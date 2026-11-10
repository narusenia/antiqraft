// Iron Chests: same shapes as the mod, ingots -> GT plates.
// Tiers: wood -> copper -> iron -> steel -> gold. Diamond, crystal, obsidian, dirt and netherite chests keep their recipes.
val copper = <ore:plateCopper>;
val iron = <ore:plateIron>;
val steel = <ore:plateSteel>;
val gold = <ore:plateGold>;
val diamond = <ore:gemDiamond>;
val glass = <ore:blockGlass>;
val chest = <ore:chestWood>;

val ironChest = <IronChest:BlockIronChest:0>;
val goldChest = <IronChest:BlockIronChest:1>;
val copperChest = <IronChest:BlockIronChest:3>;
val steelChest = <IronChest:BlockIronChest:4>;

recipes.remove(copperChest);
recipes.addShaped(copperChest, [[copper, copper, copper], [copper, chest, copper], [copper, copper, copper]]);

recipes.remove(ironChest);
recipes.addShaped(ironChest, [[iron, glass, iron], [glass, copperChest, glass], [iron, glass, iron]]);
recipes.addShaped(ironChest, [[iron, iron, iron], [iron, chest, iron], [iron, iron, iron]]);

recipes.remove(steelChest);
recipes.addShaped(steelChest, [[steel, glass, steel], [glass, ironChest, glass], [steel, glass, steel]]);
recipes.addShaped(steelChest, [[steel, steel, steel], [steel, copperChest, steel], [steel, steel, steel]]);

recipes.remove(goldChest);
recipes.addShaped(goldChest, [[gold, glass, gold], [glass, steelChest, glass], [gold, glass, gold]]);
recipes.addShaped(goldChest, [[gold, gold, gold], [gold, ironChest, gold], [gold, gold, gold]]);

// Upgrades: m = target material, s = source material
val pane = <minecraft:glass>;
val plank = <ore:plankWood>;

recipes.remove(<IronChest:woodCopperUpgrade>);
recipes.addShaped(<IronChest:woodCopperUpgrade>, [[copper, copper, copper], [copper, plank, copper], [copper, copper, copper]]);

recipes.remove(<IronChest:woodIronUpgrade>);
recipes.addShaped(<IronChest:woodIronUpgrade>, [[iron, iron, iron], [iron, plank, iron], [iron, iron, iron]]);

recipes.remove(<IronChest:copperIronUpgrade>);
recipes.addShaped(<IronChest:copperIronUpgrade>, [[iron, pane, iron], [pane, copper, pane], [iron, pane, iron]]);

recipes.remove(<IronChest:copperSteelUpgrade>);
recipes.addShaped(<IronChest:copperSteelUpgrade>, [[steel, steel, steel], [steel, copper, steel], [steel, steel, steel]]);

recipes.remove(<IronChest:ironSteelUpgrade>);
recipes.addShaped(<IronChest:ironSteelUpgrade>, [[steel, pane, steel], [pane, iron, pane], [steel, pane, steel]]);

recipes.remove(<IronChest:ironGoldUpgrade>);
recipes.addShaped(<IronChest:ironGoldUpgrade>, [[gold, gold, gold], [gold, iron, gold], [gold, gold, gold]]);

recipes.remove(<IronChest:steelGoldUpgrade>);
recipes.addShaped(<IronChest:steelGoldUpgrade>, [[gold, pane, gold], [pane, steel, pane], [gold, pane, gold]]);

recipes.remove(<IronChest:goldDiamondUpgrade>);
recipes.addShaped(<IronChest:goldDiamondUpgrade>, [[pane, pane, pane], [diamond, gold, diamond], [pane, pane, pane]]);
