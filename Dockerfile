# ✅ Use slim Python base image
FROM python:3.11-slim

# ✅ Install build tools and native libraries for blis/numpy/scipy
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

# ✅ Create working directory
WORKDIR /app

# ✅ Copy your project files
COPY . .

# ✅ Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# ✅ Expose port dynamically from Render
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:$PORT"]
