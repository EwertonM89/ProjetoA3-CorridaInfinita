extends Button

func _ready():
	# Conectar o sinal de pressionar o botão à função _on_Button_pressed
	self.pressed.connect(_on_Button_pressed)

func _on_Button_pressed():
	# Reinicia a cena atual
	get_tree().reload_current_scene()
