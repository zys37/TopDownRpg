extends Area2D

var music_player_scene : PackedScene = preload("res://muzalas.tscn")
var music_player_instance = null
func _on_MusicTriggerPoint_body_entered(body):
	if body.is_in_group("Player") and music_player_instance == null:
		var Player = body
		music_player_instance = music_player_scene.instantiate()  # Create an instance of muzalas.gd
		get_tree().root.add_child(music_player_instance)
		music_player_instance.start_music()

func _on_MusicTriggerPoint_body_exited(body):
	if body.is_in_group("Player") and music_player_instance != null:
		music_player_instance.stop()  # Assuming your music player scene has a method to stop playback
		music_player_instance.queue_free()
		music_player_instance = null
