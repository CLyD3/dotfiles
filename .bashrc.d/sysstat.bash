sysstatus(){
systemctl status;
echo -e "\n";
free -mt | head -2 | tail -1 | awk '{print $2"MB ( "$4"MB / "$3"MB / "$7"MB )"}';
echo -e "\n";
{ ps aux | head -1 ; ps aux | sort -nk +4 | tail; } | awk '{print $2" " $3" " $4" " $11}' | column -t;
echo -e "\n";
lsof -P -i -n;
echo -e "\n";
ip -f inet addr show enp9s0;
ip -f inet addr show wlp11s0;


}

