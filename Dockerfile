FROM google/cloud-sdk

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin


RUN apt-get install mongo-tools
COPY mongobackup.sh /var/mongobackup/mongobackup.sh
RUN chmod 777 /var/mongobackup/mongobackup.sh
COPY cred.json /var/cred.json
RUN export GOOGLE_APPLICATION_CREDENTIALS=/var/cred.json

CMD /var/mongobackup/mongobackup.sh