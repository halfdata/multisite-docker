# Host several sites using Docker containers

This demo shows how to host several websites (running inside Docker containers) on a single server and automatically create/renew SSL certificates to enable HTTPS on each website.

To achieve that we can use:
1. [nginxproxy/nginx-proxy](https://hub.docker.com/r/nginxproxy/nginx-proxy): Automated Nginx reverse proxy for docker containers. Together with nginx it generates its reverse proxy configs and reloads nginx when containers are started and stopped.
2. [nginxproxy/acme-companion](https://hub.docker.com/r/nginxproxy/acme-companion): Automated ACME SSL certificate generation for nginx-proxy. It handles the automated creation, renewal and use of SSL certificates for proxied Docker containers through the ACME protocol.

## Quick start

1. Make sure that your server has `git`, `docker` and `docker compose` installed and nobody listen port `80`.
2. Clone this repository:
<pre>git clone https://github.com/halfdata/multisite-docker.git</pre>
3. Jump into <code>multisite-docker</code> folder/directory:
<pre>cd multisite-docker</pre>
4. Edit `nginx-proxy/docker-compose.yml` and set your email address as a value of `DEFAULT_EMAIL` environment variable in `nginx-proxy-acme` container. This email is used to get SSL certificates from Letsencrypt.
5. Edit `domain1.tld/docker-compose.yml`, `domain2.tld/docker-compose.yml`, `domain3.tld/docker-compose.yml` and set required values of `VIRTUAL_HOST` and `LETSENCRYPT_HOST` environment variables (domains pointing to the IP of the server).
6. Make file `run.sh` executable:
<pre>chmod +x run.sh</pre>
7. Start deployment:
<pre>./run.sh</pre>
That's it.
