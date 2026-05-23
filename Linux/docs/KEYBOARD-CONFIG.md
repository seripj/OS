# Fix `' + c` → `ç` on keyboard

Example keyboard used: Royal Kludge RK84 with US International layout.

## Problem

On Windows using the **US International** keyboard layout, the following behavior works by default:

```text
' + c → ç
```

However, on Linux with:

```text
English (US, intl., with dead keys)
```

the same combination produces:

```text
' + c → ć
```

because Linux interprets `'` as a dead acute accent and applies the Unicode character `ć`.

The `ç` character still exists in the layout:

```text
AltGr + , → c → ç
```

but this does not match the Windows behavior.

---

## Environment

Keyboard:

```text
Royal Kludge RK84
```

Layout:

```text
us(intl)
```

Session:

```text
X11
```

Verify:

```bash
setxkbmap -query
echo $XDG_SESSION_TYPE
```

Expected output:

```text
layout: us,us
variant: intl,
x11
```

---

## Solution

Create a custom XCompose rule to add Windows-style behavior.

Create the file:

```bash
nano ~/.XCompose
```

Add:

```text
include "%L"

<dead_acute> <c> : "ç" ccedilla
<dead_acute> <C> : "Ç" Ccedilla
```

Save and exit:

```text
Ctrl + O
Enter
Ctrl + X
```

---

## Apply changes

Log out and log back in:

```text
Menu → Logout → Log Out
```

No system reboot required.

---

## Result

After logging in again:

```text
' + a → á
' + e → é
' + i → í
' + o → ó
' + u → ú
~ + n → ñ
' + c → ç
' + C → Ç
```

This preserves all standard US International behavior while adding compatibility with Windows.

---

## Revert changes

Remove the custom compose file:

```bash
rm ~/.XCompose
```

Log out and log back in again.
