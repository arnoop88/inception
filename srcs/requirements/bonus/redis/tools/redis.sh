#!/bin/sh

REDIS_CONF="/etc/redis/redis.conf"
BACKUP_CONF="/etc/redis/redis.conf.bak"
MAXMEMORY=${MAXMEMORY:-"2mb"} 
MEMORY_POLICY=${MEMORY_POLICY:-"allkeys-lru"}

if [ ! -f "$BACKUP_CONF" ]; then
    cp "$REDIS_CONF" "$BACKUP_CONF" || { echo "Failed to create backup of redis.conf"; exit 1; }
    
    sed -i "s|^bind 127.0.0.1|#bind 127.0.0.1|g" "$REDIS_CONF"
    sed -i "s|# maxmemory <bytes>|maxmemory $MAXMEMORY|g" "$REDIS_CONF"
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy $MEMORY_POLICY|g" "$REDIS_CONF"

    echo "Redis configuration updated."
else
    echo "Backup already exists. No changes made to redis.conf."
fi

# protected mode?
redis-server --protected-mode yes