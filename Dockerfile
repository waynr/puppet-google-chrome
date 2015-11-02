FROM opensuse:latest

RUN zypper install -y git puppet ca-certificates* && \
    git clone -b fedora https://github.com/jamesnetherton/puppet-google-chrome.git /etc/puppet/modules/google_chrome && \
    puppet module install puppetlabs-apt && \
    puppet module install darin/zypprepo && \
    puppet apply /etc/puppet/modules/google_chrome/integration-tests/chrome.pp

CMD [ "ls", "-l", "/usr/bin/google-chrome" ]
