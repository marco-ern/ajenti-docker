FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    nano \
    curl

# AUTOMATIC INSTALLATION OF AJENTI
RUN curl -o install.sh https://raw.githubusercontent.com/ajenti/ajenti/master/scripts/install.sh && \
    chmod +x install.sh && \
    ./install.sh


## AUTOMATIC INSTALLATION OF AJENTI VIRTUAL ENVIRONMENT
#RUN curl https://raw.githubusercontent.com/ajenti/ajenti/master/scripts/install-venv.sh | sudo bash -s -

# COPY START SCRIPT
RUN mkdir -p /scripts_user/
COPY start.sh /scripts_user/start.sh
WORKDIR /scripts_user
CMD ["bash", "-c", "start.sh"]
#CMD ["tail", "-f", "dev/null"]