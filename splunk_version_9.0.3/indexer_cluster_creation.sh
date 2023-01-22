### Execute below commands as a Splunk User

########## In Cluster Manager

/opt/splunk/bin/splunk edit cluster-config -mode manager -replication_factor 2 -search_factor 2 -secret INDEXER_CLUSTER_SECRET_KEY -cluster_label INDEXER_CLUSTER_LABEL -auth admin:PASSWORD

/opt/splunk/bin/splunk set servername SPLK-ClusterMaster -auth admin:PASSWORD
/opt/splunk/bin/splunk set default-hostname SPLK-ClusterMaster -auth admin:PASSWORD

/opt/splunk/bin/splunk restart

/opt/splunk/bin/splunk enable maintenance-mode -auth admin:PASSWORD


########## In Indexers 

# In Indexer 1
/opt/splunk/bin/splunk edit cluster-config -mode peer -manager_uri https://CLUSTER_MASTER_NODE_FQDN:8089 -replication_port 9000 -secret INDEXER_CLUSTER_SECRET_KEY -auth admin:PASSWORD

/opt/splunk/bin/splunk set servername SPLK-Indexer-1 -auth admin:PASSWORD
/opt/splunk/bin/splunk set default-hostname SPLK-Indexer-1 -auth admin:PASSWORD

/opt/splunk/bin/splunk restart


# In Indexer 2
/opt/splunk/bin/splunk edit cluster-config -mode peer -manager_uri https://CLUSTER_MASTER_NODE_FQDN:8089 -replication_port 9000 -secret INDEXER_CLUSTER_SECRET_KEY -auth admin:PASSWORD

/opt/splunk/bin/splunk set servername SPLK-Indexer-2 -auth admin:PASSWORD
/opt/splunk/bin/splunk set default-hostname SPLK-Indexer-2 -auth admin:PASSWORD

/opt/splunk/bin/splunk restart


# In Indexer 3
/opt/splunk/bin/splunk edit cluster-config -mode peer -manager_uri https://CLUSTER_MASTER_NODE_FQDN:8089 -replication_port 9000 -secret INDEXER_CLUSTER_SECRET_KEY -auth admin:PASSWORD

/opt/splunk/bin/splunk set servername SPLK-Indexer-3 -auth admin:PASSWORD
/opt/splunk/bin/splunk set default-hostname SPLK-Indexer-3 -auth admin:PASSWORD

/opt/splunk/bin/splunk restart



########## In Cluster Manager

/opt/splunk/bin/splunk disable maintenance-mode -auth admin:PASSWORD