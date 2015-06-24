FROM alpine:latest

ENV CLOUDSDK_PYTHON_SITEPACKAGES=1

RUN \
  apk --update add wget unzip ca-certificates python && \
  cd /tmp && \
  wget "https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip" && \
  unzip google-cloud-sdk.zip && \
  mv google-cloud-sdk /google-cloud-sdk && \
  rm google-cloud-sdk.zip && \
  /google-cloud-sdk/install.sh \
    --usage-reporting=true \
    --path-update=true \
    --bash-completion=true \
    --rc-path=/.bashrc \
    --disable-installation-options && \
#   /google-cloud-sdk/bin/gcloud \
#     --quiet \
#     components update pkg-go pkg-python pkg-java preview alpha beta app && \
  /google-cloud-sdk/bin/gcloud \
    --quiet \
    config set component_manager/disable_update_check true && \
  wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker && \
  chmod +x /usr/bin/docker && \
  mkdir /.ssh && \
  apk del wget unzip && \
  rm -Rf /tmp/* /var/cache/apk/*

ENV PATH=/google-cloud-sdk/bin:$PATH \
    HOME=/

