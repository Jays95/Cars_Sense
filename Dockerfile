FROM python:3.13-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

RUN python -m spacy download en_core_web_md

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:$PORT"]
