#!/bin/bash

export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://localhost:2379

# Read each line from the dump file
while IFS='|' read -r key value; do
  # Decode the key and value from Base64
  decoded_key=$(echo "$key" | base64 --decode)
  decoded_value=$(echo "$value" | base64 --decode)
  
  # Load the key-value pair into the destination etcd
  echo "put key: $decoded_key, value: $decoded_value"
  etcdctl put "$decoded_key" "$decoded_value"
done < etcd_dump.txt

echo "Data migration completed."
