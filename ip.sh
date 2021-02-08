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

sleep 5
#Function 

#Shell execution & perpetual-like execution
clear && apt-get update && apt-get install curl -qq > /dev/null 
banner 
	
echo -e "Enter \e[92mIP Address:"

read ip_address 

script --log-out Report_For-$ip_address.txt

echo "Start Time : $(date) && Current Directory: $(pwd)" 
echo -e "\e[92mConducting Automated \e[100mOSINT With IPWHOIS"
echo "Currency Code-Rates-Symbol : $(curl http://ipwhois.app/line/$ip_address?objects=currency_code,currency_symbol,currency_rates)" 
echo "IP address type : $(curl http://ipwhois.app/line/$ip_address?objects=type)" 
echo "City : $(curl http://ipwhois.app/line/$ip_address?objects=city)" 
echo "Region : $(curl http://ipwhois.app/line/$ip_address?objects=region)" 
echo "Longitude : $(curl http://ipwhois.app/line/$ip_address?objects=longitude)" 
echo "Latitude : $(curl http://ipwhois.app/line/$ip_address?objects=latitude)" 
echo "Country neighbours : $(curl http://ipwhois.app/line/$ip_address?objects=country_neighbours)" 
echo "Country phone : $(curl http://ipwhois.app/line/$ip_address?objects=country_phone)" 
echo "Country capital : $(curl http://ipwhois.app/line/$ip_address?objects=country_capital)" 
echo "Country code : $(curl http://ipwhois.app/line/$ip_address?objects=country_code)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=)" 
echo "ISP : $(curl http://ipwhois.app/line/$ip_address?objects=isp)" 
echo "Timezone name : $(curl http://ipwhois.app/line/$ip_address?objects=timezone_name)" 
echo "Timezone : $(curl http://ipwhois.app/line/$ip_address?objects=timezone)" 
echo "Organisation : $(curl http://ipwhois.app/line/$ip_address?objects=org)" 
echo "Amount of API calls for the current month : $(curl http://ipwhois.app/line/$ip_address?objects=completed_requests)" 
echo "" 
echo "Conducting Automated OSINT with ROBTEX FREE API:" 
#workaround because I'm lazy 
curl https://freeapi.robtex.com/ipquery/$ip_address | jq | tr -d }{[] 
echo "" 
echo "Conducting Automated OSINT with THREAT CROWD" 
curl https://www.threatcrowd.org/searchApi/v2/ip/report/?$ip_address | jq | tr -d {}[] 
echo "" 
gvar = https://www.google.com/search?&ie=UTF-8&oe=UTF-8&q=intext:%$ip_address 
echo "Conducting Automated OSINT with Google" 
echo "URL : $gvar" 
echo "" 
echo "Conducting Automated OSINT with ANY.GE API" 
curl https://any.ge/api/ip/api.php?$ip_address | tr -d "{}"
exit
echo -e "\e[92mOutput Should Be Saved To Report_For-<IP Address>.txt" 
echo "If Something Went Wrong Please Consider Opening An Issue"
