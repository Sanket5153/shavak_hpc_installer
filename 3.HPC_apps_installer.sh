#!/bin/bash

# ---------- Configuration ----------
SPACK_DIR="/home/admin/spack/"
COMPILER="gcc"
LOGFILE="logs/spack_hpc_install.log"

# ---------- Color & Style ----------
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
BOLD='\033[1m'
NC='\033[0m'

# ---------- Banner ----------
if command -v figlet &> /dev/null; then
    figlet "HPC App Setup"
    echo " "
else
    echo -e "${BOLD}=== HPC Application Installer ===${NC}"
fi

# ---------- Load Spack ----------
if [ -d "$SPACK_DIR" ]; then
    source "$SPACK_DIR/share/spack/setup-env.sh"
else
    echo -e "${RED}Spack directory not found at $SPACK_DIR${NC}"
    exit 1
fi


echo -e "${BLUE}Checking and installing HPC apps using Spack...${NC}" | tee "$LOGFILE"

# --------- GROMACS ----------
echo " "
echo -e "${BLUE} Checking for GROMACS...${NC}" | tee "$LOGFILE"
if spack find gromacs | grep -q gromacs; then
    echo -e "${GREEN}[✓] GROMACS is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "GROMACS not found Installing..."
    spack install -j40 gromacs%$COMPILER
fi

# --------- LAMMPS ----------
sleep 1
echo " "
echo -e "${BLUE} Checking for lammps...${NC}" | tee "$LOGFILE"
if spack find lammps | grep -q lammps; then
    echo -e "${GREEN}[✓] lammps is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "Lammps not found Installing..."
    spack install -j40 lammps%$COMPILER
fi

# --------- NAMD ----------
sleep 1
echo " "
echo -e "${BLUE} Checking for namd...${NC}" | tee "$LOGFILE"
if spack find namd | grep -q namd; then
    echo -e "${GREEN}[✓] namd is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "Namd not found Installing..."
    mkdir namd
    cd namd
    wget https://www.ks.uiuc.edu/Research/namd/2.14/download/946183/NAMD_2.14_Source.tar.gz
    spack install -j40 namd%$COMPILER
    cd -
fi


# --------- OPENFOAM ----------
sleep 1
echo " "
echo -e "${BLUE} Checking for openfoam...${NC}" | tee "$LOGFILE"
if spack find openfoam | grep -q openfoam; then
    echo -e "${GREEN}[✓] openfoam is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "OpenFOAM not found Installing..."
    spack install -j40 openfoam%$COMPILER+vtk+paraview
fi

# --------- WRF ----------
echo " "
sleep 1
echo -e "${BLUE} Checking for WRF...${NC}" | tee "$LOGFILE"
if spack find wrf | grep -q wrf; then
    echo -e "${GREEN}[✓] wrf is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "WRF not found Installing..."
    spack install -j40 wrf%$COMPILER
fi



# --------- nwchem----------
echo " "
sleep 1
echo -e "${BLUE} Checking for nwchem...${NC}" | tee "$LOGFILE"
if spack find nwchem | grep -q nwchem; then
    echo -e "${GREEN}[✓] nwchem is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "Nwchem not found Installing..."
    spack install -j40 nwchem%$COMPILER
fi



# --------- abinit ----------
echo " "
sleep 1
echo -e "${BLUE} Checking for abinit...${NC}" | tee "$LOGFILE"
if spack find abinit | grep -q abinit; then
    echo -e "${GREEN}[✓] abinit is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "Abinit not found Installing..."
    spack install -j40 abinit%$COMPILER
fi



# --------- cp2k ----------
echo " "
sleep 1
echo -e "${BLUE} Checking for cp2k...${NC}" | tee "$LOGFILE"
if spack find cp2k | grep -q cp2k; then
    echo -e "${GREEN}[✓] cp2k is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "cp2k not found. Installing..."
    spack install -j40 cp2k%$COMPILER
fi



# --------- hmmer ----------

echo " "
sleep 1
echo -e "${BLUE} Checking for hmmer...${NC}" | tee "$LOGFILE"
if spack find hmmer | grep -q hmmer; then
    echo -e "${GREEN}[✓] hmmer is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "hmmer not found. Installing..."
    spack install -j40 hmmer%$COMPILER
fi



# --------- mummer ----------

echo " "
sleep 1
echo -e "${BLUE} Checking for mummer...${NC}" | tee "$LOGFILE"
if spack find mummer | grep -q mummer; then
    echo -e "${GREEN}[✓] mummer is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "mummer not found. Installing..."
    spack install -j40 mummer%$COMPILER
fi



# --------- Quantum-espresso ----------

echo " "
sleep 1
echo -e "${BLUE} Checking for Quantum-espresso...${NC}" | tee "$LOGFILE"
if spack find quantum-espresso | grep -q quantum-espresso; then
    echo -e "${GREEN}[✓] Quantum-espresso is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "quantum-espresso not found. Installing..."
    spack install -j40 quantum-espresso%$COMPILER
fi



# --------- HPL ----------

echo " "
sleep 1
echo -e "${BLUE} Checking for HPL...${NC}" | tee "$LOGFILE"
if spack find hpl | grep -q hpl; then
    echo -e "${GREEN}[✓] hpl is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "HPL not found. Installing..."
    spack install -j40 hpl%$COMPILER
fi
# --------- Intel-Oneapi-Compilers ----------
sleep 1
echo " "
echo -e "${BLUE} Checking for Intel-Oneapi-Compilers...${NC}" | tee "$LOGFILE"
if spack find intel-oneapi-compilers | grep -q intel-oneapi-compilers; then
    echo -e "${GREEN}[✓] intel-oneapi-compilers is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "intel-oneapi-compilers not found Installing..."
    spack install -j40 intel-oneapi-compilers
fi

# --------- Intel-Oneapi-mpi ----------
sleep 1
echo " "
echo -e "${BLUE} Checking for Intel-Oneapi-Mpi...${NC}" | tee "$LOGFILE"
if spack find intel-oneapi-mpi | grep -q intel-oneapi-mpi; then
    echo -e "${GREEN}[✓] intel-oneapi-mpi is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "intel-oneapi-mpi not found Installing..."
    spack install -j40 intel-oneapi-mpi
fi

# --------- VMD ----------
sleep 1
echo " "
echo -e "${BLUE} Checking for VMD...${NC}" | tee "$LOGFILE"
if spack find vmd | grep -q vmd; then
    echo -e "${GREEN}[✓] VMD is already installed ${NC}" | tee -a "$LOGFILE"
else
    echo "VMD not found Installing..."
    mkdir VMD
    cd VMD
    wget https://www.ks.uiuc.edu/Research/vmd/vmd-1.9.3/files/final/vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz
    spack install -j40 vmd
    cd -
fi


