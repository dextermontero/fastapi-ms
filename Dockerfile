FROM python:3-12-slim

COPY ./app /app
COPY ./entrypoint.sh /entrypoint.sh
COPY ./requirements.txt /requirements.txt

RUN apt-get update && \
    apt-get install \
        build-essential \
        python3-dev \
        python3-setuptools \
        tesseract-ocr \
        make \
        gcc \
    && python3 -m pip install -r requirements.txt \
    && apt-get remove -y --purge make gcc build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x entrypoint.sh

CMD ["./entrypoint.sh"]