#!/bin/bash
#Draft ip
#Created By Phone-Metal (https://github.com/Phone-Metal) 
#Attribution-NonCommercial 4.0 International License 

#Not the best code but still works :D

banner_func() { 
echo -e " 
\e[32m\e[1m _ _ \e[5m_IP-LOCATOR__ \e[25m_, __" 
               
echo -e "             \e[5m\e[92m ######   ######## #"
echo -e "               \e[5m\e[92m ##      ##     ##  "
echo -e "              \e[5m\e[92m ##      ##     ## "
echo -e "              \e[5m\e[92m##     ######### "
echo -e "\e[5m\e[92m            ##     ##"    
 echo -e "\e[5m\e[92m          ##     ##"       
echo -e "\e[5m\e[92m         ####    ##"                                   
echo -e "\e[5m\e[34m ~  ~   ~  ~ Automated IP OSINT Script~  ~   ~  ~"
} 

sleep 1


#Shell execution & perpetual-like execution
# not clean code :p
 
clear
banner_func 
	
echo -e "Enter IP Address:"
#echo "\(Note: The Report Feature Is A Bit Buggy)"
read ip_address 
sleep 0.8
mkdir $ip_address-Report && cd $ip_address-Report/
echo "Start Time : $(date)" 
echo "Current Directory: $(pwd)" 
sleep 1.5 
ip_whois() {
sleep 0.7
echo -e "Conducting Automated OSINT With IPWHOIS"
echo "Currency Code-Rates-Symbol : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=currency_code,currency_symbol,currency_rates)" 
echo "IP address type : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=type)" 
echo "City : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=city)" 
echo "Region : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=region)" 
echo "Longitude : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=longitude)" 
echo "Latitude : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=latitude)" 
echo "Country neighbours : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_neighbours)" 
echo "Country phone : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_phone)" 
echo "Country capital : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_capital)" 
echo "Country code : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_code)" 
echo "Currency : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=currency)" 
echo "ISP : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=isp)" 
echo "Timezone name : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=timezone_name)" 
echo "Timezone : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=timezone)" 
echo "Organisation : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=org)" 
echo "Amount of API calls for the current month : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=completed_requests)"
} 

echo "" 
echo "Conducting Automated OSINT with ROBTEX FREE API:" 
#workaround because I'm lazy 
#robtex
sleep 2.1
curl  -sS https://freeapi.robtex.com/ipquery/"$ip_address" | jq | tr -d "}{[]"  
curl  -sS https://freeapi.robtex.com/ipquery/"$ip_address" | jq | tr -d "}{[]" 2>/dev/null > ROBTEX_REPORT.txt
#TC
sleep 1.9
echo "" 
echo "Conducting Automated OSINT with THREAT CROWD" 
#curl https://www.threatcrowd.org/searchApi/v2/ip/report/?"$ip_address" | jq | tr -d "{}[]" 
curl  -sS https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=$ip_address | jq | tr -d "{}[]" 
curl  -sS https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=$ip_address | jq | tr -d "{}[]" 2>/dev/null > THREATCROWD_REPORT.txt
#call Function 
echo "" 
sleep 2.1
ip_whois
ip_whois 2>/dev/null > IPWHOIS_Report.txt  
echo "Conducting Automated OSINT with ANY.GE API" 
curl  -sS https://any.ge/api/ip/api.php?"$ip_address" | tr -d "{}"
curl  -sS https://any.ge/api/ip/api.php?"$ip_address" | tr -d "{}" 2>/dev/null > ANYGE_report.txt

# Google it
sleep 2
echo "" 
gvar="https://www.google.com/search?&ie=UTF-8&oe=UTF-8&q=intext:%$ip_address" 
echo "Conducting Automated OSINT with GOOGLE" 
echo "URL : $gvar"  

#Check List 
sleep 3
echo "" 
echo "Seeing If IP Was Thought To Be Malicious Among 42905+ IP's" 
mal="grep -n "$ip_address" BlockIP.txt"
if [[ -z "$mal" ]]; then
  echo "Not Malicious" 
  echo "Didn't Match Any Malicious IP On List" < MAL_REPORT.txt
elif [[ -n "$mal" ]]; then
  echo "Match Found !,Thought To Be Malicious"
fi
echo "OSINT Finished!" 
echo " =========================" 
echo "|==> Generating Report <==|"
echo " =========================" 
cat IPWHOIS_Report.txt MAL_REPORT.txt ANYGE_report.txt ROBTEX_REPORT.txt THREATCROWD_REPORT.txt > $ip_address-Report.txt
rm -rf IPWHOIS_Report.txt MAL_REPORT.txt ANYGE_report.txt ROBTEX_REPORT.txt THREATCROWD_REPORT.txt
echo -e "Output Should Be Saved To <IP address>.txt" 
sleep 1.9
echo "View Report Now?(y/n)" 
read report
if [ $report == y ]
then
   more $ip_address-Report.txt 
else
   echo "Okay,You Can View It Another Time"
fi 
echo "If Something Went Wrong Please Consider Opening An Issue"
