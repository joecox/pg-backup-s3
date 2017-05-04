FROM alpine:3.5

RUN apk --update add postgresql-client=9.6.2-r0 \
                     python py-pip py-setuptools git ca-certificates \
                     curl coreutils

RUN pip install python-dateutil

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN cd /opt/s3cmd && python setup.py install

RUN apk del git py-pip ca-certificates

RUN rm -rf /var/cache/apk/* /opt/s3cmd

CMD [ "psql" ]
