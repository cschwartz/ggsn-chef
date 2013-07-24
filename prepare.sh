HOST="brewmaster"
ssh-copy-id $HOST
scp provision.sh $HOST:.
scp ssh_git $HOST:.
scp deploy_key $HOST:/tmp/deploy_key
