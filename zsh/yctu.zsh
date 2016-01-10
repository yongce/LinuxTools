#0. Add "~/bin" to PATH
export PATH=~/bin:$PATH

#1. Aliases
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

#2. Setup ccache for Android building
# The last step is to execute 'prebuilt/linux-x86/ccache/ccache -M 20G
export USE_CCACHE=1
export CCACHE_DIR="$HOME/work/.ccache"

#3. Set Env for Android SDK Tools
kernal_name=`uname -s`
if [ $kernal_name = "Darwin" ]; then
    TOOLS_ROOT=/Users/pub/tools
else
    TOOLS_ROOT=/home/pub/tools
fi
Android_SDK_Root=$TOOLS_ROOT/android-sdk
Android_SDK_BuildTools=$Android_SDK_Root/build-tools
Android_SDK_BuildTools_SubPath=`ls $Android_SDK_BuildTools | sort | tail -1`
Android_SDK_Dirs=$Android_SDK_Root/tools:$Android_SDK_Root/platform-tools:$Android_SDK_BuildTools/$Android_SDK_BuildTools_SubPath
Android_NDK=$TOOLS_ROOT/android-ndk
export PATH=$Android_SDK_Dirs:$Android_NDK:$PATH
export ANDROID_NDK_HOME=$Android_NDK
export ANDROID_HOME=$Android_SDK_Root

#4. Dump certs from APK
function dumpcert() {
    CERT_FILE=`unzip -l $1 | grep META-INF | grep RSA | awk '{print $4}'`
    echo [`unzip -p $1 ${CERT_FILE} | keytool -printcert | grep SHA1\: | sed 's|SHA1:||g' | sed "s|\t ||g"`] = $1
}

function dumpcertfull() {
    CERT_FILE=`unzip -l $1 | grep META-INF | grep RSA | awk '{print $4}'`
    unzip -p $1 ${CERT_FILE} | keytool -printcert
}

#5. Android Studio (for Linux only)
Android_Studio_Root=/home/pub/tools/android-studio
export PATH=$Android_Studio_Root/bin:$PATH

#6 Export HTTP proxy
alias exportHttpProxy='export HTTP_PROXY=127.0.0.1:8118 && export HTTPS_PROXY=127.0.0.1:8118 && export http_proxy=127.0.0.1:8118 && export https_proxy=127.0.0.1:8118'

#7 Git log graph
alias showGitGraph='git log --oneline --graph --decorate'
