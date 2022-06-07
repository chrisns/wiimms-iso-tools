FROM ubuntu@sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/