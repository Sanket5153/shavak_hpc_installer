#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No color
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

# Log file

LOGDIR="logs"
mkdir -p "$LOGDIR"

LOGFILE="$LOGDIR/package_check.log"
[ -f "$LOGFILE" ] && rm "$LOGFILE"
touch "$LOGFILE"

# Show fancy heading using figlet if available
if command -v figlet &> /dev/null; then
    figlet -c " Essential Packages Checker " | tee -a "$LOGFILE"
else
    echo -e "${BOLD}=====  Essential Packages Checker =====${NORMAL}" | tee -a "$LOGFILE"
fi

echo -e "\n${BOLD}Starting package verification...${NORMAL}\n" | tee -a "$LOGFILE"

# List of essential packages
required_packages=(
    gcc g++ gfortran
    make cmake autoconf automake libtool m4
    git wget curl rsync
    tar gzip bzip2 xz unzip zip
    python3 pip libcerf
    patch perl perl-core pkg-config file sudo
)

# Arrays to track found and not found
found=()
not_found=()

for pkg in "${required_packages[@]}"; do
    sleep 0.5
    if command -v "$pkg" &> /dev/null; then
        echo -e "${GREEN}[✓] $pkg found${NC}" | tee -a "$LOGFILE"
        found+=("$pkg")
    else
        echo -e "${RED}[✗] $pkg not found${NC}" | tee -a "$LOGFILE"
        not_found+=("$pkg")
    fi
done

# Final summary
echo -e "\n${BOLD}----- Summary -----${NORMAL}" | tee -a "$LOGFILE"

if [ ${#found[@]} -gt 0 ]; then
    echo -e "${GREEN}Found packages:${NC} ${found[*]}" | tee -a "$LOGFILE"
fi

if [ ${#not_found[@]} -gt 0 ]; then
    echo -e "${RED}Missing packages:${NC} ${not_found[*]}" | tee -a "$LOGFILE"
    echo -e "${YELLOW}Please install the missing packages for smooth operation of Spack.${NC}" | tee -a "$LOGFILE"
fi
