FROM sorintlab/stolon:v0.16.0-pg12

ENV WALG_VERSION v0.2.15

ADD https://github.com/wal-g/wal-g/releases/download/${WALG_VERSION}/wal-g.linux-amd64.tar.gz /tmp
RUN cd /tmp && \
  tar -xvf wal-g.linux-amd64.tar.gz && \
  mv wal-g /usr/local/bin && \
  rm -rf wal-g.linux-amd64.tar.gz && \
  apt-get update && apt-get install -y daemontools ca-certificates && \
  apt-get autoclean

# Setup backup scripts
COPY wal-push.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/wal-push.sh

COPY backup-push.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/backup-push.sh
