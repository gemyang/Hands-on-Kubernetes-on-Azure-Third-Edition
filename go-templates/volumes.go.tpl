apiVersion: {{.apiVersion}}{{"\n"}}
{{ range .items -}}
    {{ $name := .metadata.name }}
    POD: {{ $name }}
    {{- range .spec.containers }}
            container: {{ .name }}
                {{ "volumeMounts" }}
                {{- range .volumeMounts }}
                    {{ .name }} {{": "}} {{ .mountPath }} 
                {{- end -}}
    {{- end }}
    {{ "====="}}
{{ end -}}
