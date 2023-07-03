apiVersion: {{.apiVersion}}{{"\n"}}
{{ range .items -}}
    {{- if eq .kind "Pod" -}}
        POD: {{.metadata.name}}
        NODE: {{.spec.nodeName}}
        PHASE: {{.status.phase}}
        {{- "\n"}}
    {{ else }} 
        else {{.kind}}
    {{- end -}}
{{- end -}}
Number of pods: {{ len .items  }} {{"\n"}}
