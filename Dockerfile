ARG CUDA_VERSION=12.4.1
ARG BASE=nvidia/cuda:${CUDA_VERSION}-runtime-ubuntu22.04
FROM ${BASE}

ENV LANG C.UTF-8

RUN set -eux;\
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    gcc \
    git \
    python3 \
    python3-dev \
    python3-pip \
    && apt-get purge -y --auto-remove

WORKDIR /usr/src/app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

VOLUME [ "/hub_cache" ]

ENV HF_HUB_CACHE /hub_cache

COPY main.py .

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "python3 main.py" ]
