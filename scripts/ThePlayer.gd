extends KinematicBody2D

var velocity = Vector2()
export var move_speed = 15 * 32
var UP = Vector2(0,-1)
export var GRAVITY = 1000
export var JUMP_VELOCITY = -800

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	
	#applying gravity
	velocity.y += GRAVITY * delta
	
	velocity = 	move_and_slide(velocity,UP)

func _input(event):
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

func get_input():
	var move_direction = -(int(Input.is_action_pressed("ui_left"))) + (int(Input.is_action_pressed("ui_right")))
	
	#This variable is used to limit the player's horizontal movement when in the air.
	var velocity_weight
	if is_on_floor():
		print("Is on floor")
		velocity_weight = 0.1
	else:
		print("Is not on floor")
		velocity_weight = 0.03
	
	velocity.x = lerp(velocity.x, move_speed * move_direction,velocity_weight)
	
	

	