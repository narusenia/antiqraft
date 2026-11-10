// Railcraft: same shapes as the mod, ingots -> GT plates (rods for shafts).
// Coke oven, blast furnace, rails and signal heads keep their recipes.
val iron = <ore:plateIron>;
val steel = <ore:plateSteel>;
val gold = <ore:plateGold>;
val redstone = <ore:dustRedstone>;
val piston = <minecraft:piston>;

val rollingMachine = <Railcraft:machine.alpha:8>;
recipes.remove(rollingMachine);
recipes.addShaped(rollingMachine, [[iron, piston, iron], [piston, <ore:craftingTableWood>, piston], [iron, piston, iron]]);

val waterTank = <Railcraft:machine.alpha:14>;
recipes.remove(waterTank);
recipes.addShaped(waterTank * 6, [
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
    [iron, <ore:slimeball>, iron],
    [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);

// Anchors: gold ingots -> plates around the anchor's gem
val pearl = <minecraft:ender_pearl>;
val obsidian = <minecraft:obsidian>;
val anchors = [<Railcraft:machine.alpha:0>, <Railcraft:machine.alpha:2>, <Railcraft:machine.alpha:13>] as minetweaker.item.IItemStack[];
val anchorCores = [<ore:gemDiamond>, <ore:gemEmerald>, <ore:dyeCyan>] as minetweaker.item.IIngredient[];
for i, anchor in anchors {
    recipes.remove(anchor);
    recipes.addShaped(anchor, [[gold, obsidian, gold], [anchorCores[i], pearl, anchorCores[i]], [gold, obsidian, gold]]);
}

val shovel = <Railcraft:tool.steel.shovel>;
for i in 2 .. 4 {
    // advanced item loader (2) and unloader (3) are upgraded from the basic ones (0, 1)
    val loader = <Railcraft:machine.gamma>.definition.makeStack(i);
    recipes.remove(loader);
    recipes.addShaped(loader, [
        [steel, redstone, steel],
        [redstone, <Railcraft:machine.gamma>.definition.makeStack(i - 2), redstone],
        [steel, shovel, steel]]);
}

val advancedDetector = <Railcraft:detector:9>;
recipes.remove(advancedDetector);
recipes.addShaped(advancedDetector, [[steel, steel, steel], [steel, <minecraft:stone_pressure_plate>, steel], [steel, steel, steel]]);

val boreHeads = [<Railcraft:borehead.iron>, <Railcraft:borehead.steel>, <Railcraft:borehead.diamond>] as minetweaker.item.IItemStack[];
val boreCores = [<ore:blockIron>, <ore:blockSteel>, <ore:blockDiamond>] as minetweaker.item.IIngredient[];
for i, head in boreHeads {
    recipes.remove(head);
    recipes.addShaped(head, [[steel, steel, steel], [steel, boreCores[i], steel], [steel, steel, steel]]);
}

recipes.remove(<Railcraft:anvil>);
recipes.addShaped(<Railcraft:anvil>, [
    [<ore:blockSteel>, <ore:blockSteel>, <ore:blockSteel>],
    [<ore:craftingToolHardHammer>, steel, null],
    [steel, steel, steel]]);

// Signal boxes: I C I / I x I with the iron as plates, screwed together
val screwdriver = <ore:craftingToolScrewdriver>;
val controllerCircuit = <Railcraft:part.circuit:0>;
val receiverCircuit = <Railcraft:part.circuit:1>;
val signalCircuit = <Railcraft:part.circuit:2>;
val boxes = [
    <Railcraft:signal:8>, <Railcraft:signal:9>, <Railcraft:signal:10>, <Railcraft:signal:7>, <Railcraft:signal:6>
] as minetweaker.item.IItemStack[];
val boxCircuits = [
    receiverCircuit, controllerCircuit, controllerCircuit, <minecraft:repeater>, <minecraft:comparator>
] as minetweaker.item.IIngredient[];
val boxCores = [redstone, redstone, <minecraft:comparator>, redstone, redstone] as minetweaker.item.IIngredient[];
for i, box in boxes {
    recipes.remove(box);
    recipes.addShaped(box, [[iron, boxCircuits[i], iron], [iron, boxCores[i], iron], [null, screwdriver, null]]);
}

val relay = <Railcraft:signal:13>;
recipes.remove(relay);
recipes.addShaped(relay, [[screwdriver, signalCircuit, null], [iron, signalCircuit, iron], [iron, redstone, iron]]);

val interlock = <Railcraft:signal:0>;
recipes.remove(interlock);
recipes.addShaped(interlock, [[screwdriver, receiverCircuit, null], [iron, controllerCircuit, iron], [iron, redstone, iron]]);

// Tanks: Railcraft leaves wall/gauge/valve recipes to GTNH's core mod, so none exist here.
// Same shapes as old Railcraft (8 per craft) with GT plates; walls are hammered.
val hammer = <ore:craftingToolHardHammer>;
val pane = <ore:paneGlass>;
val bars = <minecraft:iron_bars>;
val lever = <minecraft:lever>;
val tankBlocks = [
    <Railcraft:machine.beta:0>, <Railcraft:machine.beta:13>,
    <Railcraft:machine.zeta:0>, <Railcraft:machine.zeta:3>, <Railcraft:machine.zeta:6>, <Railcraft:machine.zeta:9>, <Railcraft:machine.zeta:12>,
    <Railcraft:machine.eta:0>, <Railcraft:machine.eta:3>, <Railcraft:machine.eta:6>
] as minetweaker.item.IItemStack[];
val tankPlates = [
    iron, steel,
    <ore:plateAluminium>, <ore:plateStainlessSteel>, <ore:plateTitanium>, <ore:plateTungstenSteel>, <ore:platePalladium>,
    <ore:plateIridium>, <ore:plateOsmium>, <ore:plateNeutronium>
] as minetweaker.item.IIngredient[];
for i, wall in tankBlocks {
    // wall, gauge and valve are consecutive metadata
    val p = tankPlates[i];
    val gauge = wall.definition.makeStack(wall.damage + 1);
    val valve = wall.definition.makeStack(wall.damage + 2);
    recipes.addShaped(wall * 8, [[p, p, hammer], [p, p, null]]);
    recipes.addShaped(gauge * 8, [[pane, p, pane], [p, pane, p], [pane, p, pane]]);
    recipes.addShaped(valve * 8, [[bars, p, bars], [p, lever, p], [bars, p, bars]]);
}

// Electric shunting wire also has no recipe without GTNH: copper rods sheathed in lead
val lead = <ore:plateLead>;
val copperRod = <ore:stickCopper>;
recipes.addShaped(<Railcraft:machine.delta:0> * 8, [[lead, lead, lead], [copperRod, copperRod, copperRod], [lead, lead, lead]]);
