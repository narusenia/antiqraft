# antiqraft 設計メモ

Minecraft 1.7.10 / Forge 10.13.4.1614 の Modpack。工業・魔術・冒険の 3 本柱を、それぞれ独立して進められるようにする。

## 全体方針

- 難易度は GTNH より軽い。GT が工業の軸だが、GTNH ほど重くはしない
- 友人数人のマルチサーバー前提（ソロでもそのまま遊べる）
- Java 8 で開始。lwjgl3ify による Java 21 化は後で検証する
- 柱どうしの必須依存は作らない。共通点は素材体系で、他 Mod の金属部品・機械・道具を GT 流の部品（板・棒・ネジ・回路）から作る（魔術の研究や Infusion の手順は本家のまま）
- 魔術は工業の近道（Native Cluster による鉱石倍化など）として任意で使える。冒険の戦利品は「あると楽になる」程度
- レシピ変更は MineTweaker が基本。GT4 側に素材や機械を足すときだけ fork を触る
- 主要 Mod は GTNH の保守版を優先する。GT5u に依存していて動かない場合だけ元の版に戻す

## 工業

- IC2 Experimental + GregTech 4（Nukepowered 版の fork）
- Railcraft、BuildCraft、Applied Energistics 2、GraviSuite、Advanced Solar Panels、Forestry
- EnderIO：導管・移動（Travel Anchor など）・Dark Steel 装備・小物だけ。SAG Mill と Alloy Smelter は外す。Dark Steel は GT4 の合金扱い
- 入れない：Thermal Expansion、Mekanism
- 電力：EU → RF の一方向だけ。発電の進行は IC2/GT4 に一本化する。変換はまず Fox Power Converter を試し、ダメなら fork で電圧帯ごとの変換機を作る
- ComputerCraft は LV 帯（Turtle は重めのレシピ）、OpenComputers は MV〜EV 帯（部品の Tier 1/2/3 = MV/HV/EV 回路）
- ProjectRed：Core、Transmission、Integration、Fabrication、Illumination は ON。Exploration は鉱石生成を止め、大理石・玄武岩だけ残す。Expansion は OFF。Electrotine は GT4 の機械で作れるようにする

## 魔術

- Thaumcraft 4 が主役、2 つ目に Blood Magic
- アドオン：Electro-Magic Tools、Thaumic Energistics、Thaumic Tinkerer（Kami 系は外す）、Thaumic Horizons、Automagy、Forbidden Magic、Witching Gadgets、Thaumic Additions: Reconstructed、Forgotten Relics
- QoL：Thaumcraft NEI Plugin、Thaumcraft 4 Tweaks

## 冒険

- Biomes O' Plenty + 地上の構造物（Roguelike Dungeons と Battle Towers は標準より少なめ、Ruins は標準）
- 異世界は Twilight Forest のみ（Galacticraft は後から検討）
- Twilight Forest の GT 化
  - Ironwood、Steeleaf、Knightmetal、Fiery を GT4 の素材として fork で登録する。必須にはせず、性能のいい選択肢として扱う
  - 道具・防具は GT 化する。ボスのドロップとポータルはそのまま
  - Uncrafting Table は無効化する
- 戦闘：Infernal Mobs、Special Mobs。Infernal Mobs の強すぎるドロップは外す
- 食事：Pam's HarvestCraft を入れる。Spice of Life は入れない

## バックポート

Et Futurum Requiem。

- ON：建材・装飾、新しい Mob・食料・小物、エンチャント・金床まわり、Elytra（ジ・エンド後）
- Netherite は GT4 の素材扱いにする
- OFF：深層岩の生成、銅鉱石の生成、ネザーアップデート（ネザーは BoP に任せる）

## 鉱石生成

- 各 Mod の生成を残し、重複だけ止める。銅・スズは IC2 に、Cinnabar は Thaumcraft に一本化する
- アイテムは GT4 の統一機能で 1 種類にまとめる
- GT5 風の鉱脈生成は、パックが一通り動いた後の検討候補

## QoL

NotEnoughItems（GTNH 版）、NEI Integration、Waila + Waila Harvestability、JourneyMap、Inventory Tweaks、Mouse Tweaks、Iron Chests（GT 化）、Storage Drawers、Adventure Backpack、Chisel 2、Carpenter's Blocks、Gravestone 系、ServerUtilities、Hodgepodge、ArchaicFix、Angelica、InputFix（日本語入力）、Damage Indicators。

- VeinMiner：木と石だけ。鉱石は対象外
- Waystones：構造物の近くにも生成（少なめ）

## 見た目

- 各 Mod の標準テクスチャを使う。fork で足す素材と機械は GT4 の画風に合わせる
- 描画は Angelica。GT4 で問題が出たら OptiFine を各自で導入する

## 進行の案内

BetterQuesting。導入タブ + 工業・魔術・冒険の 3 タブ。報酬は控えめ。まず序盤から作り、遊びながら中盤以降を足す。

## 管理と配布

- packwiz で管理し、packwiz-installer で配る。jar はリポジトリに置かない（自作 jar を除く）
- ツールは mise で管理する（JDK 8、packwiz など）
- リポジトリ
  - 本体：`git@github.com:narusenia/antiqraft.git`
  - GT4 fork：`git@github.com:narusenia/gregtech4-antiq-fork.git`（本体に submodule としてつなぐ）
- GT4 fork のビルド：まず元の構成（anatawa12 ForgeGradle 1.2 + Gradle 4.4.1 + JDK 8）のまま通す。Mixin が必要になったら RetroFuturaGradle に移行する
- GT4 移植版は GPLv3。2026-02-09 にアーカイブ済みで、上流からの修正は出ない

## 構成

```
antiqraft/
├── pack/          # packwiz（Mod 一覧、config、MineTweaker スクリプト、クエスト）
├── gregtech4/     # GT4 の fork（git submodule）
└── docs/          # 設計メモ
```

## 進め方

1. 骨格（IC2、GT4、Thaumcraft、Twilight Forest、BoP など 20 個前後）だけで起動を確認する
2. Mod を足しながら、GTNH 保守版と GT4 の相性を 1 つずつ確認する
3. config（鉱石生成、構造物、Et Futurum、ProjectRed など）を調整する
4. MineTweaker で GT 化レシピを書く
5. fork で素材と機械を足す（Twilight Forest の金属、Netherite、Electrotine、電力変換機）
6. クエストを作る

## 未決定

- サーバーをどこで動かすか（メモリの割り当てにも影響する）
- Java 21 化（lwjgl3ify）を試すタイミング
