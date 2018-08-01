hwaas-user:
  user.present:
    - name: hwaas
    - home: /home/hwaas

git-client-package:
  pkg.installed:
    - name: git

hwaas-source:
  git.latest:
    - name: https://github.com/floyd-may/hwaas.git
    - rev: master
    - target: /home/hwaas/hwaas-site
