
# Zabbix agent-2 monitoring of Dell MD3200 series

1. Install SMcli on machine running zabbix agent-2. SMcli can be downloaded from Dell site https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=3rvwy&productcode=powervault-md3600f&oscode=wlhs1 just copy from this ISO image only SMIA-LINUX64.bin what is described here: https://stor2rrd.com/storage/monitoring/Dell/Dell-SC-Compellent-MD3000-monitoring.php#MD3000
2. Copy md3200.sh into /etc/zabbix/scripts (create if necessery) or change temlpate with script location
3. Inport md3200.xml template into zabbix
4. Apply this template to proper host in zabbix

This script was made using https://github.com/Borodatko/zabbix_storage_monitoring 
