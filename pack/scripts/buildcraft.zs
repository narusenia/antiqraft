// BuildCraft: metal gears, machines and item pipes from GT plates. Wood and stone gears stay.
// The quarry already takes GT gears and a circuit through GT4's own recipe.
val wrench = <ore:craftingToolWrench>;
val circuit = <ore:circuitBasic>;
val iron = <ore:plateIron>;
val gold = <ore:plateGold>;
val redstone = <ore:dustRedstone>;
val tank = <BuildCraft|Factory:tankBlock>;

recipes.remove(<BuildCraft|Core:ironGearItem>);
recipes.addShaped(<BuildCraft|Core:ironGearItem>, [[null, iron, null], [iron, <ore:ringIron>, iron], [null, iron, wrench]]);

recipes.remove(<BuildCraft|Core:goldGearItem>);
recipes.addShaped(<BuildCraft|Core:goldGearItem>, [[null, gold, null], [gold, <ore:gearIron>, gold], [null, gold, wrench]]);

recipes.remove(<BuildCraft|Core:diamondGearItem>);
recipes.addShaped(<BuildCraft|Core:diamondGearItem>, [[null, <ore:gemDiamond>, null], [<ore:gemDiamond>, <ore:gearGold>, <ore:gemDiamond>], [null, <ore:gemDiamond>, wrench]]);

val ironEngine = <BuildCraft|Core:engineBlock:2>;
recipes.remove(ironEngine);
recipes.addShaped(ironEngine, [[iron, iron, iron], [wrench, <ore:blockGlass>, null], [<ore:gearIron>, <minecraft:piston>, <ore:gearIron>]]);

val pump = <BuildCraft|Factory:pumpBlock>;
recipes.remove(pump);
recipes.addShaped(pump, [[iron, circuit, iron], [iron, <ore:gearIron>, iron], [tank, <minecraft:bucket>, tank]]);

val miningWell = <BuildCraft|Factory:miningWellBlock>;
recipes.remove(miningWell);
recipes.addShaped(miningWell, [[iron, circuit, iron], [iron, <ore:gearIron>, iron], [iron, <minecraft:iron_pickaxe>, iron]]);

val floodGate = <BuildCraft|Factory:floodGateBlock>;
recipes.remove(floodGate);
recipes.addShaped(floodGate, [[iron, <ore:gearIron>, iron], [<minecraft:iron_bars>, tank, <minecraft:iron_bars>], [iron, <minecraft:iron_bars>, iron]]);

// Iron and gold item pipes: one recipe per glass colour (metadata 0 = colourless, 1-16 = dyes)
val glasses = [
    <ore:blockGlassColorless>, <ore:blockGlassWhite>, <ore:blockGlassOrange>, <ore:blockGlassMagenta>,
    <ore:blockGlassLightBlue>, <ore:blockGlassYellow>, <ore:blockGlassLime>, <ore:blockGlassPink>,
    <ore:blockGlassGray>, <ore:blockGlassLightGray>, <ore:blockGlassCyan>, <ore:blockGlassPurple>,
    <ore:blockGlassBlue>, <ore:blockGlassBrown>, <ore:blockGlassGreen>, <ore:blockGlassRed>, <ore:blockGlassBlack>
] as minetweaker.item.IIngredient[];
val pipes = [<BuildCraft|Transport:item.buildcraftPipe.pipeitemsiron:*>, <BuildCraft|Transport:item.buildcraftPipe.pipeitemsgold:*>] as minetweaker.item.IItemStack[];
val pipePlates = [iron, gold] as minetweaker.item.IIngredient[];
for i, pipe in pipes {
    recipes.remove(pipe);
    for colour, glass in glasses {
        recipes.addShaped(pipe.definition.makeStack(colour) * 8, [[pipePlates[i], glass, pipePlates[i]]]);
    }
}
