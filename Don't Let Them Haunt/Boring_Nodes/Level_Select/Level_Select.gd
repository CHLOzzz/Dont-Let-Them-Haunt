extends Node2D


var pageNum = 0;


# Prepare all variables and resources for occupying preview page
onready var testMap = load("res://Boring_Nodes/Level_Select/Previews/Test_Map/Test_Map_Preview.tscn").instance();
onready var pagesData = [testMap            , null , null , null]; # Must be in multiples of 4; uses mod 4 arithmetic
var previewNames =      ["Test_Map_Preview" , null , null , null]; # Parallel with var pagesData
var prevX = [-491.5 , null , null , null] # Preview position.x
var prevY = [-179.5 , null , null , null] # Preview position.y


func _ready():
	addPreview(pageNum) # Add page 1 immediately


func addPreview(currPage): # Given a page number, occupy the preview page
	for i in 3:
		if pagesData[currPage*4 + i] != null:
			$Background.add_child(pagesData[currPage*4 + i])
			pagesData[currPage*4 + i].position.x = prevX[currPage*4 + i]
			pagesData[currPage*4 + i].position.y = prevY[currPage*4 + i]
		else:
			break
