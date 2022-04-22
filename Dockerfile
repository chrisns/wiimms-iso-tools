FROM ubuntu@sha256:918df1ca29156c7a02553f4b0c3f902c85bb3e6ae6b21f354dd52ad4c76257bc as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:918df1ca29156c7a02553f4b0c3f902c85bb3e6ae6b21f354dd52ad4c76257bc
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/