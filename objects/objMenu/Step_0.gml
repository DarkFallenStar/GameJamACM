timer++
//Inputs
var keyUp = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("A")) 
            or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_left)

var KeyDown = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(ord("D")) 
            or keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_right)

var KeySelectPres = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)
var KeySelectRel = keyboard_check_released(vk_space) or keyboard_check_released(vk_enter)

var move = KeyDown - keyUp

if move != 0 and !select{
    index += move
    
    var size = array_length(menuBtn)
    
    if index < 0 { index = size - 1}
    else if index >= size {index = 0}
}

for (var i = 0; i < array_length(menuBtn); i++) {
    
    var btnSel = menuBtn[i]
    
	if i == index{
        x = btnSel.x - (btnSel.sprite_width/2) + sin(timer*0.1)
        y = btnSel.y
        btnSel.image_xscale = lerp(min(btnSel.image_xscale + 0.2, 5), 5, 0.2)
        btnSel.image_yscale = lerp(min(btnSel.image_yscale + 0.2, 5), 5, 0.2)
        btnSel.y += sin(timer*0.08)*0.2
    
        if KeySelectPres{
            menuBtn[index].image_blend = c_gray
            switch (index) {   
                case 0:
                    //Start
                    instance_create_layer(x,y,"Instances",objTransition)
                    break 
                
                case 1:
                    //Settings
                    break 
                case 2:
                    //Exit
                    game_end()
                    break 
            }
        }
        if KeySelectRel{
            menuBtn[index].image_blend = c_white
        }

        
    }
    else{
        btnSel.image_xscale = max(btnSel.image_xscale - 0.5, 3)
        btnSel.image_yscale = max(btnSel.image_yscale - 0.5, 3)
    }
        
}