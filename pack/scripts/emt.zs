import mods.nei.NEI;

// Electro-Magic Tools: the crafting-table tools take MV circuits (Arcane/Infusion recipes stay as they are).
// As with IC2's own recipes, the charge of the tools put in isn't carried over.
val mv = <ore:circuitAdvanced>;
val diamond = <minecraft:diamond>;

recipes.remove(<EMT:Omnitool:*>);
recipes.addShaped(<EMT:Omnitool:26>, [
    [null, <IC2:itemToolChainsaw:*>, null],
    [<ore:plateSteel>, mv, <ore:plateSteel>],
    [null, <IC2:itemToolDrill:*>, null]]);

recipes.remove(<EMT:DiamondChainsaw:*>);
recipes.addShaped(<EMT:DiamondChainsaw:26>, [[null, diamond, null], [diamond, <IC2:itemToolChainsaw:*>, diamond], [null, mv, null]]);

// EMT only gives these a recipe with GT5 compat on. Solar goggles: the Hybrid Solar Panel stands in for EMT's
// compressed solars (not registered here). The maintenance focus serves GT5 maintenance hatches, which GT4 lacks.
recipes.addShaped(<EMT:SolarHelmetRevealing>, [
    [null, <AdvancedSolarPanel:BlockAdvSolarPanel:1>, null],
    [<ore:circuitMaster>, <EMT:QuantumGogglesRevealing:*>, <ore:circuitMaster>],
    [<IC2:itemCable:9>, <IC2:itemBatLamaCrystal:*>, <IC2:itemCable:9>]]);
NEI.hide(<EMT:MaintenanceFocus>);
