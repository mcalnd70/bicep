// Create Azure Storage Account with explicit name
// Version 1.0.0
// Author: Neil McAlister

param azsaname string
param azsalocation string
param azsasku string
param azsakind string

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: azsaname
  location: azsalocation
  sku: {
    name: azsasku
  }
  kind: azsakind
}
