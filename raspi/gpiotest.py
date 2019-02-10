# your code goes here
from gpiozero import MCP3008
import time
import csv
import serial
from pandas import Series
import pandas as pd
import numpy as np

Vref = 3.3  # TODO:ラズパイの電源電圧を厳密に計測する
setting = 400
# 現在時刻の取得
# now = time.ctime()
# cnvtime = time.strptime(now)
# now_ymdhms = time.strftime("%Y%m%d_%H%M%S", cnvtime)
# top = MCP3008(channel=0)
# middle = MCP3008(channel=1)
# bottom = MCP3008(channel=2)

ser = serial.Serial(port="/dev/ttyUSB0", baudrate=9600)  # PCのUSBは"COM3"
"""NOTE
PORT1:!
PORT2: "
PORT3: #
"""


def send_message_to_DDS_module(port, freq):
    select_port = ['!', '"', '#']
    message = 'C{port} {frequency}\r'.format(
        port=select_port[port], frequency=freq)
    ser.write(message.encode())


def find_net_frequency(start_Hz, stop_Hz):
    set_frequency = pd.Series([])  # find_frequencyのための配列
    for current_frequency in range(start_Hz, stop_Hz):
        send_message_to_DDS_module(1, current_frequency)
        middle_volt = round(middle.value, 5)
        set_frequency[current_frequency] = middle_volt
        time.sleep(0.1)
    net_frequency = abs(set_frequency).idxmax()
    return net_frequency


def fft(inverval, *volts):
    y = pd.Series(volts)
    y_removed_DC_offset = y - y.mean()
    N = len(y)
    dt = Interval
    freq = np.linespace(0, 1.0 / dt, N)
    F = np.fft.fft(y_removed_DC_offset)
    Amp = np.abs(F)
    diff_frequency_from_set = freq[Amp[:(N//2) + 1].argmax()]
    return diff_frequency_from_set


'''大まかな設計
1.middle_voltのみで作成
1.1一定時間ごとにmiddleの周波数を取り込む
NOTE:時間は不要、一定時間ごとに動作する関数をsleepをやめて、新しいものにする
1.2FFTして周波数を確定、その周波数をmiddleに、+8Vをtop,-8Vをbottomに設定

2.top,bottomでも作成する
'''


# NOTE:25Hz帯域で欲しいので標本化定理より25*2=50Hz。よって目標は1/50秒で取得。MCP3008の限界値は5e-06
def frequency_analysis_by_FFT(interval):
    top = MCP3008(channel=0)
    middle = MCP3008(channel=1)
    bottom = MCP3008(channel=2)

    elasped_time = 0  # 経過時間計測のため
    middle_volts = []  # NOTE:他に必要情報「ch,設定周波数(指定したchの),入力周波数」
    send_message_to_DDS_module(1, 200)
    while elasped_time <= 1:
        # top_volt_str = "{:.4f}".format(top.value * Vref)
        # middle_volt_str = "{:.4f}".format(middle.value * Vref)
        # bottom_volt_str = "{:.4f}".format(bottom.value * Vref)
        # rounded_time = round(elasped_time, 5)
        middle_volt = round(middle.value, 5)
        middle_volts.append(middle_volt)
        # print("{:.3f}".format(elasped_time))
        # print("top= " + "{:.4f}".format(pot0.value * Vref) + "V")
        # print("middle= " + middle_volt_str + "V")
        # print("bottom= " + "{:.4f}".format(pot2.value * Vref) + "V")
        # writer.writerow([rounded_time,middle_volt])
        elasped_time += interval
        time.sleep(interval)
    answer = fft(interval, middle_volts)
    return answer
    # y = pd.Series(middle_volts)
    # y_removed_DC_offset = y - y.mean()
    # N = len(y)
    # dt = interval
    # freq = np.linspace(0, 1.0/dt, N)
    # F = np.fft.fft(y_removed_DC_offset)
    # Amp = np.abs(F)
    # diff_frequency_from_set = freq[Amp[:(N//2) + 1].argmax()]
    # return diff_frequency_from_set


fft_data = frequency_analysis_by_FFT(0.25)
print(fft_data)


# with open(str(Input_Frequency) + "V.csv", 'w') as f:
#     writer = csv.writer(f, lineterminator='\n')
#     writer.writerow(["time", "volt"])
#     writer.writerows(lines)

# branchのテストで追加
