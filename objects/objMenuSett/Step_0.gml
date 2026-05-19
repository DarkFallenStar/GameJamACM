if open{

timer++
//Inputs
keyUp = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)
    
keyLeft = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left)
    
keyRight = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right)

KeyDown = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)

KeySelectPres = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)
KeySelectRel = keyboard_check_released(vk_space) or keyboard_check_released(vk_enter)

move = KeyDown - keyUp
}
else{
    keyUp=0
    keyLeft=0
    keyRight=0
    KeyDown=0
    KeySelectPres=0
    KeySelectRel=0
    move=0
}


if move != 0 and !select{
    index += move
    
    var size = array_length(menuBtn)
    
    if index < 0 { index = size - 1}
    else if index >= size {index = 0}
}

for (var i = 0; i < array_length(menuBtn); i++) {
    
    btnSel = menuBtn[i]
    
	if i == index{
        x = btnSel.x - (btnSel.sprite_width/2) + sin(timer*0.1)
        y = btnSel.y
        menuBtn[index].image_blend = c_gray
        if KeySelectRel{
            switch (index) {   
                case 2:
                    //Exit
                    
                    objMenu.visible = true
                    index = 0
                    open = false
                    break 
            }
        }
        if keyLeft{
            switch (index) {   
                case 0:
                    //Exit
                    menuBtn[index].volume -= 0.1
                    break 
                
                case 1:
                    //Exit
                    menuBtn[index].volume -= 0.1
                    break
            }
        }
        if keyRight{
            switch (index) {   
                case 0:
                    //Exit
                    menuBtn[index].volume += 0.1
                    break 
                
                case 1:
                    //Exit
                    menuBtn[index].volume += 0.1
                    break
            }
        }
        
    }
    else{
        btnSel.image_blend = c_white
    }
}