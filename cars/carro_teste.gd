extends VehicleBody3D

const CONSTANT_VELOCI = 8000  

func _ready():
	Input.start_joy_vibration(0, 0.0, 0.0)

func _process(delta):
	
	# Controle de direção usando o acelerômetro
	var accel_vector = Input.get_accelerometer()
	var steering = accel_vector.x * 0.4
	#steering = Input.get_axis("ui_right", "ui_left") * 0.4
	engine_force = CONSTANT_VELOCI + Input.get_axis("ui_down", "ui_up") * 10000
	
	self.steering = steering
	self.engine_force = engine_force
