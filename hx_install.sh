################################################################################
# Author:   FURams09
# 
# Web:      https://golangcode.com/how-to-install-go-in-ubuntu-16-04/
#
# Program:
#   Install go to a new server to prepare it for a new Yiimp installer
# 
################################################################################

output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}


if [ -d "~/.hxd" ]
then
    output "Hx is already installed."
	exit 1
else
	output "Hx not installed. Installation continuing."
	read -e -p "HXD Branch to Build From (default if blank) : " HXDBRANCH
	read -e -p "HXWALLET Branch to Build From (default if blank) : " HXWALLETBRANCH
fi

git clone https://github.com/hybridnetwork/hxd $GOPATH/src/github.com/hybridnetwork/hxd
cd $GOPATH/src/github.com/hybridnetwork/hxd

if [ $HXDBRANCH != ""] 
then
	git checkout $HXDBRANCH

fi
glide install
go install $(glide nv)


git clone https://github.com/hybridnetwork/hxwallet $GOPATH/src/github.com/hybridnetwork/hxwallet
cd $GOPATH/src/github.com/hybridnetwork/hxwallet

if [ $HXWALLETBRANCH != ""] 
then
	git checkout $HXWALLETBRANCH

fi
glide install
go install






output "Installed HXD from $HXDBRANCH"
output "Installed HXD from $HXWALLETBRANCH"
output ""
output ""
output "run hxd with tags --notls --txindex when running for yiimp"
output "run hxwallet with tags --noservertls --noclienttls when running for yiimp"
output ""
output ""
output "You will need to make sure the RPC user and password are the same in hxd.conf and hxwallet.conf"