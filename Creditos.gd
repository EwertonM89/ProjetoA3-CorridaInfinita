extends Control

func _ready():
	# Encontrar o botão com o nome correto na árvore de cena
	var backButton = $BackButton

	# Conectar o sinal `pressed` do botão à função _on_BackButton_pressed
	backButton.connect("pressed", self, "_on_BackButton_pressed")

func _on_BackButton_pressed():
	# Trocar para a cena do menu principal (ajuste o caminho conforme necessário)
	get_tree().change_scene("res://menu.tscn")
