#!/bin/bash

# Colors and styles
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

LOGFILE="logs/package_check.log"


# Fancy heading
if command -v figlet &> /dev/null; then
    figlet -c "Install Missing Packages"
else
    echo -e "${BOLD}=== Install Missing Packages ===${NORMAL}"
fi

# Check if log file exists
if [ ! -f "$LOGFILE" ]; then
    echo -e "${RED}Log file $LOGFILE not found! Run the package check script first [1.package_checker.sh].${NC}"
    exit 1
fi

# Detect package manager
if command -v apt &> /dev/null; then
    INSTALL_CMD="sudo apt install -y"
elif command -v yum &> /dev/null; then
    INSTALL_CMD="sudo yum install -y"
else
    echo -e "${RED}Supported package manager (apt/yum/dnf) not found.${NC}"
    exit 1
fi

echo -e "${YELLOW}Using package manager command: ${INSTALL_CMD}${NC}\n"

# Extract missing packages from log
missing_pkgs=($(grep "not found" "$LOGFILE" | awk '{print $2}'))

if [ ${#missing_pkgs[@]} -eq 0 ]; then
    echo -e "${GREEN}✅ No missing packages to install.${NC}"
    exit 0
fi

echo -e "${BOLD}🔧 Installing missing packages:${NORMAL} ${missing_pkgs[*]}\n"

for pkg in "${missing_pkgs[@]}"; do
    echo -e "${YELLOW}Installing $pkg...${NC}"
    $INSTALL_CMD "$pkg"
done

echo -e "\n${GREEN}✔ Installation attempt completed.${NC}"
