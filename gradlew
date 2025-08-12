#!/usr/bin/env bash

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
#
#   Gradle start up script for UN*X
#
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass any JVM options to this script.
DEFAULT_JVM_OPTS=()

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

if [ `uname` = "Darwin" ]; then
    # Needed to be able to use "ps" to check if gradle is running
    # see https://github.com/gradle/gradle/issues/2301
    export G_BROKEN_PS_OPTIONS=1
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
    [ -n "$APP_HOME" ] &&
        APP_HOME=`cygpath --unix "$APP_HOME"`
    [ -n "$JAVA_HOME" ] &&
        JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Register all JVM options
# Creates a single string with all options separated by "|", to allow spaces in options
for ((i=0; i<${#DEFAULT_JVM_OPTS[@]}; i++)); do
    # The "|." is a temporary separator (so that the final separator can be "|")
    ALL_JVM_OPTS="$ALL_JVM_OPTS|.${DEFAULT_JVM_OPTS[$i]}"
done

# Remove the first "|."
if [ -n "$ALL_JVM_OPTS" ]; then
    ALL_JVM_OPTS="`echo $ALL_JVM_OPTS | sed 's/|.//'`"
fi

# Stop process if it is already running
if [ "$1" = "stop" ] ; then
    shift
    `$APP_HOME/$APP_BASE_NAME --stop`
    exit 0
fi

# For Darwin, add options to specify how the application appears in the dock
if [ `uname` = "Darwin" ]; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# Collect all arguments for the java command, following the shell quoting rules
# - Pass all of our options to the launcher, which will parse them
# - Pass all of the user's options to the launcher, which will parse them
# - Quote all of the user's arguments, so that the launcher can receive them correctly
local j=0
local quoted_args=
for ((i=0; i<${#@}; i++)); do
    local var="${@:i+1:1}"
    if [[ "$var" =~ ^-D.=-X ]]; then
        # The value of a -D option can be a system property like "-Xmx1g"
        # In this case, we pass the value to the launcher as a string literal.
        # This is done by quoting the value part of the option, so that it is not interpreted as a launcher option.
        local key=`echo $var | cut -d'=' -f1`
        local val=`echo $var | cut -d'=' -f2-`
        quoted_args[$j]="$key=\"$val\""
    else
        quoted_args[$j]="\"$var\""
    fi
    j=$((j+1))
done

# The launcher will receive all options from this script and all options from the user.
# It will use them to configure the JVM and the application.
# It will also receive all arguments from the user, which it will pass to the application.
eval "\"$JAVA_EXE\"" $ALL_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS \
    "\"-Dorg.gradle.appname=$APP_BASE_NAME\"" \
    -classpath "\"$APP_CLASSPATH\"" \
    org.gradle.launcher.GradleMain "${quoted_args[@]}"
