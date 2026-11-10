import mods.nei.NEI;

// Turtles mine ores directly, so they cost more than the vanilla recipe
val steel = <ore:plateSteel>;
val aluminium = <ore:plateAluminium>;

recipes.remove(<ComputerCraft:CC-TurtleExpanded>, true);
recipes.addShaped(<ComputerCraft:CC-TurtleExpanded>, [
    [steel, <IC2:itemPartCircuit>, steel],
    [steel, <ComputerCraft:CC-Computer>, steel],
    [steel, <minecraft:chest>, steel]]);

recipes.remove(<ComputerCraft:CC-TurtleAdvanced>, true);
recipes.addShaped(<ComputerCraft:CC-TurtleAdvanced>, [
    [aluminium, <IC2:itemPartCircuitAdv>, aluminium],
    [aluminium, <ComputerCraft:CC-Computer:16384>, aluminium],
    [aluminium, <minecraft:chest>, aluminium]]);

NEI.hide(<ComputerCraft:CC-Turtle>);
