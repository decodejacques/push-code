unameOut="$(uname -s)"
case "${unameOut}" in
    CYGWIN*)    com=./rsync;;
    MINGW*)     com=./rsync;;
    *)          com=rsync
esac
echo ${machine}

if [ ! -f username.txt ]; then
    read -p "Write your name without spaces or capital letters: "
    echo "$REPLY" > username.txt
fi
username_d=`cat username.txt`
username="$(echo -e "${username_d}" | tr -d '[:space:]')"

echo "$username"
echo "password is decode"
$com -arv . --exclude 'node_modules/' --exclude upload.sh --exclude username.txt --exclude .git --exclude rsync.exe decode@decode:~/$username
