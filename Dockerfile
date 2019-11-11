FROM chef/inspec:4.18.27

COPY inspec /share/inspec
COPY app/* /share/

RUN addgroup -S user && \
    adduser -S user -G user && \
    mkdir -p /share/output /home/user/.ssh && \
    chown -R user:user /share/inspec /share/*.sh /home/user/.ssh

USER user

WORKDIR /share
ENTRYPOINT /bin/sh run.sh
