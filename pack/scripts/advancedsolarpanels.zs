// Advanced Solar Panels: IC2 advanced circuits -> GT HV/EV circuits.
// Helmets keep ASP's shapes; unlike IC2's recipe, the helmet's charge isn't carried over.
val hv = <ore:circuitElite>;
val ev = <ore:circuitMaster>;
val item = <AdvancedSolarPanel:asp_crafting_items>;
val alloy = <IC2:itemPartAlloy>;

val advanced = <AdvancedSolarPanel:BlockAdvSolarPanel>;
recipes.remove(advanced);
recipes.addShaped(advanced, [
    [item.definition.makeStack(5), item.definition.makeStack(5), item.definition.makeStack(5)],
    [alloy, <IC2:blockGenerator:3>, alloy],
    [hv, item.definition.makeStack(8), hv]]);

val hybrid = <AdvancedSolarPanel:BlockAdvSolarPanel:1>;
recipes.remove(hybrid);
recipes.addShaped(hybrid, [
    [<IC2:itemPartCarbonPlate>, <minecraft:lapis_block>, <IC2:itemPartCarbonPlate>],
    [<IC2:itemPartIridium>, advanced, <IC2:itemPartIridium>],
    [ev, item.definition.makeStack(3), ev]]);
// the 8 hybrids <- ultimate split recipe goes with the remove above
recipes.addShapeless(hybrid * 8, [<AdvancedSolarPanel:BlockAdvSolarPanel:2>]);

val ultimate = <AdvancedSolarPanel:BlockAdvSolarPanel:2>;
recipes.remove(ultimate);
recipes.addShaped(ultimate, [[hybrid, hybrid, hybrid], [hybrid, ev, hybrid], [hybrid, hybrid, hybrid]]);
val coal = <IC2:itemPartCoalChunk>;
recipes.addShaped(ultimate, [[null, <minecraft:lapis_block>, null], [coal, advanced, coal], [item.definition.makeStack(4), coal, item.definition.makeStack(4)]]);

val transformer = <AdvancedSolarPanel:BlockMolecularTransformer>;
recipes.remove(transformer);
recipes.addShaped(transformer, [
    [<IC2:blockMachine:12>, <IC2:blockElectric:6>, <IC2:blockMachine:12>],
    [hv, item.definition.makeStack(12), hv],
    [<IC2:blockMachine:12>, <IC2:blockElectric:6>, <IC2:blockMachine:12>]]);

// Solar helmets: panel on top of the helmet, the circuit tier follows the panel
val helmets = [
    <AdvancedSolarPanel:advanced_solar_helmet>, <AdvancedSolarPanel:hybrid_solar_helmet>, <AdvancedSolarPanel:ultimate_solar_helmet>
] as minetweaker.item.IItemStack[];
val helmetPanels = [advanced, hybrid, ultimate] as minetweaker.item.IItemStack[];
val helmetBases = [<IC2:itemArmorNanoHelmet:*>, <IC2:itemArmorQuantumHelmet:*>, <IC2:itemArmorQuantumHelmet:*>] as minetweaker.item.IIngredient[];
val helmetCircuits = [hv, ev, ev] as minetweaker.item.IIngredient[];
val helmetCables = [<IC2:itemCable:3>, <IC2:itemCable:9>, <IC2:itemCable:9>] as minetweaker.item.IItemStack[];
val helmetTransformers = [<IC2:blockElectric:3>, <IC2:blockElectric:5>, <IC2:blockElectric:5>] as minetweaker.item.IItemStack[];
for i, helmet in helmets {
    recipes.remove(helmet);
    recipes.addShaped(helmet, [
        [null, helmetPanels[i], null],
        [helmetCircuits[i], helmetBases[i], helmetCircuits[i]],
        [helmetCables[i], helmetTransformers[i], helmetCables[i]]]);
}
recipes.addShaped(helmets[2], [[ultimate], [<AdvancedSolarPanel:hybrid_solar_helmet:*>]]);
