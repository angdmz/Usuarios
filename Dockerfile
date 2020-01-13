FROM python:3.7-alpine
RUN apk add --no-cache git \
    build-base \
    postgresql \
    postgresql-dev \
    libpq \
    openssh-keygen
RUN mkdir -p /opt/project
RUN ssh-keygen -t rsa -b 4096 -f jwt-key -N Clave123!
WORKDIR /opt/project
ADD requirements.txt /opt/project
RUN pip install -U pip
RUN pip install -r requirements.txt
RUN pip install ipython
RUN pip install coverage
RUN pip install django-discover-runner
ENV POSTGRES_DB usuarios
ENV POSTGRES_PASSWORD secret123
ENV POSTGRES_USER usuarios
ENV POSTGRES_HOST 172.17.0.1
ENV POSTGRES_PORT 5436