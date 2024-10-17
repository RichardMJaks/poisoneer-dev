extends CharacterBody2D
class_name Player

# Get required components
@onready var sprite: Sprite2D = %Sprite

# Configurable vars
@export var speed: float
@export var jump_height: float

@export var potion: PackedScene

# Internal vars
var facing_left: float = 1

func _process(delta: float) -> void:
	sprite.flip_h = facing_left
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("a_attack"):
		throw()
	move_and_slide()

func throw() -> void:
	var dir = (get_global_mouse_position() - global_position).normalized()
	var throwable = potion.instantiate()
	throwable.global_position = global_position
	throwable.linear_velocity = dir * 500
	get_tree().current_scene.add_child(throwable)

func get_jump_force() -> float:
	return sqrt(2 * get_gravity().y * jump_height)
