FROM python:3.12-slim

# Create app working directory
WORKDIR /app

# Copy all files into container
COPY . .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Download spaCy language model
RUN python -m spacy download en_core_web_md

# Run your Flask app with dynamic port for Render
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:$PORT"]
