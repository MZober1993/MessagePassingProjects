#!/bin/bash

cd ../../../../../
cmake CMakeLists.txt -DCMAKE_BUILD_TYPE=RELEASE
make
cd rectangle/RELEASE/

pathToConfig="../measures/processorScaling/44/10000/"
hostFileDir="../hostfiles/"

echo "Starting rectanglePatternDetection:......."
echo "------------------------------------------"
echo "0"
mpirun -npernode 2 -hostfile $hostFileDir/22 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/20 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/18 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/16 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/14 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/12 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/10 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/8 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/6 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/4 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 2 -hostfile $hostFileDir/2 rectanglePatternDetection $pathToConfig/0
mpirun -npernode 1 rectanglePatternDetection $pathToConfig/0
echo "------------------------------------------"
echo "1"
mpirun -npernode 2 -hostfile $hostFileDir/22 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/20 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/18 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/16 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/14 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/12 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/10 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/8 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/6 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/4 rectanglePatternDetection $pathToConfig/1
mpirun -npernode 2 -hostfile $hostFileDir/2 rectanglePatternDetection $pathToConfig/1

mpirun -npernode 1 rectanglePatternDetection $pathToConfig/1
echo "-------------------------------------"
echo "2"
mpirun -npernode 2 -hostfile $hostFileDir/22 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/20 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/18 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/16 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/14 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/12 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/10 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/8 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/6 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/4 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 2 -hostfile $hostFileDir/2 rectanglePatternDetection $pathToConfig/2
mpirun -npernode 1 rectanglePatternDetection $pathToConfig/2
# mpirun -npernode 2 -hostfile hosts rectanglePatternDetection 1
# mpirun -npernode 2 -hostfile hosts rectanglePatternDetection 0

