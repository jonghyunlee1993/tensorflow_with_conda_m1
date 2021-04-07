#!/bin/bash

while getopts "hn:" shortopt
do
    case $shortopt in
        h)
            echo "Usage: $0 [-h] [-n env_name]"
            echo "  -h: help"
            echo "  -n: conda envirnment name"
            exit
            ;;
        n)
            ENV_NAME=$OPTARG
            ;;
        *)
            echo "default settings"
            ;;
    esac
done

echo "your envirnoment: $ENV_NAME"

# step 01
# xcode-select --install

# step 02
cd ~/Downloads
# curl -OL https://github.com/apple/tensorflow_macos/releases/download/v0.1alpha2/tensorflow_macos-0.1alpha2.tar.gz

# tar -zxvf tensorflow_macos-0.1alpha2.tar.gz
cd tensorflow_macos/arm64

# step 03
conda create -y -n $ENV_NAME python=3.8
conda init
conda activate $ENV_NAME
conda install -y pandas matplotlib scikit-learn jupyter jupyterlab

# step 04
pip install --upgrade --no-dependencies --force grpcio-1.33.2-cp38-cp38-macosx_11_0_arm64.whl h5py-2.10.0-cp38-cp38-macosx_11_0_arm64.whl tensorflow_addons_macos-0.1a2-cp38-cp38-macosx_11_0_arm64.whl tensorflow_macos-0.1a2-cp38-cp38-macosx_11_0_arm64.whl

pip install absl-py astunparse flatbuffers gast google_pasta keras_preprocessing opt_einsum protobuf tensorflow_estimator termcolor typing_extensions wrapt wheel tensorboard typeguard

pip install --upgrade --force --no-dependencies tensorflow_macos-0.1a2-cp38-cp38-macosx_11_0_arm64.whl

# done
echo "Installing tensorflow on $ENV_NAME"
echo "To test tensorflow type as follows >> conda activate $ENV_NAME > ipython > import tensorflow as tf > tf.__version__"
