//Inputs
keyLeft = keyboard_check(ord("A"))
KeyRight = keyboard_check(ord("D"))
keyJump = keyboard_check(vk_space)

//Movement
moveDir = KeyRight-keyLeft
xSpeed += moveDir * accel
xSpeed = clamp(xSpeed, -xSpeedLimit, xSpeedLimit)
ySpeed += grav




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
    
    while(!place_meeting(x+sign(ySpeed), y, tilemap)) {
        y += sign(ySpeed);
    }
    ySpeed = 0  
}

if (x > window_get_width()){
    x = 0
}

x += xSpeed
y += ySpeed