if !(objRoom.timeOut){
    instance_create_depth(x,y,10, objDead)
    instance_create_depth(objRoom.x,objRoom.y, -1, objPlayer)
    instance_destroy()
}else {
    audio_stop_all()
	room_goto(gameOver)
}