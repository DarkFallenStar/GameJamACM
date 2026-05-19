state = states.IN 
audio_stop_sound(introBGM)
if nextRoom == noone{
    room_goto_next()
}else{
    room_goto(nextRoom)
}
