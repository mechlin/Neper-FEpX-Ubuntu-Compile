#!/bin/bash

sudo apt update -y && \
    sudo apt install -y \
	    build-essential \
	    libpthread-stubs0-dev \
	    libgsl-dev \
	    libomp-dev \
	    libboost-thread-dev \
	    povray \
	    asymptote \
	    vim \
	    cmake \
	    tar \
	    git \
     	    texlive-full \
	    wget
		

#---Download and extract Gmsh sourcecode from---
#   https://gmsh.info/
cd /opt/pollock
wget -O gmsh-4.13.1-source.tgz "https://gmsh.info/src/gmsh-4.13.1-source.tgz"
tar -xf gmsh-4.13.1-source.tgz

cd gmsh-4.13.1-source
mkdir build
cd build
cmake ..
make
make test
make install

cd /opt/pollock
git clone https://github.com/rquey/neper.git neper
cd neper/src
mkdir build
cd build
cmake ..
make
make test
make install

#Need to edit 'sudo vi /etc/ImageMagick-6/policy.xml' to update size limitations

sudo apt install -y \
	  openmpi-bin \
      openmpi-common\ 
      libopenmpi-dev -y

cd /opt/pollock
git clone https://github.com/neperfepx/fepx.git fepx
cd fepx/src
mkdir build
cd build
cmake ..
make -j
make install


