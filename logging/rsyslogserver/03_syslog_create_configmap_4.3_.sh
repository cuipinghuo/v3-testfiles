echo '<store>
     @type syslog
     remote_syslog rsyslogserver.openshift-logging.svc.cluster.local
     port 514
     hostname $hostname
     remove_tag_prefix tag
     tag_key ident,systemd.u.SYSLOG_IDENTIFIER
     facility local0
     severity info
     use_record true
     payload_key message
</store>' >syslog.conf
oc create configmap syslog --from-file=syslog.conf -n openshift-logging
oc delete pod --selector logging-infra=fluentd
