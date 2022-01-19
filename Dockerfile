FROM sorintlab/stolon:v0.17.0-pg12

ENV WALG_VERSION v1.1
ENV RELEASE_FILE_NAME wal-g-pg-ubuntu-18.04-amd64.tar.gz
ENV EXTRACTED_FILE_NAME wal-g-pg-ubuntu-18.04-amd64
ENV EXECUTABLE_DESTINATION /usr/local/bin/wal-g

ADD https://github.com/wal-g/wal-g/releases/download/${WALG_VERSION}/${RELEASE_FILE_NAME} /tmp
RUN cd /tmp && \
  tar -xvf ${RELEASE_FILE_NAME} && \
  mv ${EXTRACTED_FILE_NAME} ${EXECUTABLE_DESTINATION} && \
  rm -rf ${RELEASE_FILE_NAME} && \
  apt-get update && \
  apt-get install -y daemontools ca-certificates && \
  apt-get autoclean

# Setup backup scripts
COPY wal-push.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/wal-push.sh

COPY backup-push.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/backup-push.sh
