#!/bin/bash
#Draft ip

#Not the best code but still works :D

banner_func() { 
echo -e " \e[32m\e[1m _ _ \e[5m_IP-LOCATOR__ \e[25m_, __" 
               
echo -e "             \e[92m ######   ######## #"
echo -e "               \e[92m ##      ##     ##  "
echo -e "              \e[92m ##      ##     ## "
echo -e "              \e[92m##     ######### "
echo -e " \e[92m            ##     ##"    
 echo -e " \e[92m          ##     ##"       
echo -e " \e[92m         ####    ##"                                   
echo -e " \e[34m ~  ~   ~  ~ Automated ip OSINT Script~  ~   ~  ~"
} 

sleep 1


#Shell execution & perpetual-like execution
# not clean code :p
 
clear
banner_func 
	
echo -e "\e[1m\e[32mEnter IP Address:\e[21m"
#echo "\e[21m(Note: The Report Feature Is A Bit Buggy)"
read ip_address 
mkdir $ip_address-Report && cd $ip_address-Report/
 
ip_whois() {
echo " \e[32m\e[1mStart Time : $(date) && Current Directory: $(pwd)" 
echo -e " \e[32m\e[1mConducting Automated \e[100mOSINT With IPWHOIS"
echo " \e[32m\e[1mCurrency Code-Rates-Symbol \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=currency_code,currency_symbol,currency_rates)" 
echo " \e[32m\e[1mIP address type \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=type)" 
echo " \e[32m\e[1mCity \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=city)" 
echo " \e[32m\e[1mRegion \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=region)" 
echo " \e[32m\e[1mLongitude \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=longitude)" 
echo " \e[32m\e[1mLatitude \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=latitude)" 
echo " \e[32m\e[1mCountry neighbours \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=country_neighbours)" 
echo " \e[32m\e[1mCountry phone \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=country_phone)" 
echo " \e[32m\e[1mCountry capital \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=country_capital)" 
echo " \e[32m\e[1mCountry code \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=country_code)" 
echo " \e[32m\e[1mCurrency \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=currency)" 
echo " \e[32m\e[1mISP \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=isp)" 
echo " \e[32m\e[1mTimezone name \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=timezone_name)" 
echo " \e[32m\e[1mTimezone \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=timezone)" 
echo " \e[32m\e[1mOrganisation \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=org)" 
echo " \e[32m\e[1mAmount of API calls for the current month \e[21m: $(curl http://ipwhois.app/line/"$ip_address"?objects=completed_requests)"
} 

echo "" 
echo " \e[32m\e[1mConducting Automated OSINT with ROBTEX FREE API:\e[21m" 
#workaround because I'm lazy 
#robtex
curl  -sS https://freeapi.robtex.com/ipquery/"$ip_address" | jq | tr -d "}{[]"  
curl  -sS https://freeapi.robtex.com/ipquery/"$ip_address" | jq | tr -d "}{[]" 2>/dev/null > ROBTEX_REPORT.txt
#TC
echo "" 
echo " \e[32m\e[1mConducting Automated OSINT with THREAT CROWD\e[21m" 
#curl https://www.threatcrowd.org/searchApi/v2/ip/report/?"$ip_address" | jq | tr -d "{}[]" 
curl  -sS https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=$ip_address | jq | tr -d "{}[]" 
curl  -sS https://www.threatcrowd.org/searchApi/v2/ip/report/?ip=$ip_address | jq | tr -d "{}[]" 2>/dev/null > THREATCROWD_REPORT.txt
# Google it
echo "" 
gvar="https://www.google.com/search?&ie=UTF-8&oe=UTF-8&q=intext:%$ip_address" 
echo " \e[32mConducting Automated OSINT with Google\e[21m" 
echo " \e[32mURL \e[21m: $gvar" 
#call Function 
echo "" 
ip_whois
ip_whois 2>/dev/null > IPWHOIS_Report.txt  
echo " \e[32m\e[1mConducting Automated OSINT with ANY.GE API\e[21m" 
curl  -sS https://any.ge/api/ip/api.php?"$ip_address" | tr -d "{}"
curl  -sS https://any.ge/api/ip/api.php?"$ip_address" | tr -d "{}" 2>/dev/null > ANYGE_report.txt
#Check List 
echo "" 
echo " \e[32m\e[1mSeeing If IP Was Thought To Be Malicious Among 42905+ IP's\e[21m" 
mal="grep -n "$ip_address" BlockIP.txt"
if [[ -z "$mal" ]]; then
  echo "\e[1mNot Malicious" 
  echo "Didn't Match Any Malicious IP On List" > MAL_REPORT.txt
elif [[ -n "$mal" ]]; then
  echo "\e[1mMatch Found !,Thought To Be Malicious"
fi
echo " \e[32m\e[1mGenerating Report\e[21m" 
cat IPWHOIS_Report.txt MAL_REPORT.txt ANYGE_report.txt ROBTEX_REPORT.txt THREATCROWD_REPORT.txt > $ip_address-Report.txt
rm -rf IPWHOIS_Report.txt MAL_REPORT.txt ANYGE_report.txt ROBTEX_REPORT.txt THREATCROWD_REPORT.txt
echo -e "\e[92mOutput Should Be Saved To <IP address>.txt" 
echo " \e[32m\e[1mView Report Now?(y/n)\e[21m" 
read report
if [ $report == y ]
then
   more $ip_address-Report.txt 
else
   echo "\e[1mOkay,You Can View It Another Time"
fi 
echo " \e[32m\e[1mIf Something Went Wrong Please Consider Opening An Issue\e[21m"
