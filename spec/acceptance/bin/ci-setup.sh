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
