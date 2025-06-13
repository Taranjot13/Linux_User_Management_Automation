# Linux User Management Automation – Documentation

## Objective

This project automates Linux user management tasks using Bash scripting. It aims to:
- Reduce manual user creation/modification
- Speed up admin work
- Maintain logs
- Validate inputs

## Tools Used
- Bash shell
- useradd, userdel, usermod, passwd
- grep, cut, echo, read

## Script Capabilities

1. **Add User** – Adds a new Linux user
2. **Delete User** – Removes a user and their home directory
3. **Modify User** – Updates shell for a user
4. **List Users** – Displays current system users
5. **Reset Password** – Resets the password for any user
6. **Bulk Add** – Reads `users.txt` file to add multiple users
7. **Logs** – Saves every action in `log.txt`

## Sample users.txt

student1
devopsuser
testuser


## Usage

```bash
chmod +x scripts/user_management.sh
./scripts/user_management.sh


Make sure the script is run with sudo privileges.

---

## 🧾 3. `users.txt`

```bash
touch Linux_User_Management_Automation/users.txt



