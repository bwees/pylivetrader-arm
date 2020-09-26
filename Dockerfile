FROM python:3.7-slim-buster

WORKDIR /home
COPY requirements.txt /home/requirements.txt

RUN apt-get update && apt-get install libatlas-base-dev -yf

RUN pip install -r /home/requirements.txt --extra-index-url https://www.piwheels.org/simple
RUN pip install pylivetrader --no-deps
RUN rm requirements.txt

ENTRYPOINT "pylivetrader"
