extends Node2D

var _camera_limits := [
	Rect2(Vector2(-2000, -2000), Vector2(4000, 4000)),
	Rect2(Vector2(-2000, -2000), Vector2(2000, 2000)),
	Rect2(Vector2(0, -2000), Vector2(2000, 2000)),
	Rect2(Vector2(0, 0), Vector2(2000, 2000)),
	Rect2(Vector2(-2000, 0), Vector2(2000, 2000))
]
var _camera_limits_descrition := [
	"All regions",
	"Red region",
	"Green region",
	"Yellow region",
	"Blue region"
]
var _current_camera_limit := 0

onready var limit_region_desc_value := $CanvasLayer/MarginContainer/VBoxContainer/LimitRegionHBox/LimitRegionDescValue

func _ready():
	CameraShake.enable_camera_shake(self)
	CameraLimiter.enable_camera_limit(self)
	_update_limit_region_desc_lbl()

func _update_limit_region_desc_lbl():
	limit_region_desc_value.text = _camera_limits_descrition[_current_camera_limit]

func _on_ShakeCameraBtn_pressed():
	CameraShake.shake_camera(self, 1, 1.0, 15.0)


func _on_LimitCameraBtn_pressed():
	_current_camera_limit = (_current_camera_limit + 1) % _camera_limits.size()
	CameraLimiter.limit_camera(self, _camera_limits[_current_camera_limit])
	_update_limit_region_desc_lbl()
