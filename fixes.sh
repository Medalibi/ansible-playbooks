#!/bin/bash

# Denes Turei EMBL 2018
# turei.denes@gmail.com

# install pip from python3.6
curl https://bootstrap.pypa.io/get-pip.py | python3.6

# downgrading pip because version 10 has
# unresolved issues
python3.6 -m pip install --upgrade pip==9.0.3 

# fixing the issue we already fixed
#sed -i 's/orig_path.sort(key=position_in_sys_path)/orig_path = sorted(orig_path, key = position_in_sys_path)/' /usr/local/lib/python3.6/dist-packages/pip/_vendor/pkg_resources/__init__.py

# installing python 3.6 C headers
# in order to be able to compile igraph
apt install python3.6-dev libigraph0-dev -y

# install igraph python bindings
pip3.6 install igraph
#cd /usr/local
#mkdir -p build/python-igraph
#cd build/python-igraph
#curl -LO https://github.com/igraph/python-igraph/archive/master.zip
#unzip master.zip
#cd python-igraph-master
#python3.6 ./setup.py develop --c-core-url https://github.com/igraph/igraph/archive/master.tar.gz
#python3.6 ./setup.py install
#cd ../../..
#rm -r build

# remove python 3 numpy installation
# and install numpy properly for python 3.6
# same for scipy, lxml, pandas, statsmodels,
# pygraphviz and pycurl
# these are all packages with C bindings
# no wonder they can't be loaded if compiled
# against different version
pip3 uninstall -y pypath
pip uninstall -y pypath
pip3.6 uninstall -y pypath

pip3 uninstall -y numpy scipy pandas lxml statsmodels pycurl pygraphviz bs4 html5lib
pip3.6 install numpy scipy pandas lxml statsmodels pycurl pycairo pygraphviz bs4 html5lib pycurl
pip3.6 install --upgrade bs4

# install pypath for python3.6
pip3.6 install /media/penelopeprime/.Admin/pypath-0.7.73.tar.gz

# install jupyter and ipython kernel for python3.6
# btw very weird, jupyter loaded anaconda python 2.7
# kernel when python 3 kernel was requested...
pip3.6 install jupyter

# registering python 3.6 shell as an ipython kernel
python3.6 -m ipykernel install

