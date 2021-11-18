{{/* vim: set filetype=mustache: */}}
{{/*
Create a name stem for resource names
Name is shortened to cluster-api-bootstrap due to length restriction.

When pods for deployments are created they have an additional 16 character
suffix appended, e.g. "-957c9d6ff-pkzgw". Given that Kubernetes allows 63
characters for resource names, the stem is truncated to 47 characters to leave
room for such suffix.
*/}}
{{- define "resource.default.name" -}}
{{- .Release.Name | replace "provider-kubeadm-" "" | replace "." "-" | trunc 47 | trimSuffix "-" -}}
{{- end -}}

{{- define "resource.default.namespace" -}}
giantswarm
{{- end -}}

{{- define "resource.app.version" -}}
{{- .Chart.AppVersion | quote -}}
{{- end -}}

{{/*
The CRD webhook name should match the v1alpha4 CRD webhook name.
See https://github.com/giantswarm/cluster-api-app/blob/master/helm/cluster-api/templates/_resource.tpl#L44

Issue: https://github.com/giantswarm/giantswarm/issues/19415
*/}}
{{- define "resource.webhook.name" -}}
{{- if eq $.Chart.Name $.Release.Name }}cluster-api-bootstrap{{ else }}{{ include "resource.default.name" . }}-webhook{{ end }}
{{- end -}}

{{- define "resource.app.unique" -}}
{{- if eq $.Chart.Name $.Release.Name }}true{{ else }}false{{ end }}
{{- end -}}
