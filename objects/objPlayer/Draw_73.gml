
if death and flash > 0{
    flash--
    shader_set(shHit)
    draw_self()
    shader_reset()
}
else{
    draw_self()
}
