FROM ghcr.io/loong64/debian:trixie-slim AS cosign-bin
ARG TARGETARCH
ARG VERSION
WORKDIR /ko-app
ADD https://github.com/loong64/cosign/releases/download/${VERSION}/cosign-linux-${TARGETARCH} /ko-app/cosign
RUN chmod +x /ko-app/cosign

FROM ghcr.io/loong64/debian:trixie-slim
COPY --from=cosign-bin /ko-app/cosign /ko-app/cosign
ENTRYPOINT ["/ko-app/cosign"]