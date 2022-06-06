FROM ubuntu@sha256:e92783679f647c15a44ffed3ffcd0f98ab6ecc59846645183b2ddefaaacca2d2 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:e92783679f647c15a44ffed3ffcd0f98ab6ecc59846645183b2ddefaaacca2d2
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/