# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

JANUSGRAPH-pod-present:
  cmd.run:
    - name: podman play kube --network={{ JANUSGRAPH.pod.network.domain_name }} --configmap janusgraph-configmap.yaml --seccomp-profile-root {{ JANUSGRAPH['rootdir'] }}/seccomp janusgraph-pod.yaml
    - cwd: {{ JANUSGRAPH.rootdir }}
    - runas: {{ JANUSGRAPH.hostuser.name }}
