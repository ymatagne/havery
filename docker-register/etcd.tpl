#!/bin/bash
# Genenerated by {{ .Env.USER }}
{{$hostip := .Env.COREOS_HOST }}
{{$etcdHost := .Env.ETCD_HOST }}
{{$ttl := .Env.TTL }}
{{$hostHttpPort := 0 }}

{{range $key, $value := .}}
{{ if and ($value.Env.HAVERY_HTTP_PORT) ($value.Env.HAVERY_HOSTNAME) }}
# {{ $value.Name }}
curl -XPUT -q -d value="{{$hostip}}" -d ttl={{$ttl}} http://{{$etcdHost}}:4001/v2/keys/havery/{{$value.ID}}/HostIp
{{ $addrLen := len $value.Addresses }}
{{ if gt $addrLen 0 }}
{{ with $address := index $value.Addresses 0 }}
 {{range $index,$addr := $value.Addresses}}
     {{with eq $addr.Port $value.Env.HAVERY_HTTP_PORT }}
curl -XPUT -q -d value="{{$addr.HostPort}}" -d ttl={{$ttl}} http://{{$etcdHost}}:4001/v2/keys/havery/{{$value.ID}}/HostHttpPort
     {{end}}
     {{ if $value.Env.HAVERY_SSH_PORT }}
     {{with eq $addr.Port $value.Env.HAVERY_SSH_PORT }}
curl -XPUT -q -d value="{{$addr.HostPort}}" -d ttl={{$ttl}} http://{{$etcdHost}}:4001/v2/keys/havery/{{$value.ID}}/HostSshPort
     {{end}}
     {{end}}
 {{end}}
curl -XPUT -q -d value="{{$value.Env.HAVERY_HOSTNAME}}" -d ttl={{$ttl}} http://{{$etcdHost}}:4001/v2/keys/havery/{{$value.ID}}/HostName
curl -XPUT -q -d value="{{ $value.Image.Repository}}" -d ttl={{$ttl}} http://{{$etcdHost}}:4001/v2/keys/havery/{{$value.ID}}/Image
{{ end }}
{{end}}
{{end}}
{{end}}
