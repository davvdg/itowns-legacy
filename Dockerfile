FROM ubuntu:trusty
RUN apt-get update && \
	apt-get install -y \
	nodejs npm git
RUN mkdir /itowns
ADD . /itowns
ENV PORT0=8000
WORKDIR /itowns
RUN npm install
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm run build
WORKDIR /
CMD ["bash", "-c", "npm start -- --port ${PORT0}"]
