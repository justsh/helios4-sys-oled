FROM docker.io/library/debian:trixie-slim

RUN apt-get update && apt-get install -y build-essential python3-dev

COPY . /sys-oled
WORKDIR  /sys-oled

RUN sed -i '/^systemctl/d' install.sh && ./install.sh dev

WORKDIR /
ENTRYPOINT ["/usr/bin/python3", "/usr/local/bin/sys-oled"]
CMD ["--display", "asciiblock"]
