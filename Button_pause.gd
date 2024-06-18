extends Button

var game_paused = false

func _ready():
	# Configurar o botão para processar entrada durante a pausa
	set_process_unhandled_input(true)
	# Conectar o sinal de pressionar o botão à função _on_PauseButton_pressed
	self.pressed.connect(_on_PauseButton_pressed)

func _on_PauseButton_pressed():
	if game_paused:
		# Retomar o jogo
		get_tree().paused = false
		self.text = "Pausar"
	else:
		# Pausar o jogo
		get_tree().paused = true
		self.text = "Retomar"
	game_paused = !game_paused  # Inverte o estado de pausa
