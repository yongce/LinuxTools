#1. Show git branch in shell prompt when possible
PS1='[PWD: ${debian_chroot:+($debian_chroot)}\w]  $(parse_git_branch)\n$ '

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#2. Aliases for cd
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

#3. Setup ccache for Android building
# The last step is to execute 'prebuilt/linux-x86/ccache/ccache -M 20G
export USE_CCACHE=1
export CCACHE_DIR="/home/yongce/work/.ccache"

#4. Set Env for Android SDK Tools
Android_SDK_Tools=/home/pub/tools/android-sdk-linux_x86/tools
Android_SDK_Platform_Tools=/home/pub/tools/android-sdk-linux_x86/platform-tools
Android_NDK=/home/pub/tools/android-ndk-r7
export PATH=$Android_SDK_Tools:$Android_SDK_Platform_Tools:$Android_NDK:$PATH

#5. Dump certs from APK
function dumpcert() {
    CERT_FILE=`unzip -l $1 | grep META-INF | grep RSA | awk '{print $4}'`
    echo [`unzip -p $1 ${CERT_FILE} | keytool -printcert | grep SHA1\: | sed 's|SHA1:||g' | sed "s|\t ||g"`] = $1
}

function dumpcertfull() {
    CERT_FILE=`unzip -l $1 | grep META-INF | grep RSA | awk '{print $4}'`
    unzip -p $1 ${CERT_FILE} | keytool -printcert
}

