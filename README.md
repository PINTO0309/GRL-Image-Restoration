# GRL for Image Restoration

This repository is an official implementation of the paper Efficient and Explicit Modelling of Image Hierarchies for Image Restoration.

By Yawei Li, Yuchen Fan, Xiaoyu Xiang, Denis Demandolx, Rakesh Ranjan, Radu Timofte, and Luc Van Gool


```
torchx run -- -j 1x1 -- \
-m training=False gpus=1 experiment=db_motion/grl_p480 model=grl/grl_base model.fairscale_checkpoint=True tile=0 tile_overlap=0 \
data_module.train.dataset=gopro data_module.val.dataset=gopro+hide \
load_state_dict=True pretrained_checkpoint="/workspaces/GRL-Image-Restoration/GRL/db_motion_grl_base_gopro.ckpt"
```

---
---
---

## News
- `Mar 20, 2023`: 🚀 GRL is released！
  - [ ] GRL-B/S/T model for image denosing.
  - [ ] GRL-B/S/T model for image denosing.
  - [ ] GRL-B/S/T model for single-image super-resolution.
  - [ ] GRL-B model for single-image motion deblurring.
  - [ ] GRL-B model for image defocus deblurring.
  - [ ] GRL-B model for real-world image super-resolution.
  - [ ] GRL-B model for image demosaicking.
  - [ ] GRL-S model for JPEG compression artifacts removal.
- `Feb 28, 2023`: 🚀 GRL is accepted to CVPR 2023!

## Coming soom
- [ ] LightningIR: A general framework for image restoration.
- [ ] LSDIR: A large-scale dataset for image restoration.


## Introduction

**GRL** provides a mechanism to
efficiently and explicitly model image hierarchies in the
global, regional, and local range for image restoration. To
achieve that, we start by analyzing two important properties of natural images including cross-scale similarity
and anisotropic image features. Inspired by that, we propose the anchored stripe self-attention which achieves a
good balance between the space and time complexity of
self-attention and the modelling capacity beyond the regional range. Then we propose a new network architec-
ture dubbed GRL to explicitly model image hierarchies in
the Global, Regional, and Local range via anchored stripe
self-attention, window self-attention, and channel attention
enhanced convolution. Finally, the proposed network is applied to 7 image restoration types, covering both real and
synthetic settings. The proposed method sets the new state-of-the-art for several of those.

<div align=center>
<img src='./figs/grl_network.png' width=2530>
</div>

## How to Use the Code?

1. `conda create -n LightningIR python=3.8`
2. `conda activate LightningIR`
3. `pip install -r requirements.txt`
4. prepare the dataset
5. download the pretrained models
6. ```bash
    torchx run -- -j 1x2 -- \
        -m training=False gpus=2 experiment=dm/grl model=grl/grl_small \
        load_state_dict=True pretrained_checkpoint="${MODEL_ZOO}/GRL/dm_grl_small.ckpt"
    ```

## Main Results

<div align=center>
<img src='./figs/grl_teaser_results.png' width=2000>
</div>


## Results
<details>
<summary><strong>Image denoising</strong> (click to expand) </summary>

<img src = "./figs/task3.png" width=2000>
</details>

<details>
<summary><strong>Image SR</strong> (click to expand) </summary>

<img src = "./figs/task4.png" width=2000>
</details>

<details>
<summary><strong>Single-Image Motion Deblur</strong> (click to expand) </summary>

<img src = "./figs/task1.png" width=1000>
</details>

<details>
<summary><strong>Defocus Deblur</strong> (click to expand) </summary>

<img src = "./figs/task2.png" width=2000>
</details>

<details>
<summary><strong>JPEG Compression Artifact Removal</strong> (click to expand) </summary>

<img src = "./figs/task5.png" width=2000>
</details>

<details>
<summary><strong>Image Demosaicking</strong> (click to expand) </summary>

<img src = "./figs/task6.png" width=1000>
</details>

<details>
<summary><strong>Real-World Image SR</strong> (click to expand) </summary>

<img src = "./figs/task7.png" width=1000>
</details>

## Citation

If this work is helpful for your research, please consider citing the following BibTeX entry.

```
@inproceedings{li2023grl,
  title={Efficient and Explicit Modelling of Image Hierarchies for Image Restoration},
  author={Yawei Li, Yuchen Fan, Xiaoyu Xiang, Denis Demandolx, Rakesh Ranjan, Radu Timofte, and Luc Van Gool},
  booktitle={Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition},
  year={2023}
}
```
