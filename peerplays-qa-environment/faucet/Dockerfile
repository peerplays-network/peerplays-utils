FROM registry.gitlab.com/pbsa/tools-libs/peerplays-utils/ubuntu-for-peerplays:latest
MAINTAINER PeerPlays Blockchain Standards Association

RUN \
    apt-get update -y && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y \
      libffi-dev \
      libssl-dev \
      python-dev \
      python3-pip \
      python3-venv \
      python3-wheel

WORKDIR /home/peerplays/faucet

RUN \
    git clone https://gitlab.com/PBSA/tools-libs/faucet.git . && \
    git branch --show-current && \
    git log --oneline -n 5

RUN sed -i 's/flask.*/flask==1.1.2/' requirements.txt
RUN sed -i 's/pycryptodome.*/pycryptodome==3.8.1/' requirements.txt
RUN sed -i 's/requests.*/requests==2.21.0/' requirements.txt

RUN \
    python3 -m venv env && \
    . env/bin/activate && \
    pip3 install wheel && \
    pip3 install flask-script-extras && \
    pip3 install -r requirements.txt

RUN \
    python3 -m venv env && \
    . env/bin/activate && \
    pip3 install flask-cors && \
    pip3 install flask-mail

ADD peerplays-qa-environment/faucet/config.yml ./config.yml
ADD peerplays-qa-environment/faucet/start.sh ./start.sh

RUN sed -i 's/^}/    "QAENV": {\n        "chain_id": "7c1c72eb738b3ff1870350f85daca27e2d0f5dd25af27df7475fbd92815e421e",\n        "core_symbol": "TEST",\n        "prefix": "TEST",\n    },\n}/' env/lib/python3.8/site-packages/peerplaysbase/chains.py

RUN sed -i 's/redis = Redis(.*/redis = Redis(host=config["redis_ip"])/'  app/views.py

RUN sed -i 's/if request\.remote_addr != "127.0.0.1"/#if request.remote_addr != "127.0.0.1"/' app/views.py
RUN sed -i 's/    return api_error("Only one account per IP")/#    return api_error("Only one account per IP")/' app/views.py

RUN sed -i 's/app\.run()/app.run(host="0.0.0.0")/' manage.py
RUN sed -i 's/app\.run(debug=True)/app.run(host="0.0.0.0", debug=True)/' manage.py

# Faucet
EXPOSE 5000

# Faucet
CMD ["/home/peerplays/faucet/start.sh"]

