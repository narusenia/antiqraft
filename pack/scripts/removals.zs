import mods.nei.NEI;

// Botania is only a dependency of Forgotten Relics; the mana system stays unreachable
// shortcut: only the lexicon is handled; list every Botania item from `mt names` to remove the rest
NEI.hide(<Botania:lexicon>);

// Ore processing belongs to GregTech
recipes.remove(<EnderIO:blockSagMill>);
recipes.remove(<EnderIO:blockAlloySmelter>);
NEI.hide(<EnderIO:blockSagMill>);
NEI.hide(<EnderIO:blockAlloySmelter>);

// ProjectRed Expansion brings its own power and ore processing
val expansion = [
    <ProjRed|Expansion:projectred.expansion.battery>,
    <ProjRed|Expansion:projectred.expansion.electric_screwdriver>,
    <ProjRed|Expansion:projectred.expansion.emptybattery>,
    <ProjRed|Expansion:projectred.expansion.infused_ender_pearl>,
    <ProjRed|Expansion:projectred.expansion.jetpack>,
    <ProjRed|Expansion:projectred.expansion.machine1:*>,
    <ProjRed|Expansion:projectred.expansion.machine2:*>,
    <ProjRed|Expansion:projectred.expansion.plan>,
    <ProjRed|Expansion:projectred.expansion.solar_panel>
] as minetweaker.item.IItemStack[];
for item in expansion {
    recipes.remove(item);
    NEI.hide(item);
}
