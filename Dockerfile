FROM ubuntu:14.04

RUN useradd --system -U -u 500 jenkins
RUN apt-get -y update && apt-get install -y curl git ansible python-apt

ADD . /ansible-jenkins

WORKDIR /ansible-jenkins

RUN ansible-playbook server.yml -i hosts

EXPOSE 80

# USER jenkins
# WORKDIR /usr/local/lib/jenkins

CMD ["nginx", "-g", "daemon off;"]
