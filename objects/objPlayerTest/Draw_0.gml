//Sprite
if onGround{
    draw_sprite_ext(sPlayerIdle, -1, x,y,-sign(xSpeed),1,0,c_white,1)
    if(xSpeed != 0){
        
}
    else{
        draw_sprite_ext(sPlayerIdle, -1, x,y,-sign(xSpeed),1,0,c_white,1)
    }
}




if onWall != 0{
    sprite_index = sPlayerWallHold
    image_xscale = -sign(onWall)
}

if death{
    sprite_index = sPlayerDeath
}
if(ySpeed != 0){
    sNumber = 
    yStretch = ySpeed/ySpeedLimit
    
    if(ySpeed > 0)
        image_index = 2
    else{
        image_index = 1

    }
}


