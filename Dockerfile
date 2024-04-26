ARG BASE=nvidia/cuda:11.4.3-runtime-ubuntu20.04
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

# RUN pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu113
RUN pip install --no-cache-dir -r requirements.txt

VOLUME [ "/hub_cache" ]

ENV HF_HUB_CACHE /hub_cache

COPY main.py .

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "python3 main.py" ]
