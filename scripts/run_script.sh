#!/bin/bash -l
#SBATCH --constraint=knl
#SBATCH --nodes=4
#SBATCH --time=00:30:00
#SBATCH --cpu-freq=1400000
#SBATCH --account=m3930

export input="../data/zebra-gray-int8-4x"
export xsize=7112
export ysize=5146

for P in 4 9 16 25 36 49 64 81
# for P in 9
   do
   for decomp in 1 2 3
   # for decomp in 3
      do
      echo " srun -n $P $1 -i $input -x $xsize -y $ysize -g $decomp  "
      srun -n $P ./mpi_2dmesh -x $xsize -y $ysize -g $decomp 
      done
   done
