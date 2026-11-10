// Et Futurum Requiem: small iron items from GT parts. Copper and netherite items are left to the fork.
val plate = <ore:plateIron>;
val bolt = <ore:boltIron>;
val ring = <ore:ringIron>;
val hammer = <ore:craftingToolHardHammer>;

val lanterns = [<etfuturum:lantern>, <etfuturum:soul_lantern>] as minetweaker.item.IItemStack[];
val torches = [<minecraft:torch>, <etfuturum:soul_torch>] as minetweaker.item.IIngredient[];
for i, lantern in lanterns {
    recipes.remove(lantern);
    recipes.addShaped(lantern, [[null, ring, null], [bolt, torches[i], bolt], [null, bolt, null]]);
}

recipes.remove(<etfuturum:chain>);
recipes.addShaped(<etfuturum:chain>, [[ring], [<ore:stickIron>], [ring]]);

recipes.remove(<etfuturum:iron_trapdoor>);
recipes.addShaped(<etfuturum:iron_trapdoor>, [[plate, plate, hammer], [plate, plate, null]]);

recipes.remove(<etfuturum:smithing_table>);
recipes.addShaped(<etfuturum:smithing_table>, [[plate, plate], [<ore:plankWood>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>]]);

recipes.remove(<etfuturum:stonecutter>);
recipes.addShaped(<etfuturum:stonecutter>, [[null, plate, hammer], [<ore:stone>, <ore:stone>, <ore:stone>]]);

val smoothStone = <etfuturum:smooth_stone>;
recipes.remove(<etfuturum:blast_furnace>);
recipes.addShaped(<etfuturum:blast_furnace>, [[plate, plate, plate], [plate, <minecraft:furnace>, plate], [smoothStone, smoothStone, smoothStone]]);
