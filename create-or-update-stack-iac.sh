#!/bin/bash
echo "Checking if stack exists ..."

if ! aws cloudformation describe-stacks --region us-east-1 --stack-name $1 ; then

  echo -e "\nStack does not exist, creating ..."
  aws cloudformation create-stack \
  --stack-name $1 \
  --template-body file://$2 \
  --parameters file://$3 \
  --region=us-east-1 \
  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND
  
  echo "Waiting for stack to be created ..."
  aws cloudformation wait stack-create-complete --stack-name $1 --region=us-east-1
  
  if [ $status -ne 0 ] ; then

    # Don't fail for no-op update
    if [[ $update_output == *"ValidationError"* && $update_output == *"No updates"* ]] ; then
      echo -e "\nFinished create/update - no updates to be performed"
      exit 0
    else
      exit $status
    fi
  fi

else

  echo -e "\nStack exists, attempting update ..."

  set +e
  update_output=$( aws cloudformation update-stack \
    --stack-name $1 \
    --template-body file://$2 \
    --parameters file://$3 \
    --region=us-east-1 \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND 2>&1)
  
  echo "Waiting for stack update to complete ..."
  aws cloudformation wait stack-update-complete --stack-name $1 --region=us-east-1

fi

echo "Finished create/update successfully!"
