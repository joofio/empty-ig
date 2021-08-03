//based on R4
Profile: MedRecordDispense
Title: "Medication Record - Dispense profile"
Description: "The profile for Medication Dispense in a Medication Record - a record of a single administration event"
Parent: MedicationDispense
* meta.profile 1..*
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


Profile: MedRecordOrder
Title: "Medication Record - Order profile"
Description: "The profile for Medication Order in a Medication Record - a record of a order or request for a medication or a change of medication, implicit or explicit"
Parent: MedicationRequest
* meta.profile 1..*
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
Title: "Medication Record - Usage profile"
Description: "The profile for Medication Usage in a Medication Record - a record of a single administration event"
Parent: MedicationStatement
* meta.profile 1..*
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
Title: "Medication Record - Administration profile"
Description: "The profile for Medication Administration in a Medication Record - a record of a single administration event"
Parent: MedicationAdministration
* meta.profile 1..*
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


//based on R4
Profile: MedRecordTreatmentLine
Title: "Medication Treatment Line profile"
Description: "The profile for Medication Treatment Line - a single recorded item/line of a medication treatment"
Parent: MedicationStatement
* meta.profile 1..*
* identifier MS
* basedOn MS
* subject MS 
* informationSource MS //recorder
* dateAsserted MS //recordDate
* effectiveDateTime MS //startMedicationDate + endMedicationDate
* effectivePeriod MS //startMedicationDate + endMedicationDate
* status MS //lifecycleStatus
* statusReason MS //statusReason
* medicationCodeableConcept MS
* medicationReference MS
* dosage MS //dosageAmmount + peridocity + dayperiod + route + instructionforUse
* category MS //medicationType
* note MS //everything else (origintype, lotnumber and reaction)
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan) 


//based on R4
Profile: MedRecordTreatment
Title: "Medication Treatment profile"
Description: "The profile for Medication Treatment in a Medication Record - a set of treatment lines/items"
Parent: CarePlan
* meta.profile 1..*
* identifier MS
* subject MS 
* author MS
* basedOn MS
* created MS 
* period MS 
* intent MS
* status MS
* note MS
* goal MS
* supportingInfo MS
* addresses MS
* contributor MS
* careTeam MS
* title MS
* category MS 
* partOf MS
* encounter MS
* description MS
* instantiatesUri MS
* replaces MS



//based on R4
Profile: MedRecordMedicationScheduledAdministration
Title: "Medication Scheduled Administration"
Description: "The profile for Medication Scheduled Administration in a Medication Record - a set of schedules takes for a certain drug, based on a previous prescription"
Parent: MedicationRequest
* identifier MS
* subject MS
* status MS 
* statusReason MS
* medicationCodeableConcept MS
* medicationReference MS
* encounter MS
* reasonCode MS
* groupIdentifier MS
* dosageInstruction MS
* note MS
* extension contains http://hl7.org/fhir/StructureDefinition/event-basedOn named treatmentPlan 0..1 MS
* extension[treatmentPlan].valueReference only Reference(CarePlan) 
* intent = #instance-order

//based on R4
Profile: MedRecordMedicationSummaryView
Title: "Medication Summary View profile"
Description: "The profile for Medication Summary view in a Medication Record"
Parent: CarePlan
* identifier MS
* subject MS
* status MS // =#completed?
* intent MS // =plan?
* category MS
* title MS
* description MS
* encounter MS
* period MS
* created MS
* author MS
* supportingInfo MS
* goal MS


Profile: MedRecord
Parent: Bundle
Id: MedRecord
Title: "Medication Record profile"
Description: "The profile for Medication Record"
* ^version = "1.0.0"
* identifier 0..1 MS
* type = #document (exactly)
* type ^short = "document"
* type ^definition = "Bundle is a document"
* total 0..0
* link 0..0 SU
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "Slicing based on the profile conformance of the sliced element"
* entry contains
    Composition 1..1 and
    Patient 1..1 and
    MedRecordTreatment 0..* and
    MedRecordTreatmentLine 0..* and 
    MedRecordMedicationSummaryView 0..* and
    MedRecordDispense 0..* and
    MedRecordAdministration 0..* and
    MedRecordMedicationScheduledAdministration 0..* and
    MedRecordOrder 0..* and
    MedRecordUsage 0..* 
* entry[Composition] ^short = "Composition"
* entry[Composition].resource 1.. MS
* entry[Composition].resource only Composition

* entry[Patient] ^short = "Patient for whom the record is concerned"
* entry[Patient].resource 1.. MS
* entry[Patient].resource only Patient

* entry[MedRecordTreatment] ^short = "Treatments associated with the patient"
* entry[MedRecordTreatment].resource 1.. MS
* entry[MedRecordTreatment].resource only MedRecordTreatment

* entry[MedRecordTreatmentLine] ^short = "Treatment lines associated with the patient"
* entry[MedRecordTreatmentLine].resource 1.. MS
* entry[MedRecordTreatmentLine].resource only MedRecordTreatmentLine

* entry[MedRecordMedicationSummaryView] ^short = "Medication summaries associated with the patient"
* entry[MedRecordMedicationSummaryView].resource 1.. MS
* entry[MedRecordMedicationSummaryView].resource only MedRecordTreatmentLine

* entry[MedRecordOrder] ^short = "Medication summaries associated with the patient"
* entry[MedRecordOrder].resource 1.. MS
* entry[MedRecordOrder].resource only MedRecordOrder

* entry[MedRecordDispense] ^short = "Medication summaries associated with the patient"
* entry[MedRecordDispense].resource 1.. MS
* entry[MedRecordDispense].resource only MedRecordDispense

* entry[MedRecordAdministration] ^short = "Medication summaries associated with the patient"
* entry[MedRecordAdministration].resource 1.. MS
* entry[MedRecordAdministration].resource only MedRecordAdministration

* entry[MedRecordMedicationScheduledAdministration] ^short = "Medication summaries associated with the patient"
* entry[MedRecordMedicationScheduledAdministration].resource 1.. MS
* entry[MedRecordMedicationScheduledAdministration].resource only MedRecordMedicationScheduledAdministration

* entry[MedRecordUsage] ^short = "Medication summaries associated with the patient"
* entry[MedRecordUsage].resource 1.. MS
* entry[MedRecordUsage].resource only MedRecordUsage