FROM sorintlab/stolon:v0.15.0-pg12

ENV WALG_VERSION v0.2.9
ENV INSTALL_DIR /tmp

ADD https://github.com/wal-g/wal-g/releases/download/${WALG_VERSION}/wal-g.linux-amd64.tar.gz ${INSTALL_DIR}
RUN cd ${INSTALL_DIR} && \
  tar -xvf wal-g.linux-amd64.tar.gz && \
  mv wal-g /usr/local/bin && \
  rm -rf wal-g.linux-amd64.tar.gz && \
  apt-get update && apt-get install -y daemontools && \
  apt-get autoclean
