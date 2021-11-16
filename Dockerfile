FROM quay.io/bitnami/python:3.8

ARG VENV=.venv

RUN set -xe && \
    python -m venv ${VENV} && \
    . ${VENV}/bin/activate && \
    pip install --upgrade pip && \
    pip install rasa[full] && \
    rasa telemetry disable && \
    python -m spacy download it_core_news_md && \
    python -m spacy download en_core_web_sm && \
    pip install farm-haystack

USER ci

CMD ["rasa"]
