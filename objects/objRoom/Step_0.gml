if !(audio_is_playing(transitionSnd)){
    audio_sound_gain(lvlBGM1, 1)
    if !audio_is_playing(lvlBGM1){
        audio_play_sound(lvlBGM1,2,1,0.8)
    }
}

if alarm[0] == -1 and timeOut{
    alarm[0] = 150
}

///Particle Test
//
/// 
/// 
/*
system=part_system_create();
part_system_depth(system,-100);

part=part_type_create();
part_type_shape(part,pt_shape_disk);
part_type_speed(part,5,10,.1,0);
part_type_colour1(part,c_red);
part_type_life(part,10,10);
part_type_size(part,.1,.3,-.02,0);

if(mouse_check_button(mb_left))
{
    var _dir=random(360);
    var _dist=100;
    var _x=x+lengthdir_x(_dist,_dir);
    var _y=y+lengthdir_y(_dist,_dir);
    var _part_dir=point_direction(_x,_y,x,y);
    part_type_direction(part,_part_dir,_part_dir,0,0);
    part_particles_create(system,_x,_y,part,1);
}