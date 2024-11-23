#!/bin/bash
########################################
#         jankengame
########################################
#
# 実行形式
#  janken.sh 
#
########################################

#相手の手
while true
do
janken=$(($RANDOM % 3)) 

if [ $janken = 0 ]; then
 com_hand_dec="グー"
elif [ $janken = 1 ]; then
 com_hand_dec="チョキ"
elif [ $janken = 2 ]; then
 com_hand_dec="パー"
else
 echo "コンピュータの手が正しく処理されませんでした、ゲームを終了します"
 exit 1;
fi

#ゲーム開始
echo "グー・チョキ・パーのどれかを入力してください"

#私の手
read -p "最初はグー！じゃんけん:" yourhand
echo "あなたの手:"$yourhand

#相手の手出力
echo "コンピュータの手 : "$com_hand_dec

#勝敗コメント
if [ $com_hand_dec = $yourhand ]; then
 echo "あいこです、もう一度遊びましょう"
fi

if [ $com_hand_dec = "グー" ]; then
 if [ $yourhand = "パー" ]; then
  echo "おめでとうございます！あなたの勝ちです！"
  break;
 else
  echo "残念、あなたの負けです。外出は控えましょう。"
  break;
 fi
fi

if [ $com_hand_dec = "チョキ" ]; then
 if [ $yourhand = "グー" ]; then
  echo "おめでとうございます！あなたの勝ちです！"
  break;
 else
  echo "残念、あなたの負けです。壺を買ったりしないようにしましょう。"
  break;
 fi
fi

if [ $com_hand_dec = "パー" ]; then
 if [ $yourhand = "チョキ" ]; then
  echo "おめでとうございます！あなたの勝ちです！"
  break;
 else
  echo "残念、あなたの負けです。転ばないように注意しましょう。"
  break;
 fi
fi
done







