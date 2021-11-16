FROM rasa/rasa:latest-full

USER root
RUN rasa telemetry disable; \
    python -m spacy download it_core_news_md; \
    python -m spacy download en_core_web_sm; \
    pip install farm-haystack;
USER 1001
