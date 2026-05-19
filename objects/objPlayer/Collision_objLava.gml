if (!audio_is_playing(deathSnd) and !death){
    audio_play_sound(deathSnd,2,0,1,0.2, random_range(0.8,1.2))
    ySpeed = 0
    ySpeed -= 5
    alarm[0] = 50
}
death = true