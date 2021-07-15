Logical:        BeModelMedicationRecordDispense
Title:          "Medication Record Dispense logical model"

* identifier 0..1 Identifier "The business identifier(s) for the medication dispense session" ""
* patient 1..1	Reference(Patient) "The person for which the medication is dispensed." ""
* dispenser	0..1 BackboneElement "The dispenser, if known and relevant" ""
  * actor	1..1 Reference(Practitioner) "Reference to person that performed the recording or reporting" ""
  * organization 1..1	Reference(Organization) "Reference to person that performed the recording or reporting" ""
* date 1..1 dateTime "The date when the dispense ocurred (or not)" ""
* prescription	0..1 BackboneElement "The information about a prescription related to the dispense" ""
  * isprescribed 0..1	boolean	"Whether this dispense was performed against a prescription" ""
  * prescription 0..1 Reference(MedicationRequest)	"The prescription identification" ""
* status 1..1 code "preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown  MedicationDispense Status Codes (Required)" ""
* statusReason 0..1	Reference(DetectedIssue) "Why a dispense was not performed MedicationDispense Status Reason Codes (Example)" ""
* product 1..1 Reference(Medication) "The product that was dispensed - coded or not (e.g. for magistral preparations)" ""
* dispenseDetail 0..* BackboneElement	"Each product that was dispensed" ""
  * quantitydispensed	0..1 Quantity "The amound of product that was dispensed"
  * dosageInstructions 0..1 Dosage	"The instructions for use" ""
  * note	0..* Annotation "Additional information about the dispensed item" ""
* SubstitutionReason 0..1 CodeableConcept "Why was substitution made" ""
* type 0..1 CodeableConcept	"Trial fill, partial fill, emergency fill, etc." ""
* location 0..1 string "" ""
* treatment 0..1 Reference "" ""

Logical:        BeModelMedicationRecordPrescription
Title:          "Medication Record Prescription logical model"
* identifier 0..1 Identifier "The business identifier(s) for the medication dispense session" ""
* patient 1..1	Reference(Patient) "The person for which the medication is dispensed." ""
* status	1..1	code	"active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown medicationrequest Status (Required)" ""
* statusReason	0..1	CodeableConcept	"Reason for current status medicationRequest Status Reason Codes (Example)" ""
* intent	1..1	code	"proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option  medicationRequest Intent (Required)" ""
* medication	1..1 Reference(Medication)	"Medication to be taken SNOMED CT Medication Codes (Example)" ""
* encounter	0..1	Reference(Encounter)	"Encounter created as part of encounter/admission/stay" ""
* requester	0..1	Reference(Practitioner)	"Who/What requested the Request" ""
* reason	0..*	Reference(Condition or Observation)	"Reason or indication for ordering or not ordering the medication Condition/Problem/Diagnosis Codes (Example)" ""
* groupIdentifier	0..1	Identifier	"Composite request this is part of" ""
* dosageInstruction	0..*	Dosage	"How the medication should be taken" ""
* note	0..*	Annotation	"Additional Information about the prescription" ""
* date	0..1	dateTime	"When request was initially made" ""
* location 0..1 string "" ""
* treatment 0..1 Reference "" ""

