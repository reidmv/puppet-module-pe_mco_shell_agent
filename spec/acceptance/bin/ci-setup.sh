#!/bin/sh

# Prep EC2 configuration from environment, if necessary
if [ ! -z "$AWS_ACCESS_KEY_ID" -a ! -f ~/.fog ]; then
	cat > ~/.fog <<-EOF
		---
		:default:
		  :aws_access_key_id: $AWS_ACCESS_KEY_ID
		  :aws_secret_access_key: $AWS_SECRET_ACCESS_KEY
	EOF
fi

# Generate an ssh keypair, if one doesn't already exist
if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen -f ~/.ssh/id_rsa -q -N ""
fi
