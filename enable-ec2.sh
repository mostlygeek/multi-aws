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

alias aws="$basePath/aws.sh"
