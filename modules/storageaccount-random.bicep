param azsaprefix string
param azsalocation string
param azsasku string
param azsakind string

var storageaccount_randomname = '${toLower(azsaprefix)}${uniqueString(resourceGroup().id, deployment().name)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageaccount_randomname
  location: azsalocation
  sku: {
    name: azsasku
  }
  kind: azsakind
}

var storageaccount_primarykey = '${listKeys(storageaccount.id, storageaccount.apiVersion).keys[0].value}'

output primarykey string = storageaccount_primarykey
