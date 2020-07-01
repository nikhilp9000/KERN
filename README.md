# KERN
# Knowledge-Embedded Routing Network  for Scene Graph Generation
Tianshui Chen*, Weihao Yu*, Riquan Chen, and Liang Lin, “Knowledge-Embedded Routing Network for Scene Graph Generation”, CVPR, 2019. (* co-first authors) [[manuscript](https://arxiv.org/abs/1903.03326)] 



This repository contains a PyTorch version code for the above paper, If the paper significantly inspires you, we request that you cite the work:

### Bibtex

```
@inproceedings{chen2019knowledge,
  title={Knowledge-Embedded Routing Network for Scene Graph Generation},
  author={Chen, Tianshui and Yu, Weihao and Chen, Riquan and Lin, Liang},
  booktitle = "Conference on Computer Vision and Pattern Recognition",  
  year={2019}
}
```
# Setup


0. Install python3.6 and pytorch 3. I recommend the [Anaconda distribution](https://repo.continuum.io/archive/). To install PyTorch if you haven't already, use
 ```conda install pytorch=0.3.0 torchvision=0.2.0 cuda90 -c pytorch```. 
 
 
1. Update the config file with the dataset paths. Specifically:
    - Visual Genome (the VG_100K folder, image_data.json, VG-SGG.h5, and VG-SGG-dicts.json). See data/stanford_filtered/README.md for the steps to download these.
    - You'll also need to fix your PYTHONPATH: ```export PYTHONPATH=/home/exp/KERN``` 

2. Compile everything. run ```make``` in the main directory: this compiles the Bilinear Interpolation operation for the RoIs. Maybe you need to update your CUDA path in Makefile file.

3. Run make.sh files for nms and roi_align - lib/fpn/nms/make.sh and lib/fpn/roi_align/make.sh respectively. Change the SM architecture value in the files depending on the GPU that you are using.

4. Pretrain VG detection. [You can download their pretrained detector checkpoint provided by @rowanz.](https://drive.google.com/open?id=11zKRr2OF5oclFL47kjFYBOxScotQzArX) 
You could also run ./scripts/pretrain_detector.sh to train detector by yourself. Note: You might have to modify the learning rate and batch size according to number and memory of GPU you have.

5. Generate knowledge matrices: ```python prior_matrices/generate_knowledge.py```

6. Train KERN model. There are three training phase. You need a GPU with 12G memory. 
    - Train VG relationship predicate classification: run ```CUDA_VISIBLE_DEVICES=YOUR_GPU_NUM ./scripts/train_kern_predcls.sh``` 
    This phase maybe last for about 20 epochs. 
    - Train scene graph classification: run ```CUDA_VISIBLE_DEVICES=YOUR_GPU_NUM ./scripts/train_kern_predcls.sh```. Before run this script, you need to modify the path name of best checkpoint you trained in precls phase: ```-ckpt checkpoints/kern_predcls/vgrel-YOUR_BEST_EPOCH_RNUM.tar```. It lasts about 5-10 epochs, then you can decrease the learning rate to 1e-6 to further improve the performance. 
    - Refine for detection: run ```CUDA_VISIBLE_DEVICES=YOUR_GPU_NUM ./scripts/refine_for_detection.sh``` . If you find the validation performance plateaus, you could also decrease learning rate to 1e-6 to improve performance. 




# Acknowledgement
Thank Yuweihao for generously releasing his nice code [KERN](https://github.com/yuweihao/KERN).




