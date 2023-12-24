FROM pinto0309/ubuntu22.04-cuda11.8:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
        nano python3-pip python3-mock libpython3-dev \
        libpython3-all-dev python-is-python3 wget curl cmake \
        software-properties-common sudo \
    && sed -i 's/# set linenumbers/set linenumbers/g' /etc/nanorc \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install pip -U \
    && pip install --index-url https://download.pytorch.org/whl/cu118 \
        torch \
        torchvision \
        torchaudio \
    && pip install \
        matplotlib==3.8.2 \
        scikit-image==0.22.0 \
        opencv-python==4.8.1.78 \
        natsort==8.4.0 \
        tqdm==4.66.1 \
        einops==0.7.0 \
        timm==0.9.12 \
        torchx==0.6.0 \
        hydra-core==1.3.2 \
        pytorch-lightning==1.6.0 \
        tensorboard==2.15.1 \
        h5py==3.10.0 \
        pandas==2.1.4 \
        fairscale==0.4.13 \
        torchmetrics==0.8.2

ENV USERNAME=user
RUN echo "root:root" | chpasswd \
    && adduser --disabled-password --gecos "" "${USERNAME}" \
    && echo "${USERNAME}:${USERNAME}" | chpasswd \
    && echo "%${USERNAME}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}
USER ${USERNAME}
ARG WKDIR=/workdir
WORKDIR ${WKDIR}
RUN sudo chown ${USERNAME}:${USERNAME} ${WKDIR}
