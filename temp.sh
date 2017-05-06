pacman -S acpi lm_sensors
sensors-detect

# show thermal & cooling info
acpi -V 

# current fan speed and level
cat /proc/acpi/ibm/fan

yaourt -S thinkfan

find /sys/devices -type f -name "temp*_input"

# test
sudo thinkfan -n

sensors

sudo systemctl enable thinkfan
sudo systemctl start thinkfan
