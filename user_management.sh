#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Log File
LOG_FILE="log.txt"

# LINUX Banner
clear
echo -e "${RED}"
echo " ██╗ ██╗███╗ ██╗██╗ ██╗██╗ ██╗"
echo " ██║ ██║████╗ ██║██║ ██║╚██╗██╔╝"
echo " ██║ ██║██╔██╗ ██║██║ ██║ ╚███╔╝ "
echo " ██║ ██║██║╚██╗██║██║ ██║ ██╔██╗ "
echo " ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗"
echo " ╚══════╝╚═╝╚═╝ ╚═══╝ ╚═════╝ ╚═╝ ╚═╝"
echo -e "${RESET}"

# Menu
while true; do
    echo -e "${CYAN}"
    echo "=========== USER MANAGEMENT MENU ==========="
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Modify User"
    echo "4. List Users"
    echo "5. Reset Password"
    echo "6. Bulk Add Users (from users.txt)"
    echo "7. View Logs"
    echo "8. Exit"
    echo -e "============================================"
    echo -e "${RESET}"
    read -p "Enter your choice [1-8]: " choice

    case $choice in
        1)
            read -p "Enter username to add: " uname
            if id "$uname" &>/dev/null; then
                echo -e "${RED}User $uname already exists.${RESET}"
            else
                sudo useradd "$uname" && echo -e "${GREEN}User $uname added.${RESET}" ||
                echo -e "${RED}Failed to add user.${RESET}"
                echo "$(date): Added user $uname" >> $LOG_FILE
            fi
            ;;
        2)
            read -p "Enter username to delete: " uname
            if id "$uname" &>/dev/null; then
                sudo userdel -r "$uname" && echo -e "${YELLOW}User $uname deleted.${RESET}" ||
                echo -e "${RED}Failed to delete user.${RESET}"
                echo "$(date): Deleted user $uname" >> $LOG_FILE
            else
                echo -e "${RED}User $uname does not exist.${RESET}"
            fi
            ;;
        3)
            read -p "Enter username to modify: " uname
            if id "$uname" &>/dev/null; then
                read -p "Enter new shell [/bin/bash]: " shell
                shell=${shell:-/bin/bash}
                sudo usermod -s "$shell" "$uname" && echo -e "${GREEN}Shell updated for $uname.${RESET}" ||
                echo -e "${RED}Failed to modify user.${RESET}"
                echo "$(date): Modified $uname - shell changed to $shell" >> $LOG_FILE
            else
                echo -e "${RED}User $uname does not exist.${RESET}"
            fi
            ;;
        4)
            echo -e "${CYAN}Current system users:${RESET}"
            cut -d: -f1 /etc/passwd
            ;;
        5)
            read -p "Enter username to reset password: " uname
            if id "$uname" &>/dev/null; then
                sudo passwd "$uname"
                echo "$(date): Password reset for $uname" >> $LOG_FILE
            else
                echo -e "${RED}User $uname does not exist.${RESET}"
            fi
            ;;
        6)
            if [[ -f users.txt ]]; then
                while read -r uname; do
                    if id "$uname" &>/dev/null; then
                        echo -e "${YELLOW}User $uname already exists.${RESET}"
                    else
                        sudo useradd "$uname" && echo -e "${GREEN}Added: $uname${RESET}" ||
                        echo -e "${RED}Failed: $uname${RESET}"
                        echo "$(date): Bulk add - $uname" >> $LOG_FILE
                    fi
                done < users.txt
            else
                echo -e "${RED}users.txt file not found!${RESET}"
            fi
            ;;
        7)
            echo -e "${YELLOW}========= ACTION LOGS =========${RESET}"
            if [[ -f $LOG_FILE ]]; then
                cat $LOG_FILE
            else
                echo -e "${RED}Log file not found!${RESET}"
            fi
            ;;
        8)
            echo -e "${GREEN}Exiting User Management Script. Goodbye!${RESET}"
            break
            ;;
        *)
            echo -e "${RED}Invalid choice. Please enter a number between 1 and 8.${RESET}"
            ;;
    esac
done
