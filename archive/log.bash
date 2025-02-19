# Log monitoring script
#!/bin/bash
LOG_PATH="/var/log/nginx/access.log"
ARCHIVE_IPS=("198.245.53.182" "37.1.213.27" "5.188.0.77" "89.38.210.19")

tail -Fn0 $LOG_PATH | while read line ; do
    for ip in "${ARCHIVE_IPS[@]}"; do
        echo "$line" | grep -q "$ip" && \
        echo "$(date) - Archive.Today activity detected: $line" >> /var/log/archive_block.log
    done
done
