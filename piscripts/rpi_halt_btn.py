import RPi.GPIO as GPIO
import os
GPIO.setmode(GPIO.BCM)
GPIO.setup(25, GPIO.IN, pull_up_down=GPIO.PUD_UP)
print "\nrpi_halt_btn: started and now waiting for GPIO halt button to be pressed."
try:
  GPIO.wait_for_edge(25, GPIO.FALLING)
except KeyboardInterrupt:
  GPIO.cleanup()
GPIO.cleanup()
os.system("halt")
