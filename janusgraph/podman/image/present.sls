# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

JANUSGRAPH-podman-image-present:
  cmd.run:
    - name: podman image pull {{ JANUSGRAPH['janusgraph']['image'] }}
    - runas: {{ JANUSGRAPH.hostuser.name }}
    - unless:
      - '[[ "$(podman image ls -q {{ JANUSGRAPH['janusgraph']['image'] }})" != "" ]]'
