FROM quay.io/bitnami/python:3.8

RUN set -xe && \
    pip install --upgrade pip && \
    pip install rasa[full] && \
    rasa telemetry disable && \
    python -m spacy download it_core_news_md && \
    python -m spacy download en_core_web_sm && \
    pip install farm-haystack

CMD ["rasa"]
