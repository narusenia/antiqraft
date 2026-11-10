import mods.gregtechmod.recipe.RecipeMaps;

// EnderIO: the SAG Mill and Alloy Smelter are off, so its alloys and fused quartz come from GT4's Alloy Smelter.
// Dark Steel (itemAlloy:6) is not here: the fork makes it in GT4's Blast Furnace from steel + obsidian dust.
val alloySmelter = RecipeMaps.getRecipeMap("ALLOY_SMELTING");
val alloy = <EnderIO:itemAlloy>;
val silicon = <ore:itemSilicon> | <ore:dustSilicon>;
val pearl = <minecraft:ender_pearl>;
val alloyOutputs = [
    alloy.definition.makeStack(0), alloy.definition.makeStack(1), alloy.definition.makeStack(2), alloy.definition.makeStack(3),
    alloy.definition.makeStack(4), alloy.definition.makeStack(5), alloy.definition.makeStack(7)
] as minetweaker.item.IItemStack[];
val alloyBases = [
    <ore:ingotSteel>, <ore:ingotGold>, <ore:ingotEnergeticAlloy>, <ore:dustRedstone>,
    <ore:ingotIron>, <ore:ingotIron>, <ore:ingotGold>
] as minetweaker.item.IIngredient[];
val alloyAdditives = [
    silicon, <ore:dustGlowstone>, pearl, silicon,
    <ore:dustRedstone>, pearl, <minecraft:soul_sand>
] as minetweaker.item.IIngredient[];
for i, out in alloyOutputs {
    alloySmelter.factory().inputs(alloyBases[i], alloyAdditives[i]).output(out).EUt(16).duration(200).buildAndRegister();
}

val fusedQuartz = <EnderIO:blockFusedQuartz>;
alloySmelter.factory().input(<ore:gemQuartz> * 4).output(fusedQuartz).EUt(16).duration(160).buildAndRegister();
alloySmelter.factory().input(<ore:blockGlass>).output(fusedQuartz.definition.makeStack(1)).EUt(16).duration(80).buildAndRegister();
alloySmelter.factory().inputs(fusedQuartz, <ore:dustGlowstone> * 4).output(fusedQuartz.definition.makeStack(2)).EUt(16).duration(160).buildAndRegister();
alloySmelter.factory().inputs(fusedQuartz.definition.makeStack(1), <ore:dustGlowstone> * 4).output(fusedQuartz.definition.makeStack(3)).EUt(16).duration(160).buildAndRegister();

// Conduits: binder rows stay, the middle top and bottom binder become GT bolts
val binder = <ore:itemConduitBinder>;
val bolt = <ore:boltSteel>;
val conduits = [
    <EnderIO:itemItemConduit>,
    <EnderIO:itemLiquidConduit>, <EnderIO:itemLiquidConduit:1>, <EnderIO:itemLiquidConduit:2>,
    <EnderIO:itemPowerConduit>, <EnderIO:itemPowerConduit:1>, <EnderIO:itemPowerConduit:2>
] as minetweaker.item.IItemStack[];
val clearGlass = fusedQuartz.definition.makeStack(1);
val conduitCores = [
    [<ore:itemPhasedIronNugget>, <ore:itemPhasedIronNugget>, <ore:itemPhasedIronNugget>],
    [clearGlass, clearGlass, clearGlass],
    [fusedQuartz, fusedQuartz, fusedQuartz],
    [fusedQuartz, <ore:ingotVibrantAlloy>, fusedQuartz],
    [<ore:ingotConductiveIron>, <ore:ingotConductiveIron>, <ore:ingotConductiveIron>],
    [<ore:ingotEnergeticAlloy>, <ore:ingotEnergeticAlloy>, <ore:ingotEnergeticAlloy>],
    [<ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>, <ore:ingotVibrantAlloy>]
] as minetweaker.item.IIngredient[][];
for i, conduit in conduits {
    recipes.remove(conduit);
    recipes.addShaped(conduit * 8, [[binder, bolt, binder], conduitCores[i], [binder, bolt, binder]]);
}

// ME conduit: MV circuit per craft
val binderItem = <EnderIO:itemMaterial:1>;
recipes.remove(<EnderIO:itemMEConduit>);
recipes.addShaped(<EnderIO:itemMEConduit> * 4, [
    [binderItem, <ore:circuitAdvanced>, binderItem],
    [<ore:crystalFluix> | <ore:crystalPureFluix>, <appliedenergistics2:item.ItemMultiPart:140>, <ore:crystalFluix> | <ore:crystalPureFluix>],
    [binderItem, binderItem, binderItem]]);

val anchor = <EnderIO:blockTravelAnchor>;
recipes.remove(anchor);
recipes.addShaped(anchor, [[<ore:plateSteel>, binderItem, <ore:plateSteel>], [binderItem, <EnderIO:itemMaterial:5>, binderItem], [<ore:plateSteel>, <ore:circuitAdvanced>, <ore:plateSteel>]]);

// End Steel and the Endergy alloys (cores of the Endergy conduits) had no source either.
// GT4's smelter takes two inputs, so EnderIO's third one is dropped; there is no pink slime, so plain slime stands in.
val endSteel = alloy.definition.makeStack(8);
alloySmelter.factory().inputs(<ore:ingotDarkSteel>, <minecraft:end_stone>).output(endSteel).EUt(32).duration(200).buildAndRegister();
val endergy = <EnderIO:itemAlloyEndergy>;
val pulsating = <ore:itemPulsatingPowder>;
val energeticSilver = endergy.definition.makeStack(5);
val melodic = endergy.definition.makeStack(2);
alloySmelter.factory().inputs(<minecraft:gravel>, <minecraft:clay_ball>).output(endergy).EUt(16).duration(100).buildAndRegister();
alloySmelter.factory().inputs(<ore:ingotGold>, pulsating).output(endergy.definition.makeStack(1)).EUt(32).duration(200).buildAndRegister();
alloySmelter.factory().inputs(endSteel, <minecraft:ender_eye>).output(melodic).EUt(32).duration(400).buildAndRegister();
alloySmelter.factory().inputs(melodic, <minecraft:nether_star>).output(endergy.definition.makeStack(3) * 2).EUt(32).duration(800).buildAndRegister();
alloySmelter.factory().inputs(<ore:slimeball> * 2, pulsating).output(endergy.definition.makeStack(4)).EUt(32).duration(200).buildAndRegister();
alloySmelter.factory().inputs(<ore:ingotSilver>, <ore:dustGlowstone>).output(energeticSilver).EUt(32).duration(200).buildAndRegister();
alloySmelter.factory().inputs(energeticSilver, pearl).output(endergy.definition.makeStack(6)).EUt(32).duration(200).buildAndRegister();

// Endergy conduits, same pattern as the other conduits
val endergyCores = [
    endergy, <ore:ingotIron>, <ore:ingotAluminium>, <ore:ingotGold>, <ore:ingotCopper>, <ore:ingotSilver>,
    <ore:ingotElectrum>, energeticSilver, endergy.definition.makeStack(1), endergy.definition.makeStack(4), melodic, endergy.definition.makeStack(3)
] as minetweaker.item.IIngredient[];
val endergyConduit = <EnderIO:itemPowerConduitEndergy>;
for i, core in endergyCores {
    val conduit = endergyConduit.definition.makeStack(i);
    recipes.remove(conduit);
    recipes.addShaped(conduit * 8, [[binder, bolt, binder], [core, core, core], [binder, bolt, binder]]);
}
