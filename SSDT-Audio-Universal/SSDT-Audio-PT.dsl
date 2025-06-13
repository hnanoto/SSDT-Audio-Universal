
// SSDT-Audio.dsl - Modelo universal para ativar áudio onboard com AppleALC
// Criado por Hackintosh and Beyond

DefinitionBlock ("", "SSDT", 2, "HACK", "HDAU", 0x00000000)
{
    // Altere o caminho abaixo se seu dispositivo de áudio estiver em PCI0 ou outro nome
    External (_SB.PC00.HDAS, DeviceObj)

    Scope (_SB.PC00.HDAS)
    {
        // Método _DSM que injeta o layout-id apenas no macOS
        Method (_DSM, 4, NotSerialized)
        {
            // Requisito do AppleALC para chamada válida
            If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 }) }

            // Injeta apenas se for macOS
            If (!_OSI("Darwin")) { Return (Buffer() { 0x03 }) }

            // Aqui você pode alterar o layout-id conforme seu codec (ex: 0x0C = 12)
            Return (Package ()
            {
                "layout-id", Buffer() { 0x07, 0x00, 0x00, 0x00 }
            })
        }
    }
}
