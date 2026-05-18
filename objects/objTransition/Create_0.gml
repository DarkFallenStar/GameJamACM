spr = sTrans
sprW = sprite_get_width(spr)
sprH = sprite_get_height(spr)

xMax = room_width div sprW +1
yMax = room_height div sprH +1
iMax = sprite_get_number(spr)

col = c_black
subImgIndex = 0
subImgIndexInc = sprite_get_speed(spr)/game_get_speed(gamespeed_fps)

enum states {
    IN,
    OUT	
}
setTimer = false
state = states.OUT