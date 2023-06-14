gameid=$1
collectionid=$2
echo -n "steamcmd +login anonymous ">temp.sh
curl -s --data "collectioncount=1&publishedfileids[0]=$collectionid" https://api.steampowered.com/ISteamRemoteStorage/GetCollectionDetails/v1/ | jq '.response.collectiondetails[] | .children[] | .publishedfileid' | sed 's/^/+workshop_download_item '"$gameid"' /' | tr '\n' ' ' >> temp.sh
echo " +quit" >> temp.sh
echo "rm temp.sh" >> temp.sh
chmod +x temp.sh
