extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var aceleretion = 0
var prevAnim = "1"
var atacking = false
var running = false
var jumping = false
var playing = false
var current_animation = ""
@onready var Arrow = $Arrow

func constrols(delta):
	var a = 1
	var current_animation = "IdlAnimatio"
	var input_dir = Input.get_vector("left", "right", "up", "down")
	running = false
	atacking = false
	
	if input_dir.length() != 0 and !atacking:
		a = input_dir.angle() / (PI/4)
		a = wrapi(int(a), 0, 8)
		prevAnim = a
		#Arrow.set_rotation(a)#rotaciona a hitbox
		aceleretion = 10
		current_animation = "WalkDir"


	elif input_dir.length() ==0:
		current_animation = "IdlAnimatio"	

		
		
	if Input.is_action_pressed("Run") and input_dir.length() != 0 and !atacking:
		current_animation = "Run" 
		aceleretion = 50
		running = true



	velocity = input_dir  * speed * delta * aceleretion	
	if !playing:
		$AnimationPlayer.play(current_animation + str(prevAnim))
	

	
func _physics_process(delta):
	constrols(delta)	
	move_and_slide()



func _input(event):

	atacking = false
	jumping = false
	
	#print(event.as_text())
	
	if Input.is_action_pressed("Jump"):
		jumping = true;
		playing = true
		current_animation = "Jump"


		
	if Input.is_action_pressed("attack"):
		current_animation = "AtackDir" 
		atacking = true
		playing = true
		aceleretion = 0

		
	if playing:
		$AnimationPlayer.play(current_animation + str(prevAnim))

func play():
	playing = false


