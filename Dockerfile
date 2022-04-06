FROM ubuntu@sha256:d11cf985a3a0c1f20fa25bada66928d31a40615adf21e1bb8b298497505227c2 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:d11cf985a3a0c1f20fa25bada66928d31a40615adf21e1bb8b298497505227c2
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/