open = objMenuSett.open
if open{
    layer_set_visible(SettingsId, true)
    layer_set_visible("Assets_1", true)
}
else{
    
    layer_set_visible(SettingsId, false)
    layer_set_visible("Assets_1", false)
}