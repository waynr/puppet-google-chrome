FROM fedora:22

RUN dnf install git puppet findutils -y && \
    git clone -b fedora https://github.com/jamesnetherton/puppet-google-chrome.git /etc/puppet/modules/google_chrome && \
    puppet module install puppetlabs-apt && \
    puppet module install darin/zypprepo && \
    puppet apply /etc/puppet/modules/google_chrome/integration-tests/chrome.pp

CMD [ "ls", "-l", "/usr/bin/google-chrome" ]
