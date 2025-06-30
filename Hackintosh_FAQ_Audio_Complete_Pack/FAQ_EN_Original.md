# 🎧 FAQ — Why SSDT Audio Injection Works on Clover but Not on OpenCore (HDEF vs HDAS)

---

## ❓ 1. Why doesn't the SSDT with layout-id activate audio on OpenCore when the path is `HDEF`?

Because most laptop DSDTs already include a `_DSM` method inside the `HDEF` device.

This method usually contains dynamic logic like:

```asl
If (PCIC (Arg0)) { Return (PCID (Arg0, Arg1, Arg2, Arg3)) }
```

🛑 OpenCore **does not override existing methods** in the DSDT.  
So, the `_DSM` method from your SSDT **is ignored** if one already exists in the DSDT.

---

## ❓ 2. Why does it work fine when the audio device is called `HDAS`?

In many PCs and desktops, the DSDT **does not contain** a `_DSM` method inside `HDAS`.  
In such cases, macOS executes the `_DSM` method from the SSDT correctly.

✅ Result: the layout-id injected by the SSDT **activates audio successfully** via `AppleALC.kext` or `VoodooHDA.kext`.

---

## ❓ 3. Can Clover bypass this?

✅ **Yes.** Clover includes a `DropOEM_DSM` fix that automatically removes the `_DSM` method from the DSDT for devices like `HDEF`.

This allows the SSDT with layout-id to work correctly, even when the device is `HDEF`.

---

## ❓ 4. So, is it impossible to use SSDT with OpenCore on `HDEF`?

It's possible, but with **restrictions**:

- ❌ OpenCore’s ACPI patch to remove `_DSM` from `HDEF` **often fails**, causing boot errors.
- ✅ The only guaranteed methods are:
  - **Manually edit the DSDT**, remove the `_DSM`, and recompile
  - Or use the boot-arg: `alcid=13` (no SSDT needed)

---

## ❓ 5. What is the safest solution for laptops with `HDEF` on OpenCore?

Use the boot-arg in your `config.plist > NVRAM > boot-args`:

```
alcid=13
```

✅ Works 100% of the time  
✅ Compatible with `AppleALC.kext`  
✅ Compatible with `VoodooHDA.kext` (tested and confirmed!)  
✅ No need for SSDT or ACPI patch

---

## ✅ Technical Summary:

| Path    | `_DSM` Method in DSDT | SSDT with `_DSM` Works? | Recommended Solution          |
|---------|------------------------|---------------------------|-------------------------------|
| `HDEF`  | ✅ Yes                 | ❌ Not with OpenCore     | `alcid=13` or Clover + SSDT   |
| `HDAS`  | ❌ No                  | ✅ Yes with OpenCore     | SSDT with layout-id           |

---

## ✅ Extras

- ✅ `VoodooHDA.kext` also responds to the `_DSM` method with layout-id, working with either SSDT or `alcid`.
- ✅ Clover remains a viable option when full ACPI control is needed.

---

🎥 Created by Hackintosh and Beyond — share with anyone struggling to get audio working on Hackintosh!
