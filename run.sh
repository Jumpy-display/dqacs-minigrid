#!/bin/bash
#SBATCH --job-name=diffqas_train
#SBATCH --output=diffqas_%j.out
#SBATCH --error=diffqas_%j.err
#SBATCH --partition=class
#SBATCH --account=class
#SBATCH --qos=default
#SBATCH --time=04:00:00
#SBATCH --mem=32gb
#SBATCH --cpus-per-task=32
#SBATCH --gres=gpu:1

# --- STEP 1: LOAD THE MODULE (CASE SENSITIVE!) ---
# Use 'Python3' exactly as shown in the wiki
module load Python3/3.12.7

# --- STEP 2: ACTIVATE ENVIRONMENT ---
source ~/my_env/bin/activate

# --- STEP 3: PREVENT THREADING CRASHES ---
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

echo "Starting DiffQAS Training on $(hostname)"
echo "Allocated CPUs: $SLURM_CPUS_PER_TASK"
echo "Allocated GPU: $CUDA_VISIBLE_DEVICES"
# --- STEP 4: RUN ---
# The wiki confirms virtualenv picks up the loaded python version
python -u ultimateAgent_FL.py