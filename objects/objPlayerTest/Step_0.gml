//Inputs
keyLeft = keyboard_check(ord("A"))
KeyRight = keyboard_check(ord("D"))
keyJumpPress = keyboard_check_pressed(vk_space)
keyJumpHold = keyboard_check(vk_space)
keyJumpLet = keyboard_check_released(vk_space)

//Movement calc
moveDir = KeyRight-keyLeft
if death{
    moveDir = 0
    xSpeed *= accel
    keyJumpLet = false
    if image_blend = c_gray{
        exit
    }
}

xSpeed += moveDir * accel

lockedMvt = max(lockedMvt-1,0)

//Wall jump
var onWall = place_meeting(x-1, y, wallTiles) - place_meeting(x+1, y, wallTiles);

if (lockedMvt <= 0){
    if onWall != 0 and keyJumpPress{
        ySpeed -= jumpStr/1.5
        lockedMvt = 15
        audio_play_sound(jumpSnd,2,0,1.3,0.35, random_range(0.8,1.2 ))
    }
}

xSpeed = clamp(xSpeed, -xSpeedLimit, xSpeedLimit)

if ySpeed > 0 {
    grav = 0.5
}
else{
    grav = 0.3
}

ySpeed += grav

//Jump
if (place_meeting(x, y+1, allTiles)) and (keyJumpHold) and !death{
    ySpeed -= jumpStr
    audio_play_sound(jumpSnd,2,0,1.3,0.35, random_range(0.8,1.2 ))
    onGround = false
}
if keyJumpLet and ySpeed<0{
    ySpeed = 0
}

//Horizontal Collisions
if (place_meeting(x+xSpeed, y, allTiles))
{
    while(!place_meeting(x+sign(xSpeed), y, allTiles)) {
        x += sign(xSpeed);
    }
    if (moveDir != 0)and ySpeed > 0{
        if onWall{
            ySpeed /= 4
        }
    }
        xSpeed = 0
}

//Vertical Collisions

if (place_meeting(x, y+ySpeed, allTiles))
{
    onGround = true
    while(!place_meeting(x, y+sign(ySpeed), allTiles)) {
        y += sign(ySpeed);
    }
    ySpeed = 0 
    
    if death{
        xSpeed = 0
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


x += xSpeed
y += ySpeed




