FROM ubuntu@sha256:0b8153d771cdca9185be7c730b64c25697f30e63f122fbce49dd4f1f5ae9b26e as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:0b8153d771cdca9185be7c730b64c25697f30e63f122fbce49dd4f1f5ae9b26e
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/