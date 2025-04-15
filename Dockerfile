ARG VERSIONROCKY="9.5"

FROM rockylinux/rockylinux:${VERSIONROCKY}

RUN dnf update -y && \
    dnf install -y \
    openssl-devel \
    bzip2-devel \
    libffi-devel \
    wget \
    make \
    gcc \
    zlib-devel \
    sqlite-devel \
    tk-devel \
    libuuid-devel libuuid \
    readline-devel
ARG PYTHON_VERSION="3.13.1"
RUN wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations --with-ensurepip=install && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. 

RUN rm -rf Python-${PYTHON_VERSION}* && \
    dnf clean all
RUN ln -sf /usr/local/bin/python3.13 /usr/local/bin/python && \
    ln -sf /usr/local/bin/pip3.13 /usr/local/bin/pip
RUN python --version && pip --version
CMD ["python"]
