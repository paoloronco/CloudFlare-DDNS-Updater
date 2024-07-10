auth_email="YOUR_AUTH_EMAIL"
auth_method="global"
auth_key="YOUR_AUTHorAPI_KEY"
zone_identifier="YOUR_ZONE_IDENTIFIER"
record_name="subdomain.domain.com"
ttl=3600

ip=$(curl -s http://ipv4.icanhazip.com)
record_id=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records?name=$record_name" \
    -H "X-Auth-Email: $auth_email" \
    -H "X-Auth-Key: $auth_key" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')

update=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_id" \
    -H "X-Auth-Email: $auth_email" \
    -H "X-Auth-Key: $auth_key" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'"$record_name"'","content":"'"$ip"'","ttl":'"$ttl"',"proxied":false}')

echo "$update"
