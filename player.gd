extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var prevAnim = "1"

func movePlayer(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	var rDirecrion = round(direction)
	var numAnim = "0"
	velocity = direction  * speed
	
	
	
	if(direction == Vector2(0,0)):
		if(prevAnim == "1"):
			$AnimationPlayer.play("IdlAnimatio1")
		if(prevAnim == "2"):
			$AnimationPlayer.play("IdlAnimatio2")
		if(prevAnim == "3"):
			$AnimationPlayer.play("IdlAnimatio3")
		if(prevAnim == "4"):
			$AnimationPlayer.play("IdlAnimatio4")
		if(prevAnim == "5"):
			$AnimationPlayer.play("IdlAnimatio5")
		if(prevAnim == "6"):
			$AnimationPlayer.play("IdlAnimatio6")
		if(prevAnim == "7"):
			$AnimationPlayer.play("IdlAnimatio7")
		if(prevAnim == "8"):
			$AnimationPlayer.play("IdlAnimatio8")
	else:
		if(direction == Vector2(0,-1)):#print("cima")
			numAnim  ="4"
			prevAnim = numAnim
		if(direction == Vector2(0,1)):#print("baixo")
			numAnim = "8"
			prevAnim = numAnim
		if(direction == Vector2(1,0)):#print("direita")
			numAnim = "6"
			prevAnim = numAnim
		if(direction == Vector2(-1,0)):#print("esquerda")
			numAnim = "2"
			prevAnim = numAnim
		if(rDirecrion == Vector2(-1, 1)):#print("S A")
			numAnim = "1"
			prevAnim = numAnim
		if(rDirecrion == Vector2(1, 1)):#print("sd")
			numAnim = "7"
			prevAnim = numAnim
		if(rDirecrion == Vector2(1, -1) ):#print("WD")
			numAnim = "5"
			prevAnim = numAnim
		if(rDirecrion == Vector2(-1, -1)):#print("w a")
			numAnim = "3"
			prevAnim = numAnim
		
		
		$AnimationPlayer.play("WalkDir"+numAnim)
		


func constrols(delta):
	var a = 1
	var current_animation = "IdlAnimatio"
	#var input_dir = Vector2.ZERO
	var input_dir = Input.get_vector("left", "right", "up", "down")
	#direction = input_dir.normalized()
	

	if input_dir.length() != 0:
		a = input_dir.angle() / (PI/4)
		a = wrapi(int(a), 0, 8)
		prevAnim = a
		print(a)
		current_animation = "WalkDir"
	if input_dir.length() ==0:
		current_animation = "IdlAnimatio"
		
	velocity = input_dir  * speed
	move_and_slide()
	$AnimationPlayer.play(current_animation + str(prevAnim))
	
func _physics_process(delta):
	constrols(delta)
	move_and_slide()
