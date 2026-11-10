// GraviSuite: the top items take EV circuits and tungstensteel plates, the mid ones HV circuits.
// Advanced lappack, chainsaw and drill keep GraviSuite's shapes with HV circuits in place of IC2 advanced circuits.
// IC2 carried charge over from the ingredients; these MineTweaker recipes start the result empty.
val hv = <ore:circuitElite>;
val ev = <ore:circuitMaster>;
val ts = <ore:plateTungstenSteel>;
val superconductor = <ore:itemSuperconductor>;
val carbon = <IC2:itemPartCarbonPlate>;
val alloy = <IC2:itemPartAlloy>;
val lapotron = <IC2:itemBatLamaCrystal:*>;
val glassFibre = <IC2:itemCable:9>;
val mfsu = <IC2:blockElectric:5>;
val simple = <GraviSuite:itemSimpleItem>;

val chest = <GraviSuite:graviChestPlate>;
recipes.remove(chest);
recipes.addShaped(chest, [
    [ts, <IC2:itemArmorQuantumChestplate:*>, ts],
    [simple.definition.makeStack(3), mfsu, simple.definition.makeStack(3)],
    [ev, <GraviSuite:ultimateLappack:*>, ev]]);

val vajra = <GraviSuite:vajra>;
recipes.remove(vajra);
recipes.addShaped(vajra, [[ts, <IC2:itemBatCrystal:*>, ts], [carbon, simple.definition.makeStack(5), carbon], [ev, lapotron, ev]]);

val ultimateLappack = <GraviSuite:ultimateLappack>;
recipes.remove(ultimateLappack);
for pack in [<IC2:itemArmorEnergypack:*>, <GraviSuite:advLappack:*>] as minetweaker.item.IIngredient[] {
    recipes.addShaped(ultimateLappack, [[lapotron, ev, lapotron], [lapotron, pack, lapotron], [lapotron, superconductor, lapotron]]);
}

val jetpack = <GraviSuite:advJetpack>;
recipes.remove(jetpack);
recipes.addShaped(jetpack, [
    [carbon, <IC2:itemArmorJetpackElectric:*>, carbon],
    [simple.definition.makeStack(6), <GraviSuite:advLappack:*>, simple.definition.makeStack(6)],
    [glassFibre, hv, glassFibre]]);

val nanoChest = <GraviSuite:advNanoChestPlate>;
recipes.remove(nanoChest);
recipes.addShaped(nanoChest, [[carbon, <GraviSuite:advJetpack:*>, carbon], [carbon, <IC2:itemArmorNanoChestplate:*>, carbon], [glassFibre, hv, glassFibre]]);

val graviTool = <GraviSuite:graviTool>;
recipes.remove(graviTool);
recipes.addShaped(graviTool, [
    [carbon, <IC2:itemToolHoe:*>, carbon],
    [alloy, <IC2:itemBatCrystal:*>, alloy],
    [<IC2:itemToolWrenchElectric:*>, hv, <IC2:itemTreetapElectric:*>]]);

val stainless = <ore:plateStainlessSteel>;
val overclocker = <IC2:upgradeModule>;

val advLappack = <GraviSuite:advLappack>;
recipes.remove(advLappack);
recipes.addShaped(advLappack, [[null, <IC2:itemArmorEnergypack:*>, null], [stainless, hv, stainless], [null, lapotron, null]]);

val advDrill = <GraviSuite:advDDrill>;
recipes.remove(advDrill);
recipes.addShaped(advDrill, [[overclocker, <IC2:itemToolDDrill:*>, overclocker], [hv, overclocker, hv]]);

val advChainsaw = <GraviSuite:advChainsaw>;
recipes.remove(advChainsaw);
recipes.addShaped(advChainsaw, [[null, <minecraft:diamond>, null], [overclocker, <IC2:itemToolChainsaw:*>, overclocker], [hv, overclocker, hv]]);
