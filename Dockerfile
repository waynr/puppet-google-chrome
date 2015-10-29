FROM debian:jessie

RUN apt-get update && \
    apt-get install git puppet lsb-release --no-install-recommends -y && \
    git clone -b debian https://github.com/jamesnetherton/puppet-google-chrome.git /etc/puppet/modules/google_chrome && \
    puppet module install puppetlabs-apt && \
    puppet module install darin/zypprepo && \
    puppet apply /etc/puppet/modules/google_chrome/integration-tests/chrome.pp

CMD [ "ls", "-l", "/usr/bin/google-chrome" ]
