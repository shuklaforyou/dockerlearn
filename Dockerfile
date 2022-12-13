FROM python:3.8-alpine

ENV PATH="scripts:${PATH}"
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc lib-dev linux-header 
RUN pip install -r /requirements.txt
RUN apk del .tmp

RUN mkdir /project1
COPY ./project1 /project1
WORKDIR /project1
COPY ./scripts /scripts 

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static 

RUN adduser -D user 
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web 
USER user 


CMD ["enterypoint.sh"]