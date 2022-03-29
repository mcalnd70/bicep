targetScope = 'resourceGroup'

param p_azsarandomprefix string
param p_azlocation string


module storageaccount1 './modules/mssa-random.bicep' = {
  name: 'storageaccount1'
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: p_azlocation
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}

module storageaccount2 './modules/mssa-random.bicep' = {
  name: 'storageaccount2'
  params: {
    azsaprefix: p_azsarandomprefix
    azsalocation: p_azlocation
    azsasku: 'Standard_LRS'
    azsakind: 'StorageV2'
  }
}
