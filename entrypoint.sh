
#!/bin/sh
echo "SCP-Deployer - Start"
echo ""
echo "     ____             _         ____"
echo "    / __ )____  _____(_)____   / __ )________  __  _____  _____"
echo "   / __  / __ \/ ___/ / ___/  / __  / ___/ _ \/ / / / _ \/ ___/"
echo "  / /_/ / /_/ / /  / (__  )  / /_/ / /  /  __/ /_/ /  __/ /"
echo " /_____/\____/_/  /_/____/  /_____/_/   \___/\__,_/\___/_/ "

if [[ "$INPUT_KEY" ]]; then
    echo -e "${INPUT_KEY}" > tmp_id
    chmod 400 tmp_id
    scp -qr -P $INPUT_PORT -o StrictHostKeyChecking=no -i tmp_id $INPUT_SOURCE "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_TARGET"
    echo "Transfer process complete using SSH keys"
else
    echo "Trying password authentication as key is not available"
    sshpass -p $INPUT_PASSWORD scp -qr -P $INPUT_PORT -o StrictHostKeyChecking=no $INPUT_SOURCE "$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_TARGET"
    echo "Transfer process complete using password"
fi

echo "SCP-Deployer - Done"
