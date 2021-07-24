# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

JANUSGRAPH-rootdir-absent:
  file.absent:
    - name: {{ JANUSGRAPH.rootdir }}

JANUSGRAPH-podman-network-file-absent:
  file.absent:
    {%- if JANUSGRAPH.hostuser.name == 'root' %}
    - name: /etc/cni/net.d/podman-network-{{ JANUSGRAPH.pod.network.domain_name }}.conflist
    {%- else %}
    - name: /home/{{ JANUSGRAPH.hostuser.name }}/.config/cni/net.d/podman-network-{{ JANUSGRAPH.pod.network.domain_name }}.conflist
    {%- endif %}
