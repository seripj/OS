# Brave Browser Video Flickering Issue

## 🐛 Problem Description

When playing videos, content may start **flickering, blinking, or flashing repeatedly**.  
This issue typically occurs on platforms such as YouTube, streaming sites, or embedded video players.

The flickering makes video playback unstable and sometimes unusable.

---

## ⚠️ Common Causes

This issue is usually related to:

- GPU (hardware acceleration) conflicts
- Outdated or buggy graphics drivers
- Experimental browser flags enabled in Brave
- Incompatible rendering settings
- Extension interference (ad blockers or script blockers)

---

## ✅ Solution Steps

### 1. Disable Hardware Acceleration (Most Effective Fix)

1. Open Brave Browser
2. Go to:

```text
brave://settings/system
```

3. Disable:
   > Use hardware acceleration when available
4. Restart the browser

---

### 2. Reset Experimental Flags

1. Open:

```text
brave://flags/
```

2. Click:
   > Reset all to default
3. Restart Brave

---

### 3. Adjust Rendering Flags (Optional Fix)

If the issue persists:

- Enable:

  > Override software rendering list

- Disable:

  > GPU rasterization

- Restart Brave

---

### 4. Update Graphics Drivers

Ensure your GPU drivers are up to date:

- [**NVIDIA:**](https://www.nvidia.com/Download/index.aspx)
- [**AMD:**](https://www.amd.com/en/support)
- [**Intel:**](https://www.intel.com/content/www/us/en/download-center/home.html)

Or update via Device Manager on Windows.

---

### 5. Test Without Extensions

Extensions may interfere with video rendering:

- Open Brave in Incognito Mode
- Or disable all extensions temporarily:

```text
brave://extensions/
```

---

### 6. Update Brave Browser

Make sure you are using the latest version:

```text
brave://settings/help
```

---

## 🧪 Additional Troubleshooting

If the issue still persists:

- Try creating a new Brave profile
- Test another browser (Chrome or Edge) to compare behavior
- Check if the issue happens only on specific websites
- Verify system GPU usage during playback

---

## 🧾 Summary

In most cases, **disabling hardware acceleration** resolves video flickering in Brave.  
If not, the issue is usually related to GPU drivers or experimental browser flags.

---

## 📌 Result

After applying the recommended fixes, video playback should return to normal without flickering or blinking.
