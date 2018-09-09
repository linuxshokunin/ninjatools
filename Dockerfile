FROM hagakureninja/ninjatools:0.1
LABEL version=0.5

ARG OS="linux"
ARG KUBELESSVER="v1.0.0-alpha.7"
ARG KUBESEALVER="v0.7.0"
ARG KUBEADMVER="v1.11.2"

### kubeless
RUN curl -OL https://github.com/kubeless/kubeless/releases/download/${KUBELESSVER}/kubeless_${OS}-amd64.zip && \
      unzip kubeless_${OS}-amd64.zip && \
      mv bundles/kubeless_${OS}-amd64/kubeless /usr/local/bin/ && rm -rf bundles kubeless_*


### kubeapps
RUN wget $(curl -s https://api.github.com/repos/kubeapps/kubeapps/releases/latest | \
      grep -i $(uname -s) | grep browser_download_url | cut -d '"' -f 4) && \
      mv kubeapps-$(uname -s| tr '[:upper:]' '[:lower:]')-amd64 /usr/local/bin/kubeapps && \
      chmod +x /usr/local/bin/kubeapps

### kubeseal
RUN wget https://github.com/bitnami-labs/sealed-secrets/releases/download/${KUBESEALVER}/kubeseal-linux-amd64 && \
      mv kubeseal-linux-amd64 /usr/local/bin/kubeseal && chmod +x /usr/local/bin/kubeseal

### storageos
RUN curl -sSLo storageos https://github.com/storageos/go-cli/releases/download/1.0.0-rc2/storageos_linux_amd64 && chmod +x storageos && mv storageos /usr/local/bin/

### kubeadm
RUn curl -L --remote-name-all https://storage.googleapis.com/kubernetes-release/release/${KUBEADMVER}/bin/linux/amd64/kubeadm && chmod +x kubeadm && mv kubeadm /usr/local/bin


