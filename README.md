# Ubiquiti-Controller-Container-Instance-ARM-Template

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdaltskin%2FUbiquiti-Controller-Container-Instance-ARM-Template%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fdaltskin%2FUbiquiti-Controller-Container-Instance-ARM-Template%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template will deploy a fully working Unifi Controller right into Azure Container Instances.  It opens up the necessary firewall ports [https://help.ubnt.com/hc/en-us/articles/218506997] and will install the Unifi controller software and it's dependencies.

This will deploy on a 1x cpu, 1.5Gb linux based instance in the chosen resource group location using the docker based image by [LinuxServer.io](https://hub.docker.com/r/linuxserver/unifi-controller).

The entire provisioning process will take ~1 minute.  To access the Unifi Controller the url will be in the format: 

*   https://{dnsName}.{region}.azurecontainer.io:8443

## Register APs to controller

If your APs are already registered to a controller, ensure they are forgotten on that controller and re-assign them to the new one.  You'll need to be on the same network as them to update them with the new inform address.  You can do this by SSH into the AP using default credentials (ubnt/ubnt) eg:

```
ssh ubnt@192.168.1.90
syswrapper.sh restore-default
set-inform https://{dnsName}.{region}.azurecontainer.io:8080/inform
```
