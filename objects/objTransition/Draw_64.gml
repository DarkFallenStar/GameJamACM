for (var yy = 0; yy < yMax; ++yy) {
	for (var xx = 0; xx < xMax; xx++) {
    	draw_sprite_ext(spr, min(max(0, subImgIndex -xx ), iMax-1), xx * sprW, yy*sprH, 1,1,0,col,1)
    }
}