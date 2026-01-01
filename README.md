# E-Commerce Application Deployment Script 🚀

A comprehensive Bash automation script for deploying a full-stack e-commerce application on CentOS/RHEL systems. This project demonstrates DevOps best practices, infrastructure automation, and secure application deployment.

## 📋 Overview

This automated deployment script handles the complete setup of an e-commerce web application, including:
- Database server installation and configuration
- Web server setup with PHP support
- Firewall configuration
- Application deployment from GitHub
- Environment-based configuration management

## 🛠️ Technologies Used

- **Operating System**: CentOS/RHEL
- **Web Server**: Apache (httpd)
- **Database**: MariaDB
- **Backend**: PHP with MySQLnd extension
- **Security**: FirewallD
- **Version Control**: Git
- **Scripting**: Bash

## ✨ Features

### 🔒 Security First
- Automated firewall setup and configuration
- Database user with specific privileges
- Environment variable-based credential management
- Isolated database credentials from source code

### 🤖 Full Automation
- One-command deployment
- No manual configuration required
- Idempotent operations
- Error handling and service enablement

### 📦 Complete Stack Setup
- MariaDB database server
- Apache web server
- PHP runtime environment
- Sample product database with test data

## 🚀 Quick Start

### Prerequisites
```bash
# Root or sudo access required
# CentOS 7+ or RHEL 7+
```

### Installation

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd deploy-ecommerce-app
```

2. **Make the script executable**
```bash
chmod +x deploy-ecommerce.sh
```

3. **Run the deployment**
```bash
./deploy-ecommerce.sh
```

4. **Access the application**
```
http://your-server-ip
```

## 📂 Project Structure

```
deploy-ecommerce-app/
├── deploy-ecommerce.sh    # Main deployment script
├── README.md              # This file
└── generated files/
    ├── configure_db.sql   # Database initialization
    └── db-load-script.sql # Sample data
```

## 🔧 Script Functions

| Function | Purpose |
|----------|---------|
| `deploy_prerequisite()` | Installs and configures firewalld |
| `install_mariadb()` | Sets up MariaDB server |
| `configure_firewall_for_db()` | Opens port 3306 for database |
| `configure_db()` | Creates database and user |
| `load_db_data()` | Populates database with sample products |
| `install_web_requirements()` | Installs Apache and PHP |
| `config_web()` | Configures Apache for PHP |
| `start_webserver()` | Starts and enables Apache |
| `download_project()` | Clones application from GitHub |
| `add_env_loader_to_index()` | Injects environment variable loader |
| `load_environment_variables()` | Creates .env configuration file |

## 🗄️ Database Configuration

**Default Credentials:**
- Database: `ecomdb`
- User: `ecomuser`
- Password: `ecompassword`
- Host: `localhost`

**Sample Products:**
The script automatically loads 8 sample products including laptops, drones, VR headsets, tablets, watches, phone covers, and phones.

## 🌐 Application Features

- Responsive e-commerce interface
- Product catalog display
- Dynamic pricing
- Product images
- Search functionality
- Bootstrap-based responsive design

## 🔐 Security Considerations

⚠️ **Important**: This script is designed for learning and development purposes.

**For Production Use:**
- Change default database credentials
- Implement SSL/TLS certificates
- Use secure password management
- Restrict database access
- Enable SELinux policies
- Regular security updates

## 📊 System Requirements

- **OS**: CentOS 7+ / RHEL 7+
- **RAM**: Minimum 1GB
- **Disk Space**: 2GB free space
- **Network**: Internet connection for package downloads
- **Privileges**: Root or sudo access

## 🐛 Troubleshooting

### Database Connection Issues
```bash
# Check MariaDB status
sudo systemctl status mariadb

# Check firewall rules
sudo firewall-cmd --list-all
```

### Web Server Issues
```bash
# Check Apache status
sudo systemctl status httpd

# Check Apache logs
sudo tail -f /var/log/httpd/error_log
```

### Permission Issues
```bash
# Fix web directory permissions
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html
```

## 📚 Learning Outcomes

This project demonstrates:
- ✅ Bash scripting and automation
- ✅ Linux system administration
- ✅ LAMP stack deployment
- ✅ Database management
- ✅ Firewall configuration
- ✅ Environment variable management
- ✅ Git integration
- ✅ DevOps practices

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📝 License

This project is open source and available for educational purposes.

## 👤 Author

**[Saul Tzakun]**
- LinkedIn: www.linkedin.com/in/saulisraeltzakumochoa

## 🙏 Acknowledgments

- KodeKloud for the sample e-commerce application
- Open source community for the tools used

---

⭐ If you found this project helpful, please give it a star!

#DevOps #BashScripting #Automation #Linux #LAMP #WebDevelopment #Learning
```