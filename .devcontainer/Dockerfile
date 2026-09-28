FROM mcr.microsoft.com/devcontainers/python:3.13-bookworm

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        curl \
        wget \
        jq \
        shellcheck \
        build-essential \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libcups2 \
        libdrm2 \
        libxkbcommon0 \
        libxcomposite1 \
        libxdamage1 \
        libxfixes3 \
        libxrandr2 \
        libgbm1 \
        libasound2 \
        libpango-1.0-0 \
        libcairo2 \
        libnspr4 \
        libnss3 \
        graphviz \
        fonts-liberation \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && node --version \
    && npm --version \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest \
    /uv \
    /uvx \
    /usr/local/bin/

ENV UV_LINK_MODE=copy

RUN uv pip install --system \
    pre-commit \
    ruff \
    pylint \
    pytest \
    pyyaml \
    requests \
    pydantic \
    click \
    data-flow-diagram 

RUN curl -fsSL https://get.pulumi.com | sh \
    && install -m 0755 /root/.pulumi/bin/pulumi /usr/local/bin/pulumi \
    && rm -rf /root/.pulumi

ENV PUPPETEER_CACHE_DIR=/usr/local/share/puppeteer

RUN npm install --global \
        @mermaid-js/mermaid-cli \
        @openai/codex \
        puppeteer \
    && npx puppeteer browsers install chrome-headless-shell \
    && chmod -R a+rX /usr/local/share/puppeteer

# --- draw.io (diagrams.net) desktop CLI for headless diagram export ---
# xvfb + xauth give the Electron app a virtual display; the .deb pulls in its
# own GTK/dbus dependencies. Bump DRAWIO_VERSION to upgrade.
ARG DRAWIO_VERSION=31.3.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends xvfb xauth \
    && DRAWIO_ARCH="$(dpkg --print-architecture)" \
    && curl -fsSL -o /tmp/drawio.deb \
        "https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/drawio-${DRAWIO_ARCH}-${DRAWIO_VERSION}.deb" \
    && apt-get install -y /tmp/drawio.deb \
    && rm -f /tmp/drawio.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY .devcontainer/drawio-export.sh /usr/local/bin/drawio-export
RUN chmod 0755 /usr/local/bin/drawio-export

USER vscode

ENV PATH="/home/vscode/.local/bin:${PATH}"
ENV PUPPETEER_CACHE_DIR=/usr/local/share/puppeteer

RUN if curl -fsSL https://cursor.com/install | bash; then \
        /home/vscode/.local/bin/agent --version || true; \
    else \
        echo "Cursor CLI installation skipped"; \
    fi

USER root

RUN if [ -x /home/vscode/.local/bin/agent ]; then \
        ln -sf /home/vscode/.local/bin/agent /usr/local/bin/agent && \
        ln -sf /home/vscode/.local/bin/agent /usr/local/bin/cursor; \
    else \
        echo "Cursor CLI binary not available; skipping symlinks"; \
    fi

USER vscode