# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

JANUSGRAPH-pod-absent:
  cmd.run:
    - name: podman pod rm --force {{ JANUSGRAPH.projectname }}-janusgraph-pod
    - runas: {{ JANUSGRAPH.hostuser.name }}
    - success_retcodes:
      - 0
      - 1
