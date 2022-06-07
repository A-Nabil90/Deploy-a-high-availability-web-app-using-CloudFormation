# Deploy a High-Availability Web App using CloudFormation 

> In this project (Udagram App), I deployed web servers for a highly available web app using CloudFormation.
> I wrote the script that creates and deploys the infrastructure and application for an Udagram app from the ground up.
> The script begin deploying the networking components followed by servers, security roles and software.

## The files consist of:
```sh
* /Udagram Diagram : Diagram of the infrastructure.
* create-stack-iac.sh : Cloudformation create stack script.
* delete-stack-iac.sh : Cloudformation delete stack script.
* network.yml : Udagram Project's network CloudFormation script.
* servers.yml : Udagram Project's servers CloudFormation script.
* network-parameters.json : Udagram Project's CloudFormation network script parameters.
* server-parameters.json : Udagram Project's CloudFormation servers script parameters.
```


## Instruction for deployment:

Kindly run:
```sh
> ./create-or-update-stack-iac.sh Udagram-IAC-Network network.yml network-parameters.json
```
Followed by:
```sh
> ./create-or-update-stack-iac.sh Udagram-IAC-Servers servers.yml server-parameters.json
```

## Instruction for deleting the stack:

To delete the servers stack please run:
```sh
> ./delete-stack-iac.sh Udagram-IAC-Servers
```
Followed by:
```sh
> ./delete-stack-iac.sh Udagram-IAC-Network
```
