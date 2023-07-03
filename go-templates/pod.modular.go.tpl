{{/* define template called labels  */}}
{{- define "labels" -}}
    {{if .metadata.labels}}
    {{- range $label,$value := .metadata.labels}}
        {{$label}}{{" => "}}{{$value -}}
    {{end}}
    {{else}}
        No labels
    {{end}}
{{- end -}}

{{/* define template called volumes  */}}
{{- define "volumes" -}}
    {{ range .spec.volumes }}
        - {{.name}}
    {{- end -}}
{{- end -}}
apiVersion: {{.apiVersion}}{{"\n"}}
{{ range .items -}}
    {{- if eq .kind "Pod" -}}
    POD: {{.metadata.name}}
    NODE: {{.spec.nodeName}}
    PHASE: {{.status.phase}}
    VOLUMES: {{template "volumes" .}}
    LABELS: {{template "labels" .}}
    {{- "\n"}}
    {{- end -}}
{{- end -}}
Number of pods: {{ len .items  }} {{"\n"}}