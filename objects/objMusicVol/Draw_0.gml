if visible{
    draw_self()
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text(x-sprite_width/3.4,y-sprite_height/8,"Music Volume")
    draw_text(x+sprite_width/4, y-sprite_height/8, volume*10)
}
