# Allows me to easily monitor resource usage via the GNOME top bar.
# To be pasted into the slots in the 'Executor' GNOME extension.

echo 'GPU:  {  '
nvidia-smi -q -d UTILIZATION | grep Gpu | awk '{print "usage: " $3 "%"}'
echo '  }'
