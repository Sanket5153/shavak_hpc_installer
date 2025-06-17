**Run the main installer script to begin the automated setup:**

./main_installer.sh

**You will be greeted with:**

🔧 Welcome to the Shavak HPC App Setup Wizard
---------------------------------------------
Choose an option:
1. Check for essential system packages
2. Install missing system packages
3. Install HPC applications using Spack
4. Exit

**Step 1 – Check Essential Packages**
This will verify if necessary system packages (like gcc, g++, gfortran, make, wget, curl, git, etc.) are installed.
A log (package_check.log) will be generated with the status of each package.

**Step 2 – Install Missing Packages**
This will read from the above log and automatically install any missing packages on your system using the package manager (e.g., yum, apt).

**Step 3 – Install HPC Applications**
Once your system is ready, choose this to install HPC applications (like GROMACS, OpenFOAM, WRF) via Spack, one by one.
