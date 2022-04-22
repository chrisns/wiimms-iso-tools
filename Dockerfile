FROM ubuntu@sha256:18b083992355354958fd861c9f89b393f34d27442c07fa7492a5dbbd516b1c9a as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:18b083992355354958fd861c9f89b393f34d27442c07fa7492a5dbbd516b1c9a
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/