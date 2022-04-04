extends AudioStreamPlayer

func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//mainmusica.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)
	if Global.musica:
		self.play()
