#!/bin/bash
# FortiSIEM Sysprep
# ranton@fortinet.com
# Version 1.0 - Jun 2020
# This script doesn't have validation routines for the input values used, so be careful with the information provided.
##############################################################################################################################
echo ""
figlet -w 200 -f small FortiSIEM Sysprep
echo ""
echo "(c) 2020 Fortinet LATAM CSE - Author: ranton@fortinet.com"
echo ""
if [ $# -eq 0 ]; then
	echo "Usage: ./fsm-sysprep.sh FSM_Full_XXXXXX_ESX_X.X.X_buildXXXX.zip"
else
##############################################################################################################################
#
#	You can edit the following variables to match your environment:
#	- The variables with the "GOVC_" prefix are related to your vCenter environment. 
#	- The variables with the "va_" prefix are for the IP configuration of the super image.
#	- The variables with the "co_" prefix are for the IP configuration of the collector image.
#
##############################################################################################################################
#	vCenter connection information
##############################################################################################################################
	export GOVC_INSECURE=1
	export GOVC_URL="vcsa.fortilabs.org"
	export GOVC_USERNAME="administrator@cloud.fortilabs.org"
	export GOVC_PASSWORD="Nada123#"
	export GOVC_DATASTORE="NVMe01"
	export GOVC_NETWORK="VM Network"
	export GOVC_RESOURCE_POOL="*/Resources"
##############################################################################################################################
#	FSM VA IP configuration
##############################################################################################################################
	va_ipv4ip="10.100.88.20"
	va_ipv4netmask="255.255.255.0"
	va_ipv4gw="10.100.88.1"
	va_ipv4dns="10.100.88.1"
##############################################################################################################################
#	FSM Collector IP configuration
##############################################################################################################################
	co_ipv4ip="10.100.77.253"
	co_ipv4netmask="255.255.255.0"
	co_ipv4gw="10.100.77.1"
	co_ipv4dns="10.100.77.1"
##############################################################################################################################
#	Post-provisioning script, needs to be converted to GZ and then to base64: gzip script.py , base64 -w 0 script.py.gz
##############################################################################################################################
	stage01script="H4sICOqI1V4AA3N0YWdlMDEucHkA7Vhtb9s2EP7uX8EqBSQHsVinATa0cIdiabZ8WJbBw4Bh2QRaOttcJJIlKb9k2X77jtRLnPoNSQsMGCzAFkXePXe8O96ddPSClkbTXKYspyMuqFraqRSvO7xQUluiYKEgtc2jWZpmKNsR0xPFtIFOp5PBmBjLJvCqH3XfdAghBhDPWMEKIANkipVUIKJAq4L0PjJyP9GgCEtTyMm9gYyEhvonqQwdm4JOQnJP2PyW9C5I2AsJ+StUmgtLXvZvgt5N8PI0/DvoxhpYFnVjYzVXUddJTqeQ3iapzHPcgNSbpZNV8dVDLyUt00ZgPl7HHpCwH/oN+8trGAW/Hf9Ovm2JMrA4gCzotnSoEZrUQhG1U+4KnSF6nASv+8TQP+gRDQiVytJZMWcaqJm6/xkruP9L0MiJms5YXoJ50CpWy9CLgtzARt2GpQI942afcq0+VMNISkuzWh81lSD4gmagcrksQFj6Z1mokVzgEhfcGicBtXCgTlX0Qh1SsVFsLqJw175SKcZ8kgiw4QmIVGZcTAZhace9r6udOapcTpxvnV9Dqp12nhenY7tAxnD+QBvj7JjnLhRr1nal0ioKh+CsR6QAIsfEToGwkZwBjjTglLJcCvPmxt7oG7ECbEBkORcQhacrsw1o9A3vXl7PzsjlNXmfZRqMiePjjey7uK/AFszcPof1O2ZhzpZPZv3ljJxfDckQ4wQ06T9H9Ar/6VP5DWEYsHKxxETiEQSkaDyml8RKgmcznXofXQoLGuNkG77YLsBOucETr7ULyi3syzqE9x/9dQlClZY0ObAVQNaErGTK7h60i5/Or3YghRuO/RrS9wyDeilLl6HJz7yAOxfyzLo5TfBkcIFWEUbmu5QOfwUT7lP3v9j80zzV5KQPP16cEIvGkKUdXKFBHgups0ec5tJA1K5tSJQ+cR/RL5i316zhk/cuQ2xxzBfbK6RTSYKqIgTk3bunloTVbiFJS2NlEXE1O+PqxN1Elez8eDL3t0yYQ1dx6CoOXcVTu4rqWD27s1g5js9uMapj/HltRpMDPqvX2A1yaDgODceh4dhojf9Jw7E0Cgty/XniUd2qVryKL+qKtSJdY3Gfjb3MpJYZW6bjxV24lRZsSssMZlSXOZg4o1+96qEyhiOZsD2XP/zKbgRjpu6XuIBNjrfS/uPLVDxijhQlSMxZ9ZxD2MHIsoKLTznryT2sHv/YOW+dJsvwVAyo2/8daImVb0DnXIGvlSMz6P/wFt0h0rek2W2zuo5lZYmZl9bbqTzlfOpcWjAuWn+6L1GuLWu+SsXv9aR0UXHtV+rAqshilmUJq9ejoFc1ocEJtm6uIA9CZwpIrC4hPCFTyNUg+CDYCNWvSB0OZhAsBYaM8cRjIa66i1IzhxDsklYV5aABHmJa9DWsLuV7eeuKvA5QF/O9AJP5Ou85jFmZ26aY78XASroB5GoYuPPmWJHeuP6sQvA3h2FqR2DadE9xZc+HfvKT9wJPU78ctOPmDaGdwNeEdtyU+AqtOfR+5nHn2n6v3EDd6aB+SeKqRJL4fJ4kLtqSpE7rVeh1/gWNBOiyRxUAAA=="
##############################################################################################################################

	image=$(echo $1|awk -F ".zip" {'print $1'} )
	image_type=$(echo $image| awk -F "_" '{print $3}')
	if [ $image_type == "Super-Worker" ]; then
		image_type="VA"
	fi
	version=$(echo $image|grep -Eo '(\d+\.)+\d+')
	build=$(echo $image|grep -Eo '\d{4}')
	ovafile=$(echo FortiSIEM-$image_type-$version.$build.ova)
	newname=FortiSIEM-$image_type-$version.$build
	
	deploy () {
		echo "[*] Initiating Deployment"
		echo "[*] Procesing FortiSIEM image"
		if [ -f $ovafile ]; then
			echo "[*] Initiating Deployment"
                	echo "[*] Procesing FortiSIEM image"
			govc import.spec $ovafile | python3 -m json.tool > /tmp/$newname.json
			sed -i 's/flat/thin/g' /tmp/$newname.json
	                sed -i "s/\"Network\": \"\"/\"Network\": \"$GOVC_NETWORK\"/g" /tmp/$newname.json
			sed -i 's/"PowerOn": false,/"PowerOn": true,/g' /tmp/$newname.json
                        echo "[*] Deploying OVA to vCenter"
                        govc import.ova -name=$newname.tpl -options=/tmp/$newname.json $ovafile
                        echo "[*] OVA deployed"
                        echo "[*] Cleaning file"
                        rm -vf $ovafile
		else 	
			unzip $image	
                        echo "[*] Initiating Deployment"
                        echo "[*] Procesing FortiSIEM image"
			govc import.spec $ovafile | python3 -m json.tool > /tmp/$newname.json
                        sed -i 's/flat/thin/g' /tmp/$newname.json
                        sed -i "s/\"Network\": \"\"/\"Network\": \"$GOVC_NETWORK\"/g" /tmp/$newname.json
                        sed -i 's/"PowerOn": false,/"PowerOn": true,/g' /tmp/$newname.json
			echo "[*] Deploying OVA to vCenter"
        	govc import.ova -name=$newname.tpl -options=/tmp/$newname.json $ovafile
                	echo "[*] OVA deployed"
                	echo "[*] Cleaning file"
                	rm -vf $ovafile
		fi

	}


	check_power () {
		echo "[*] Checking Power status..."
	    check_if_on=$(govc vm.info -json $newname.tpl | jq -r '.VirtualMachines[].Runtime.PowerState'|grep -c "poweredOn")
	    if [ "$check_if_on" -gt "0" ]; then
	        counter=0
	        while [ $counter -lt 10 ]; do
	        check_guest=$(govc vm.info -json $newname.tpl |python3 -m json.tool|jq -r .VirtualMachines[].Guest.Net[].Connected 2> /dev/null |grep -c true)
	        if [ "$check_guest" -ne "0" ]; then
	            echo "[*] VMWare Tools is up. Still, we will double-check to avoid issues."
	            let counter=counter+1
	            sleep 30
	        else
	            echo "[*] Still Working..."
        	    sleep 10
            fi
	    	done
			echo "[*] System Up!"
		else
			govc vm.power -on $newname.tpl
			counter=0
			while [ $counter -lt 10 ]; do
			check_guest=$(govc vm.info -json $newname.tpl |python3 -m json.tool|jq -r .VirtualMachines[].Guest.Net[].Connected 2> /dev/null |grep -c true)
			if [ "$check_guest" -ne "0" ]; then
		       	echo "[*] VMWare Tools is up. Still, we will double-check to avoid issues."
		        let counter=counter+1
				sleep 30
		    else
		        echo "[*] Still Working..."
		        sleep 10
			fi
			done
			echo "[*] System Up!"
		fi
	}

	check_first_boot () {
        echo "[*] Waiting for the initial boot sequence to finish"
		counter=0
		while [ $counter -lt 1 ]; do
		        firstboot=$(sshpass -p 'ProspectHills' ssh -o StrictHostKeyChecking=no -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null -q root@$fsmip pgrep -f /opt/phoenix/phscripts/bin/phUpdateSystem.sh|wc -l)
			if [ "$firstboot" -eq "0" ]; then
                echo "[*] Firstboot scripts finished!"                               	        
				let counter=counter+1
				sleep 10
            else
                echo "[*] Firstboot scripts are still running."
				sleep 30
			fi
		done

	}

	remote_exec () {
			pid=$(govc guest.start -l root:ProspectHills -vm=$newname.tpl "$@")
			while true;
					do
							status=$(govc guest.ps -l root:ProspectHills -vm=$newname.tpl -json -p "$pid"|python3 -m json.tool |jq -r .ProcessInfo[].EndTime |grep -v null|wc -l)
							if [ "$status" -ne "0" ]
							then
									echo "[*] Tadam! Finished!"
									break
							else
									echo "[*] A minion is executing the remote tasks for us :)"
									sleep 60
							fi
					done
	}
	
	sysprep () {
		echo "[*] Initiating bootstrap"
		govc vm.ip $newname.tpl 1>/dev/null
        check_power
        sleep 5
        echo "[*] Initiating bootstrap"
		fsmip=$(govc vm.info -json=true $newname.tpl |jq -r '.VirtualMachines[].Guest.Net[].IpConfig.IpAddress[0].IpAddress' |grep -v null)
		check_first_boot
		sleep 10
		echo "[*] Deploying automation script"
		echo $stage01script | govc guest.upload -l root:ProspectHills -vm=$newname.tpl  - /tmp/stage01.b64
		govc guest.run -l root:ProspectHills -vm=$newname.tpl openssl base64 -d -A -in /tmp/stage01.b64 -out /tmp/stage01.py.gz
		govc guest.run -l root:ProspectHills -vm=$newname.tpl gunzip /tmp/stage01.py.gz
		govc guest.chmod -l root:ProspectHills -vm=$newname.tpl  0755 /tmp/stage01.py
		govc guest.rm -l root:ProspectHills -vm=$newname.tpl /tmp/stage01.b64
		echo "[*] Executing vami_config_net"
		if [ $image_type == "Collector" ]; then
            remote_exec /tmp/stage01.py -custom -ipv4ip $co_ipv4ip -ipv4netmask $co_ipv4netmask -ipv4gw $co_ipv4gw -ipv4dns $co_ipv4dns
		elif [ $image_type == "VA" ]; then
            remote_exec /tmp/stage01.py -custom -ipv4ip $va_ipv4ip -ipv4netmask $va_ipv4netmask -ipv4gw $va_ipv4gw -ipv4dns $va_ipv4dns
		fi		
		check_sysprep_finished
		echo "[*] Cleaning up"
		govc guest.rm -l root:ProspectHills -vm=$newname.tpl /tmp/stage01.py
		govc guest.download -l root:ProspectHills -vm=$newname.tpl /root/vami_log.txt vami-$newname-$(date +%Y%m%d%H%M).log
		sleep 5
	}

	check_off () {
		counter=0
		while [ $counter -lt 1 ]; do
		check_guest=$(govc vm.info -json $newname.tpl |python3 -m json.tool|jq -r .VirtualMachines[].Runtime.PowerState 2> /dev/null |grep -c poweredOff)
		if [ "$check_guest" -ne "0" ]; then
        	echo "[*] VM is off"
            let counter=counter+1
        else
            govc vm.power -off $newname.tpl
			sleep 30
		fi
		done

	}

	check_sysprep_finished () {
		counter=0
		while [ $counter -lt 1 ]; do
		checksysprep=$(govc guest.ls -l root:ProspectHills -vm $newname.tpl /root/.sysprep > /dev/null 2>&1 && echo 1 || echo 0)
		if [ "$checksysprep" -eq "1" ]; then
        	echo "[*] Sysprep scripts finished!"
    		let counter=counter+1
            sleep 10
        else
            echo "[*] Sysprep scripts are still running. (If this takes too long check the server as there may be an issue)"
            sleep 30
        fi
        done
	}

	create_images () {
		echo "[*] Time to create images"
		timestamp=$(date "+%Y%m%d%H%M")
		echo "[*] Exporting FortiSIEM VM to OVA"
		govc vm.power -off $newname.tpl
		govc vm.change -vm $newname.tpl -name $newname-$timestamp
		govc export.ovf -sha=1 -vm $newname-$timestamp .
		echo "[*] Creating an image compatible with FortiPoC"
	    if [ $image_type == "Collector" ]; then
            echo "[*] Creating new OVA"
			mv -v $newname-$timestamp/$newname-$timestamp-disk-0.vmdk system.vmdk
	        tar -vcf FortiSIEM-$image_type-$version.$build.$timestamp.ova system.vmdk 
        	echo "[*] Cleaning up"
	        rm -vf system.vmdk cmdb.vmdk svn.vmdk
			rm -rvf $newname-$timestamp/
		elif [ $image_type == "VA" ]; then
	        mv -v $newname-$timestamp/$newname-$timestamp-disk-0.vmdk system.vmdk
			mv -v $newname-$timestamp/$newname-$timestamp-disk-1.vmdk cmdb.vmdk
			mv -v $newname-$timestamp/$newname-$timestamp-disk-2.vmdk svn.vmdk
	        echo "[*] Creating new OVA"
	        tar -vcf FortiSIEM-$image_type-$version.$build.$timestamp.ova system.vmdk cmdb.vmdk svn.vmdk
        	echo "[*] Cleaning up"
	        rm -vf system.vmdk cmdb.vmdk svn.vmdk
            rm -rvf $newname-$timestamp/
		fi
		chmod 666 FortiSIEM-$image_type-$version.$build.$timestamp.ova
		echo "[*] OVA Image Ready!: FortiSIEM-$image_type-$version.$build.$timestamp.ova"
	}

	find_vm=$(govc vm.info -r $newname.tpl | grep -c Name)
	if [ "$find_vm" -ne "0" ]; then
        echo "[*] A previous template found, executing preparation scripts."
		sysprep
		create_images
	else
        echo "[*] Deploying FortiSIEM template"
		deploy
		sysprep
		create_images
	fi

fi
