access_token=`sfdx force:org:display -u knowledgeshareTest --json | jq ".result.accessToken" -r`
instance_url=`sfdx force:org:display -u knowledgeshareTest --json | jq ".result.instanceUrl" -r`
curl ${instance_url}/services/data/v37.0/sobjects/ -s -H "Authorization: Bearer $access_token"
