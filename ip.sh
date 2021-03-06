#!/bin/bash
#Draft ip
#Created By Phone-Metal (https://github.com/Phone-Metal) 
#some apis are for non-commercial use only 
#so to avoid conflict this script is Licensed Under : Attribution-NonCommercial 4.0 International License 

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
echo -e "" 	
echo -e " \e[32mEnter a IP Address:"
#echo "\(Note: The Report Feature Is A Bit Buggy)"
read ip_address 
sleep 0.8
mkdir $ip_address-Report && cd $ip_address-Report
echo "Start Time : $(date)" 
echo "Folder Created For Report in $(pwd)"
echo "Starting Recon" 
sleep 2 
ip_whois() {

echo "" 
echo "Currency  : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=currency)" 
echo "Currency Rates : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=currency_rates)" 
echo "Currency Symbol : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=currency_symbol)" 
echo "Country neighbours : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_neighbours)" 
echo "Country phone : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_phone)" 
echo "Country capital : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_capital)" 
echo "Country code : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=country_code)" 
echo "Currency Code : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=currency_code)" 
echo ""
echo "ISP : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=isp)" 
echo "IP address type : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=type)" 
echo ""
echo "City : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=city)" 
echo "Region : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=region)" 
echo ""
echo "Longitude : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=longitude)" 
echo "Latitude : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=latitude)" 
echo ""
echo "Timezone name : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=timezone_name)" 
echo "Timezone : $(curl -sS http://ipwhois.app/line/"$ip_address"?objects=timezone)" 
echo ""
echo "Organisation : $(curl  -sS http://ipwhois.app/line/"$ip_address"?objects=org)" 
echo ""
} 

echo "" 
echo "Conducting Automated OSINT with ROBTEX FREE API:" 
echo "" 
#workaround because I'm lazy 
#robtex
sleep 1.5
echo "Robtex Report:"
echo ""
curl  -sS https://freeapi.robtex.com/ipquery/"$ip_address" | jq | tr -d "}{[]"  
#TC
sleep 1.9
echo "" 
echo "Conducting Automated OSINT with THREAT CROWD" 
echo "" 
#curl https://www.threatcrowd.org/searchApi/v2/ip/report/?"$ip_address" | jq | tr -d "{}[]" 
echo "Threat Crowd Report:" 
echo ""
curl -sS https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=$ip_address | jq | tr -d "{}[]" 
#call Function 
echo "" 
echo -e "Conducting Automated OSINT With IPWHOIS"
sleep 0.9
ip_whois
echo "" 
echo "Conducting Automated OSINT with ANY.GE API" 
echo "" 
echo "Any.ge Report:" 
echo "" 
curl  -sS https://any.ge/api/ip/api.php?ip=$ip_address | tr -d "{}" | sort | column -t

# Google it
echo "" 
echo "Conducting Automated OSINT with GOOGLE" 
sleep 1.9
echo "" 
gvar="https://www.google.com/search?&ie=UTF-8&oe=UTF-8&q=intext:%$ip_address" 
echo "URL : $gvar"  
#DShield
echo "" 
echo "Conducting Automated OSINT with DSHIELD API" 
sleep 0.9
echo "" 
echo "DShield API Report:" 
echo "" 
curl -sS http://isc.sans.edu/api/ip/$ip_address | tr -d "{}" 
curl -sS https://isc.sans.edu/api/ipdetails/$ip_address | tr -d "{}" 
#Check List 
echo "" 
echo "Checking If IP Was Thought To Be Malicious Among 42905+ IP's" 
sleep 1.1
echo "" 
mal="grep -n "$ip_address" BlockIP.txt"
if [[ -z "$mal" ]]; then
echo "Match Found !,Thought To Be Malicious"
elif [[ -n "$mal" ]]; then
  echo "Not Malicious" 
   fi
#ip asn
echo "Conducting Automated OSINT With BGPRANKING-NG.CIRCL.LU" 
echo "" 
echo "bgpranking-ng.circl.lu report:" 
echo "" 
curl -sS https://bgpranking-ng.circl.lu/ipasn_history/?ip=$ip_address | tr -d "{}" 
echo "" 
echo ""
echo "Conducting Automated OSINT with BARRACUDA REPUTATION" 
echo "URL : https://www.barracudacentral.org/lookups/lookup-reputation" 
sleep 0.7
echo "" 
echo "<><><>| OSINT Finished !|<><><>"

#Report 

echo "The Reporting Is A Bit Buggy Will Be Fixed Soon" 
echo "" 
sleep 0.9
echo "       |Please Wait|         " 
echo " <=========================>" 
echo "<|==> Generating Report <==|>"
echo " <=========================>" 
echo ""

curl  -sS https://freeapi.robtex.com/ipquery/"$ip_address" | jq | tr -d "}{[]" 2>/dev/null > ROBTEX_REPORT.txt
curl -sS https://bgpranking-ng.circl.lu/ipasn_history/?ip=$ip_address | tr -d "{}" 2>/dev/null > BG_report.txt
curl -sS http://isc.sans.edu/api/ip/$ip_address | tr -d "{}" 2>/dev/null > DH_report.txt
curl -sS https://isc.sans.edu/api/ipdetails/$ip_address | tr -d "{}" 2>/dev/null > DH_report.txt
curl -sS https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=$ip_address | jq | tr -d "{}[]" 2>/dev/null > THREATCROWD_REPORT.txt
ip_whois 2>/dev/null > IPWHOIS_Report.txt  
curl  -sS https://any.ge/api/ip/api.php?ip=$ip_address | tr -d "{}" | sort | column -t 2>/dev/null > ANYGE_report.txt
echo "Didn't Match Any Malicious IP On List" > MAL_REPORT.txt

cat IPWHOIS_Report.txt BG_report.txt DH_report.txt MAL_REPORT.txt ANYGE_report.txt ROBTEX_REPORT.txt THREATCROWD_REPORT.txt > $ip_address-Report.txt
rm -rf IPWHOIS_Report.txt BG_report.txt DH_report.txt MAL_REPORT.txt ANYGE_report.txt ROBTEX_REPORT.txt THREATCROWD_REPORT.txt
echo -e "Output Should Be Saved To <IP address>.txt" 
sleep 1.9
echo "View Report Now?(y/n)" 
#echo "Note Press ENTER <-| For Next Page/Info" 
#sleep 0.9
read report
if [ "$report" = "y" ]
then
echo "Using More To View Report" 
sleep 0.9
   more $ip_address-Report.txt 
else
   echo "Okay,You Can View It Another Time"
fi 
echo "If Something Went Wrong Please Consider Opening An Issue Or Open One If You Want To Recommended An API"
