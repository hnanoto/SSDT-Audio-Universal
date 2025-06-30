# Hackintosh and Beyond — Audio Injection FAQ Pack

This package contains everything needed to understand and resolve issues related to SSDT audio injection on Clover vs OpenCore using HDEF or HDAS.

## 📁 Contents

- `FAQ_EN.md` — Markdown FAQ (English)
- `FAQ_EN.txt` / `FAQ_EN.pdf` — Text and PDF formats
- `FAQ_PT.md` — Markdown FAQ (Portuguese)
- `FAQ_EN_Infographic.png` — Visual FAQ (English)
- `FAQ_PT_Infografico.png` — Visual FAQ (Portuguese)
- `SSDT-HDEF-13.dsl` — SSDT for injecting layout-id = 13
- `ACPI_Clover_HDEF_Patch.plist` — ACPI patch to remove `_DSM` from HDEF (Clover only)

## ✅ Use Cases

- For **OpenCore**: Use `alcid=13` as boot-arg in NVRAM. Do NOT rely on SSDT if HDEF contains _DSM.
- For **Clover**: Apply the ACPI patch and use the SSDT for reliable audio injection.

Created by the Hackintosh and Beyond project.
