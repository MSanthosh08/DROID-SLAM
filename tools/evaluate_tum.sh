#!/bin/bash


TUM_PATH=~/Datasets/TUM-RGBD

evalset=(
    rgbd_dataset_freiburg3_long_office_household_validation
    rgbd_dataset_freiburg3_structure_texture_far
    #rgbd_dataset_freiburg1_360
    #rgbd_dataset_freiburg1_desk
    #rgbd_dataset_freiburg1_desk2
    #rgbd_dataset_freiburg1_floor
    #rgbd_dataset_freiburg1_plant
    #rgbd_dataset_freiburg1_room
    #rgbd_dataset_freiburg1_rpy
    #rgbd_dataset_freiburg1_teddy
    #rgbd_dataset_freiburg1_xyz
)

for seq in ${evalset[@]}; do
    python evaluation_scripts/test_tum.py --datapath=$TUM_PATH/$seq --weights=droid.pth $@
done

