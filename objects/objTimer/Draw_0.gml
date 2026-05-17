draw_set_font(Font1)

t = ""
t += string(tMin)+":"
if tSec>9{ t += string(tSec) } 
else{ t += "0"+string(tSec) }
t += "."
t += string(tMil)

draw_text(x,y,t)
