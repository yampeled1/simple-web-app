FROM python:3.7

MAINTAINER Yam Peled "yampeled1@gmail.com"

RUN apt-get update

RUN apt-get install stress

WORKDIR /app

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

RUN python -m pip install -r requirements.txt

COPY . /app

#ENTRYPOINT [ "python" ]

CMD [ "python","app.py" ]
