Instance: be-ns-cnk-codes
InstanceOf: NamingSystem
Usage: #definition
Description: "Naming System - CNK Product Codes"
* status = #active
* name = "BeNSCNK"
* date = "2020-07-24"
* kind = #codesystem
// * title = "NamingSystem for CNK Product Codes"
* description = "Naming System - CNK Product Codes"
* uniqueId[0].type = #uri
* uniqueId[0].value = "https://www.ehealth.fgov.be/standards/fhir/NamingSystem/cnk-codes"
* uniqueId[0].preferred = true
* jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#056


Instance: be-ns-prescription-ids
InstanceOf: NamingSystem
Usage: #definition
Description: "Naming System - Prescription IDs"
* status = #active
// * title = "NamingSystem for unique Prescription IDs in the medication record"
* name = "BeNSPrescriptions"
* date = "2020-07-24"
* kind = #identifier
* description = "Naming System - Prescription IDs"
* uniqueId[0].type = #uri
* uniqueId[0].value = "https://www.ehealth.fgov.be/standards/fhir/NamingSystem/prescription-id"
* uniqueId[0].preferred = true
* jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#056



Instance: be-ns-product-package-type
InstanceOf: NamingSystem
Usage: #definition
Description: "Naming System - Prescription IDs"
* status = #active
// * title = "NamingSystem for product package types"
* name = "BeNSProductPackage"
* date = "2020-07-24"
* kind = #codesystem
* description = "Naming System - Product Package Types"
* uniqueId[0].type = #uri
* uniqueId[0].value = "https://www.ehealth.fgov.be/standards/fhir/NamingSystem/product-package-type"
* uniqueId[0].preferred = true
* jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#056


