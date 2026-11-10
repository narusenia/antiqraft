// Pam's HarvestCraft: metal cooking tools and kitchen blocks from GT plates (any of the metals the mod accepts)
val metal = <ore:plateIron> | <ore:plateCopper> | <ore:plateSteel> | <ore:plateBronze>;
val stick = <ore:stickWood>;

recipes.remove(<harvestcraft:potItem>);
recipes.addShaped(<harvestcraft:potItem>, [[stick, metal, metal], [null, metal, metal]]);

recipes.remove(<harvestcraft:skilletItem>);
recipes.addShaped(<harvestcraft:skilletItem>, [[metal, null, null], [null, metal, null], [null, null, stick]]);

recipes.remove(<harvestcraft:saucepanItem>);
recipes.addShaped(<harvestcraft:saucepanItem>, [[metal], [stick]]);

recipes.remove(<harvestcraft:cuttingboardItem>);
recipes.addShaped(<harvestcraft:cuttingboardItem>, [[metal, null, null], [null, stick, null], [null, null, <ore:plankWood>]]);

val presser = <harvestcraft:presser>;
recipes.remove(presser);
recipes.addShaped(presser, [[metal, <minecraft:piston>, metal], [metal, <ore:craftingToolHardHammer>, metal], [metal, <minecraft:piston>, metal]]);

val iron = <ore:plateIron>;
recipes.remove(<harvestcraft:oven>);
recipes.addShaped(<harvestcraft:oven>, [[iron, <minecraft:iron_bars>, iron], [iron, <minecraft:furnace>, iron], [iron, iron, iron]]);
