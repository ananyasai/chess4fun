var file_name = "position"+string(argument0)+".json";
//var file_name = 'position1.json';
var theJsonFile = file_text_open_read(file_name);
var theData = "";
while (!file_text_eof(theJsonFile))
{
    theData += file_text_read_string(theJsonFile);
    file_text_readln(theJsonFile);
}
file_text_close(theJsonFile);

var theJsonMap = json_decode(theData);
var theList = ds_map_find_value(theJsonMap, "default");
global.totalPieces = ds_list_size(theList);
global.pieces = ds_grid_create(global.totalPieces,5);
for (var i = 0; i < global.totalPieces; i++)
{
    var theEntry = ds_list_find_value(theList, i);
    PIECE = theEntry[? "PIECE"];
    X = theEntry[? "X"];
    Y = theEntry[? "Y"];
    sprite_index = asset_get_index(PIECE);
    draw_sprite(sprite_index, 0, X*60, Y*60);    
}


