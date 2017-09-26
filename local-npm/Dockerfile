FROM node:8

WORKDIR /local-npm
VOLUME /data

EXPOSE 5080
EXPOSE 16984

ENV BASE_URL='http://127.0.0.1:5080'
ENV DATA_DIRECTORY='/data'
ENV REMOTE_REGISTRY='https://registry.npmjs.org'
ENV REMOTE_REGISTRY_SKIMDB='https://replicate.npmjs.com'

RUN npm set progress=false && npm i local-npm --no-color

CMD node node_modules/local-npm/bin/index.js \
        --remote $REMOTE_REGISTRY \
        --remote-skim $REMOTE_REGISTRY_SKIMDB \
        --directory $DATA_DIRECTORY \
        --url $BASE_URL
