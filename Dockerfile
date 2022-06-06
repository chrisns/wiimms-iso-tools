FROM ubuntu@sha256:18f63cbe22f65810c15453f050cb64603193264b039661389efb2cd20f2b236a as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:18f63cbe22f65810c15453f050cb64603193264b039661389efb2cd20f2b236a
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/