FROM ubuntu@sha256:9db075a9570d47dae28e17889a800cadaaefd641d18fc43bdf4fa0ad6c02e1b3 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:9db075a9570d47dae28e17889a800cadaaefd641d18fc43bdf4fa0ad6c02e1b3
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/