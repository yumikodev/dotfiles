from os import path
from subprocess import run, Popen
from datetime import datetime
from time import sleep

lastHour = datetime.now().hour
path = path.expanduser("~")

def changeBg(hour: int):
  run(["pkill", "swaybg"])
  
  if hour < 18:
    Popen(["swaybg", "-o", "*", "-i", f"{path}/Imágenes/wallpapers/cropped-1920-1080-1059834.png", "-m", "fill"])
  else:
    Popen(["swaybg", "-o", "*", "-i", f"{path}/Imágenes/wallpapers/1144985.png", "-m", "fill"])

  global lastHour
  lastHour = datetime.now().hour

changeBg(lastHour)

while True:
  actualHour = datetime.now().hour

  if lastHour != actualHour:
    changeBg(actualHour)

  sleep(5 * 60) # Sleep 5 minutes
