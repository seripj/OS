# Fix: Windows Keeps Restoring "United States (US)" Keyboard Layout After Restart

## Overview

A common issue on Windows is that even after setting **United States-International** as the default keyboard layout, the standard **United States (US)** keyboard layout keeps reappearing after restarting the computer.

This behavior can be frustrating because:

- Windows may silently restore keyboard layouts.
- Keyboard shortcuts may unexpectedly switch layouts.
- Special characters and accent combinations can stop working as expected.
- Developers and multilingual users frequently rely on the **US-International** layout and are affected by this issue.

This guide explains why it happens and how to permanently fix it.

---

# Why Does This Happen?

Windows keyboard settings are influenced by multiple system components:

1. Language preferences
2. Input methods
3. User profile settings
4. System defaults
5. Registry entries
6. Synchronization settings across devices

Even if you remove a keyboard from one place, Windows can restore it from another source.

For example:

- Adding English (United States) can automatically include the standard US keyboard.
- Windows updates may restore default layouts.
- Registry preload settings can force keyboard layouts at startup.
- Input synchronization may reapply settings.

Because of this, simply removing the keyboard once is often not enough.

---

# Solution

Follow all steps below.

Skipping steps may cause the problem to return.

---

## Step 1 — Remove the "United States (US)" Keyboard Layout

1. Open **Settings** (`Win + I`)

2. Go to:

   ```
   Time & Language
   → Language & Region
   ```

3. Under **Preferred languages**, select:

   ```
   English (United States)
   ```

4. Click:

   ```
   Language options
   ```

5. Scroll down to:

   ```
   Keyboards
   ```

6. If you see:

   ```
   United States (US)
   ```

   click:

   ```
   Remove
   ```

7. Keep only:

   ```
   United States-International
   ```

### Expected result

Only the International keyboard layout should remain.

---

## Important Note

Sometimes Windows disables the **Remove** button.

If that happens:

1. Add another temporary keyboard.
2. Set it as default.
3. Remove the US keyboard.
4. Restore US-International as default.

---

## Step 2 — Set US-International as the Default Input Method

Removing a keyboard does not automatically make another keyboard the global default.

You also need to override the default input method.

### Instructions

Open:

```
Settings
→ Time & Language
→ Typing
→ Advanced keyboard settings
```

Under:

```
Override for default input method
```

Select:

```
United States-International
```

### Why this matters

Without this setting, Windows may continue using the old layout internally.

---

## Step 3 — Disable Automatic Keyboard Switching

Windows can automatically manage keyboard methods per application.

This behavior can unintentionally restore layouts.

Open:

```
Settings
→ Time & Language
→ Typing
→ Advanced keyboard settings
```

Locate:

```
Let me set a different input method for each app window
```

If enabled:

```
Disable it
```

---

## Step 4 — Remove Keyboard Switching Shortcuts

Some users accidentally trigger keyboard changes with shortcuts such as:

- Alt + Shift
- Ctrl + Shift
- Win + Space

These shortcuts can make it appear as if Windows restored the layout.

### Instructions

Open:

```
Advanced keyboard settings
→ Language bar options
```

Open:

```
Advanced Key Settings
```

Review any configured shortcuts.

Disable them or customize them according to your preference.

---

# Advanced Fix: Registry Cleanup

If the keyboard layout still returns after restarting, Windows may be loading it directly from the registry.

## Warning

Editing the registry incorrectly can cause system issues.

Proceed carefully.

---

## Open Registry Editor

Press:

```
Win + R
```

Type:

```
regedit
```

Press Enter.

---

## Navigate to:

```
HKEY_USERS\.DEFAULT\Keyboard Layout\Preload
```

You may see values such as:

```
1
2
3
```

Check their contents.

If one contains:

```
00000409
```

that represents:

```text
United States (US)
```

Delete it or replace it with:

```
00020409
```

which represents:

```text
United States-International
```

---

## Also Check Current User Settings

Repeat the same process under:

```
HKEY_CURRENT_USER\Keyboard Layout\Preload
```

This ensures both:

- Current user profile
- System startup profile

use the correct keyboard layout.

---

# Registry Codes Reference

| Code     | Keyboard                    |
| -------- | --------------------------- |
| 00000409 | United States (US)          |
| 00020409 | United States-International |

---

# Optional: Disable Language Synchronization

Windows account synchronization can sometimes restore keyboard settings.

Open:

```
Settings
→ Accounts
→ Windows Backup
```

Disable:

```
Remember my preferences
```

or disable language preferences synchronization.

---

# Final Verification Checklist

After completing all steps:

- Only US-International exists under keyboards
- US keyboard removed
- Default input method changed
- Per-app keyboard switching disabled
- Keyboard shortcuts reviewed
- Registry preload entries fixed
- PC restarted

---

# Result

After applying all changes, Windows should stop restoring the standard US keyboard layout after reboot.

Your preferred keyboard should remain:

```text
United States-International
```

permanently.

---

# Additional Notes for Developers

Developers commonly use US-International because it allows easier typing of:

- accents
- symbols
- multilingual content
- special characters
- coding symbols while maintaining US key positions

If you regularly switch between languages or work with international content, keeping a stable keyboard configuration can significantly improve productivity.
