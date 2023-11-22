extends CharacterBody2D

var speed = 400  # speed in pixels/sec


func movePlayer():
	var direction = Input.get_vector("left", "right", "up", "down")
	var rDirecrion = round(direction)
	var numAnim = "0"
	velocity = direction * speed
	
	if(direction == Vector2(0,0)):
		#print("idel")
		$AnimationPlayer.pause()
		
	if(direction == Vector2(0,-1)):
		#$AnimationPlayer.play("attackdir4")
		#$AnimationPlayer.play("WalkDir4")
		#print("cima")
		
		numAnim = "4"
	if(direction == Vector2(0,1)):
		#$AnimationPlayer.play("attackdir8")
		#$AnimationPlayer.play("WalkDir8")
		#print("baixo")
		
		numAnim = "8"
	if(direction == Vector2(1,0)):
		#$AnimationPlayer.play("attackdir6")
		#$AnimationPlayer.play("WalkDir6")
		#print("direita")
		numAnim = "6"
	if(direction == Vector2(-1,0)):
		#$AnimationPlayer.play("attackdir2")
		#$AnimationPlayer.play("WalkDir2")
		#print("esquerda")
		numAnim = "2"
		
	

	if(rDirecrion == Vector2(-1, 1)):
		#print("S A")
		#$AnimationPlayer.play("WalkDir1")
		numAnim = "1"
	if(rDirecrion == Vector2(1, 1)):
		#print("sd")
		#$AnimationPlayer.play("WalkDir7")
		numAnim = "7"
	if(rDirecrion == Vector2(1, -1) ):
		#print("WD")
		#$AnimationPlayer.play("WalkDir5")
		numAnim = "5"
	if(rDirecrion == Vector2(-1, -1)):
		#print("w a")
		#$AnimationPlayer.play("WalkDir3")
		numAnim = "3"
	

	$AnimationPlayer.play("WalkDir"+numAnim)
	

func _physics_process(delta):
	movePlayer()
	move_and_slide()
