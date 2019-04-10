FROM gcr.io/cloud-builders/git

ENV PATH=$PATH:/builder/google-cloud-sdk/bin/

RUN apt-get -y update && \
    apt-get -y install wget ca-certificates && \
    wget https://github.com/github/hub/releases/download/v2.11.1/hub-linux-amd64-2.11.1.tgz && \
    tar -xvf hub-linux-amd64-2.11.1.tgz && \
    mv hub-linux-amd64-2.11.1/bin/hub /usr/local/bin/hub && \
    # clean up
    apt-get -y remove wget && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf hub-linux-amd64-2.11.1.tgz && \
    rm -rf hub-linux-amd64-2.11.1

ENTRYPOINT ["hub"]