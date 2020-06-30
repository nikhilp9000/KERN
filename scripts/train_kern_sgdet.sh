#!/usr/bin/env bash
python models/train_rels.py -m sgdet -p 400 -clip 5 \
-save_dir checkpoints/kern_sgdet \
-ckpt checkpoints/kern_sgcls/vgrel-14.tar \
-val_size 350 \
-adam \
-b 4 \
-lr 4e-5 \
-use_ggnn_obj \
-ggnn_obj_time_step_num 3 \
-ggnn_obj_hidden_dim 512 \
-ggnn_obj_output_dim 512 \
-use_obj_knowledge \
-obj_knowledge prior_matrices/obj_matrix.npy \
-use_ggnn_rel \
-ggnn_rel_time_step_num 3 \
-ggnn_rel_hidden_dim 512 \
-ggnn_rel_output_dim 512 \
-use_rel_knowledge \
-rel_knowledge prior_matrices/rel_matrix.npy