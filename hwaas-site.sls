hwaas-user:
  user.present:
    - name: hwaas
    - home: /home/hwaas

hwaas-source:
  git.latest:
    - name: https://github.com/floyd-may/hwaas.git
    - rev: master
    - target: /home/hwaas/hwaas-site
