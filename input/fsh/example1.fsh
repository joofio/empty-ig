Instance: example-1-of-medication-dispense 
InstanceOf: BeModelMedicationRecordDispense
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title:    "Dispense Example - Prescribed branded medication is changed by another branded medication from the same VOS-cluster"

* meta.profile[0] = "https://www.hl7belgium.be/fhir/StructureDefinition/be-medicationdispense"
* subject.identifier.system = "https://www.ehealth.fgov.be/standards/fhir/NamingSystem/ssin"
* subject.identifier.value = "64110219106"
* status = #completed

* product.identifier.system = "https://cnk.apb.be/codings/cnk_product_codes"
* product.identifier.value = #2399640
* product.display = "Amlodipin Sandoz tabl. (deelb.) Besilaat 100x 5mg"

* date = "2021-07-19T13:00:00+02:00"

* dispenseDetail.quantitydispensed.value = 100
* dispenseDetail.quantitydispensed.unit = "TAB"
* dispenseDetail.quantitydispensed.system =  "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* dispenseDetail.quantitydispensed.code = "TAB"
//or 1 package?

* prescription.identifier.system = "http://prescription-identifiers.com"
* prescription.identifier.value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* SubstitutionReason.coding.display = "Out of Stock"
* SubstitutionReason.coding.code = "OS"
* SubstitutionReason.coding.system = "http://terminology.hl7.org/CodeSystem/v3-ActReason"
* dispenser.actor.identifier.value = "7c3aa173-3185-4001-a661-df36a7492798"
* dispenser.actor.identifier.system = "http://dispenser-identifiers.com"

* dispenser.actor.display = "Pharmacist"

* dispenser.organization.identifier.value = "5b2e9903-fba7-4ed3-aa76-52d386012ca0"
* dispenser.organization.identifier.system = "http://dispenser-identifiers.com"

* dispenser.organization.display = "Pharmacy X"

* treatment.identifier.value = "0d462dac-513a-4fb0-a2fe-fb7f53b27c5d"
* treatment.identifier.system = "http://treatment-identifiers.com"


Instance: example-1-of-medication-presc 
InstanceOf: BeModelMedicationRecordPrescription
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title:    "Dispense Example - Prescribed branded medication is changed by another branded medication from the same VOS-cluster"

* meta.profile[0] = "https://www.hl7belgium.be/fhir/StructureDefinition/be-medicationprescription"
* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* status = #active
* intent = #order

* subject.identifier.system = "https://www.ehealth.fgov.be/standards/fhir/NamingSystem/ssin"
* subject.identifier.value = "64110219106"

* product.identifier.system = "https://cnk.apb.be/codings/cnk_product_codes"
* product.identifier.value = #2837409
* product.display = "Amlor harde caps. 98x 5mg"

* date = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"

* treatment.identifier.value = "0d462dac-513a-4fb0-a2fe-fb7f53b27c5d"
* treatment.identifier.system = "http://treatment-identifiers.com"