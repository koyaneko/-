#!/bin/bash
########################################
#         jankengame
########################################
#
# 実行形式
#  janken.sh 
#
########################################

# 何本勝負か
# readonly GAME_TIMES=5
# 先取数
# readonly FIRST_TO_GET_CNT=$((${GAME_TIMES} / 2 + 1)) 
readonly FIRST_TO_GET_CNT=3

game_count=1                #現在何番戦か
player_win_cnt=0            #プレイヤー勝利数
cpu_win_cnt=0               #CPU勝利数
# aiko_flg=false              #あいこかどうかのフラグ


#繰り返し
while true; do
    # 続けるかどうかの判定
    # プレイヤー勝利数が設定勝利数以上であれば抜ける
    if [ ${player_win_cnt} -ge ${FIRST_TO_GET_CNT} ]; then
        break
    fi
    # CPU勝利数が設定勝利数以上であれば抜ける
    if [ ${cpu_win_cnt} -ge ${FIRST_TO_GET_CNT} ]; then
        break
    fi

    # 相手の手を生成する
    janken=$(($RANDOM % 3)) 

    # 値に応じて表示用に変数に格納する
    if [ $janken = 0 ]; then
        com_hand_dec="グー"
    elif [ $janken = 1 ]; then
        com_hand_dec="チョキ"
    elif [ $janken = 2 ]; then
        com_hand_dec="パー"
    else
        echo "コンピュータの手が正しく処理されませんでした、ゲームを終了します"
        exit 1
    fi

    # ゲーム開始
    echo "${game_count}回戦目です"
    sleep 1
    echo "グー・チョキ・パーのどれかを入力してください"

    #私の手
    read -p "最初はグー！じゃんけん:" yourhand
    echo "あなたの手:"$yourhand

    #相手の手出力
    echo "コンピュータの手 : "$com_hand_dec

    # あいこだった場合は、勝敗判定をせずに次のループへ進む
    if [ $com_hand_dec = $yourhand ]; then
        echo "あいこです、もう一度遊びましょう"
        continue
    fi
    
    # 勝敗判定
    if [ $com_hand_dec = "グー" ]; then
        if [ $yourhand = "パー" ]; then
            # 勝ちの場合
            echo "おめでとうございます！あなたの勝ちです！"
            player_win_cnt=$((${player_win_cnt} + 1))
        else
            # 負けの場合
            echo "あなたの負けです"
            cpu_win_cnt=$((${cpu_win_cnt} + 1))
        fi
        game_count=$((${game_count} + 1))
        continue 
    fi

    if [ $com_hand_dec = "チョキ" ]; then
        if [ $yourhand = "グー" ]; then
            # 勝ちの場合
            echo "おめでとうございます！あなたの勝ちです！"
            player_win_cnt=$((${player_win_cnt} + 1))
        else
            # 負けの場合
            echo "あなたの負けです"
            cpu_win_cnt=$((${cpu_win_cnt} + 1))
        fi
        game_count=$((${game_count} + 1))
        continue 
    fi

    if [ $com_hand_dec = "パー" ]; then
        if [ $yourhand = "チョキ" ]; then
            # 勝ちの場合
            echo "おめでとうございます！あなたの勝ちです！"
            player_win_cnt=$((${player_win_cnt} + 1))
        else
            # 負けの場合
            echo "あなたの負けです"
            cpu_win_cnt=$((${cpu_win_cnt} + 1))
        fi
        game_count=$((${game_count} + 1))
        continue 
    fi
done

# 最終判定
if [ ${player_win_cnt} -gt ${cpu_win_cnt} ]; then
    # 勝ちの場合
        # 敗北時コメントをランダムに設定する
    SHOURI=$(($RANDOM % 10)) 
    if [ $SHOURI = 0 ]; then
        you_win_dec="おめでとうございます！あなたの勝ちです！"
    elif [ $SHOURI = 1 ]; then
        you_win_dec="あなたの勝ちです！遊びに行きましょう！"
    elif [ $SHOURI = 2 ]; then
        you_win_dec="あなたの勝ちです…。もう一回！もう一回やりましょう！"
    elif [ $SHOURI = 3 ]; then
        you_win_dec="やりますね…。次は負けませんよ？"
    elif [ $SHOURI = 4 ]; then
        you_win_dec="おめでとうございます。あなたの勝利です！今日はお菓子パーティーをしましょう！"
    elif [ $SHOURI = 5 ]; then
        you_win_dec="おめでとうございます！今日はきっと良いことがありますよ！"
    elif [ $SHOURI = 6 ]; then
        you_win_dec="残念、私の負けです。ゲーム周回を許可します。"
    elif [ $SHOURI = 7 ]; then
        you_win_dec="You Win! congratulation!!"
    elif [ $SHOURI = 8 ]; then
        you_win_dec="私が負けるなんて！そ、その力はまさか…！！"
    elif [ $SHOURI = 9 ]; then
        you_win_dec="おめでとうございます！あなたの勝ちです！…もう一度やりませんか？"
    else
        echo "勝利時のコメントが正しく処理されませんでした、ゲームを終了します"
        exit 1
    fi
    echo $you_win_dec
else
    # 負けの場合
    # 敗北時コメントをランダムに設定する
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
        you_loose_dec="残念。あなたの負けです。飲み会もほどほどに。"
    elif [ $HAIBOKU = 5 ]; then
        you_loose_dec="残念、あなたの負けです。今日の夕飯は白米禁止です。"
    elif [ $HAIBOKU = 6 ]; then
        you_loose_dec="残念、私の勝ちです。ゲームはログインだけなら許可します。"
    elif [ $HAIBOKU = 7 ]; then
        you_loose_dec="残念、あなたの負けです。今日は動画鑑賞禁止です。"
    elif [ $HAIBOKU = 8 ]; then
        you_loose_dec="残念だったな。怖いか？この力が・・・。"
    elif [ $HAIBOKU = 9 ]; then
        you_loose_dec="残念、私の勝ちです。またの挑戦をお待ちしております。"
    else
        echo "敗北時のコメントが正しく処理されませんでした、ゲームを終了します"
        exit 1
    fi
    echo $you_loose_dec
fi

exit 0
