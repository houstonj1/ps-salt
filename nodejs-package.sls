nodejs-repo:
  pkgrepo.managed:
    - humanname: NodeJS nodesource repo
    - name: deb https://deb.nodesource.com/node_8.x xenial main
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key


nodejs:
  pkg:
    - installed

#npm:
#  pkg:
#    - installed
