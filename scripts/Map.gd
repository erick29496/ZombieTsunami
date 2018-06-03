# TUX INVASION: a zombie mobile video game
# Copyright (C) 2018 Roger Oriol Pérez, Èric Rodríguez Balsells, Laura Figuerola Peña
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

extends Node2D

export(Array) var maps
var timer

func _ready():
	_spawn_first_map()
	
func _spawn_first_map():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	timer.set_wait_time(2.5)
	timer.start()
	
func _on_timer_timeout():
   _spawn_map()

func _spawn_map():
	var index
	var new_map
	index = randi()%maps.size()
	new_map = maps[index].instance()
	var pos = get_parent().get_node("Camera").get_camera_position() + Vector2(700, -360)
	new_map.set_position(pos)
	add_child(new_map)
	
