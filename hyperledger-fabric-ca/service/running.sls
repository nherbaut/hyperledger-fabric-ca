# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric__ca with context %}

include:
  - {{ sls_config_file }}

hyperledger-fabric-ca-service-running-service-running:
  service.running:
    - name: {{ hyperledger__fabric__ca.service.name }}
    - enable: True
    - watch:
      - sls: {{ sls_config_file }}
