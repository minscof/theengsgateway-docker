FROM python:3.11-bookworm

SHELL ["/bin/bash", "-ec"]

RUN apt update && apt install --no-install-recommends -y bluez
RUN python3 -m venv /opt/venv && \
        source /opt/venv/bin/activate && \
	pip install --upgrade --extra-index-url=https://www.piwheels.org/simple pip TheengsGateway==1.1.0

COPY chroot /

CMD source /opt/venv/bin/activate && exec /opt/venv/start.sh
