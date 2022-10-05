FROM ubuntu@sha256:e00bd9ad7f936c975dd7c15c71d216f6456aabc39118df7eaa6919d7ddfdb3b0 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:e00bd9ad7f936c975dd7c15c71d216f6456aabc39118df7eaa6919d7ddfdb3b0
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/