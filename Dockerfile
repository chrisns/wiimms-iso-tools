FROM ubuntu@sha256:7cfe75438fc77c9d7235ae502bf229b15ca86647ac01c844b272b56326d56184 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:7cfe75438fc77c9d7235ae502bf229b15ca86647ac01c844b272b56326d56184
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/