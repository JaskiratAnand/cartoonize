FROM python:3.10-slim

# Copy code to container image.
ENV APP_HOME=/app
WORKDIR $APP_HOME

# Install system dependencies & cleanup 
RUN apt-get update && apt-get install -y \
libglib2.0-0 \
libsm6 \
libxext6 \
libxrender-dev \
ffmpeg \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip \ 
&& pip install gunicorn

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "--threads", "8", "--timeout", "0", "app:app"]