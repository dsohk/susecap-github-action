FROM alpine:3.10

LABEL "name"="SUSE CAP CLI Action"
LABEL "maintainer"="ltlamontagne@gmail.com>"
LABEL "version"="1.0.1"

LABEL "com.github.actions.name"="GitHub Action for SUSE Cloud Application Platform"
LABEL "com.github.actions.description"="Enable CF commands in GitHub Action"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="green"

# Install uuidgen
RUN apk add --no-cache ca-certificates curl bash jq util-linux

# Install Cloud Foundry cli
ADD https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github /tmp/cf-cli.tgz
RUN mkdir -p /usr/local/bin && \
  tar -xzf /tmp/cf-cli.tgz -C /usr/local/bin && \
  cf --version && \
  rm -f /tmp/cf-cli.tgz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
