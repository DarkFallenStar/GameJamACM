if (!audio_is_playing(deathSnd) and !death){
    audio_play_sound(deathSnd,2,0,1.3,0.2, random_range(0.8,1.2))
}



death = true

alarm[0]= 50


/*partSys = part_system_create(deathParticles)
part_system_position(partSys, x, y)*/

