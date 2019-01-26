reseach_data_middle = pd.read_csv(str(setting) + "V.csv")

plt.figure(figsize=(18, 3), facecolor="white")
x = reseach_data_middle["time"]
y = reseach_data_middle["volt"]

plt.plot(x, y, linewidth=0.3)

plt.title(str(setting) + "V")
plt.xlabel("Time")
plt.ylabel("Volt")

plt.grid(True)
