FROM ubuntu@sha256:9dc05cf19a5745c33b9327dba850480dae80310972dea9b05052162e7c7f2763 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:9dc05cf19a5745c33b9327dba850480dae80310972dea9b05052162e7c7f2763
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/