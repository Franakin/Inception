#!/bin/bash

if [ ! -d "/var/lib/mysql/"$MYSQL_DATABASE ]; then
    echo "FLUSH PRIVILEGES;" > init.sql
    echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;" >> init.sql
    echo "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'fpurdom.42.fr' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql
    echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> init.sql
    cat init.sql
    mariadbd --bootstrap < init.sql
fi

mariadbd