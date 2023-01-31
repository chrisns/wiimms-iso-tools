FROM ubuntu@sha256:f05532b6a1dec5f7a77a8d684af87bc9cd1f2b32eab301c109f8ad151b5565d1 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:f05532b6a1dec5f7a77a8d684af87bc9cd1f2b32eab301c109f8ad151b5565d1
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/