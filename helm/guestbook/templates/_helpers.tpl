{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "guestbook.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "guestbook.fullname" -}}
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
{{- define "guestbook.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "base.labels" -}}
helm.sh/chart: {{ include "guestbook.chart" . }}
visualize: "true"
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "guestbook.selectorLabels" -}}
app.kubernetes.io/name: {{ include "guestbook.name" . }}-gb
app.kubernetes.io/instance: {{ .Release.Name }}
app: guestbook-service
{{- end }}
{{- define "message.selectorLabels" -}}
app.kubernetes.io/name: {{ include "guestbook.name" . }}-message
app.kubernetes.io/instance: {{ .Release.Name }}
app: message-service
{{- end }}
{{- define "ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "guestbook.name" . }}-ui
app.kubernetes.io/instance: {{ .Release.Name }}
app: ui
{{- end }}
{{- define "redis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "guestbook.name" . }}-redis
app.kubernetes.io/instance: {{ .Release.Name }}
app: redis
{{- end }}
{{- define "mysql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "guestbook.name" . }}-mysql
app.kubernetes.io/instance: {{ .Release.Name }}
app: mysql
{{- end }}