
if keyboard_check_pressed(vk_escape){
    if !pause{
        pause = true
        audio_pause_all()
        instance_deactivate_all(true)
    }
    else{
        pause = false
        audio_resume_all()
        instance_activate_all()
    }
}

