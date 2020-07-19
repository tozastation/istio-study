#!/bin/bash -x
read -p "enter resource name : " n1
read -p "enter namespace : " n2

kubectl port-forward $n1 -n $n2 16686:16686

# 5775	UDP	agent	accept zipkin.thrift over compact thrift protocol (deprecated, used by legacy clients only)
# 6831	UDP	agent	accept jaeger.thrift over compact thrift protocol
# 6832	UDP	agent	accept jaeger.thrift over binary thrift protocol
# 5778	HTTP	agent	serve configs
# 16686	HTTP	query	serve frontend
# 14268	HTTP	collector	accept jaeger.thrift directly from clients
# 9411	HTTP	collector	Zipkin compatible endpoint (optional)