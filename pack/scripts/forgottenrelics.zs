import mods.thaumcraft.Infusion;
import mods.thaumcraft.Research;

// Forgotten Relics: Botania's mana items are gone, so the Botania parts of the relic infusions become Thaumcraft ones.
// Central item (unless Botania), research key, instability and aspects are FR's own. The Crown of Terror stays removed (removals.zs).
val gaiaSpirit = <Thaumcraft:ItemResource:16>;       // Gaia Spirit -> Void Metal Ingot
val terrasteel = <Thaumcraft:blockCosmeticSolid:4>;  // Terrasteel -> Block of Thaumium
val elementium = <Thaumcraft:ItemResource:2>;        // Elementium -> Thaumium Ingot
val dragonstone = <minecraft:diamond>;               // Dragonstone -> Diamond
val pixieDust = <Thaumcraft:ItemResource:14>;        // Pixie Dust -> Salis Mundus
val enderAir = <minecraft:ender_pearl>;              // Bottled Ender Air / Mana Pearl -> Ender Pearl
val runeAir = <Thaumcraft:ItemShard>;                // Rune of Air -> Air Shard

val nitor = <Thaumcraft:ItemResource:1>;
val salis = <Thaumcraft:ItemResource:14>;
val charm = <Thaumcraft:ItemResource:15>;
val voidSeed = <Thaumcraft:ItemResource:17>;
val wisp = <Thaumcraft:ItemWispEssence>;
val pearl = <Thaumcraft:ItemEldritchObject:3>;
val book = <minecraft:writable_book>;

