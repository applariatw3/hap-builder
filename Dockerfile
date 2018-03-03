FROM haproxy:latest

ARG artifact_root="."

COPY $artifact_root/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh  
COPY $artifact_root/code/ /conf/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
