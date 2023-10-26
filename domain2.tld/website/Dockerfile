# pull official base image
FROM python:3.12-slim

# create new non-root user
RUN groupadd -g 10001 nonroot && useradd -u 10000 -g nonroot nonroot

# create work directory
RUN mkdir /home/app/ && chown -R nonroot:nonroot /home/app

# set work directory
WORKDIR /home/app/

# copy project
COPY --chown=nonroot:nonroot . .

# install requirements
RUN pip install -r requirements.txt

# switch to nonroot user
USER nonroot:nonroot

# expose port 80, not required if use with nginx-proxy
EXPOSE 80

# run gunicorn server
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]
