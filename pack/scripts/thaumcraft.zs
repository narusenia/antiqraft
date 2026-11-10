import mods.thaumcraft.Arcane;

// Wand caps: nuggets -> GT rings, same shapes and vis cost as Thaumcraft. Void caps have no GT ring and stay.
// Only the iron cap is a workbench recipe, so only it takes a hammer (arcane recipes keep no tools).
recipes.remove(<Thaumcraft:WandCap:0>);
recipes.addShaped(<Thaumcraft:WandCap:0>, [[<ore:ringIron>, <ore:ringIron>, <ore:ringIron>], [<ore:ringIron>, <ore:craftingToolHardHammer>, <ore:ringIron>]]);

Arcane.removeRecipe(<Thaumcraft:WandCap:1>);
Arcane.addShaped("CAP_gold", <Thaumcraft:WandCap:1>, "ordo 3, ignis 3, aer 3",
    [[<ore:ringGold>, <ore:ringGold>, <ore:ringGold>], [<ore:ringGold>, null, <ore:ringGold>]]);

Arcane.removeRecipe(<Thaumcraft:WandCap:3>);
Arcane.addShaped("CAP_copper", <Thaumcraft:WandCap:3>, "ordo 2, ignis 2, aer 2",
    [[<ore:ringCopper>, <ore:ringCopper>, <ore:ringCopper>], [<ore:ringCopper>, null, <ore:ringCopper>]]);

// Silver and thaumium are the inert caps; infusing them into charged caps is unchanged
Arcane.removeRecipe(<Thaumcraft:WandCap:5>);
Arcane.addShaped("CAP_silver", <Thaumcraft:WandCap:5>, "ordo 4, ignis 4, aer 4",
    [[<ore:ringSilver>, <ore:ringSilver>, <ore:ringSilver>], [<ore:ringSilver>, null, <ore:ringSilver>]]);

Arcane.removeRecipe(<Thaumcraft:WandCap:6>);
Arcane.addShaped("CAP_thaumium", <Thaumcraft:WandCap:6>, "ordo 6, ignis 6, aer 6",
    [[<ore:ringThaumium>, <ore:ringThaumium>, <ore:ringThaumium>], [<ore:ringThaumium>, null, <ore:ringThaumium>]]);
