extends VehicleBody3D

# Defina a velocidade constante para frente
const FORWARD_SPEED = 30.0
# Defina a força para virar o veículo
const STEERING_FORCE = 0.5

# Referências para as rodas
var steering_wheels = [$FrenteDireita, $FrenteEsquerda]
var traction_wheels = [$AtrasDireita, $AtrasEsquerda]

func _ready():
	# Encontre as rodas e armazene referências
	for child in get_children():
		if child is VehicleWheel3D:
			if child.use_as_steering:
				steering_wheels.append(child)
			if child.use_as_traction:
				traction_wheels.append(child)
	
	# Definir propriedades das rodas
	for wheel in steering_wheels:
		wheel.use_as_steering = true
	for wheel in traction_wheels:
		wheel.use_as_traction = true

func _process(delta):
	# Capturar a entrada do teclado
	var steering_input = 0.0
	if Input.is_action_pressed("ui_left"):
		steering_input = -1.0
	elif Input.is_action_pressed("ui_right"):
		steering_input = 1.0

	# Ajustar a direção do veículo
	for wheel in steering_wheels:
		wheel.steering = steering_input * STEERING_FORCE

	# Aplicar a velocidade constante para frente
	apply_engine_force(FORWARD_SPEED)

func apply_engine_force(force):
	for wheel in traction_wheels:
		wheel.engine_force = force
