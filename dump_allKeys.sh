#!/bin/bash

export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://localhost:2379

etcdctl get "" --prefix -w json | jq -r '.kvs[] | "\(.key)|\(.value)"' > etcd_dump.txt