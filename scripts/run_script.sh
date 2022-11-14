#!/bin/bash -l
#SBATCH --constraint=knl
#SBATCH --nodes=5
#SBATCH --time=00:30:00
#SBATCH --cpu-freq=1400000

export input="../data/zebra-gray-int8-4x"
export xsize=7112
export ysize=5146

# for P in 4 9 16 25 36 49 64 81
for P in 81
   do
   # for decomp in 1 2 3
   for decomp in 1
      do
      echo " srun -n $P $1 -i $input -x $xsize -y $ysize -g $decomp  "
      srun -n $P ./mpi_2dmesh -x $xsize -y $ysize -g $decomp 
      done
   done
