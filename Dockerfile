FROM quay.io/bitnami/python:3.8

RUN set -xe && \
    pip install --upgrade pip && \
    pip install rasa[full] && \
    rasa telemetry disable && \
    python -m spacy download it_core_news_md && \
    python -m spacy download en_core_web_sm && \
    pip install farm-haystack && \
# keras 2.7 crash "Cannot register 2 metrics with the same name"
    pip install keras==2.6 && \
    echo Done!

CMD ["rasa"]
