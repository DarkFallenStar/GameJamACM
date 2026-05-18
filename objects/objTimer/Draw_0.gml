draw_set_font(Font1)

t = ""
t += string(tMin)+":"
if tSec>9{ t += string(tSec) } 
else{ t += "0"+string(tSec) }
t += "."
t += string(tMil)

if (tSec <= 30 and tMin <=0){
    if (tSec%2 == 0){
        draw_set_colour(c_red)
    } 
    else{
        draw_set_colour(c_white)
    }
}
draw_text(room_width/2,room_height/10,t)
