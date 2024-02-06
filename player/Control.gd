extends Control
var soundEnabled = true
var musicVolume = 0.5

func _on_ButtonPlay_pressed():
	get_tree().change_scene("res//World.tscn")
func _on_ButtonExit_pressed():
	finalizeGame()
func finalizeGame():
	#youcanaddsaving
	get_tree().quit()
func _on_ButtonSoundToggle_pressed():
	soundEnabled = !soundEnabled
	updateSoundButtonLabel()
func _on_SliderMusicVolume_value_changed(value):
	musicVolume = value
	updateMusicVolumeLabel()
func updateSoundButtonLabel():
	var button = $ButtonSoundToggle
	if soundEnabled:
		button.text = "Sound: On"
	else:
		button.text = "Sound: Off"
func updateMusicVolumeLabel():
	var label = $LabelMusicVolume
	label.text = "Music Volume: " + str(musicVolume)
func _on_ButtonApply_pressed():
	#apply game options here
	print("Sound Enabled:", soundEnabled)
	print("Music Volume:", musicVolume)
	#kod na wiecej settingow kiedys
func _on_ButtonCancel_pressed():
	print("Cancel Button Pressed")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
