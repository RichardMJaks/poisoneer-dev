extends State
class_name PlayerState

var player: Player
var anim: AnimationPlayer
@export var animation_name: String
var movement_handler: PlayerMovementHandler

func enter() -> void:
	anim.play(animation_name)
	
func exit() -> void:
	super()
	
func update() -> void:
	pass
	
func physics_update() -> void:
	pass
