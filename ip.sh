#Draft ip

#Not the best code but still works :D

banner(){ 
echo -e "_ _ _ \e[5m_IP-LOCATOR__ \e[25m_, __" 
               
echo -e "             \e[92m ####    ######## "
echo -e "               \e[92m ##      ##     ##  "
echo -e "              \e[92m ##      ##     ## "
echo -e "              e[92m ##     ########  "
echo -e " \e[92m            ##     ##"    
 echo -e " \e[92m          ##     ##"       
echo -e " \e[92m         ####      ##"                                   
 echo -e "\e[43m~  ~   ~  ~ Automated ip OSINT Script~  ~   ~  ~"
} 

#Function
ip_alias() {
alias ip = 'touch report.txt && echo ip.txt && sleep 30 && rm -rf ip.txt' 
ip } 

#Function 

#Shell execution & perpetual-like execution
clear && banner 
clear && apt-get update && apt-get install curl -qq > /dev/null 
banner 
	
echo -e "Enter \e[92mIP Address:"

read ip_address 

echo "Start Time : $(date) && Current Directory: $(pwd)" 
echo -e "\e[92mConducting Automated \e[100mOSINT"
echo "Currency Code - Rates - Symbol : $(curl http://ipwhois.app/line/$ip_address?objects=currency_code,currency_symbol,currency_rates,> ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=currency  > ip.txt && ip)" 
echo "ISP : $(curl http://ipwhois.app/line/$ip_address?objects=isp  > ip.txt && ip)" 
