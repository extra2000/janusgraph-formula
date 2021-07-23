# -*- coding: utf-8 -*-
# vim: ft=yaml
---
janusgraph:
  lookup:
    projectname: janusgraph
    rootdir: /opt/janusgraph
    hostuser:
      name: root
      group: root
    pod:
      network:
        subnet: 10.77.1.0/24
        gateway: 10.77.1.1
        domain_name: janusgraphnet
        bridge: cni-podman1
    janus_server_timeout: 30
    janus_storage_timeout: 60
    janusgraph:
      restart_policy: OnFailure
      port:
        nonencrypted:
          container: 8182
          host: 8182
          ip: 0.0.0.0
          protocol: tcp
          bind: true
      resources:
        requests:
          memory: 1000Mi
          cpu: 1000m
        limits:
          memory: 1000Mi
          cpu: 1000m
