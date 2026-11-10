// Thaumic Energistics: essentia cells take an MV circuit like AE2's network blocks (the casing's empty middle).
// Arcane and infusion recipes are untouched.
val circuit = <ore:circuitAdvanced>;
val stone = <Thaumcraft:blockCosmeticOpaque:2>;
val thaumium = <Thaumcraft:ItemResource:2>;
val redstone = <minecraft:redstone>;

val casing = <thaumicenergistics:storage.casing>;
recipes.remove(casing);
recipes.addShaped(casing, [[stone, redstone, stone], [redstone, circuit, redstone], [thaumium, thaumium, thaumium]]);

// Direct cell recipes: the top redstone becomes the circuit (casing + component shapeless recipes stay)
for i in [0, 1, 2, 3, 5, 6, 7, 8] as int[] {
    val cell = <thaumicenergistics:storage.essentia>.definition.makeStack(i);
    recipes.remove(cell);
    recipes.addShaped(cell, [[stone, circuit, stone], [redstone, <thaumicenergistics:storage.component>.definition.makeStack(i), redstone], [thaumium, thaumium, thaumium]]);
    recipes.addShapeless(cell, [<thaumicenergistics:storage.component>.definition.makeStack(i), casing]);
}
