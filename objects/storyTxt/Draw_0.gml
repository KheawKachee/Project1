accept_key = keyboard_check_pressed(vk_space);

//setup
if setup == false
{
	//setup
	setup = true
	draw_set_font(fntDefaultSmall);
	draw_set_halign(fa_top);
	draw_set_valign(fa_left);
	
	pagenumber = array_length(text);
	
	for(var p = 0; p< pagenumber; p++)
	{
		text_length[p] = string_length(text[p]);
	}
	
}

//type
if draw_char < text_length[page]
{
	draw_char += textspeed;
	draw_char = clamp(draw_char,0,text_length[page]);
}
	
//flip through pages
if accept_key
{
	//if typing is done
	if draw_char == text_length[page]
	{
		//next page
		if page < pagenumber-1
		{
			page++;
			draw_char = 0;
		}
		//destroy textbox
		else
		{
			//instance_destroy();
		}
	}
	else
	{
		draw_char = text_length[page]; //instant fill the textbox
	}
}
	
//create textbox
draw_sprite_ext(Spr_textbox, 0, x, y, textbox_width/64, textbox_length/64, 0, c_white, 1);


//draw the text
var _drawtext =string_copy(text[page], 1, draw_char);

draw_text_ext(xBorder+x, yBorder+y, _drawtext, line_gap, textbox_width);









