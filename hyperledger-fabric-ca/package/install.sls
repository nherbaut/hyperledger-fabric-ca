# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric__ca with context %}

hyperledger-fabric-ca-package-install-pkg-installed:
  pkg.installed:
    - name: {{ hyperledger__fabric__ca.pkg.name }}
