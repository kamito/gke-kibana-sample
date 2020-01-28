# CaaS kibana demonstration

[kompose](https://github.com/kubernetes/kompose) を利用して k8s のクラスタを起動します。

## Prepare

- 対象プロジェクトの Kubernetes API を有効にする。
  - 過程で課金設定も有効にする必要あり。

## Instration kompose to local machine

with Linux
```
$ curl -L https://github.com/kubernetes/kompose/releases/download/v1.20.0/kompose-linux-amd64 -o kompose
$ chmod +x kompose
```

## Convert

```
$ kompose convert -f docker-compose.yml
$ ls -la
合計 51948
drwxr-xr-x  3 kamito kamito     4096  1月 27 18:39 .
drwxr-xr-x 30 kamito kamito     4096  1月 27 18:01 ..
drwxr-xr-x  7 kamito kamito     4096  1月 27 18:02 .git
-rw-r--r--  1 kamito kamito      622  1月 27 18:39 README.md
-rw-r--r--  1 kamito kamito      539  1月 27 18:15 docker-compose.yml
-rw-r--r--  1 kamito kamito     1204  1月 27 18:15 elasticsearch-deployment.yaml
-rw-r--r--  1 kamito kamito      392  1月 27 18:15 elasticsearch-service.yaml
-rw-r--r--  1 kamito kamito      235  1月 27 18:15 es-data-persistentvolumeclaim.yaml
-rw-r--r--  1 kamito kamito      781  1月 27 18:15 kibana-deployment.yaml
-rw-r--r--  1 kamito kamito      427  1月 27 18:15 kibana-service.yaml
-rwxr-xr-x  1 kamito kamito 53152678  1月 27 18:06 kompose
```

## Setup

```
$ gcloud components update
$ gcloud config set project blocks-gn-kibana
$ gcloud container clusters create caas-kibana-demo --num-nodes=1 --zone=us-central1-a
WARNING: Currently VPC-native is not the default mode during cluster creation. In the future, this will become the default mode and can be disabled using `--no-enable-ip-alias` flag. Use `--[no-]enable-ip-alias` flag to suppress this warning.
WARNING: Newly created clusters and node-pools will have node auto-upgrade enabled by default. Thiscan be disabled using the `--no-enable-autoupgrade` flag.
WARNING: Starting in 1.12, default node pools in new clusters will have their legacy Compute Engineinstance metadata endpoints disabled by default. To create a cluster with legacy instance metadata endpoints disabled in the default node pool, run `clusters create` with the flag `--metadata disable-legacy-endpoints=true`.
WARNING: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).
This will enable the autorepair feature for nodes. Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair for more information on node autorepairs.
Creating cluster caas-kibana-demo in us-central1-a... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1/projects/blocks-gn-kibana/zones/us-central1-a/clusters/caas-kibana-demo].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1-a/caas-kibana-demo?project=blocks-gn-kibana
kubeconfig entry generated for caas-kibana-demo.
NAME              LOCATION       MASTER_VERSION  MASTER_IP      MACHINE_TYPE   NODE_VERSION    NUM_NODES  STATUS
caas-kibana-demo  us-central1-a  1.13.11-gke.23  35.238.15.125  n1-standard-1  1.13.11-gke.23  1          RUNNING
```

## Control

### deploy

```
$ make deploy
```

### get pods

```
$ make get-pods
```

### stop kibana and elasticsearch

```
$ make stop
```

### start kibana and elasticsearch

```
$ make start
```
