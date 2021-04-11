### Installing : 

Originally Intended For Andorid Termux However, Should Work With Anything That Has ![](https://img.shields.io/badge/Bash-green.svg) https://ftp.gnu.org/gnu/bash/ And The Basic Packages

If It Doesn't Work Just Tweak The Script And Submit A Pull Request :D 

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
