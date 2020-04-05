ARG jellyfin_version=latest
from linuxserver/jellyfin:$jellyfin_version

ARG jellyfin_entrypoint=/init

COPY subtree/nvidia-patch/patch.sh /usr/local/bin/patch.sh
COPY subtree/nvidia-patch/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN echo "/usr/local/bin/docker-entrypoint.sh $jellyfin_entrypoint \$@" > /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
