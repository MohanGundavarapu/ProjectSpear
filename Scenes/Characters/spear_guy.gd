extends CharacterBody2D


const ACCELERATION = 600.0
const MAX_SPEED = 150.0
const FRICTION = 400.0
const DASH = 1200.0
var dashing: bool = false

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState: AnimationNodeStateMachinePlayback = animationTree.get("parameters/playback")


func _physics_process(delta):

	# Get Input
	var direction = Input.get_vector("Left", "Right","Up", "Down")
	
	# Move Player
	if not dashing:
		if direction != Vector2.ZERO:
			animationTree.set("parameters/Idle/blend_position",direction)
			animationTree.set("parameters/Run/blend_position",direction)
			animationState.travel("Run")
			velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		else:
			animationState.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	# Dash Player
	if Input.is_action_just_pressed("Dash") and not dashing:
		$Dash.start()
		dashing = true
		velocity = (direction * 10).normalized() * DASH
#		position = position + ((direction * 10).normalized() * DASH)
#		Input.start_joy_vibration(0,0.5,0.5,10)
	
	# Move
	move_and_slide()


func _on_dash_timeout():
	dashing = false 
	velocity = velocity.normalized() * MAX_SPEED
