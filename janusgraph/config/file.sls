# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as JANUSGRAPH with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- set container_files = [
    'gremlin-server.yaml',
    'janusgraph-configmap.yaml',
    'janusgraph-pod.yaml',
    'janusgraph.properties'
  ]
%}

{%- for container_file in container_files %}
JANUSGRAPH-{{ container_file }}-file-managed:
  file.managed:
    - name: {{ JANUSGRAPH.rootdir }}/{{ container_file }}
    - source: {{ files_switch([container_file]) }}
    - mode: 644
    - user: {{ JANUSGRAPH.hostuser.name }}
    - group: {{ JANUSGRAPH.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        JANUSGRAPH: {{ JANUSGRAPH | json }}
{%- endfor %}

JANUSGRAPH-podman-network-file-managed:
  file.managed:
    {%- if JANUSGRAPH.hostuser.name == 'root' %}
    - name: /etc/cni/net.d/podman-network-janusgraphnet.conflist
    {%- else %}
    - name: /home/{{ JANUSGRAPH.hostuser.name }}/.config/cni/net.d/podman-network-janusgraphnet.conflist
    {%- endif %}
    - source: {{ files_switch(['podman-network-janusgraphnet.conflist']) }}
    - mode: 644
    - user: {{ JANUSGRAPH.hostuser.name }}
    - group: {{ JANUSGRAPH.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        JANUSGRAPH: {{ JANUSGRAPH | json }}

JANUSGRAPH-selinux-policy-file-managed:
  file.managed:
    - name: {{ JANUSGRAPH.rootdir }}/{{ JANUSGRAPH['projectname'] }}_janusgraph_pod_srv01.cil
    - source: {{ files_switch(['janusgraph_pod_srv01.cil']) }}
    - mode: 644
    - user: {{ JANUSGRAPH.hostuser.name }}
    - group: {{ JANUSGRAPH.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        JANUSGRAPH: {{ JANUSGRAPH | json }}
