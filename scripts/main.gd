extends Node3D

@onready var bg_image = %background_sprite
@onready var bg_geo = $BG_Geo/SubViewport2/background
@onready var maincam = %maincam
@onready var player = %player

@onready var doorcol = $"BG_Geo/SubViewport2/background colliders/Walls/doorcol"

# preload background assets here?
#I also might not even have to do this, because the animated sprite 2d can store many background images!

@onready var bg2geo = $"BG_Geo/SubViewport2/3d filter/SubViewport/3d_objects/bg2"


# array of camera positions here for respective backgrounds
# dictionary? camera position + background image + background geometry
# dictionaries are key-value pairs : the value can be ANYTHING even another dictionary
# so how do I want to sort this data?

# iterate through it cleanly = array ? And then each entry in the array is a dictionary

@onready var geo_array: Array[Node3D] = [
	null,
	$"BG_Geo/SubViewport2/3d filter/SubViewport/3d_objects/bg2",
]

# consider making this dict V @onready and then just adding the geo nodes to it instead maybe. I think it wasnt working earlier simply because it wasnt @onready lol

var bgarray = [
	{"campos" : Vector3(8.236,0.688,3.781), "camrot" : Vector3(12.0, 62.7, 0.0), "bgimage" : "bg1"},
	{"campos" : Vector3(-8.907,4.349,-4.713), "camrot" : Vector3((79.6 - 90), -105.5, 0.0), "bgimage" : "bg2doorclose"},
	{"campos" : Vector3(-8.907,4.349,-4.713), "camrot" : Vector3((79.6 - 90), -105.5, 0.0), "bgimage" : "bg2doorclose"},
]


var scene:int = 0

func _ready() -> void:
	
	print(bgarray[scene])
	var n:int = 0
	for i in bgarray:
		if n == scene:
			changescene(n)
			break
		n += 1


func _process(delta: float) -> void:
	pass
	#epic script here that checks the scene number, and changes the camera position, background image and geometry based on that. kid shit
	if Input.is_action_just_pressed("interact"):
		bg_image.play("bg1dooropen")
		doorcol.disabled = true


func changescene(i:int):
	maincam.position = bgarray[i]["campos"]
	maincam.rotation_degrees = bgarray[i]["camrot"]
	bg_image.play(bgarray[i]["bgimage"])
	if geo_array[i] != null:
		if geo_array[i-1] != null:
			geo_array[i-1].visible = false
		geo_array[i].visible = true
	Global.scenechange.emit()


func scenetransition(body: CharacterBody3D, scene:int) -> void:
	print("this has worked")
	changescene(scene)
