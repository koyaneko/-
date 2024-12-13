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
HAIBOKU=$(($RANDOM % 10)) 

 if [ $HAIBOKU = 0 ]; then
  you_loose_dec="残念、あなたの負けです。外出は控えましょう。"
 elif [ $HAIBOKU = 1 ]; then
  you_loose_dec="残念、私の勝ちです。1時間勉強しましょう。約束ですよ？"
 elif [ $HAIBOKU = 2 ]; then
  you_loose_dec="残念、私の勝ちです。私に勝とうなんて100年早いです。"
 elif [ $HAIBOKU = 3 ]; then
  you_loose_dec="残念、あなたの負けです。今日は甘いものは控えましょう。"
 elif [ $HAIBOKU = 4 ]; then
  you_loose_dec="残念だったな。怖いか？この力が・・・。"
 elif [ $HAIBOKU = 5 ]; then
  you_loose_dec="残念、あなたの負けです。今日の夕飯は白米禁止です。"
 elif [ $HAIBOKU = 6 ]; then
  you_loose_dec="残念、私の勝ちです。ゲームはログインだけなら許可します。"
 elif [ $HAIBOKU = 7 ]; then
  you_loose_dec="残念、あなたの負けです。今日は動画鑑賞禁止です。"
 elif [ $HAIBOKU = 8 ]; then
  you_loose_dec="残念。あなたの負けです。飲み会もほどほどに。"
 elif [ $HAIBOKU = 9 ]; then
  you_loose_dec="残念、私の勝ちです。またの挑戦をお待ちしております。"
 else
  echo "敗北時のコメントが正しく処理されませんでした、ゲームを終了します"
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
 else
  break;
 fi
done




 if [ $com_hand_dec = "グー" ]; then
  if [ $yourhand = "パー" ]; then
   echo "おめでとうございます！あなたの勝ちです！"
   exit 0;
  else
  echo $you_loose_dec
  exit 0;
  fi
 fi

 if [ $com_hand_dec = "チョキ" ]; then
  if [ $yourhand = "グー" ]; then
   echo "おめでとうございます！あなたの勝ちです！"
   exit 0;
  else
   echo $you_loose_dec
   exit 0;
  fi
 fi

 if [ $com_hand_dec = "パー" ]; then
  if [ $yourhand = "チョキ" ]; then
   echo "おめでとうございます！あなたの勝ちです！"
   exit 0;
  else
   echo $you_loose_dec
   exit 0;
  fi
 fi








