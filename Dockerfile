FROM ubuntu@20.04 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@20.04
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/