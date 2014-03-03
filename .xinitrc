
export LANG=zh_CN.UTF-8
export LCALL=zh_CN.UTF-8

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

fcitx &

exec openbox-session
#exec gnome-session

