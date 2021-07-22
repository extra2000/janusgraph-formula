# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

JANUSGRAPH-selinux-policy-present:
  cmd.run:
    - name: semodule -i {{ JANUSGRAPH['projectname'] }}_janusgraph_pod_srv01.cil /usr/share/udica/templates/{base_container.cil,net_container.cil}
    - cwd: {{ JANUSGRAPH.rootdir }}
