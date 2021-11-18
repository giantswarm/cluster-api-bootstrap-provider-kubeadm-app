{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels for controller and webhook
*/}}
{{- define "labels.common" -}}
app: {{ include "name" . | quote }}
app.giantswarm.io/branch: {{ .Values.project.branch | quote }}
app.giantswarm.io/commit: {{ .Values.project.commit | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ include "chart" . | quote }}
{{- end -}}

{{- define "labels.controller" -}}
{{ include "labels.controller.selector" . }}
{{ include "labels.common" . }}
{{- end -}}

{{- define "labels.webhook" -}}
{{ include "labels.webhook.selector" . }}
{{ include "labels.common" . }}
{{- end -}}

{{- define "labels.controller.selector" -}}
{{ include "labels.provider" . }}
app.kubernetes.io/name: {{ include "name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}

{{- define "labels.webhook.selector" -}}
{{ include "labels.provider" . }}
app.kubernetes.io/name: {{ include "resource.webhook.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}

{{/*
Provider labels
*/}}
{{- define "labels.provider" -}}
cluster.x-k8s.io/provider: bootstrap-kubeadm
{{- end -}}
