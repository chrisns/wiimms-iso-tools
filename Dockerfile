FROM ubuntu@sha256:2ec38e3c5c9e889445516d2b044d061c23dc23d321e4e1508957997f4001dc1d as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:2ec38e3c5c9e889445516d2b044d061c23dc23d321e4e1508957997f4001dc1d
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/