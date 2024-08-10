#!/bin/bash

systemctl start vsftpd

if ! id -u "$FTP_USR" >/dev/null 2>&1; then
  adduser "$FTP_USR" --disabled-password || { echo "Failed to add user"; exit 1; }
fi

echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd || { echo "Failed to set password"; exit 1; }

echo "$FTP_USR" | tee -a /etc/vsftpd.userlist || { echo "Failed to add user to vsftpd.userlist"; exit 1; }

mkdir -p /var/www/html/ftp || { echo "Failed to create directory"; exit 1; }
chown "$FTP_USR":"$FTP_USR" /var/www/html/ftp || { echo "Failed to set ownership"; exit 1; }
chmod 755 /var/www/html/ftp || { echo "Failed to set permissions"; exit 1; }

sed -i -r "s/#write_enable=YES/write_enable=YES/1" /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1" /etc/vsftpd.conf

cat <<EOL >> /etc/vsftpd.conf
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/var/www/html/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist
EOL

systemctl stop vsftpd

exec /usr/sbin/vsftpd