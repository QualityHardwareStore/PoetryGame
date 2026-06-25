extends Node3D

@onready var bg_image = $BG_Image/SubViewport/Sprite2D
@onready var bg_geo = $BG_Geo/SubViewport2/background

# preload background assets here?

# array of camera positions here for respective backgrounds
# dictionary? camera position + background image + background geometry

var scene:int = 0

func _process(delta: float) -> void:
	pass
	#epic script here that checks the scene number, and changes the camera position, background image and geometry based on that. kid shit
