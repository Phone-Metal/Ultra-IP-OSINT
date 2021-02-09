#BETA

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
#Licensed Under Attribution-NonCommercial-ShareAlike 4.0 International	
echo -e "Enter \e[92mIP Address:"

read ip_address 

echo "Start Time : $(date) && Current Directory: $(pwd)" 
echo -e "\e[92mConducting Automated \e[100mOSINT With IPWHOIS"
echo "Currency Code-Rates-Symbol : $(curl http://ipwhois.app/line/$ip_address?objects=currency_code,currency_symbol,currency_rates,> ip.txt && ip)" 
echo "IP address type : $(curl http://ipwhois.app/line/$ip_address?objects=type  > ip1.txt && ip)" 
echo "City : $(curl http://ipwhois.app/line/$ip_address?objects=city  > ip2.txt && cat >> ip)" 
echo "Region : $(curl http://ipwhois.app/line/$ip_address?objects=region  > ip3.txt && ip)" 
echo "Longitude : $(curl http://ipwhois.app/line/$ip_address?objects=longitude  > ip4.txt && ip)" 
echo "Latitude : $(curl http://ipwhois.app/line/$ip_address?objects=latitude  > ip5.txt && ip)" 
echo "Country neighbours : $(curl http://ipwhois.app/line/$ip_address?objects=country_neighbours  > ip.txt && ip)" 
echo "Country phone : $(curl http://ipwhois.app/line/$ip_address?objects=country_phone > ip6.txt && ip)" 
echo "Country capital : $(curl http://ipwhois.app/line/$ip_address?objects=country_capital  > ip.txt && ip)" 
echo "Country code : $(curl http://ipwhois.app/line/$ip_address?objects=country_code > ip7.txt && ip)" 
echo "Currency : $(curl http://ipwhois.app/line/$ip_address?objects=  > ip8.txt && ip)" 
echo "ISP : $(curl http://ipwhois.app/line/$ip_address?objects=isp  > ip9.txt && ip)" 
echo "Timezone name : $(curl http://ipwhois.app/line/$ip_address?objects=timezone_name  > ip10.txt && ip)" 
echo "Timezone : $(curl http://ipwhois.app/line/$ip_address?objects=timezone  > ip11.txt && ip)" 
echo "Organisation : $(curl http://ipwhois.app/line/$ip_address?objects=org  > ip12.txt && ip)" 
echo "Finished" 
#
echo "Generating Report" 
echo "Report : $(cat ip1.txt ip2.txt ip3.txt ip4.txt ip5.txt ip6.txt ip7.txt ip8.txt ip9.txt ip10.txt ip11.txt ip12.txt > ip.txt && cat ip.txt)" 
echo "Amount of API calls for the current month : $(curl http://ipwhois.app/line/$ip_address?objects=completed_requests)" 
#

echo "Conducting Automated OSINT with ROBOTEX FREE API" 

#workaround because I'm lazy
 
curl https://freeapi.robtex.com/ipquery/199.19.54.1 | jq | tr -d }{[] > robtex_report.txt && echo cat robtex_report.txt
#If You Use Any Part Of This Code In Your Program (which you probably won't since this isn't that good) 
#Please Follow The Rules Of Attribution-NonCommercial-ShareAlike 4.0 International 
