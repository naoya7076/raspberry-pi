# your code goes here
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
Input_Frequency = 400
# 現在時刻の取得
# now = time.ctime()
# cnvtime = time.strptime(now)
# now_ymdhms = time.strftime("%Y%m%d_%H%M%S", cnvtime)
top = MCP3008(channel=0)
middle = MCP3008(channel=1)
bottom = MCP3008(channel=2)

ser = serial.Serial(port="/dev/ttyUSB0", baudrate=9600)  # PCのUSBは"COM3"
"""NOTE
PORT1:!
PORT2: "
PORT3: #
"""
ser.write(b'C" 400\r')
ser.close()

while elasped_time <= 1:
    # top_volt_str = "{:.4f}".format(top.value * Vref)
    # middle_volt_str = "{:.4f}".format(middle.value * Vref)
    # bottom_volt_str = "{:.4f}".format(bottom.value * Vref)
    rounded_time = round(elasped_time, 5)
    middle_volt = round(middle.value, 5)
    lines.append([rounded_time, middle_volt])
    # print("{:.3f}".format(elasped_time))
    # print("top= " + "{:.4f}".format(pot0.value * Vref) + "V")
    # print("middle= " + middle_volt_str + "V")
    # print("bottom= " + "{:.4f}".format(pot2.value * Vref) + "V")
    # writer.writerow([rounded_time,middle_volt])
    elasped_time += Interval
    time.sleep(Interval)

with open(str(Input_Frequency) + "V.csv", 'w') as f:
    writer = csv.writer(f, lineterminator='\n')
    writer.writerow(["time", "volt"])
    writer.writerows(lines)
