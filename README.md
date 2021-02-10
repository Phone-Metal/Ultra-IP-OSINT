# Automated IP Address-OSINT :
[![License: IP OSINT](https://img.shields.io/badge/lP-OSINT-f39f37)](https://github.com/Phone-Metal/Ultra-IP-OSINT)  
 
![](https://img.shields.io/badge/Scripted%20In-Bash-f39f37)   ![](https://img.shields.io/badge/Status:%20Alpha-f54f38)
#### A Simple Bash Script To Automated Your IP Information Gathering OSINT Needs. 
![IP OSINT](https://github.com/Phone-Metal/IP-OSINT-/blob/main/1612767709-picsay.png)
## Features :

<--> Currently Queries And Gets Detailed Information About :

* Currency Code-Rates-Symbol
* IP address type
* Organisation 
* IP ASN History of discovering an IP announced by ASN and the nearest prefix announcing it at a particular date
* City & Region
* Protocols 
* Reports or Records 
* Longitude & Latitude
* Country neighbours 
* Country phone 
* Country capital 
* Country code 
* Timezone name & Timezone
* ISP
* Malicious IP's & Malware 
* Searches List Of 42905+ Known IP's 
* ~~Destination port a Malicious packet was sent to & Source port the blocked packet came from~~ (Currently Not Working Will Be Fixed Soon) 
* AS & Asname
* Bgproute & Routedesc & Whoisdesc

     ---

### Installing : 

Should Work With Anything That Has ![](https://img.shields.io/badge/Bash-green.svg) [(Get It Here)](https://ftp.gnu.org/gnu/bash/) And The Basic Packages

#### For Debian Based Systems (Including *Termux*) :

`apt-get update && apt-get upgrade`

Then :

* `apt-get install curl coreutils script jq git -qq > /dev/null && git clone https://github.com/Phone-Metal/Ultra-IP-OSINT` 

Afterwards Navigate To the Directory :

`cd Ultra-IP-OSINT && bash ip.sh`

#### Cent OS : 

`sudo yum update && yum check-update`
 
Then :

`sudo yum install -y git coreutils jq script git curl && git clone https://github.com/Phone-Metal/Ultra-IP-OSINT && cd Ultra-IP-OSINT && bash ip.sh`

#### Fedora :

`dnf check-update && sudo dnf upgrade`

Then :

`sudo dnf install -y git coreutils jq script curl && git clone https://github.com/Phone-Metal/Ultra-IP-OSINT/ && cd Ultra-IP-OSINT && bash ip.sh`

### To do :

* Bulk IP Lookup
* Get More Information About IP
* Weather Details About IP's Location
* Get Information About Reverse DNS of the IP & Mobile connection
* Detect Any Proxy or VPN or Tor exit address
* ~~Detect Malicious IP Or If Reported (Improve)~~

## This Script Uses :

* Threat Crowd API Version 2
* IP Whois API
* Robtex Freeapi
* Google 
* DShield API
* Any.ge IP Address API
* Manually Curated IP Blocklist by Pallebone
* D4-project 
* Barracuda Reputation

#### ![](https://img.shields.io/badge/%20Bugs-f54f38) 
 
If You Encounter Bugs  or Spotted Mistakes Just Open An Issue 
All Contributions Are Really Appreciated :D

### License : 
Most Of The API's Are For Non-commercial Use Only, So To Avoid 
Any Issues I Choose CC BY NC 

#### Attribution-NonCommercial 4.0 International
[![License: CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/)
