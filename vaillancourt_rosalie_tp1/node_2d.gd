extends Node2D

#Connection des variables au node
@onready var background: ColorRect = $ColorRect
@onready var button1: Button = $Button1
@onready var button2: Button = $Button2

#Son boutton 1
func _on_button_1_pressed() -> void:
	$Button1/sound1.play()
	

#Son boutton 2
func _on_button_2_pressed() -> void:
	$Button2/sound2.play()

var brightness := 1.0

func _ready():
	button1.pressed.connect(_make_lighter)
	button2.pressed.connect(_make_darker)

func _make_lighter():
	brightness += 0.1
	_update_background()

func _make_darker():
	brightness -= 0.1
	_update_background()

func _update_background():
	
	brightness = clamp(brightness, 0.2, 2.0)

	background.modulate = Color(brightness, brightness, brightness, 1.0)
	
func _input(event):
	if event.is_pressed():
		if event.is_action_pressed("bouton1"):
			print("test")
			_on_button_1_pressed()
			_make_lighter()
		elif event.is_action_pressed("bouton2"):
			_on_button_2_pressed()
			_make_darker()
