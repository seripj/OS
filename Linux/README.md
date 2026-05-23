# Repository for Linux configuration

A collection of Linux scripts and documentation to install essential programs, development tools, configure system setup, and troubleshoot common issues.

## Scripts to configure the initial setup

Script to install essential programs/tools:

- See [the essentials.sh](https://github.com/seripj/OS/blob/main/Linux/ubuntu-based/essentials.sh)

```bash
curl -fsSL https://raw.githubusercontent.com/seripj/OS/refs/heads/main/Linux/ubuntu-based/essentials.sh -o essentials.sh && \
chmod +x essentials.sh && \
./essentials.sh
```

---

## Scripts to configure the progam/tools

Script to install docker/docker-compose/kubectl/kubectx/kubens/k9s:

- See [the docker-tools.sh](https://github.com/seripj/OS/blob/main/Linux/ubuntu-based/docker-tools.sh)

```bash
curl -fsSL https://raw.githubusercontent.com/seripj/OS/refs/heads/main/Linux/ubuntu-based/docker-tools.sh -o docker-tools.sh && \
chmod +x docker-tools.sh && \
./docker-tools.sh
```

---

## Docs to fix issues

- [Fix `' + c` → `ç` on keyboard](https://github.com/seripj/OS/blob/main/Linux/docs/KEYBOARD-CONFIG.md)
- [The headset exposes multiple audio endpoints](https://github.com/seripj/OS/blob/main/Linux/docs/DEVICES-WATCH.md)
