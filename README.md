# SSDT-Audio-Universal
📘 SSDT-Audio - Modelo Universal para AppleALC

Este SSDT permite injetar o layout-id de áudio diretamente via ACPI,
substituindo o uso de DeviceProperties no config.plist.

✅ Como usar:
1. Abra o DSDT da sua máquina e descubra o caminho do áudio (ex: _SB.PC00.HDAS ou _SB.PCI0.HDEF)
2. Edite o arquivo SSDT-Audio.dsl e ajuste:
   - O caminho no External() e Scope()
   - O layout-id correto (ex: 0x07 = 7, 0x0C = 12)
3. Compile com o comando:
   iasl SSDT-Audio.dsl
4. Copie o SSDT-Audio.aml para EFI/OC/ACPI (ou CLOVER/ACPI/patched)
5. Ative no config.plist → ACPI → Add (se usar OpenCore)

🎯 Dica: Use o Hackintool ou IORegistryExplorer para verificar se a injeção foi aplicada.

Criado por: Hackintosh and Beyond




https://github.com/user-attachments/assets/7bcab094-e7a9-4baa-8d4a-6ed8e916a9af


https://github.com/user-attachments/assets/46e252e8-3fb9-4392-ba57-2fb3fb4f1183




-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

📘 SSDT-Audio - Universal Template for AppleALC

This SSDT injects the audio layout-id directly via ACPI,
replacing the need for DeviceProperties in the config.plist.

✅ How to use:
1. Open your machine's DSDT and find the audio path (e.g. _SB.PC00.HDAS or _SB.PCI0.HDEF)
2. Edit the SSDT-Audio.dsl file and adjust:
   - The path in External() and Scope()
   - The correct layout-id (e.g. 0x07 = 7, 0x0C = 12)
3. Compile with the command:
   iasl SSDT-Audio.dsl
4. Copy the resulting SSDT-Audio.aml to EFI/OC/ACPI (or CLOVER/ACPI/patched)
5. Enable it in config.plist → ACPI → Add (if using OpenCore)

🎯 Tip: Use Hackintool or IORegistryExplorer to verify if the injection was applied.

Created by: Hackintosh and Beyond

https://github.com/user-attachments/assets/b0aefde7-3dcb-4d14-be25-3294de856e44
https://github.com/user-attachments/assets/0bfdbdb6-37c2-4a3f-a875-0d6034a5532c


