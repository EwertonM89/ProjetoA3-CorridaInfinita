extends Node3D
class_name ControleTerrenos

## Isso constrói e opera a "esteira transportadora" de terrenos
##
## Um conjunto de blocos de terreno escolhidos aleatoriamente é renderizado no visor.
## À medida que o jogo é jogado, o terreno é movido na direção positiva do eixo Z.
## Quando um determinado bloco passa por trás deste nó, ele é removido e um novo bloco
## é adicionado ao final da esteira.

## Mantém o catálogo das cenas de blocos de terreno carregadas
var controleTerrenos: Array = []
## O conjunto de blocos de terreno que estão atualmente renderizados no visor
var terrain_belt: Array[MeshInstance3D] = []
@export var terrain_velocity: float = 10.0
## O número de blocos a serem mantidos renderizados no visor
@export var num_terrain_blocks = 10
## Caminho para o diretório que contém as cenas dos blocos de terreno
@export_dir var terrian_blocks_path = "res://scenes/controleTerrenos/"

func _ready() -> void:
	_load_terrain_scenes(terrian_blocks_path)
	_init_blocks(num_terrain_blocks)

func _physics_process(delta: float) -> void:
	_progress_terrain(delta)

func _init_blocks(number_of_blocks: int) -> void:
	for block_index in range(number_of_blocks):
		var block = controleTerrenos.pick_random().instantiate()
		if block_index == 0:
			block.position.z = block.mesh.size.y / 2
		else:
			_append_to_far_edge(terrain_belt[block_index - 1], block)
		add_child(block)
		terrain_belt.append(block)

func _progress_terrain(delta: float) -> void:
	for block in terrain_belt:
		block.position.z += terrain_velocity * delta

	if terrain_belt[0].position.z >= terrain_belt[0].mesh.size.y / 2:
		var last_terrain = terrain_belt[-1]
		var first_terrain = terrain_belt.pop_front()
		first_terrain.queue_free()

		var block = controleTerrenos.pick_random().instantiate()
		_append_to_far_edge(last_terrain, block)
		add_child(block)
		terrain_belt.append(block)

func _append_to_far_edge(target_block: MeshInstance3D, appending_block: MeshInstance3D) -> void:
	appending_block.position.z = target_block.position.z - target_block.mesh.size.y / 2 - appending_block.mesh.size.y / 2

func _load_terrain_scenes(target_path: String) -> void:
	var dir = DirAccess.open(target_path)
	for scene_path in dir.get_files():
		print("Carregando cena de bloco de terreno: " + target_path + "/" + scene_path)
		controleTerrenos.append(load(target_path + "/" + scene_path))
