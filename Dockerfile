FROM ubuntu@sha256:f454154bd8670e52ab840d7bfe26a8f9e830731c6964760c6c2cee21e8fd57d0 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:f454154bd8670e52ab840d7bfe26a8f9e830731c6964760c6c2cee21e8fd57d0
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/