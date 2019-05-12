#!/bin/bash
if [ -z "$CLUSTER_NAME" ]; then
        echo >&2 'Error:  You need to specify CLUSTER_NAME'
        exit 1
fi

if [ -z "$DISCOVERY_SERVICE" ]; then
        echo >&2 'Error:  You need to specify DISCOVERY_SERVICE'
        exit 1
fi

if [ -z "$PROXY_ADMIN_USER" ]; then
        echo >&2 'Error:  You need to specify PROXY_ADMIN_USER'
        exit 1
fi

if [ -z "$PROXY_ADMIN_PASS" ]; then
        echo >&2 'Error:  You need to specify PROXY_ADMIN_PASS'
        exit 1
fi

sed -i "s/admin_credentials=\"admin:admin\"/admin_credentials=\"$PROXY_ADMIN_USER:$PROXY_ADMIN_PASS\"/" /etc/proxysql.cnf
/usr/bin/proxysql --initial -f -c /etc/proxysql.cnf 
