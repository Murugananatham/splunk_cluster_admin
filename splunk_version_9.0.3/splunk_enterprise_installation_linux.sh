######## Splunk Enperprise installation:

sudo su 

yum update -y
yum install wget -y

useradd splunk
groupadd splunk
mkdir /opt/splunk
ll /opt/
chown -R splunk:splunk /opt/splunk/
ll /opt/


sudo su - splunk

cd /home/splunk
wget -O splunk-9.0.3-dd0128b1f8cd-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.0.3/linux/splunk-9.0.3-dd0128b1f8cd-Linux-x86_64.tgz"
tar -xvf splunk-9.0.3-dd0128b1f8cd-Linux-x86_64.tgz -C /opt/
cd /opt/splunk/bin
./splunk start --accept-license --no-prompt --answer-yes --seed-passwd PASSWORD

/opt/splunk/bin/splunk enable boot-start -user splunk
