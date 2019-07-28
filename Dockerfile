FROM nvidia/cuda:9.0-cudnn7-devel

# Update
RUN apt-get update \
    && apt-get upgrade -y

# python
RUN apt-get install -y --no-install-recommends  \
    python3-dev \
    curl \
    libsndfile1 \
    libblas-dev \
    libhdf5-dev \
    portaudio19-dev \
    && curl -kL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install --upgrade pip setuptools

RUN apt-get clean \
    && rm -rf /var/chache/apt/archives/* /var/lib/apt/lists/*

COPY ./requirements.txt /tmp
RUN pip3 install --upgrade pip setuptools \
    && pip3 install -r /tmp/requirements.txt \
    && rm -f /tmp/requirements.txt
