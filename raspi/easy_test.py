from gpiozero import MCP3008
Vref = 3.29476

pot1 = MCP3008(channel=0)
pot2 = MCP3008(channel=1)
pot3 = MCP3008(channel=3)

out1 = pot1.value * Vref
out2 = pot2.value * Vref
out3 = pot3.value * Vref

print(str(out1) + "V")
