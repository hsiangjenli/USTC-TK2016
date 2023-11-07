# --- install python requirements ----------------------------------------------
pip install -r requirements.txt

# --- add mono repo -------------------------------------------------------------
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
apt install apt-transport-https ca-certificates -y
echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list
apt-get update

# --- install mono ---------------------------------------------------------------
apt install mono-devel -y

# --- install powershell ---------------------------------------------------------
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-get update
apt-get install -y powershell

# --- install fdupes ------------------------------------------------------------
apt-get install fdupes -y