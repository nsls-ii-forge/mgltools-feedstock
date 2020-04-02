#!/bin/bash
./install.sh -d $PREFIX

BINARY_HOME=$PREFIX/bin
UTILITIES_RPATH=MGLToolsPckgs/AutoDockTools/Utilities24
UTILITIES_HOME=$PREFIX/${UTILITIES_RPATH}

ln -s $UTILITIES_HOME/prepare_ligand4.py $BINARY_HOME/prepare_ligand4.py
ln -s $UTILITIES_HOME/prepare_receptor4.py $BINARY_HOME/prepare_receptor4.py

ACTIVATE=$PREFIX/etc/conda/activate.d/autodocktools.sh
DEACTIVATE=$PREFIX/etc/conda/deactivate.d/autodocktools.sh

# set up
echo "export AUTODOCKTOOLS_UTIL=\$CONDA_DEFAULT_ENV/${UTILITIES_RPATH}"> $ACTIVATE

# tear down
echo "unset AUTODOCKTOOLS_UTIL" > $DEACTIVATE

# clean up after self
unset ACTIVATE
unset DEACTIVATE
