extends Area2D

var rng = RandomNumberGenerator.new()
var posicaoObstaculo = 0
var timer = 0

func _ready():
	if(Global.skinsGames == "floresta"):
		$Roadblock.texture = load("res://Minigame2/Imagens2/arvore.png")
	else:
		$Roadblock.texture = load("res://Minigame2/Imagens2/roadBlock.png")
		
	rng.randomize()
	posicaoObstaculo = rng.randi_range(0, 3) # gera um número aleatório (0, 1 ou 2)
	if posicaoObstaculo == 0:
		$".".position.x = 246 # caso a posicaoColetavel for 0, a posição x do coletável será 307
	elif posicaoObstaculo == 1:
		$".".position.x = 512 # caso a posicaoColetavel for 1, a posição x do coletável será 512
	else:
		$".".position.x = 780 # caso a posicaoColetavel for 2, a posição x do coletável será 716

func _process(delta):
	timer += delta
	$".".position.y += Global.velocidade
	if $".".position.y > 600:
		queue_free()
	if(Global.gX == 6 and Global.fase == "03"):
		queue_free()

func _on_obstaculo_body_entered(body):
	if body.name == "player" and timer > 0:
		Global.gameover = true

