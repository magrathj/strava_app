# Use an official Python runtime as a parent image
FROM python:3.7-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

RUN apk add --no-cache --upgrade --virtual .build-deps build-base

# Install any needed packages specified in requirements.txt
# RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN apk update && apk add python3-dev \
                        gcc \
                        libc-dev \
                        libffi-dev \
                        postgresql-dev \
                        linux-headers \
                        musl-dev \
                        openssl-dev \
                        cargo \
                        unixodbc-dev \
                        unixodbc \
                        libpq-dev 

RUN pip install --trusted-host pypi.python.org -r requirements.txt


# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]