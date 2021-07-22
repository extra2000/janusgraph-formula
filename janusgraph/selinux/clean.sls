# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

JANUSGRAPH-selinux-policy-absent:
  cmd.run:
    - name: semodule -r {{ JANUSGRAPH.projectname }}_janusgraph_pod_srv01
    - success_retcodes:
      - 0
      - 1
