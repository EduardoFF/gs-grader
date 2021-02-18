#!/usr/bin/env bash

apt-get install -y wget

#pip3 install -r /autograder/source/requirements.txt


export ANACONDA_VERSION=2020.11
export ANACONDA_MD5=4cd48ef23a075e8555a8b6d0a8c4bae2

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh && \
    mkdir -p /opt && \
    sh ./miniconda.sh -b -p /opt/conda && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

source /opt/conda/bin/activate
conda install -y scikit-learn
pip3 install gradescope-utils
conda --version

# Create non-root user, install dependencies, install Anaconda
#addgroup -S anaconda && \
#adduser -D -u 10151 anaconda -G anaconda && \
#wget --quiet https://repo.continuum.io/archive/Anaconda3-$ANACONDA_VERSION-Linux-x86_64.sh -O anaconda.sh && \
#echo "${ANACONDA_MD5}  anaconda.sh" > anaconda.md5 && \
#if [ $(md5sum -c anaconda.md5 | awk '{print $2}') != "OK" ] ; then exit 1; fi && \
#    mkdir -p /opt && \
#    sh ./anaconda.sh -b -p /opt/conda && \
#    rm anaconda.sh anaconda.md5 && \
#    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
#    #chown -R anaconda /opt && \
#    #echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/anaconda/.profile && \
#    #echo "conda activate base" >> /home/anaconda/.profile && \
#    find /opt/conda/ -follow -type f -name '*.a' -delete && \
#    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
#    /opt/conda/bin/conda clean -afy
