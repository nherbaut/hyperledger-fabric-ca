# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric__ca with context %}

include:
  - golang

hyperledger-fabric-ca-package-install-pkg-installed:
  pkg.installed:
    - refresh: True
    - pkgs: 
      - libtool 
      - libltdl-dev

/etc/systemd/system/fabric-ca-server.service:
  file.managed:
    source: salt://hyperledger-fabric-ca/service/fabric-ca-server.service
    template: jinja

fabric-ca-server:
  service.running: []
    - require:
    - file: /etc/systemd/system/fabric-ca-server.service
