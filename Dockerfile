FROM ruby:3.2.2

RUN apt-get update && apt-get install -y \
    make \
    default-jdk \
    pipx \
    && rm -rf /var/lib/apt/lists/*

RUN pipx install xml2rfc

RUN gem install metanorma-cli

COPY . /app

WORKDIR /app/src

ENV PATH="/root/.local/bin:$PATH"

RUN make all
