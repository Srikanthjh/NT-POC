
#!/bin/bash

json_file="sample.json"

# Check if JSON file exists
if [ ! -f "$json_file" ]; then
    echo "JSON file '$json_file' not found."
    exit 1
fi

# Parse JSON and extract key-value pairs
blob=$(jq -r '.blob' "$json_file")
adls=$(jq -r '.adls' "$json_file")
azureml=$(jq -r '.azureml' "$json_file")
sql_server=$(jq -r '.sql_server' "$json_file")
snowflake=$(jq -r '.snowflake' "$json_file")
purview=$(jq -r '.purview' "$json_file")
synapse_spark=$(jq -r '.synapse_spark' "$json_file")
synapse_sql=$(jq -r '.synapse_sql' "$json_file")
databricks=$(jq -r '.databricks' "$json_file")
azure_vm=$(jq -r '.azure_vm' "$json_file")


node_size_family=$(jq -r '.synapse_spark_config.node_size_family' "$json_file")
node_size=$(jq -r '.synapse_spark_config.node_size' "$json_file")
spark_version=$(jq -r '.synapse_spark_config.spark_version' "$json_file")

node_type=$(jq -r '.databricks_config.node_type' "$json_file")
cluster_mode=$(jq -r '.databricks_config.cluster_mode' "$json_file")
spark_version=$(jq -r '.databricks_config.spark_version' "$json_file")
node_auto_termination=$(jq -r '.databricks_config.node_auto_termination' "$json_file")

resource_group_name=$(jq -r '.azure_vm_config.resource_group_name' "$json_file")
admin_password=$(jq -r '.azure_vm_config.admin_password' "$json_file")
admin_username=$(jq -r '.azure_vm_config.admin_username' "$json_file")
size=$(jq -r '.azure_vm_config.size' "$json_file")
sku=$(jq -r '.azure_vm_config.sku' "$json_file")
storage_account_type=$(jq -r '.azure_vm_config.storage_account_type' "$json_file")

# Echo the extracted key-value pairs
echo "Blob: $blob"
echo "ADLS: $adls"
echo "AzureML: $azureml"
echo "SQL Server: $sql_server"
echo "Snowflake: $snowflake"
echo "Purview: $purview"
echo "Synapse Spark: $synapse_spark"
echo "Synapse SQL: $synapse_sql"
echo "Databricks: $databricks"


# Echo the extracted sub-section key-value pairs individually
echo "node_size_family: $node_size_family"
echo "node_sizee: $node_size"
echo "spark_version: $spark_version"
echo "node_type: $node_type"
echo "cluster_mode: $cluster_mode"
echo "spark_version: $spark_version"
echo "node_auto_termination: $node_auto_termination"
echo "resource_group_name: $resource_group_name"
echo "admin_password: $admin_password"
echo "admin_username: $admin_username"
echo "size: $size"
echo "sku: $sku"
echo "storage_account_type: $storage_account_type"


# terraform -chdir=config plan -var="resource_group_name=$resource_group_name" -var="admin_password=$admin_password" -var="admin_username=$admin_username" -var="size=$size" -var="sku=$sku" -var="storage_account_type=$storage_account_type"

