knot:
  pkg.installed:
    - pkgs:
      - knot
    - require:
      - sls: pacman
  file.managed:
    - name: /etc/knot/knot.conf
    - source: salt://knot/files/knot.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  service.running:
    - name: knot.service
    - enable: True

reload_knot:
  cmd.wait:
    - name: '/usr/bin/knotc reload'
    - watch:
      - file: /etc/knot/knot.conf
