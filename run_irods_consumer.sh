#!/bin/bash -e

/wait-for -t 90 irodshost:1247
provider_wait_status=$?
echo "provider host wait-for returned with status $provider_wait_status" | tee /tmp/results_of_provider_wait-for.txt

if [ $provider_wait_status  -eq 0 ]; then
    echo >&2 "Waiting 5 secs before configuring consumer..."
    sleep 5
    python /var/lib/irods/scripts/setup_irods.py <<-EOF
	irods
	irods
	2
	tempZone
	irodshost
	1247
	20000
	20199
	1248
	
	rods
	yes
	TEMPORARY_ZONE_KEY
	32_byte_server_negotiation_key__
	32_byte_server_control_plane_key
	rods
	
	EOF
    [ $? -eq 0 ] && echo -n SUCCESS || echo -n FAILURE
    echo " in setting up consumer"
fi

while true
do
  sleep 1
done

