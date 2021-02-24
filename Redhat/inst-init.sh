# loop until SQL is ready
# Source: https://github.com/grrlgeek/bak-to-bacpac/blob/main/container/Docker/create-bacpacs.sh
for i in {1..60};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD  -Q "SELECT Name FROM SYS.DATABASES"
    if [ $? -eq 0 ]
    then
        echo "SQL Server is ready"
        break
    else
        echo "Not ready yet.."
        sleep 1
    fi
done

echo "Running instance configuration script"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i inst-init.sql
