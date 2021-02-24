# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric__ca with context %}

hyperledger-fabric-ca-service-clean-service-dead:
  service.dead:
    - name: {{ hyperledger__fabric__ca.service.name }}
    - enable: False
