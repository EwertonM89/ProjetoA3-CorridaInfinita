extends Control

func _ready():
	# Conectar o sinal de pressionar do botão à função _on_BackButton_pressed
	self.pressed.connect(_on_Button_pressed)

func _on_Button_pressed():
	# Trocar para a cena do menu principal (ajuste o caminho conforme necessário)
	get_tree().change_scene_to_file("res://menu.tscn")
