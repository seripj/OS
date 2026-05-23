# Headset – Linux Configuration Guide

This guide documents the complete solution used to fix audio issues and automatically switch audio outputs between:

- **Wireless mode (dongle)**
- **USB charging mode**

Environment:

- Linux Mint (Ubuntu-based)
- PipeWire + WirePlumber
- Headset (used H510-Pro Wireless on tests)
- Fifine USB Microphone

---

## Problem

The headset exposes multiple audio endpoints:

Wireless mode:

```text
alsa_output.usb-XiiSound_Technology_Corporation_H510-PRO_Wireless_headset
```

USB charging mode:

```text
alsa_output.usb-XiiSound_Technology_Corporation_H510-PRO_USB_Gaming_Headset
```

When connecting the USB cable for charging, Linux creates a new audio device and may switch the active output incorrectly.

Symptoms:

- Audio only works on one side
- Manual device switching required
- Need to reopen pavucontrol
- Headset changes output after reconnecting

---

# Step 1: Install pavucontrol

Install PulseAudio Volume Control:

```bash
sudo apt update
sudo apt install pavucontrol
```

Open:

```bash
pavucontrol
```

Configure:

## Output Devices

Enable only the headset profile currently used.

Disable unused or duplicate profiles.

Set:

- H510 Headset → fallback device (preference for Digital Output)

## Input Devices

Set:

- Fifine USB Microphone → fallback device (preference for Digital Input)

This solved the one-channel audio issue.

---

# Step 2: Identify available audio outputs

Run:

```bash
pactl list short sinks
```

Example:

```text
57 alsa_output.usb-3142_fifine_Microphone-00.analog-stereo
59 alsa_output.usb-XiiSound_Technology_Corporation_H510-PRO_Wireless_headset-00.iec958-stereo
112 alsa_output.usb-XiiSound_Technology_Corporation_H510-PRO_USB_Gaming_Headset-00.iec958-stereo
```

Current active device is usually marked RUNNING.

---

# Step 3: Create automatic switching script

Create folder:

```bash
mkdir -p ~/.local/bin
```

Download script:

```
curl -fsSL https://raw.githubusercontent.com/seripj/linux/main/ubuntu-based/devices-watch.sh -o ~/.local/bin/devices-watch.sh
```

Or create script:

```bash
nano ~/.local/bin/devices-watch.sh
```

Paste:

```bash
#!/bin/bash

pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "sink"; then

        USB=$(pactl list short sinks | grep "USB" | awk '{print $2}')
        WIRELESS=$(pactl list short sinks | grep "Wireless" | awk '{print $2}')

        if [ -n "$USB" ]; then
            pactl set-default-sink "$USB"
        elif [ -n "$WIRELESS" ]; then
            pactl set-default-sink "$WIRELESS"
        fi
    fi
done
```

Save and exit.

---

# Step 4: Make executable

```bash
chmod +x ~/.local/bin/devices-watch.sh
```

Test manually:

```bash
~/.local/bin/devices-watch.sh
```

Behavior:

- USB connected → switches to USB mode
- USB removed → switches back to wireless mode
- Runs automatically when devices change

---

# Step 5: Start script automatically on login

Open:

Menu → Startup Applications

Add:

Name:

```text
Headset Auto Switch
```

Command:

```bash
~/.local/bin/devices-watch.sh
```

Save.

---

# Result

Final behavior:

✅ Audio output changes automatically

✅ No manual pavucontrol switching

✅ Wireless ↔ USB charging works seamlessly

✅ Fixed one-side audio issue

✅ Fifine microphone
