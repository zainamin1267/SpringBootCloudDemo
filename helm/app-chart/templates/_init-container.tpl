{{- define "app-chart.initContainer" -}}
{{- if .Values.configureInitContainer }}
initContainers:
  - name: check-db-env-vars
    image: busybox:1.35.0-uclibc
    command:
      - /bin/sh
      - -c
      - |
        if [ -z "$DB_USERNAME" ]; then
          echo "Error: DB_USERNAME is not set";
          exit 1;
        fi
        if [ -z "$DB_PASSWORD" ]; then
          echo "Error: DB_PASSWORD is not set";
          exit 1;
        fi
        echo "Environment variables are set correctly";
    env:
      - name: DB_USERNAME
        valueFrom:
          configMapKeyRef:
            name: db-config
            key: DB_USERNAME
      - name: DB_PASSWORD
        valueFrom:
          secretKeyRef:
            name: db-secret
            key: DB_PASSWORD
{{- end -}}
{{- end -}}