//Inputs
keyLeft = keyboard_check(ord("A"))
KeyRight = keyboard_check(ord("D"))
keyJumpPress = keyboard_check_pressed(vk_space)
keyJumpHold = keyboard_check(vk_space)
keyJumpLet = keyboard_check_released(vk_space)

//Movement calc
moveDir = KeyRight-keyLeft

xSpeed += moveDir * accel

lockedMvt = max(lockedMvt-1,0)

//Wall jump
var onWall = place_meeting(x-1, y, wallTiles) - place_meeting(x+1, y, wallTiles);

if (lockedMvt <= 0){
    if onWall != 0 and keyJumpPress{
        ySpeed -= jumpStr/1.5
        lockedMvt = 15
    }
}

xSpeed = clamp(xSpeed, -xSpeedLimit, xSpeedLimit)

if ySpeed > 0 {
    grav = 0.5
}
else{
    grav = 0.2
}

ySpeed += grav

//Jump
if (place_meeting(x, y+1, allTiles)) and (keyJumpHold){
    ySpeed -= jumpStr
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
            ySpeed /= 1.5
        }
    }
        xSpeed = 0
}

//Vertical Collisions

if (place_meeting(x, y+ySpeed, allTiles))
{
    while(!place_meeting(x, y+sign(ySpeed), allTiles)) {
        y += sign(ySpeed);
    }
    ySpeed = 0 
}

//Slowing
if (!keyLeft and !KeyRight) {
    xSpeed += -xSpeed * accel
}
if keyLeft and (xSpeed>0) {
    xSpeed += -xSpeed * accel
}
if KeyRight and xSpeed<0 {
    xSpeed += -xSpeed * accel
}

if (x > window_get_width()){
    x = 0
}

//Movement update
x += xSpeed
y += ySpeed

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

if onWall != 0{
    sprite_index = sPlayerWallHold
    image_xscale = -sign(onWall)
}

if !visible{
    moveDir = 0
}