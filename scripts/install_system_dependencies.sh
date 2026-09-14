#!/usr/bin/env bash

set -euo pipefail

echo "Installing system dependencies required by the SCID 2026 workshop..."

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    libmagick++-dev \
    libudunits2-dev \
    libabsl-dev \
    libnlopt-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev

echo
echo "System dependencies installed successfully."
echo

echo "CMake:"
cmake --version | head -n 1

echo
echo "GDAL:"
gdal-config --version

echo
echo "PROJ:"
proj 2>&1 | head -n 1 || true

echo
echo "Checking required Debian packages..."

packages=(
    cmake
    libmagick++-dev
    libudunits2-dev
    libabsl-dev
    libnlopt-dev
    libgdal-dev
    libgeos-dev
    libproj-dev
)

for package in "${packages[@]}"; do
    dpkg-query -W -f='${Status}\n' "${package}" 2>/dev/null \
        | grep -q "install ok installed" \
        && echo "  [OK] ${package}" \
        || {
            echo "  [FAIL] ${package}"
            exit 1
        }
done

echo
echo "The VM is ready for the R package installation step."