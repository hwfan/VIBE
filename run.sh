#!/usr/bin/env bash
# 1=exp_name, 2=gpus, 3=group_gpu, 4="other command"
jobname=${1:-train_debug}
gpu_num=${2:-1}
group_gpu_num=${3:-1}
suffix=${4:-""}
nodes=$gpu_num
gpus=$group_gpu_num
partition=${5:-spring_scheduler}
task_num=${6:-5}

spring.submit run --mpi=pmi2 -p $partition \
    -n$nodes \
    --gres=gpu:$gpus \
    --ntasks-per-node=$gpus \
    --cpus-per-task=$task_num \
    --job-name=$jobname \
    "python -u demo.py \
    --no_render \
    $suffix"
