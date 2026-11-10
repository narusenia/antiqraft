# antiqraft

Minecraft 1.7.10 / Forge 10.13.4.1614 の Modpack。設計の決定事項は `docs/design.md`。変える前に読み、決定が変わったら更新する。

## ルール

- コミットは Conventional Commits（`feat:` `fix:` `docs:` `chore:`）、1 行、本文なし
- Mod は GTNH の保守版（github.com/GTNewHorizons）を優先する。なければ CurseForge、それも無理なら URL 直指定
- GTNH 版の取得元は GTNH の Mod 一覧で調べられる: `https://raw.githubusercontent.com/GTNewHorizons/DreamAssemblerXXL/master/gtnh-assets.json`
- Mod を足したら必ず `tools/boot-test.sh` でサーバー起動を確認してからコミットする

## コマンド

```sh
cd pack && mise exec -- packwiz serve --port 8089   # 別シェルで起動しておく
tools/boot-test.sh                                    # 展開 → 起動 → 結果表示 → 停止
cd gregtech4 && mise exec -- sh ./gradlew build       # GT4 fork のビルド
```

## packwiz の落とし穴

- `packwiz init` は 1.7.10 の Forge 表記を受け付けないので、`pack.toml` は手で管理している
- GitHub Releases から取るときは `-dev` `-sources` `-api` `-preshadow` `-predowngrade` の jar を選ばない
- `packwiz curseforge add` は依存 Mod を自動で入れ、既存の定義を上書きすることがある。入れた後に `git status` で `M` が付いたファイルを確認する。過去に上書きされたもの: NEI と CodeChickenCore（元の版に）、UniMixins（古い版に）、Baubles（Baubles Expanded と重複）
- CurseForge API から除外された Mod（Thaumcraft NEI Plugin : Patched など）は、配布時にインストーラーが止まる。入れない
- クライアント専用の Mod は `side = "client"` にする（Damage Indicators、InputFix、JourneyMap、Mouse Tweaks、リソースパック）。サーバーで `NoClassDefFoundError: net/minecraft/client/...` が出たらこれ
- Ruins は zip 配布なので、中身（jar と `mods/resources/ruins/`）を `pack/mods/` に直接置いている
- `.gitattributes` の `pack/** -text` は消さない。改行が変わると packwiz の索引のハッシュと合わなくなる

## config

- `pack/config/` に置いたファイルは、配布先の同名ファイルを上書きする。変更したいファイルだけを置く
- 元になる初期値は、`tools/boot-test.sh` を一度回すと `.cache/server/config/` に生成される

## MineTweaker（CraftTweaker 3.5 GTNH 版）

- スクリプトは `pack/scripts/*.zs`
- アイテム ID は、サーバーのコンソールで `mt names` を実行すると `logs/minetweaker.log` に出る。鉱石辞書は `mt oredict <名前>`
- `loadedMods[...].items` と `<modid:*>` は使えない。アイテムは個別に列挙する（Botania の一覧は `mt names` から生成した）
- `mt reload` の結果は信用しない。`recipes.remove(出力)` は 1 つのアクションを使い回していて、1 回目に 0 件だと以降のリロードでは実行されない（`WAS STUCK`）。確認は必ずサーバーを起動し直して行う
- 削除件数の確かめ方：起動し直した直後に 1 回だけ `mt reload` を送ると、`Trying to restore N recipes` の N が起動時に消えた件数になる
- `mt recipes` の一覧はバニラ形式のレシピしか出さない（鉱石辞書レシピなどは出ない）ので、レシピの有無の確認には使わない
- `Batch Remove 0 recipes` は `removeShaped` 系の別経路のログで、`recipes.remove(出力)` とは無関係
- NBT 付きのバリエーションがあるアイテム（Turtle など）は `recipes.remove(item, true)` で素のものだけを消す
- GT4 の工具は鉱石辞書名（`<ore:craftingToolHardHammer>` `craftingToolFile` `craftingToolWrench` `craftingToolScrewdriver` `craftingToolSaw` など）を普通の材料として置く。工具は自分で耐久を減らすので `.transformDamage()` などは付けない（二重に減る）
- レシピの有無は `recipes.getRecipesFor(item).length` で確かめる。`.cache/server/scripts/zz_probe.zs` に `print("PROBE " ~ x.displayName ~ " " ~ recipes.getRecipesFor(x).length)` を書いて `tools/boot-test.sh` を回し、`logs/minetweaker.log` を `PROBE` で grep したら消す。配列は `as minetweaker.item.IItemStack[]` で型を付ける（map の反復は使えない）
  - 0 件なら「作業台レシピがない」と言える。逆に 1 件以上でも当てにならない（削除済みの Mana Spreader に 16 件と返した）。作れるかの最終確認はクライアントの NEI で行う
- GTNH 版の Mod には、レシピを GTNH の core mod に任せていて単体では作れないものがある（Railcraft のタンク、AE2 の Advanced Inscriber など）。Mod を足したら作れないアイテムがないか確かめる
- GT4 の機械レシピは `mods.gregtechmod.recipe.RecipeMaps.getRecipeMap("ALLOY_SMELTING").factory().inputs(...).output(...).EUt(16).duration(200).buildAndRegister()` で足せる。入力の鉱石辞書が空だと `An empty stack array` で止まる

## GT4 fork

- ビルドした jar は `pack/mods/gregtechmod-v<版>.jar` に直接置く（古い jar は消して `packwiz refresh`）。版は `build.gradle` の `version`。`v417.58` のように数字だけにする（`VERSION` の int に埋め込まれるので英字を付けるとビルドが壊れる）
- 素材は `Materials` enum。部品は ID（0〜999）と種類のビットから自動生成され、色は RGB で付くのでテクスチャは要らない。他 Mod がインゴットを持つ素材は `OrePrefixes` で `ingot.mNotGeneratedItems` に入れる（入れないと GT のインゴットが統一先になり、道具レシピの置き換えが効かない）
- 鉱石辞書名の素材部分は enum 名と大文字小文字まで一致させる。Twilight Forest の金属は GT4 側の名前が違う（`IronWood` `SteelLeaf` `FieryBlood`）。`GT_ItemIterator` が TF のインゴットをその名前でも登録している
- 道具・防具レシピの置き換えが効いたかは `.cache/server/config/GregTech/DynamicConfig.cfg` の `recipereplacements` に `<素材>.Pickaxe` などのキーが出るかで分かる
- GT4 の機械レシピは `RecipeMaps.getRecipeMap("BLAST_FURNACE").findRecipe([...], [])` で probe できる

## 起動時に出るが無害なエラー

- `joml ... module-info.class`（古い Forge が新しい jar を読もうとする）
- `IC2 is expecting signature`
- `[GregTech] Improperly registered Ore: ...`（他 Mod の鉱石辞書名が GT4 の命名規則に合わない）
- MineTweaker の `WeightedItemStack is already defined`
