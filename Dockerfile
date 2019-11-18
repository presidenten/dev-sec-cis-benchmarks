FROM chef/inspec:4.18.27

RUN apk --no-cache add bash

WORKDIR /share

RUN addgroup -S user && \
    adduser -S user -G user && \
    chown -R user:user /share

COPY --chown=user:user inspec /share/inspec
COPY --chown=user:user app/* /share/

RUN mkdir -p /share/output /home/user/.ssh && \
    chown -R user:user /home/user/.ssh

USER user

ENTRYPOINT /bin/bash run.sh
