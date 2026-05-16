ySpeed += 0.1
clamp(xSpeed, 0, 5)


if (keyboard_check(ord("D"))) 
{
    xSpeed += 0.2
    
}
else if (keyboard_check(ord("A"))) 
{
    xSpeed = -2
}

if (place_meeting(x, y + 1, tilemap)){
    
    ySpeed = 0
    
   
}
 if (keyboard_check_pressed(vk_space)){
        ySpeed -= 5
    }

move_and_collide(xSpeed, ySpeed, tilemap)