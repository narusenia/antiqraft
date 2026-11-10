import mods.gregtechmod.recipe.RecipeMaps;

// Botania decorative blocks whose base came from mana (Pure Daisy, mana pool, elven trade) are made in GT4's Assembler instead.
// Bricks, slabs, stairs, walls, panes, pavement and quartz blocks keep Botania's own crafting recipes (re-enabled in removals.zs).
val assembler = RecipeMaps.getRecipeMap("ASSEMBLING");
val petal = <Botania:petal:*>;
val livingwood = <Botania:livingwood>;
val manaGlass = <Botania:manaGlass>;
val elfGlass = <Botania:elfGlass>;

assembler.factory().inputs(<minecraft:stone> * 8, petal).output(<Botania:livingrock> * 8).EUt(16).duration(200).buildAndRegister();
assembler.factory().inputs(<ore:logWood> * 8, petal).output(livingwood * 8).EUt(16).duration(200).buildAndRegister();
assembler.factory().inputs(livingwood * 8, <minecraft:ender_pearl>).output(<Botania:dreamwood> * 8).EUt(16).duration(200).buildAndRegister();
assembler.factory().inputs(<ore:blockGlass> * 4, <ore:gemLapis>).output(manaGlass * 4).EUt(16).duration(100).buildAndRegister();
assembler.factory().inputs(manaGlass * 4, <ore:dustGlowstone>).output(elfGlass * 4).EUt(16).duration(100).buildAndRegister();
assembler.factory().inputs(<Botania:livingrock> * 8, elfGlass).output(<Botania:shimmerrock> * 8).EUt(16).duration(200).buildAndRegister();
assembler.factory().inputs(<Botania:dreamwood:1> * 8, elfGlass).output(<Botania:shimmerwoodPlanks> * 8).EUt(16).duration(200).buildAndRegister();
// Mana and elven quartz; the other quartz colors already have crafting recipes
assembler.factory().inputs(<ore:gemQuartz> * 4, <ore:gemLapis>).output(<Botania:quartz:1> * 4).EUt(16).duration(100).buildAndRegister();
assembler.factory().inputs(<ore:gemQuartz> * 4, <ore:dustGlowstone>).output(<Botania:quartz:5> * 4).EUt(16).duration(100).buildAndRegister();
