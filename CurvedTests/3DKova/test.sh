#!/bin/bash

# These are exported so be used in envsubst
export TIMESTEP=0.001 
export NUMSTEPS=5000
export IO_CHECKSTEPS=1000 
export IO_INFOSTEPS=1000 
export KINVIS=0.025 
export GEOMETRY=3DKovaGeom.xmt_txt
export PUMIMESH=3DKovaPumiMesh.sms

SOLVER=../../builds/dist/bin/IncNavierStokesSolver
MODES=(4 5 6 7 8)
for N in ${MODES[@]}; do 
	export NUMMODES=$N
	echo -n "Running $N ..."
	envsubst < template.xml > m${N}.xml
	$SOLVER m${N}.xml &> m${N}.log
	echo " done"
done