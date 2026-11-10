// Forestry: gears, casing, machines and engines from GT plates. Powered machines take an LV circuit.
val wrench = <ore:craftingToolWrench>;
val circuit = <ore:circuitBasic>;
val glass = <ore:blockGlass>;
val piston = <minecraft:piston>;
val bronze = <ore:plateBronze>;
val copper = <ore:plateCopper>;
val tin = <ore:plateTin>;
val gold = <ore:plateGold>;
val iron = <ore:plateIron>;

// Gears: four plates around a ring, tightened with a wrench (no stone gear)
val gears = [<Forestry:gearCopper>, <Forestry:gearTin>, <Forestry:gearBronze>] as minetweaker.item.IItemStack[];
val gearPlates = [copper, tin, bronze] as minetweaker.item.IIngredient[];
val gearRings = [<ore:ringCopper>, <ore:ringTin>, <ore:ringBronze>] as minetweaker.item.IIngredient[];
for i, gear in gears {
    recipes.remove(gear);
    recipes.addShaped(gear, [[null, gearPlates[i], null], [gearPlates[i], gearRings[i], gearPlates[i]], [null, gearPlates[i], wrench]]);
}

val casing = <Forestry:sturdyMachine>;
recipes.remove(casing);
recipes.addShaped(casing, [[bronze, bronze, bronze], [bronze, wrench, bronze], [bronze, bronze, bronze]]);

// Factory machines keep their shapes; the bottom glass becomes the circuit
val can = <Forestry:canEmpty>;
val machines = [
    <Forestry:factory:0>, <Forestry:factory:1>, <Forestry:factory:2>, <Forestry:factory:3>, <Forestry:factory:5>, <Forestry:factory:6>
] as minetweaker.item.IItemStack[];
val corners = [can, bronze, copper, <ore:gearBronze>, tin, <ore:dustRedstone>] as minetweaker.item.IIngredient[];
val sides = [glass, bronze, copper, glass, tin, glass] as minetweaker.item.IIngredient[];
for i, machine in machines {
    recipes.remove(machine);
    recipes.addShaped(machine, [
        [corners[i], glass, corners[i]],
        [sides[i], casing, sides[i]],
        [corners[i], circuit, corners[i]]]);
}

val fabricator = <Forestry:factory2:0>;
recipes.remove(fabricator);
recipes.addShaped(fabricator, [[gold, circuit, gold], [glass, casing, glass], [gold, <ore:chestWood>, gold]]);

val raintank = <Forestry:factory2:1>;
recipes.remove(raintank);
recipes.addShaped(raintank, [[iron, glass, iron], [iron, casing, iron], [iron, glass, iron]]);

// Piston engines: electrical (tin) gets a circuit, the others a wrench
val engines = [<Forestry:engine:0>, <Forestry:engine:1>, <Forestry:engine:2>] as minetweaker.item.IItemStack[];
val enginePlates = [tin, copper, bronze] as minetweaker.item.IIngredient[];
val engineGears = [<ore:gearTin>, <ore:gearCopper>, <ore:gearBronze>] as minetweaker.item.IIngredient[];
val engineTools = [circuit, wrench, wrench] as minetweaker.item.IIngredient[];
for i, engine in engines {
    recipes.remove(engine);
    recipes.addShaped(engine, [
        [enginePlates[i], enginePlates[i], enginePlates[i]],
        [engineTools[i], glass, null],
        [engineGears[i], piston, engineGears[i]]]);
}

val generator = <Forestry:engine:3>;
recipes.remove(generator);
recipes.addShaped(generator, [[gold, glass, gold], [gold, casing, gold], [gold, circuit, gold]]);

// Multifarm: a farm block's look is NBT (FarmBlock = index into farmLooks, Forestry's own order), so each look gets a recipe
// and the upgrades copy the tag from the farm block they're made from. Gearbox and control are powered: LV circuit.
val farm = <Forestry:ffarm>;
val farmLooks = [
    <minecraft:stonebrick>, <minecraft:stonebrick:1>, <minecraft:stonebrick:2>, <minecraft:brick_block>,
    <minecraft:sandstone:2>, <minecraft:sandstone:1>, <minecraft:nether_brick>, <minecraft:stonebrick:3>,
    <minecraft:quartz_block>, <minecraft:quartz_block:1>, <minecraft:quartz_block:2>
] as minetweaker.item.IItemStack[];
recipes.remove(farm);
for i, look in farmLooks {
    recipes.addShaped(farm.withTag({FarmBlock: i}), [
        [copper, look, copper],
        [<ore:slabWood>, <Forestry:thermionicTubes:1>, <ore:slabWood>],
        [null, wrench, null]]);
}
val gearTin = <ore:gearTin>;
val farmParts = [<Forestry:ffarm:2>, <Forestry:ffarm:3>, <Forestry:ffarm:4>, <Forestry:ffarm:5>] as minetweaker.item.IItemStack[];
val farmTops = [null, wrench, wrench, null] as minetweaker.item.IIngredient[];
val farmBottoms = [
    [gearTin, circuit, gearTin],
    [gearTin, <minecraft:trapdoor>, gearTin],
    [glass, gearTin, glass],
    [<ore:dustRedstone>, circuit, <ore:dustRedstone>]
] as minetweaker.item.IIngredient[][];
for i, part in farmParts {
    recipes.remove(part);
    recipes.addShaped(part, [[null, farm.marked("farm"), farmTops[i]], farmBottoms[i]],
        function(output, inputs, crafting) { return output.withTag(inputs.farm.tag); });
}

// Alveary parts: iron and gold ingots -> plates. Fan and heater are powered: LV circuit.
val alveary = <Forestry:alveary:*>;
val tubeGold = <Forestry:thermionicTubes:4>;
val tubeDiamond = <Forestry:thermionicTubes:5>;
val stone = <ore:stone>;
val alvearyParts = [
    <Forestry:alveary:2>, <Forestry:alveary:3>, <Forestry:alveary:4>, <Forestry:alveary:5>, <Forestry:alveary:7>
] as minetweaker.item.IItemStack[];
val alvearyShapes = [
    [[tubeDiamond, gold, tubeDiamond], [null, alveary, null], [tubeDiamond, gold, tubeDiamond]],
    [[iron, circuit, iron], [null, alveary, null], [iron, tubeGold, iron]],
    [[tubeGold, iron, tubeGold], [null, alveary, null], [stone, circuit, stone]],
    [[glass, iron, glass], [glass, alveary, glass], [glass, iron, glass]],
    [[iron, iron, iron], [null, alveary, null], [<Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>, <Forestry:craftingMaterial:3>]]
] as minetweaker.item.IIngredient[][][];
for i, part in alvearyParts {
    recipes.remove(part);
    recipes.addShaped(part, alvearyShapes[i]);
}
