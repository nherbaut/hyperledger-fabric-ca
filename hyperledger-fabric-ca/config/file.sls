# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import hyperledger__fabric__ca with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

hyperledger-fabric-ca-config-file-file-managed:
  file.managed:
    - name: {{ hyperledger__fabric__ca.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='hyperledger-fabric-ca-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ hyperledger__fabric__ca.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        hyperledger__fabric__ca: {{ hyperledger__fabric__ca | json }}
