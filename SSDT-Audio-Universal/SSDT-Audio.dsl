
// SSDT-Audio.dsl - Universal template to enable onboard audio with AppleALC
// Created by Hackintosh and Beyond

DefinitionBlock ("", "SSDT", 2, "HACK", "HDAU", 0x00000000)
{
    // Change the path below if your audio device is on PCI0 or other name
    External (_SB.PC00.HDAS, DeviceObj)

    Scope (_SB.PC00.HDAS)
    {
       // _DSM method that injects layout-id only on macOS
        Method (_DSM, 4, NotSerialized)
        {
            // AppleALC requirement for valid call
            If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 }) }

            // Inject only if it is macOS
            If (!_OSI("Darwin")) { Return (Buffer() { 0x03 }) }

            // Here you can change the layout-id according to your codec (ex: 0x0C = 12)
            Return (Package ()
            {
                "layout-id", Buffer() { 0x07, 0x00, 0x00, 0x00 }
            })
        }
    }
}
