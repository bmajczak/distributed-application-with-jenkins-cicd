echo "updating"

sudo apt update -y

curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"

sudo apt-get update -y
sudo apt-get install -y mssql-server
export MSSQL_SA_PASSWORD='Sqlserver1!'
export MSSQL_PID='Developer'
export MSSQL_TCP_PORT='1433'
export ACCEPT_EULA='Y'
sudo -E /opt/mssql/bin/mssql-conf -n setup
curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

sudo apt-get update -y

sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
sudo -E /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -N -C -l 30 < setup.sql
