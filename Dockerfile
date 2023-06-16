FROM ubuntu@sha256:6120be6a2b7ce665d0cbddc3ce6eae60fe94637c6a66985312d1f02f63cc0bcd as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:6120be6a2b7ce665d0cbddc3ce6eae60fe94637c6a66985312d1f02f63cc0bcd
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/