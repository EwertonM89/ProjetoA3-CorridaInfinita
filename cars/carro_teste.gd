extends VehicleBody3D

const CONSTANT_VELOCI = 8000  

func _ready():
	Input.start_joy_vibration(0, 0.0, 0.0)

func _process(delta):
	# Controle de direção usando o acelerômetro
	var accel_vector = Input.get_accelerometer()
	
	# Controle de direção usando as setas do teclado
	var keyboard_steering = Input.get_axis("ui_right", "ui_left") * 0.4
	var keyboard_engine_force = Input.get_axis("ui_down", "ui_up") * 10000

	# Se não há entrada do teclado, use o acelerômetro
	var steering = keyboard_steering
	if keyboard_steering == 0:
		steering = accel_vector.x * 0.4

	var engine_force = CONSTANT_VELOCI + keyboard_engine_force
	
	# Aplicar forças e direção
	self.steering = steering
	self.engine_force = engine_force
