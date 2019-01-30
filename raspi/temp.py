from gpiozero import MCP3008
import time
import csv
import serial
# from pandas import Series
# import pandas as pd

Vref = 3.3  # TODO:ラズパイの電源電圧を厳密に計測する
Interval = 0.1  # NOTE:25Hz帯域で欲しいので標本化定理より25*2=50Hz。よって目標は1/50秒で取得。限界値は5e-06
elasped_time = 0  # 経過時間計測のため
lines = []  # NOTE:他に必要情報「ch,設定周波数(指定したchの),入力周波数」
setting = 400
middle = MCP3008(channel=1)
# PCのUSBは"COM3",Raspiは"/dev/ttyUSB0"
ser = serial.Serial(port="COM4", baudrate=9600)
"""NOTE
PORT0:!
PORT1: "
PORT2: #
"""
select_port = ['!', '"', '#']


def find_frequency(start_frequency, stop_frequency):
    for i in range(start_frequency, stop_frequency):
        message = 'C{port} {frequency}\r'.format(
            port=select_port[1], frequency=i)
        ser.write(message.encode())
        middle_volt = round(middle.value, 5)
        lines.append([frequency, middle_volt])


find_frequency(0, 500)

with open("find_max_frequency.csv", 'w') as f:
    writer = csv.writer(f, lineterminator='\n')
    writer.writerow(["frequency", "volt"])
    writer.writerows(lines)

ser.close()
