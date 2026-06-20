# OpenShift commands

Pods not running on a node:

```bash
NODE=worker-0
oc get pods -A --field-selector spec.nodeName="$NODE" \
  | awk 'NR==1 || ($4!="Running" && $4!="Completed" && $4!="Succeeded")'
```

Node events:

```bash
NODE=worker-0
oc get events -A --field-selector involvedObject.kind=Node,involvedObject.name="$NODE" \
  --sort-by=.lastTimestamp
```
