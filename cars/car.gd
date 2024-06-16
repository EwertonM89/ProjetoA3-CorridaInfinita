extends VehicleBody3D

# Define a velocidade constante
const CONSTANT_SPEED = 500
var wheels = []

func _process(delta):
# Captura o valor de direção dos inputs do usuário
	steering = Input.get_axis("ui_right", "ui_left") * .2

# Define uma força constante para mover o veículo para frente
	engine_force = CONSTANT_SPEED

# Aplica a força do motor e a direção ao veículo
	apply_engine_force(engine_force)
	apply_steering(steering)

# Função para aplicar a força do motor ao veículo
func apply_engine_force(force):
	for wheel in wheels:
		wheel.engine_force = force

# Função para aplicar a direção ao veículo
func apply_steering(steer_value):
	for wheel in wheels:
		wheel.steering = steer_value
