# 修士論文のフォーマット

⚠ READMEファイルは必ず最後まで読んでください．

### ディレクトリ構造

- `fig/` ：図のフォルダー
    - `thesis/`
    - `paper/`（abstract用）
    - `slide/`
- `src/` ：texファイルのフォルダー．
    - `thesis/`
        - `thesis.tex`（メインのファイル）
        - `chap*.tex`
    - `paper/` (abstract用)
        - `paper.tex`（メインのファイル）
        - `sec*.tex`
    - `slide/`
        - `slide.tex`（メインのファイル）
        - `sec*.tex`
        - `app.tex`（appendix用）
- `sty/` ：texスタイルファイルのフォルダー．
    - `private.sty`: タイトル名や氏名などを記入．
    - `thesis.sty`
    - `paper.sty`
    - `slide.sty`
- `.bib` ：参考文献のファイル
- `Makefile` ：コンパイルおよびpdf生成を行うためのファイル

### コンパイルおよびpdf作成方法

`Makefile`が存在するディレクトリで，ターミナルに`make`と入力して実行してください．また`make MODE=paper`で`paper.pdf`を，`make MODE=slide`で`slide.pdf`を作成することができます．

うまくいかないときは，`make clean`と入力してください．pdfファイルと中間生成ファイルが削除されます．

⚠ 自動ビルドや保存時ビルドを利用されている場合は，おそらくエラーが出ると思います．そのためこのフォーマットを使用される場合は，`setting.json`に
```
"latex-workshop.latex.autoBuild.run": "never",
```
を追加されることを推奨します．

### 図の挿入方法

図のパスは`Makefile`からの相対パスになります．なので`fig/slide/1-1.pdf`をslideの`sec1.tex`で挿入したい場合は，
```
\begin{figure}
    \centering
    \includegraphics[width=\linewidth]{fig/slide/1-1.pdf}
    \caption[パイプラインの概要]{パイプラインの概要を示す．}
    \label{fig:overview_of_pipeline}
\end{figure}
```
といった感じになります．

### 修士論文の執筆について 

いつ執筆を開始するかは個人によってさまざまだと思いますが，執筆にかかりそうな時間を早めに概算しておくことを推奨します．

また，このフォーマット作成者は以下の三つのサイトを参考にして執筆を進めました．完遂しないとしても，書き方を知るうえではたいへん参考になるかと思います．（2と3は研究室内でよく共有されているものです．）

1. [卒業論文・修士論文の書き方](https://www.graco.c.u-tokyo.ac.jp/labs/morihata/thesis_memo.htm)
2. [LaTexにおける正しい論文の書き方](https://qiita.com/birdwatcher/items/5ec42b35d84d3ee2ffbb)
3. [卒論・修論チェックリスト](https://qiita.com/tttamaki/items/f553e4cb9f4f08cc8872)

### スライドの作成について

本フォーマット作成者は，個人的にスライド作成に思い入れがありますので，スライド作成において実施していただきたいことをいくつか書いておきます．

- 口頭練習を少なくとも10回は行ってください．練習すればするほど，表現のおかしな部分やスライドの必要なコンテンツに気付き，洗練されると思います．また「えー」や「えっと」を減らしたり，抑揚をつけて話しやすくなります．
- スライド作成にとりかかる前に，一度口頭だけで友人や研究室仲間に自分の研究を説明してみてください．特に，背景と貢献を意識してみると，研究の意義がはっきりします．また，このときに伝わった表現・内容と伝わらなかった表現・内容をしっかりと覚えておくことを推奨します．
- スライドや話す内容が，本当に必要かを吟味してください．発表は12分と，かなり限られています．にもかかわらず，フォーマットがあると不要なスライドや説明を含めてしまいがちです．（例えば，1秒しかみせない目次や貢献に関係ない関連研究など．）伝えたいことがしっかり伝わるように，過剰な情報や時間の無駄遣いは避けましょう．
- 発表は，見聞きする第二者がいて成り立ちます．よって，自分が話したいことを話すだけの発表は発表ではありません．how toを詳細に入れたくなる気持ちは十二分に分かりますが，まずは聴衆の興味を惹くように，研究意義や貢献を第一優先としてください．相手に「続きを聞きたい」と思わせられれば成功間違いなしです．
- 流れを意識してください．聴衆は，あなたとは異なる学問・分野を専攻しています．そのため，発表の流れが大きく異なることもよくあります．なので「次に〇〇の説明です．」と言われても，いままでの説明とのつながりがよくわからず，理解が困難になることはしばしば起こります．できるだけ，「なぜいまこれを説明されているのか」が伝わるようにスライドを構成してください．

#### 最後に，あなたの素敵な修士論文の完成と発表の成功をお祈りしています．<br>頑張ってください👍️