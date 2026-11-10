// Small metal tools of decorative mods: ingots -> GT plates and rods
// (GT4 already rebuilt the Chisel iron chisel with a hammer and file.)
val plate = <ore:plateIron>;
val file = <ore:craftingToolFile>;

// ForgeMultipart iron saw: the blade is a plate, filed
recipes.remove(<ForgeMicroblock:sawIron>);
recipes.addShaped(<ForgeMicroblock:sawIron>, [[<ore:stickWood>, <ore:rodStone>, <ore:rodStone>], [<ore:stickWood>, plate, <ore:rodStone>], [null, file, null]]);

// Carpenter's Blocks hammer and chisel
val carpentersBlock = <CarpentersBlocks:blockCarpentersBlock>;
recipes.remove(<CarpentersBlocks:itemCarpentersHammer>);
recipes.addShaped(<CarpentersBlocks:itemCarpentersHammer>, [[plate, plate, null], [null, carpentersBlock, plate], [null, carpentersBlock, null]]);
recipes.remove(<CarpentersBlocks:itemCarpentersChisel>);
recipes.addShaped(<CarpentersBlocks:itemCarpentersChisel>, [[<ore:stickIron>, file], [carpentersBlock, null]]);
