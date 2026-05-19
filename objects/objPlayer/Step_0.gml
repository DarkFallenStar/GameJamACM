//Inputs
keyLeft = keyboard_check(ord("A")) or keyboard_check(vk_left)
KeyRight = keyboard_check(ord("D")) or keyboard_check(vk_right)
keyJumpPress = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up)
keyJumpHold = keyboard_check(vk_space) or keyboard_check(vk_up)
keyJumpLet = keyboard_check_released(vk_space) or keyboard_check_released(vk_up)
keySprint = keyboard_check(vk_shift)

//Movement calc

if keySprint{
    xSpeedLimit = 6
}
else{
    xSpeedLimit = 4
}
moveDir = KeyRight-keyLeft
if death{
    moveDir = 0
    xSpeed *= accel
    keyJumpPress=false
    keyJumpLet = false
}
//Wall jump
onWall = place_meeting(x-1, y, wallTiles) - place_meeting(x+1, y, wallTiles);

xSpeed += moveDir * accel

lockedMvt = max(lockedMvt-1,0)



xSpeed = clamp(xSpeed, -xSpeedLimit, xSpeedLimit)

if ySpeed > 0 {
    grav = gravDown
}
else{
    grav = gravUp
}

ySpeed += grav

//Jump
if (place_meeting(x, y+1, allTiles)) and (keyJumpHold) and !death{
    ySpeed -= jumpStr
    audio_play_sound(jumpSnd,2,0,1.3,0.35, random_range(0.8,1.2 ))
}
if keyJumpLet and ySpeed<0{
    ySpeed = 0
}

//Horizontal Collisions
if (place_meeting(x+xSpeed, y, allTiles)){
{
    while(!place_meeting(x+sign(xSpeed), y, allTiles)) {
        x += sign(xSpeed);
    }
    if onWall !=0 and ySpeed>0{
            ySpeed /= 2
        }
    }
        xSpeed = 0
}
x += xSpeed

//Vertical Collisions

if (place_meeting(x, y+ySpeed, allTiles))
{
    while(!place_meeting(x, y+sign(ySpeed), allTiles)) {
        y += sign(ySpeed);
    }
    ySpeed = 0 
    if death{
        xSpeed = 0
    }
}



if (lockedMvt <= 0){
    image_index = 1
    if onWall != 0 and keyJumpPress and (keyLeft or KeyRight){
        ySpeed -= jumpStr/1.5
        lockedMvt = 15
        image_index = 2
        audio_play_sound(jumpSnd,2,0,1.3,0.35, random_range(0.8,1.2 ))
    }
}

//Slowing
if !death{

if (!keyLeft and !KeyRight) {
    xSpeed += -xSpeed * accel
}
if keyLeft and (xSpeed>0) {
    xSpeed += -xSpeed * accel
}
if KeyRight and xSpeed<0 {
    xSpeed += -xSpeed * accel
}    
}

//Movement update
y += ySpeed



if y>window_get_height(){
    death = true
    alarm[0] = 50
}

//Sprite
if(xSpeed != 0){
    sprite_index = sPlayerRun  
    image_xscale = -sign(xSpeed)}
else{
    sprite_index = sPlayerIdle
}

if(ySpeed != 0){
    sprite_index = sPlayerAir
    
    if(ySpeed > 0)
        image_index = 2
    else{
        image_index = 1
    }
}

if onWall != 0 and (keyLeft or KeyRight){
    sprite_index = sPlayerWallHold
    image_xscale = -sign(onWall)
}

if death{
    sprite_index = sPlayerDeath
    
}