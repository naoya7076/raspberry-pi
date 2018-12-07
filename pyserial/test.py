import serial
# PORT1:!
# PORT2: "
# PORT3: #
ser = serial.Serial(port="/dev/ttyUSB0", baudrate=9600)	#PCのUSBは"COM3"
ser.write(b'C" 39000\r')
ser.close()
