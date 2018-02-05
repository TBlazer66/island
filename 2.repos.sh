 #!/bin/bash
#  
# 
# 
#  keep a log named by time stamp
set -u
app=$(basename $0)
mkdir $HOME/logs
pathto=/logs
timename=$(date +"%m-%d-%Y_%H-%M-%S")
out=$HOME$pathto/$timename.log

echo "basename dollar sign zero is" $app
echo "path is" $pathto
echo "Munged time is" $timename
echo "out fn is $out"
echo "Time is $timename " | tee -a "$out"

TITLE='Builder'
VER='.1'

#Constants

declare -ir SUCCESS=0
declare -ir E_FATAL=1

trap_err() 
   {
      echo " $(caller) errexit on line $1 $BASH_COMMAND exit status=$2" >&2
   }
trap 'trap_err ${LINENO}  $?' ERR

  if [ -z ${EDITOR:-""} ] ; then
        #export EDITOR=gedit
        export EDITOR=$(which geany) 
      fi

usage()
{
cat <<EOM
$TITLE v$VER
---------------------------------------------------------------------------
Usage: $(basename $0) [options]



  -q, --quiet    disabled # [ ${QUIET} ] || notify
  -h, --help     Display this help and exit
  -v, --version  Output version information and exit

EOM
    exit $1
}

# $1 ERR_NO, $2 message
fatal_error()
{
    echo -e "Error #$1: $2" >&2
    echo
    usage $1
}

# display script version
version()
{
    echo "$app v$VER"
    exit $SUCCESS
}

#User confirmation
confirm()
{
    MSG="Do you want to do something?"
    zenity --question --text="$MSG" --title="$TITLE" --display=:0 || exit $SUCCESS
}

#User notification
notify()
{
    MSG="processing complete"
    notify-send "$TITLE" "$MSG" || exit $SUCCESS
}

# Parse command line for options
if (( $# ))
then
    case $1 in

        -h | --help | -\?)  usage $SUCCESS;;
        -v | --version)     version;;
        *)      fatal_error $E_FATAL "Unknown argument \"$1\"";;
    esac
else
    confirm
fi
#####


#gedit $out & #this works great
#but we're working up to where geany might work instead
$EDITOR $app & 
cat $app | tee -a "$out"
echo "duration=$SECONDS"  | tee -a "$out"
exit $SUCCESS

