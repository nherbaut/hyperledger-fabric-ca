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

