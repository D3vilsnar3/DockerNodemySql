while getopts "d:u:p:" opt; do
    case ${opt} in
    d )
        database=$OPTARG
        ;;
    u )
        username=$OPTARG
        ;;
    p )
        password=$OPTARG
        ;;
    \?)
        echo "Invalid option: $OPTARG"
        echo "Usage: getDB"
        echo "       getDB -h hostname -u username -p password"
        ;;
    :)
        echo "Missing Arguements for $OPTARG"
        ;;
    esac
done
if [ -n "$username" ]; then
    sed -i 's/defaultuser/'$username'/g' docker-compose.yaml
fi

if [ -n "$password" ]; then
    sed -i 's/defaultpass/'$password'/g' docker-compose.yaml
fi

if [ -n "$database" ]; then
    sed -i 's/defaultdb/'$database'/g' docker-compose.yaml
else 
    sed -i 's/MYSQL_DATABASE: defaultdb/ /g' docker-compose.yaml
fi