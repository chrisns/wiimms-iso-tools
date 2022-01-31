FROM ubuntu
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu
USER 1000
COPY --from=0 /build/bin/* /usr/local/bin/