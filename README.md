# About

This makes it easy to change your AWS/EC2 environment on the command
line. 

This is useful when working with multiple AWS/EC2 accounts. You do not
need to specify the access key/secret with each command. You simply 
type `aws {environment}` and the proper enviroment variables 
will be set. 

## Usage

* create a new settings file in the `creds/` dir, like `creds/prod.cred`
* use `aws prod` to switch to the environment
* use `aws` to show usage instructions

## Installation

* `git clone git@github.com:mostlygeek/multi-aws.git ~/.aws`
* `mkdir ~/.aws/creds`
* add: `source $HOME/.aws/bash-ec2` to `.bash_profile`
* done

## Creating cred/ files

The files in there are `source`'d by bash so they replace
the current environmnent variables for `EC2_ACCESS_KEY` and 
`EC2_SECRET`. The files look like this: 

<code>
    export AWS_ACCESS_KEY=your access key
    export AWS_SECRET=your secret
</code>
