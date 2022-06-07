#!/bin/bash

./create-or-update-iac Udagram-IAC-Network network.yml network-parameters.json
./create-or-update-iac Udagram-IAC-Servers servers.yml servers-parameters.json