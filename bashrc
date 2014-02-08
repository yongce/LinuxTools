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
Android_SDK_Root=/home/pub/tools/android-sdk-linux
Android_SDK_BuildTools=$Android_SDK_Root/build-tools
Android_SDK_BuildTools_SubPath=`ls $Android_SDK_BuildTools | sort | tail -1`
Android_SDK_Dirs=$Android_SDK_Root/tools:$Android_SDK_Root/platform-tools:$Android_SDK_BuildTools/$Android_SDK_BuildTools_SubPath
Android_NDK=/home/pub/tools/android-sdk-linux/ndk/android-ndk
export PATH=$Android_SDK_Dirs:$Android_NDK:$PATH

#5. Dump certs from APK
function dumpcert() {
    CERT_FILE=`unzip -l $1 | grep META-INF | grep RSA | awk '{print $4}'`
    echo [`unzip -p $1 ${CERT_FILE} | keytool -printcert | grep SHA1\: | sed 's|SHA1:||g' | sed "s|\t ||g"`] = $1
}

function dumpcertfull() {
    CERT_FILE=`unzip -l $1 | grep META-INF | grep RSA | awk '{print $4}'`
    unzip -p $1 ${CERT_FILE} | keytool -printcert
}

#6. Android Studio
Android_Studio_Root=/home/pub/tools/android-studio
export PATH=$Android_Studio_Root/bin:$PATH
