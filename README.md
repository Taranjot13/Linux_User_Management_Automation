# 🛠️ Linux User Management Automation

> Bash script project created in Semester 4 to automate Linux user management tasks. Built using shell scripting, this tool simplifies the addition, deletion, and modification of user accounts on a Linux system.

## 📌 Features

- ✅ Add/Delete/Modify Linux Users
- 🔐 Reset User Passwords
- 📜 Bulk Add Users from `users.txt`
- 🧾 Logging of all operations
- 🎨 Interactive menu using colors
- 🔍 View logs and current system users

## 📂 Project Structure

Linux_User_Management_Automation/
├── scripts/
│ └── user_management.sh # Main Bash script
├── docs/
│ └── linux_user_management.md # Documentation
├── users.txt # List of users for bulk addition
├── log.txt # Action logs
├── README.md # Project overview
└── LICENSE

bash
Copy
Edit

## 🚀 Getting Started

### 📥 Prerequisites

- Linux or WSL installed
- Bash terminal access
- sudo privileges

### ▶️ Run the Script

```bash
chmod +x scripts/user_management.sh
./scripts/user_management.sh
📦 Bulk Add Users
Add usernames (one per line) in users.txt and choose option 6 in the menu.


🔑 Commands Used
useradd, userdel, usermod, passwd

cut, grep, awk

sudo, chmod, echo, read

🧠 What I Learned
Shell scripting for system admin

Validating user inputs

Menu-driven interactive Bash programs

Log management

📃 License
This project is licensed under the MIT License - see the LICENSE file for details.

Developed by Taranjot Singh | GitHub
