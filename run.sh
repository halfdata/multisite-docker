# Create the netowrk.
docker network create nginx-proxy-network

# Start nginx-proxy and acme-companion containers.
docker compose --file ./nginx-proxy/docker-compose.yml up -d

# Start container(s) with first website.
docker compose --file ./domain1.tld/docker-compose.yml up -d

# Start container(s) with second website.
docker compose --file ./domain2.tld/docker-compose.yml up -d

# Start container(s) with third website.
docker compose --file ./domain3.tld/docker-compose.yml up -d
