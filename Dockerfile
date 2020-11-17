FROM google/cloud-sdk:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
ENV PATH "$PATH:/google-cloud-sdk/bin/gsutil"
ENV PATH "$PATH:/google-cloud-sdk/bin/gcloud"
CMD ["version"]