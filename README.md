# antiqraft

Minecraft 1.7.10 の Modpack。IC2 Experimental + GregTech 4 の工業、Thaumcraft 4 の魔術、Biomes O' Plenty と Twilight Forest の冒険を、それぞれ独立して進められるようにまとめたもの。他 Mod の金属部品・機械・道具は GT 流の部品から作る。

設計の決定事項は [docs/design.md](docs/design.md) にある。

## 遊び方（Prism Launcher）

1. Minecraft 1.7.10 + Forge 10.13.4.1614 のインスタンスを作る。Java は 8
2. インスタンスの `.minecraft/` に [packwiz-installer-bootstrap.jar](https://github.com/packwiz/packwiz-installer-bootstrap/releases) を置く
3. インスタンスの設定 →「カスタムコマンド」の Pre-launch command に次を入れる

   ```
   $INST_JAVA -jar packwiz-installer-bootstrap.jar -g <pack.toml の URL>
   ```

   - `$INST_JAVA` を引用符で囲まない（Prism が壊す）
   - `-g` を外さない（macOS でインストーラーのウィンドウが残り、起動が止まる）
4. 起動すると、Mod と config が自動で取得・更新される

リソースパック（Modernity、Modernity Adjunct）は同梱しているが、自動では有効にならない。オプションのリソースパック画面で選ぶ。

## 構成

```
pack/        packwiz のパック（Mod の定義、config、MineTweaker スクリプト、リソースパック）
gregtech4/   GT4 の fork（submodule: narusenia/gregtech4-antiq-fork）
docs/        設計メモ
tools/       開発用スクリプト
```

## 開発

ツールは mise で入る（JDK 8、Go、packwiz）。

```sh
mise install
git submodule update --init

# GT4 fork のビルド（gradlew に実行権限がないので sh 経由）
cd gregtech4 && mise exec -- sh ./gradlew build
cp build/libs/gregtechmod-*.jar ../pack/mods/

# パックの配信（ローカルで Prism や起動確認から読む）
cd pack && mise exec -- packwiz serve --port 8089

# サーバーで起動確認（別のシェルで。初回は Forge サーバーを .cache/ に用意する）
tools/boot-test.sh
```

Mod の追加は `packwiz curseforge add` か `packwiz url add`。GTNH が保守している版を優先する。

## ライセンス

- GT4 fork は GPLv3（上流: [Nukepowered/GregTech4](https://github.com/Nukepowered/GregTech4)）
- `pack/mods/` に直接置いている jar（GT4、Ruins）以外の Mod は、配布元から各自の環境にダウンロードされる
