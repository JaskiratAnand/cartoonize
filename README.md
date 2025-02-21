# Cartoon

## Installation

### Application tested on:

- python 3.7
- tensorflow 2.1.0 
- tf_slim 1.1.0
- ffmpeg 3.4.8
- Cuda version 10.1
- OS: Linux (Ubuntu 18.04)

### Using Docker

1. Build Docker Image
```bash
docker build -t cartoonize:latest . 
```
2. Run Docker Image
```bash
docker run -p 8080:8080 cartoonize:latest
```
3. Open `localhost:8080`

### Using `virtualenv`

1. Make a virtual environment using `virutalenv` and activate it
```bash
virtualenv -p python3 cartoonize
source cartoonize/bin/activate
```
2. Install python dependencies
```bash
pip install -r requirements.txt
```
3. Run the webapp. Be sure to set the appropriate values in `config.yaml` file before running the application.
```bash
python app.py
```
4. Open `localhost:8080`
