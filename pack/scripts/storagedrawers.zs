// Storage Drawers: same shapes as the mod, ingots -> GT plates
val iron = <ore:plateIron>;
val gold = <ore:plateGold>;
val stick = <ore:stickWood>;
val stone = <minecraft:stone>;
val drawer = <ore:drawerBasic>;
val template = <StorageDrawers:upgradeTemplate>;

recipes.remove(<StorageDrawers:upgrade:2>);
recipes.addShaped(<StorageDrawers:upgrade:2>, [[iron, stick, iron], [stick, template, stick], [iron, stick, iron]]);

recipes.remove(<StorageDrawers:upgrade:3>);
recipes.addShaped(<StorageDrawers:upgrade:3>, [[gold, stick, gold], [stick, template, stick], [gold, stick, gold]]);

recipes.remove(<StorageDrawers:upgradeLock>);
recipes.addShaped(<StorageDrawers:upgradeLock>, [[<ore:nuggetGold>, gold], [null, gold], [null, template]]);

recipes.remove(<StorageDrawers:compDrawers>);
recipes.addShaped(<StorageDrawers:compDrawers>, [[stone, stone, stone], [<minecraft:piston>, drawer, <minecraft:piston>], [stone, iron, stone]]);

recipes.remove(<StorageDrawers:controllerSlave>);
recipes.addShaped(<StorageDrawers:controllerSlave>, [[stone, stone, stone], [<minecraft:comparator>, drawer, <minecraft:comparator>], [stone, gold, stone]]);
