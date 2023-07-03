## Try these templates out with My K8S Lab

Always think what the template will do to your input!
"block" is like iife in javascript, defines a template and then executes it against the input data structure.

troubleshooting tip:
- save kubectl command output to yaml file and examine the structure
```
kubectl get node chungguangy-thornton-master1 -o yaml > node.yaml
kubectl get node -o yaml > nodes.yaml
```

```
export KUBECONFIG=~/.kube/chungguangy-thornton/config
kubectl config get-contexts
kubectl get deployments --all-namespaces -o go-template-file=./go-templates/cpu.limit.go.tpl 
```

[Tutorial](https://blog.dkwr.de/development/kubernetes-go-templates/)

[Redhat tutorial using oc](https://cloud.redhat.com/blog/customizing-oc-output-with-go-templates)
Use below alias as oc should be compatible with kubectl plus a bit more.
```apache
alias oc=kubectl
oc get pods -o go-template='Hello, World!{{"\n"}}'
oc get pods -o go-template='{{.apiVersion}}{{"\n"}}'
oc get pods -o go-template='{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'
oc get pod -o  go-template-file=./go-templates/pod.modular.go.tpl 
kubectl get all -o  go-template-file=./go-templates/pod.go.tpl 

kubectl get pods --field-selector status.phase!=Running -A
No resources found
```
## JSON PATH
[Reference](https://kubernetes.io/docs/reference/kubectl/jsonpath/)
Example: get pod name whose podIP is a specific value ?() defines a  filter
```
kubectl get pods -o=jsonpath='{.items[?(@.status.podIP=="10.244.2.190")].metadata.name}{"\n"}'

kubectl get pods -o=jsonpath='{.items[?(@.status.phase=="Running")].metadata.name}{"\n"}'
kubectl get pods -o=jsonpath='{.items[?(@.status.phase!="Running")].metadata.name}{"\n"}'

kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}'

kubectl get pods -o json | jq -r '.items[] | select(.status.phase | test("Running")).metadata.name'

kubectl get pods -o json | jq -r '.items[] | select(.status.phase | test("Running") | not).metadata.name'

```