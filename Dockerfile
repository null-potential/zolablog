FROM --platform=linux/arm64 ghcr.io/getzola/zola:v0.17.1 as zola

COPY . /project
WORKDIR /project
RUN ["zola", "build"]

FROM --platform=linux/arm64 ghcr.io/static-web-server/static-web-server:2
WORKDIR /
COPY --from=zola /project/public /public
