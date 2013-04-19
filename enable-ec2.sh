#
# 
# this file should be sourced from ~/.bash_profile
#
# This sets up ~/.aws for EC2 
#
basePath="$HOME/.aws"
toolsPath="$basePath/cli_tools/ec2-api-tools/bin"
credPath="$basePath/creds"

if [ ! `echo $PATH | grep "$toolsPath"` ]
then
    export PATH="$PATH:$toolsPath"
    export EC2_HOME="$basePath/cli_tools"
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
fi

function print_ec2Env {
    echo ""
    echo "EC2 Environment"
    echo "---------------"
    echo "EC2_PRIVATE_KEY  = $EC2_PRIVATE_KEY"
    echo "EC2_CERT         = $EC2_CERT"
    echo 
}
#
# This is exported into the shell we can use setEC2Env as a CLI 
# command
function setEC2Env {
    envPath="$credPath/$1"
    if [ -e $envPath ]
    then
        pkFile="$envPath/pk.pem"
        certFile="$envPath/cert.pem"

        if [ ! -e $pkFile ]
        then 
            echo "ERROR: $pkFile missing"
            return
        fi

        if [ ! -e $certFile ]
        then 
            echo "ERROR: $certFile missing"
            return
        fi
        
        export EC2_PRIVATE_KEY="$envPath/pk.pem"
        export EC2_CERT="$envPath/cert.pem"
        print_ec2Env
    else
        echo "ERROR: Unknown Environment: $1 ($envPath)"
    fi
}

export -f setEC2Env

