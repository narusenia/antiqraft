// ProjectRed: the motor shaft is a GT iron rod. Red alloy and wires have no crafting-table iron to swap here.
val motor = <ProjRed|Core:projectred.core.part:15>;
val copperCoil = <ProjRed|Core:projectred.core.part:16>;
val red = <ore:dustRedstone>;
val stone = <minecraft:stone>;

recipes.remove(motor);
recipes.addShaped(motor, [[null, <ore:stickIron>, null], [stone, copperCoil, stone], [red, copperCoil, red]]);
