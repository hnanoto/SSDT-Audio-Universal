DefinitionBlock ("", "SSDT", 2, "HACK", "HDEF", 0x00000000)
{
    External (_SB.PCI0.HDEF, DeviceObj)

    Scope (_SB.PCI0.HDEF)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 }) }
            If (!_OSI("Darwin")) { Return (Buffer() { 0x03 }) }

            Return (Package ()
            {
                "layout-id", Buffer () { 0x0D, 0x00, 0x00, 0x00 }
            })
        }
    }
}
