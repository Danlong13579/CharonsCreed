class_name Dialog extends Resource
 
@export_category("Main Dialog")
#@export_group("Main Dialog")
@export var title: String
@export_multiline var main_text: Array[String]

#@export var has_seen: bool

#@export_category("Dialog Choices")
#@export_group("Dialog Choices")
#@export var choice_title: Array[String]
#@export var choices: Array[Dialog]

