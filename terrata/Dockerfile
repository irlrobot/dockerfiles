FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y

ARG oktabaseurl
ARG tfver="0.12.13"

# Install dependencies
RUN apt-get install curl unzip python3-pip -y

# Terraform
RUN curl -Os https://releases.hashicorp.com/terraform/${tfver}/terraform_${tfver}_linux_amd64.zip
RUN unzip terraform_${tfver}_linux_amd64.zip -d /usr/bin/
RUN rm terraform_${tfver}_linux_amd64.zip

# okta-awscli
RUN pip3 install okta-awscli awscli

# Replaces https://github.com/jmhale/okta-awscli/blob/master/oktaawscli/okta_auth.py
# with a modified version that can look for more than one Okta appName pattern.
# If needed, uncomment and modify hacked_okta_auth.py by searching for "hack"
# and then adding more appName strings to look for.
# COPY hacked_okta_auth.py /usr/local/lib/python3.6/dist-packages/oktaawscli/okta_auth.py

# Add an alias for okta-awscli to make setup easier.
RUN echo "alias setup='echo \"[default]\nbase-url = ${oktabaseurl}\" > ~/.okta-aws && /usr/local/bin/okta-awscli --profile default --force'" >> ~/.bashrc
# Add an alias for refreshing the STS credentials.
RUN echo "alias refresh='/usr/local/bin/okta-awscli --profile default'" >> ~/.bashrc

# Add the okta-awscli dot file
RUN echo "[default]\nbase-url = ${oktabaseurl}" > ~/.okta-aws
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Clean up and reduce image size
RUN apt-get clean
RUN apt-get autoremove

# Display a welcome message to the user to help them get started.
# We're echo'ing an echo inside of .bashrc so it displays on login - how meta
RUN echo 'echo "To get started, run \`setup\`. After you authenticate and select an account/role you can run then awscli or terraform commands like normal. Run \`refresh\` to get new STS credetials if they expire after setup. If you need to switch AWS accounts or roles just run \`setup\` again and select the appropriate options."' >> ~/.bashrc

WORKDIR /terraform
