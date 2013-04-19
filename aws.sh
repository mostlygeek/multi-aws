#!/bin/sh
basePath="$HOME/.aws"
credPath="$basePath/creds"

function errorout {
    echo "ERROR: $1"
    exit 1 
}

if [ -z $1 ]
then
    available=$(ls -1 $credPath | tr "\n" "|" | sed 's/|$//')
    echo
    echo "Usage: aws [$available]"
    echo

    echo "Example: "
    echo "> aws `ls -1 $credPath | head -1`"
    echo
    exit 1
fi

envPath="$credPath/$1"
if [ ! -d $envPath ]
then 
    errorout "Environment $1 path ($envPath) does not exist"
fi

pkFile="$envPath/pk.pem"
certFile="$envPath/cert.pem"

if [ ! -e $pkFile ]
then 
    errorout "Missing $pkFile"
fi

if [ ! -e $certFile ]
then 
    errorout "Missing $certFile"
fi

export EC2_ENV=$1
export EC2_PRIVATE_KEY="$envPath/pk.pem"
export EC2_CERT="$envPath/cert.pem"

echo ""
echo "EC2 Environment"
echo "---------------"
echo "EC2_ENV          = $EC2_ENV"
echo "EC2_PRIVATE_KEY  = $EC2_PRIVATE_KEY"
echo "EC2_CERT         = $EC2_CERT"
echo 
