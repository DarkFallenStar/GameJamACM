if !(objRoom.timeOut){
    instance_create_depth(x,y,10, objDead)
    instance_create_depth(objRoom.x,objRoom.y-sprite_height/2, -1, objPlayer)
    instance_destroy()
    instance_activate_object(objNews)
}else {
    if !instance_exists(objTransition){
        trans = instance_create_layer(x,y,"Instances",objTransition)
        trans.nextRoom = gameOver
    }
    audio_pause_all()
}