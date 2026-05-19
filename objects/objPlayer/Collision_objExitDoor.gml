if other.canPass{
    if !instance_exists(objTransition){
        audio_sound_gain(lvlBGM1, 0.2)
        audio_play_sound(transitionSnd,2,0,1,0,1)
        trans = instance_create_layer(x,y,"Instances",objTransition)
        trans.nextRoom = noone
    }
}