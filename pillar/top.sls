base:
  '*':
    - common

  'loadbalance1':
    - override

  'roles:load-balancing':
    - match: grain
    - hwaas-ssl
