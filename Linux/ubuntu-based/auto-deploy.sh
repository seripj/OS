#!/bin/bash

set -e

usage() {
	echo "Uso: $0 --front --prod"
	exit 1
}

INCLUDE_DEV=true
INCLUDE_BACKEND=true

for arg in "$@"
do
	case $arg in
		--front)INCLUDE_BACKEND=false; shift;;
		--prod) INCLUDE_DEV=false; shift;;
		\*) echo "Opção desconhecida: $arg"; usage; exit 1 ;;
	esac
done

echo "📦 Definindo váriaveis de ambiente..."
CURRENT_DIR=$(pwd)

if [[ "$CURRENT_DIR"==*"/src" || "$CURRENT_DIR"==*"/src/"* ]]; then
	BASE_DIR="${CURRENT_DIR%/src*}"
else
	BASE_DIR=$(pwd)
fi

if [ "$INCLUDE_DEV" = false ]; then
	MANIFEST=$(find $BASE_DIR -type f -iname "*k8s*" ! -iname "*dev*"  -print -quit)
	DOCKERFILE=$(find $BASE_DIR -type f -iname "*docker*" ! -iname "*dev*"  -print -quit)
else
	MANIFEST=$(find $BASE_DIR -type f -iname "*k8s*" -iname "*dev*"  -print -quit)
	DOCKERFILE=$(find $BASE_DIR -type f -iname "*docker*" -iname "*dev*" -print -quit)
fi

IMAGE=$(grep -m1 "image:" $MANIFEST | awk '{ print $2 }' | tr -d '\r"'\''')
WIN_USER=$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')
SECRET=/mnt/c/Users/$WIN_USER/.npmrc

if [[ -z "$DOCKERFILE" || -z "$MANIFEST" ]]; then
	echo "O arquivo de Dockerfile ou K8s não foi encontrado!"
	exit 1
fi

echo "🔧 Iniciando processo de deploy da aplicação: $IMAGE"
echo "🚧 Executando docker build..."

if [ "$INCLUDE_BACKEND" = false ]; then
	cd $BASE_DIR
	docker build --no-cache --secret id=npmrc,src=$SECRET -f "$DOCKERFILE" . -t "$IMAGE"
else
	cd "$BASE_DIR/src"
	docker build --no-cache -f "$DOCKERFILE" . -t "$IMAGE"
fi

echo "📤 Enviando imagem para o repositório..."
docker push "$IMAGE"

echo "🗑️ Apagando imagem local..."
docker rmi "$IMAGE"

echo "🚀 Aplicando manifest Kubernetes..."
kubectl apply -f "$MANIFEST"

echo "✅ Deploy concluído para: $IMAGE"