#! /bin/bash

function deploy_prerequisite() {
        sudo yum install -y firewalld
        sudo systemctl start firewalld
        sudo systemctl enable firewalld

}

function install_mariadb() {
        sudo yum install -y mariadb-server
        sudo systemctl start mariadb
        sudo systemctl enable mariadb
}

function configure_firewall_for_db() {
        sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
        sudo firewall-cmd --reload
}

function configure_db() {
        cat > configure_db.sql <<-EOF
        CREATE DATABASE IF NOT EXISTS ecomdb;
        CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
        GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
        FLUSH PRIVILEGES;
EOF
        sudo mysql < configure_db.sql
}

function load_db_data() {
        cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE IF NOT EXISTS products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");

EOF


sudo mysql < db-load-script.sql
}

function install_web_requirements() {
        sudo yum install -y httpd php php-mysqlnd
        sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
        sudo firewall-cmd --reload
}

function config_web() {
        sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf
}

function start_webserver() {
        sudo systemctl start httpd
        sudo systemctl enable httpd
}

function download_project() {
        sudo yum install -y git
        sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
}

function load_environment_variables() {
        sudo bash -c 'cat > /var/www/html/.env <<-EOF
DB_HOST=localhost
DB_USER=ecomuser
DB_PASSWORD=ecompassword
DB_NAME=ecomdb
EOF
'
}

function add_env_loader_to_index() {
    cat > /tmp/env_loader.php <<-'EOF'
<?php
// Function to load environment variables from a .env file
function loadEnv($path)
{
    if (!file_exists($path)) {
        return false;
    }

    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue;
        }

        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value);
        putenv(sprintf('%s=%s', $name, $value));
    }
    return true;
}

// Load environment variables from .env file
loadEnv(__DIR__ . '/.env');
?>
EOF

    sudo sed -i '/<body>/r /tmp/env_loader.php' /var/www/html/index.php
    
    rm -f /tmp/env_loader.php
}

deploy_prerequisite
install_mariadb
configure_firewall_for_db
configure_db
load_db_data
install_web_requirements
config_web
start_webserver
download_project
add_env_loader_to_index
load_environment_variables