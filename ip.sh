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

echo "Currency : $(curl http://ipwhois.app/line/8.8.4.4?objects=currency  > ip.txt && ip)" 
