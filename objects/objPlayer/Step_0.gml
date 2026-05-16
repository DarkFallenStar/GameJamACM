//Inputs
keyLeft = keyboard_check(ord("A"))
KeyRight = keyboard_check(ord("D"))
keyJump = keyboard_check(vk_space)

//Movement calc
moveDir = KeyRight-keyLeft

xSpeed += moveDir * accel
xSpeed = clamp(xSpeed, -xSpeedLimit, xSpeedLimit)

ySpeed += grav


if (place_meeting(x, y+1, tilemap)) and (keyJump){
    ySpeed -= jumpStr
}

//Horizontal Collisions

if (place_meeting(x+xSpeed, y, tilemap))
{
    while(!place_meeting(x+sign(xSpeed), y, tilemap)) {
        x += sign(xSpeed);
    }
    xSpeed = 0  
}

//Vertical Collisions

if (place_meeting(x, y+ySpeed, tilemap))
{
    if (keyboard_check_pressed(vk_space)){
        ySpeed -= jumpStr
    }
    
    while(!place_meeting(x, y+sign(ySpeed), tilemap)) {
        y += sign(ySpeed);
    }
    ySpeed = 0  
}

//Slowing
if (moveDir == 0)
{
    xSpeed += -xSpeed * accel
}


if (x > window_get_width()){
    x = 0
}

//Movement update
x += xSpeed
y += ySpeed

//Sprite

if(xSpeed != 0){image_xscale = sign(xSpeed)}