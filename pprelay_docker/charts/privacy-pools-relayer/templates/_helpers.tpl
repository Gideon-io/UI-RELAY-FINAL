{{/*
Expand the name of the chart.
*/}}
{{- define "privacy-pools-relayer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "privacy-pools-relayer.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "privacy-pools-relayer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Default labels
*/}}
{{- define "privacy-pools-relayer.labels" -}}
helm.sh/chart: {{ include "privacy-pools-relayer.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ include "privacy-pools-relayer.name" . }}

{{- end }}

{{/*
Redis Secret
*/}}
{{- define "privacy-pools-relayer.redis-secret" -}}
{{- if .Values.config.redis.secretReferenceKey -}}
{{- .Values.config.redis.secretReferenceKey }}
{{- else -}}
{{ include "privacy-pools-relayer.name" . }}-redis
{{- end -}}
{{- end -}}
