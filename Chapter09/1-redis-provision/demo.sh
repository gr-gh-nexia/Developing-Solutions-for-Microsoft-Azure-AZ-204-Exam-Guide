################################################################
# These commands should be executed from Azure Cloud Shell bash 
################################################################
#create the resource group
rgname=rg-az204-ch09-AzureCache
myloc=southafricanorth
az group create --location $myloc --name $rgname
# to avoid name collisions generate a unique name for your account
account=azurecache$RANDOM
#create Basic SKU instance
az redis create --location $myloc --name $account --resource-group $rgname --sku Basic --vm-size C0
#retrieve key and address 
$key=$(az redis list-keys --name $account --resource-group $rgname --query primaryKey -o tsv)
echo $key
echo $account.redis.cache.windows.net
