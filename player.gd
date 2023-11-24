extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var aceleretion = 0
var prevAnim = "1"
var atacking = false

func constrols(delta):
	var a = 1
	var current_animation = "IdlAnimatio"
	var input_dir = Input.get_vector("left", "right", "up", "down")

	
	
	
	if input_dir.length() != 0:
		a = input_dir.angle() / (PI/4)
		a = wrapi(int(a), 0, 8)
		prevAnim = a
		current_animation = "WalkDir"
		aceleretion = 10
		
		
		
	elif input_dir.length() ==0:
		current_animation = "IdlAnimatio"	

		
	
	if Input.is_action_pressed("attack"):
		current_animation = "AtackDir" 
		atacking == true
		aceleretion = 0
	
	
	velocity = input_dir  * speed * delta * aceleretion
	
	move_and_slide()
	$AnimationPlayer.play(current_animation + str(prevAnim))
	

	
func _physics_process(delta):
	constrols(delta)
	
	move_and_slide()
