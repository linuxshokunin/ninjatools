FROM hagakureninja/ninjatools:0.5
LABEL version=0.6

RUN curl -sqL "https://github.com/kubernetes-incubator/cri-tools/releases/download/v1.11.1/crictl-v1.11.1-linux-amd64.tar.gz" | \
      tar zxC /usr/local/bin && chown root:root /usr/local/bin/crictl
