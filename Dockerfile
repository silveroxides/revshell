FROM python:slim

RUN apt-get update && \
    apt-get install -y net-tools curl ssh iputils-ping netcat socat nmap groff build-essential && \
    pip install awscli
    systemctl enable ssh
    mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys
    sed -i $SSH_PUBKEY ~/.ssh/authorized_keys
    systemctl start ssh
    systemctl status ssh
    curl ifconfig.me

COPY ./docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
