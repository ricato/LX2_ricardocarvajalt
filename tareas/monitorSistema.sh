echo "Script para el monitoreo del sistema"
echo " "

echo "::::::::::::::::::::::::::::Networking:::::::::::::::::::::::::::::"
echo " "

echo "-----> CCONEXIONES"
echo " "
echo "NETSTAT"
echo " "
netstat -ltuna | grep EST
echo "---------------------------------------------------"

echo "SS"
echo " "
ss -t
echo " "
echo "SS Estadisticas"
echo " "
ss -s
echo "---------------------------------------------------"

echo "--> Puertos"
echo "  "
nmap ricato
echo " "
echo "::::::::::::::::::::::::::::::Estado Disco Duro::::::::::::::::::::"
echo " "
df -lh

echo " "
echo "::::::::::::::::::::::::::::::::::Memoria GB:::::::::::::::::::::::"
echo " "
free -h
