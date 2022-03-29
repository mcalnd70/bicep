targetScope = 'subscription'

param p_azresouregroup01 string
param p_azlocation string
param p_azenvresourcegroup string
param p_azenvkeyvault string
param p_azsarandomprefix string

resource azresourcegroup01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: p_azresouregroup01
  location: p_azlocation
  tags: {
    owner: 'mcalnd70'
  }
}

resource azenvresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: p_azenvresourcegroup
}

module storageaccount1 './modules/storageaccount-random.bicep' = {
  name: 'storageaccount1'
  scope: azresourcegroup01
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: azresourcegroup01.location
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

module envkeyvault1 './modules/keyvaultexisting-secret.bicep' = {
  name: 'envkeyvault1'
  scope: azenvresourcegroup
  params: {
    azkvname: p_azenvkeyvault
    azkvsecretname: 'Secret-for-Storage-Account1-PrimaryAccessKey'
    azkvsecretvalue: '${storageaccount1.outputs.primarykey}'
  }
}

module storageaccount2 './modules/storageaccount-random.bicep' = {
  name: 'storageaccount2'
  scope: azresourcegroup01
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: azresourcegroup01.location
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

module envkeyvault2 './modules/keyvaultexisting-secret.bicep' = {
  name: 'envkeyvault2'
  scope: azenvresourcegroup
  params: {
    azkvname: p_azenvkeyvault
    azkvsecretname: 'Secret-for-Storage-Account2-PrimaryAccessKey'
    azkvsecretvalue: '${storageaccount2.outputs.primarykey}'
  }
}
