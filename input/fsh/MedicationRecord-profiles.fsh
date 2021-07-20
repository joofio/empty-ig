//based on R4
Profile: MedRecordDispense
Parent: MedicationDispense
* identifier MS
* subject MS // dispense.patient
* performer MS
//* performer.actor only Reference($be-organization or $be-practitioner)
* whenHandedOver MS
* authorizingPrescription MS
* status MS
* statusReasonCodeableConcept MS
* medicationCodeableConcept MS
* medicationReference MS
* quantity MS
* dosageInstruction MS
* substitution.reason MS
* type MS
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan)


Profile: MedRecordPrescription
Parent: MedicationRequest
* identifier MS
* subject MS 
* status MS
* statusReason MS
* intent MS
* medicationCodeableConcept MS
* medicationReference MS
* encounter MS
* requester MS
* reasonCode MS
* groupIdentifier MS
* dosageInstruction MS
* note MS
* authoredOn MS
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan) 


Profile: MedRecordUsage
Parent: MedicationStatement
* identifier MS
* status MS
* category MS
* medicationCodeableConcept MS
* medicationReference MS
* subject MS 
* effectiveDateTime MS	
* effectivePeriod MS
* dateAsserted MS
* informationSource MS
* reasonCode MS
* reasonReference MS
* dosage MS
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan) 

Profile: MedRecordAdministration
Parent: MedicationAdministration
* identifier MS
* status MS
* statusReason MS
* category MS
* medicationCodeableConcept MS
* medicationReference MS
* subject MS 
* context MS
* effectiveDateTime MS	
* effectivePeriod MS
* performer MS
* reasonCode MS
* reasonReference MS
* request MS
* device MS
* note MS 
* dosage MS
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan) 

/* 
Alias: $be-patient = https://www.ehealth.fgov.be/standards/fhir/StructureDefinition/be-patient
Alias: $be-organization = https://www.ehealth.fgov.be/standards/fhir/StructureDefinition/be-organization
Alias: $be-practitioner = https://www.ehealth.fgov.be/standards/fhir/StructureDefinition/be-practitioner
Profile:        BeMedicationDispense
Parent:         MedicationDispense
Id:             be-medicationdispense
Title:          "BeMedicationDispense"
Description: "Defines constraints and extensions on the Medication Dispense resource for a record of a dispensation in Belgium."
* ^version = "0.2.0"
* ^status = #active
* . ^short = "The medication dispense entry"
* . ^definition = "A register of a medication dispense, describing the medication that has been dispensed by a professional or by an organization, including the medication, the patient, some prescription and treatment information."
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains DGUID 0..1 MS
* identifier[DGUID].type.coding.code = #dguid
* identifier[DGUID].system 1..
* identifier[DGUID].system = "https://www.gfd-dpp.be/fhir/reference/dguid" (exactly)
* medicationCodeableConcept 0..1 MS
* medicationCodeableConcept only CodeableConcept
* medicationCodeableConcept from SNOMEDCTMedicationCodes (example)
* medicationCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* medicationCodeableConcept ^binding.extension.valueString = "MedicationCode"
* medicationCodeableConcept ^binding.description = "The drug code. For example CNK code for the medication"
* medicationReference 0..1 MS
* medicationReference only Reference(Medication)
* subject only Reference($be-patient)
* context MS
* context ^short = "The dispense session identifier, for example an identifier of a visit to a pharmacy"
* context.identifier MS
* context.identifier.system = "https://www.gfd-dpp.be/fhir/reference/sguid"
* context.identifier.type.coding.code = #sguid
* context.identifier.type.coding.system = "https://www.gfd-dpp.be/fhir/reference/identifier_types"
* authorizingPrescription MS
* authorizingPrescription.identifier MS
* authorizingPrescription.display MS
* quantity MS
* note MS
* dosageInstruction MS
* dosageInstruction.text MS
* dosageInstruction.patientInstruction MS
Invariant:  performer-nidhi
Description: "When an organization is referred to by use of an identifier, the naming system SHOULD be NIHDI number"
Expression: "actor.identifier.exists() implies (actor.identifier.system='https://www.ehealth.fgov.be/standards/fhir/NamingSystem/nihdi-organization' or  actor.identifier.system='https://www.ehealth.fgov.be/standards/fhir/NamingSystem/nihdi-practitioner'"
Severity:   #warning
*/