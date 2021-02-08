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

alias ip = 'touch report.txt && echo ip.txt && sleep 30 && rm -rf ip.txt' 


#Function 

#Shell execution & perpetual-like execution
clear && apt-get update && apt-get install curl -qq > /dev/null 
banner 
	
echo -e "Enter \e[92mIP Address:"

read ip_address 

echo "Start Time : $(date) && Current Directory: $(pwd)" 
echo -e "\e[92mConducting Automated \e[100mOSINT With IPWHOIS"
echo "Currency Code-Rates-Symbol : $(curl http://ipwhois.app/line/$ip_address?objects=currency_code,currency_symbol,currency_rates,> ip.txt && ip)" 
echo "IP address type : $(curl http://ipwhois.app/line/$ip_address?objects=type  > ip.txt && ip)" 
echo "City : $(curl http://ipwhois.app/line/$ip_address?objects=city  > ip.txt && ip)" 
echo "Region : $(curl http://ipwhois.app/line/$ip_address?objects=region  > ip.txt && ip)" 
echo "Longitude : $(curl http://ipwhois.app/line/$ip_address?objects=longitude  > ip.txt && ip)" 
echo "Latitude : $(curl http://ipwhois.app/line/$ip_address?objects=latitude  > ip.txt && ip)" 
echo "Country neighbours : $(curl http://ipwhois.app/line/$ip_address?objects=country_neighbours  > ip.txt && ip)" 
echo "Country phone : $(curl http://ipwhois.app/line/$ip_address?objects=country_phone > ip.txt && ip)" 
echo "Country capital : $(curl http://ipwhois.app/line/$ip_address?objects=country_capital  > ip.txt && ip)" 
echo "Country code : $(curl http://ipwhois.app/line/$ip_address?objects=country_code > ip.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=  > ip.txt && ip)" 
echo "ISP : $(curl http://ipwhois.app/line/$ip_address?objects=isp  > ip.txt && ip)" 
echo "Timezone name : $(curl http://ipwhois.app/line/$ip_address?objects=timezone_name  > ip.txt && ip)" 
echo "Timezone : $(curl http://ipwhois.app/line/$ip_address?objects=timezone  > ip.txt && ip)" 
echo "Organisation : $(curl http://ipwhois.app/line/$ip_address?objects=org  > ip.txt && ip)" 
echo " : $(curl http://ipwhois.app/line/$ip_address?objects=  > ip.txt && ip)" 
echo " : $(curl http://ipwhois.app/line/$ip_address?objects=  > ip.txt && ip)" 
echo " : $(curl http://ipwhois.app/line/$ip_address?objects=  > ip.txt && ip)" 
echo "Amount of API calls for the current month : $(curl http://ipwhois.app/line/$ip_address?objects=completed_requests  > ip.txt && ip)" 
echo "Conducting Automated OSINT with ROBOTEX FREE API" 
#workaround because I'm lazy 
curl https://freeapi.robtex.com/ipquery/ip_address | jq | tr -d }{[] > robtex_report-$ip_address.txt && cat robtex_report-$ip_address.txt
echo "Conducting Automated OSINT with THREAT CROWD" 
curl https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=188.40.75.132 | jq | tr -d {}[] > threatcrowd_report-$ip_address.txt && cat threatcrowd_report-$ip_address.txt
