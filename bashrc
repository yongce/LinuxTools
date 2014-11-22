#1. Show git branch in shell prompt when possible
PS1='[PWD: ${debian_chroot:+($debian_chroot)}\w]  $(parse_git_branch)\n$ '

function parse_git_branch {
    git rev-parse --abbrev-ref HEAD
    #git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#2. Aliases
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#3. Setup ccache for Android building
# The last step is to execute 'prebuilt/linux-x86/ccache/ccache -M 20G
export USE_CCACHE=1
export CCACHE_DIR="/home/yongce/work/.ccache"

#4. Set Env for Android SDK Tools
kernal_name=`uname -s`
if [ $kernal_name = "Darwin" ]; then
    Android_SDK_Root=/Users/pub/tools/android-sdk
else
    Android_SDK_Root=/home/pub/tools/android-sdk
fi
Android_SDK_BuildTools=$Android_SDK_Root/build-tools
Android_SDK_BuildTools_SubPath=`ls $Android_SDK_BuildTools | sort | tail -1`
Android_SDK_Dirs=$Android_SDK_Root/tools:$Android_SDK_Root/platform-tools:$Android_SDK_BuildTools/$Android_SDK_BuildTools_SubPath
Android_NDK=/home/pub/tools/android-sdk-linux/ndk/android-ndk
export PATH=$Android_SDK_Dirs:$Android_NDK:$PATH
export ANDROID_SDK_HOME=$Android_SDK_Root
export ANDROID_NDK_HOME=$Android_NDK
export ANDROID_HOME=$Android_SDK_Root

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

#7. Gradle
Gradle_Root=/home/pub/tools/gradle
export PATH=$Gradle_Root/bin:$PATH

#8 Export HTTP proxy
alias exportHttpProxy='export HTTP_PROXY=127.0.0.1:8118 && export HTTPS_PROXY=127.0.0.1:8118'

#9 Git log graph
alias showGitGraph='git log --oneline --graph --decorate'