val outputs = [
    <ForgottenRelics:ItemSuperpositionRing>, <ForgottenRelics:ItemWeatherStone>, <ForgottenRelics:ItemMiningCharm>,
    <ForgottenRelics:ItemDimensionalMirror>, <ForgottenRelics:ItemAdvancedMiningCharm>, <ForgottenRelics:ItemAncientAegis>,
    <ForgottenRelics:ItemDarkSunRing>, <ForgottenRelics:ItemDeificAmulet>, <ForgottenRelics:ItemChaosCore>,
    <ForgottenRelics:ItemShinyStone>, <ForgottenRelics:ItemOblivionAmulet>, <ForgottenRelics:ItemArcanum>,
    <ForgottenRelics:ItemTeleportationTome>, <ForgottenRelics:ItemTelekinesisTome>, <ForgottenRelics:ItemSoulTome>,
    <ForgottenRelics:ItemFateTome>, <ForgottenRelics:ItemEldritchSpell>, <ForgottenRelics:ItemChaosTome>,
    <ForgottenRelics:ItemMissileTome>, <ForgottenRelics:ItemLunarFlares>, <ForgottenRelics:ItemApotheosis>,
    <ForgottenRelics:ItemThunderpeal>, <ForgottenRelics:ItemDiscordRing>, <ForgottenRelics:ItemVoidGrimoire>
] as minetweaker.item.IItemStack[];
val research = [
    "SuperpositionRing", "WeatherStone", "MiningCharm",
    "DimensionalMirror", "AdvancedMiningCharm", "AncientAegis",
    "DarkSunRing", "DeificAmulet", "ChaosCore",
    "ShinyStone", "OblivionAmulet", "NebulousCore",
    "DiscordTome", "TelekinesisTome", "SoulTome",
    "FateTome", "EldritchSpell", "ChaosTome",
    "NuclearFury", "LunarFlares", "Apotheosis",
    "Thunderpeal", "DiscordRing", "VoidGrimoire"
] as string[];
val centers = [
    <Thaumcraft:ItemBaubleBlanks:1>, <Thaumcraft:blockCosmeticSolid:6>, <Thaumcraft:ItemBaubleBlanks:1>,
    <Thaumcraft:HandMirror>, <ForgottenRelics:ItemMiningCharm>, <Thaumcraft:ItemGirdleRunic>,
    <Thaumcraft:ItemRingRunic:2>, <Thaumcraft:ItemAmuletRunic:1>, charm,
    dragonstone, <Thaumcraft:ItemAmuletRunic>, pearl,
    book, book, book,
    book, book, book,
    <ForgottenRelics:ItemChaosTome>, book, book,
    book, <Thaumcraft:ItemBaubleBlanks:1>, <ForgottenRelics:ItemOverthrower>
] as minetweaker.item.IItemStack[];
val components = [
    [<minecraft:ender_eye>, enderAir, voidSeed, salis, <minecraft:emerald>, salis, voidSeed, enderAir],
    [gaiaSpirit, <minecraft:ghast_tear>, runeAir, <Thaumcraft:ItemResource:9>, nitor, <Thaumcraft:ItemResource:9>, runeAir, <minecraft:ghast_tear>],
    [<Thaumcraft:ItemPickaxeElemental>, <Thaumcraft:ItemShard:3>, salis, <minecraft:gold_ingot>, <minecraft:potion:8226>, <Thaumcraft:ItemShard:3>, salis, <minecraft:gold_ingot>],
    [gaiaSpirit, <minecraft:glowstone_dust>, dragonstone, enderAir, <Thaumcraft:FocusPortableHole>, enderAir, dragonstone, <minecraft:glowstone_dust>],
    [charm, wisp, elementium, dragonstone, gaiaSpirit, wisp, <Thaumcraft:ItemPickVoid>, wisp, gaiaSpirit, dragonstone, elementium, wisp],
    [dragonstone, <minecraft:potion:8229>, <minecraft:gold_ingot>, <Thaumcraft:ItemResource:7>, <Thaumcraft:ItemGirdleRunic:1>, <Thaumcraft:ItemResource:7>, <minecraft:gold_ingot>, <minecraft:potion:8229>],
    [<Thaumcraft:FocusFire>, elementium, <minecraft:blaze_rod>, <Thaumcraft:blockCustomPlant:3>, voidSeed, nitor, voidSeed, <Thaumcraft:blockCustomPlant:3>, <minecraft:blaze_rod>, elementium],
    [<minecraft:potion:8227>, gaiaSpirit, pixieDust, gaiaSpirit, charm, gaiaSpirit, pixieDust, gaiaSpirit],
    [dragonstone, pixieDust, <Thaumcraft:ItemResource:16>, pixieDust, <Thaumcraft:ItemResource>, pixieDust, <Thaumcraft:ItemResource:16>, pixieDust],
    [charm, <minecraft:gold_ingot>, gaiaSpirit, nitor, <minecraft:golden_apple:1>, nitor, gaiaSpirit, <minecraft:gold_ingot>],
    [<minecraft:nether_star>, <minecraft:blaze_powder>, <Thaumcraft:ItemResource:16>, <minecraft:blaze_powder>, <Thaumcraft:ItemEldritchObject>, <minecraft:blaze_powder>, <Thaumcraft:ItemResource:16>, <minecraft:blaze_powder>],
    [<Thaumcraft:ItemAmuletVis:1>, wisp, gaiaSpirit, <Thaumcraft:ItemResource:2>, enderAir, wisp, <ForgottenRelics:ItemSuperpositionRing>, wisp, enderAir, <Thaumcraft:ItemResource:2>, gaiaSpirit, wisp],
    [charm, elementium, <minecraft:ender_pearl>, enderAir, salis, <Thaumcraft:FocusPortableHole>, salis, enderAir, <minecraft:ender_pearl>, elementium],
    [charm, voidSeed, <Thaumcraft:FocusShock>, gaiaSpirit, salis, <ThaumicTinkerer:focusTelekinesis>, salis, gaiaSpirit, <Thaumcraft:FocusShock>, voidSeed],
    [<Thaumcraft:FocusPech>, <Thaumcraft:ItemResource>, gaiaSpirit, <minecraft:ender_eye>, gaiaSpirit, salis, <Thaumcraft:blockJar:1>, salis, gaiaSpirit, <minecraft:ender_eye>, gaiaSpirit, <Thaumcraft:ItemResource>],
    [<minecraft:golden_apple:1>, dragonstone, gaiaSpirit, nitor, gaiaSpirit, salis, charm, salis, gaiaSpirit, nitor, gaiaSpirit, dragonstone],
    [charm, <Thaumcraft:ItemResource:16>, <minecraft:fire_charge>, <Thaumcraft:ItemEldritchObject>, <Thaumcraft:ItemBottleTaint>, salis, gaiaSpirit, salis, <Thaumcraft:ItemBottleTaint>, <Thaumcraft:ItemEldritchObject>, <minecraft:fire_charge>, <Thaumcraft:ItemResource:16>],
    [<Thaumcraft:FocusPrimal>, salis, elementium, <Thaumcraft:FocusPrimal>, gaiaSpirit, salis, <Thaumcraft:FocusPrimal>, salis, gaiaSpirit, <Thaumcraft:FocusPrimal>, elementium, salis],
    [<Thaumcraft:FocusPrimal>, <Thaumcraft:ItemResource>, terrasteel, charm, gaiaSpirit, wisp, pearl, wisp, gaiaSpirit, charm, terrasteel, <Thaumcraft:ItemResource>],
    [charm, enderAir, terrasteel, <Thaumcraft:ItemSwordElemental>, gaiaSpirit, salis, pearl, salis, gaiaSpirit, <Thaumcraft:ItemSwordElemental>, terrasteel, enderAir],
    [pearl, <Thaumcraft:ItemResource:9>, <minecraft:gold_ingot>, charm, gaiaSpirit, salis, pearl, salis, gaiaSpirit, charm, <minecraft:gold_ingot>, <Thaumcraft:ItemResource:9>],
    [charm, pixieDust, enderAir, salis, <Thaumcraft:FocusShock>, salis, enderAir, pixieDust],
    [dragonstone, salis, elementium, salis, gaiaSpirit, salis, elementium, salis],
    [gaiaSpirit, voidSeed, <Thaumcraft:ItemResource:9>, voidSeed, <Thaumcraft:ItemEldritchObject>, voidSeed, <Thaumcraft:ItemResource:9>, voidSeed]
] as minetweaker.item.IItemStack[][];
val aspects = [
    "alienis 32, permutatio 30, iter 24, tenebrae 20, tutamen 8",
    "tempestas 16, aer 24, aqua 10, permutatio 12, potentia 20",
    "perfodio 24, instrumentum 20, motus 16, metallum 12, praecantatio 16",
    "iter 40, tenebrae 20, praecantatio 24, vacuos 16, alienis 10",
    "perfodio 64, auram 40, vitreus 48, permutatio 40, motus 32, praecantatio 36, instrumentum 50",
    "tutamen 45, permutatio 30, sano 24, praecantatio 30, metallum 20",
    "ignis 60, tutamen 48, permutatio 36, tenebrae 40, praecantatio 25",
    "humanus 30, lux 42, auram 16, praecantatio 25, sano 8, permutatio 20",
    "perditio 25, ordo 25, permutatio 16, praecantatio 32",
    "sano 40, victus 32, vinculum 24, permutatio 24, praecantatio 24, vitreus 16",
    "mortuus 64, permutatio 50, vacuos 72, tenebrae 100, alienis 24, praecantatio 32, ignis 16",
    "auram 80, praecantatio 128, vacuos 32, alienis 50, tenebrae 40, iter 24, permutatio 48",
    "iter 50, tenebrae 30, vacuos 30, praecantatio 45, cognitio 24",
    "motus 32, vinculum 48, praecantatio 64, tenebrae 24, aer 25, potentia 40, instrumentum 16",
    "spiritus 80, vacuos 60, praecantatio 45, vinculum 60, mortuus 32, tenebrae 48, permutatio 52",
    "sano 40, victus 64, permutatio 32, humanus 24, cognitio 16, spiritus 36, ordo 20",
    "alienis 72, tenebrae 64, mortuus 40, praecantatio 36, cognitio 24, telum 12, vitium 24",
    "aer 100, aqua 100, terra 100, ignis 100, ordo 100, perditio 100, praecantatio 256, permutatio 72, alienis 36, tenebrae 40",
    "lux 72, ignis 80, perditio 36, praecantatio 64, auram 16, potentia 48, sensus 32, vacuos 40",
    "aer 64, potentia 96, praecantatio 120, cognitio 32, ordo 40, motus 16, telum 24, lux 48",
    "telum 128, instrumentum 72, permutatio 54, praecantatio 80, lux 64, metallum 32, cognitio 48, ordo 40",
    "potentia 32, praecantatio 24, aer 24, cognitio 10, ignis 16",
    "instrumentum 16, iter 16, praecantatio 12, permutatio 8, vacuos 8",
    "vacuos 100, tenebrae 52, iter 24, praecantatio 40, cognitio 32, alienis 40, permutatio 16, perditio 20"
] as string[];
val instability = [4, 4, 1, 6, 8, 5, 8, 4, 10, 8, 16, 12, 5, 8, 10, 20, 8, 12, 10, 12, 48, 4, 2, 10] as int[];

for i, out in outputs {
    Infusion.removeRecipe(out);
    Infusion.addRecipe(research[i], centers[i], components[i], aspects[i], out, instability[i]);
    // Point the Thaumonomicon page at the new recipe
    Research.refreshResearchRecipe(research[i]);
}
