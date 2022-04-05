extends Node2D

onready var pontos = 0
export var maxDinheiro = 10
export var tempo = 10 # Estado inicial do timer
var tempo_on = false # Caso esteje funcioanando o timer essa variavel e igual a true

func _ready():
	$Control/Titulo.visible = true
	$Control/Titulo.scale = Vector2(0.0,0.0)
	tempo_on = true
	print(Vector2(Global.gP,Global.gN))
	$Control/Timer.start()

func criar_dinheiro(): # Funcao, quando chama cria e instancia o obj Dinheiro apartir da cena Dinheiro.tscn
	var loadDinheiro = preload("res://Obj/Dinheiro.tscn")# Carrega a cena Dinheiro.tscn
	var dinheiro = loadDinheiro.instance() # Instancia o obj Dinheiro
	get_parent().add_child(dinheiro) # get_parent(), pega o no pai, nesse caso Node2D. add_child(), é uma funcao que adiciona um obj a cena


func _process(delta):
	print($Control/Titulo.scale)
	
	
	
	if (tempo <= 0):
		tempo_on = false
		$Control/Label.text = "00" + ":" + "00"
		Global.gN = 3
		Global.gP = 3
		yield(get_tree().create_timer(0.5),"timeout")
		get_tree().change_scene("res://Telas/main.tscn")
	else:
		if(tempo_on == true):
			tempo -= delta
		$Control/Label.text = "00" + ":" + str(int(tempo))
		$Control/ProgressBar.text = str(pontos)


func _on_Timer_timeout():
	if tempo >= 2.5:
		if(tempo_on == true):
			for i in range (0,2):
				criar_dinheiro()
				print("criou")
				i +=1

func chamarTitulo(a):
	yield(get_tree().create_timer(0,2),"timeout")
	a.scale += Vector2(0.2,0.2)

