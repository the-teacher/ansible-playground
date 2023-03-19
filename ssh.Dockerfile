# docker build \
#   -t iamteacher/ssh:arm64 \
#   -f ssh.Dockerfile \
#   --build-arg BUILDPLATFORM="linux/arm64" \
#   --build-arg TARGETARCH="arm64" \
#   .

# docker build \
#   -t iamteacher/ssh:amd64 \
#   -f ssh.Dockerfile \
#   --build-arg BUILDPLATFORM="linux/amd64" \
#   --build-arg TARGETARCH="amd64" \
#   .

# docker run -ti iamteacher/ssh:arm64 bash
# docker run -ti iamteacher/ssh:amd64 bash

FROM --platform=$BUILDPLATFORM ruby:3.2

ARG TARGETARCH
ARG BUILDPLATFORM

RUN echo "$BUILDPLATFORM" > /BUILDPLATFORM
RUN echo "$TARGETARCH" > /TARGETARCH

# For having SSH access
RUN apt-get update && apt-get install -y \
  openssh-server \
  vim

# For Ansible
RUN apt-get update && apt-get install -y python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python

ADD assets/sshd_run.sh /root/sshd_run.sh
RUN chmod +x /root/sshd_run.sh
RUN echo "/root/sshd_run.sh" > /root/.bashrc

RUN  mkdir ~/.ssh
COPY assets/ssh-key/id_rsa.pub /root/.ssh/authorized_keys
RUN  chmod 600 /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/root/sshd_run.sh"]
