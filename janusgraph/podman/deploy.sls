# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}

{%- if JANUSGRAPH.pod.network.use_podman_default_network %}
{%- set network_param = '--network="podman"' %}
{%- else %}
{%- set network_param = '--network="' + JANUSGRAPH.pod.network.domain_name + '"' %}
{%- endif %}

{%- if JANUSGRAPH.janusgraph.use_seccomp %}
{%- set seccomp_param = '--seccomp-profile-root="' + JANUSGRAPH.rootdir + '/seccomp"' %}
{%- else %}
{%- set seccomp_param = '' %}
{%- endif %}

JANUSGRAPH-pod-present:
  cmd.run:
    - name: podman play kube {{ network_param }} --configmap janusgraph-configmap.yaml {{ seccomp_param }} janusgraph-pod.yaml
    - cwd: {{ JANUSGRAPH.rootdir }}
    - runas: {{ JANUSGRAPH.hostuser.name }}
