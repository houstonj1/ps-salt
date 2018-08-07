nginx:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://load-balance/nginx.conf

{{ pillar['hwaas-ssl]['cert-path']'] }}:
  file.managed:
    - contents_pillar: hwaas-ssl:cert-contents

{{ pillar['hwaas-ssl']['cert-key-path'] }}:
  file.managed:
    - contents_pillar: hwaas-ssl:cert-key-contents
