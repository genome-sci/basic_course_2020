# バッチジョブ
#### 国立遺伝学研究所　森宙史

### バッチジョブとは?

- コマンド入力と応答というようなインタラクティブな逐次処理ではなく、一連の処理を最初に入力した後、順次処理を実行するような処理の形式  
- 上記は、UNIXコマンドを一つ一つ入力して処理を実行する形式と、シェルスクリプトを記述して一気に処理を実行する形式、として考えることができる    
- つまり、バッチジョブの一例が、シェルスクリプトを記述して一気に処理を実行することである  　 
　  
### 遺伝研スパコンにおけるバッチジョブの実行方法

詳しくは、  
- [スーパーコンピュータシステムの基本的な利用方法](https://sc2.ddbj.nig.ac.jp/index.php/ja-howtouse)  
- [UGEのその他の利用方法について](https://sc2.ddbj.nig.ac.jp/index.php/ja-uge-additional)  

に書かれている。  
　  
### 遺伝研スパコンにおけるバッチジョブの実行

1. FileZillaで遺伝研スパコンのホームディレクトリ上に、下記のbatch1.shファイルを作成

batch1.sh
```
#!/bin/bash
#$ -S /bin/bash
#$ -N knowhost
#$ -cwd
sleep 7
hostname > hos.txt
```

2. TeraTerm or ターミナル等を用いてsshで遺伝研スパコンにログインし、qlogin後、下記のコマンドを実行  
`chmod u+x batch1.sh`  
`./batch1.sh`  
`cat hos.txt`  
`qsub batch1.sh`  
`qstat`  
`cat hos.txt`  

3. コードの解説  
`#$` はqsubコマンドに渡すオプションを記述  
`-S /bin/bash` はqsubでスクリプトの解釈にbashシェルを用いることを指定  
`-N knowhost` はジョブの名前をジョブスクリプト名ではなくknowhostに変更  
`-cwd` はジョブをカレントディレクトリで実行することを指定  
`>` は左側のコマンドの結果を右側のファイルに書き込む  
　  

