#!/usr/bin/env bash

###############################################################################
# Define You Address Here.                                                    #
###############################################################################
PYTHON_BUILD_MIRROR_URL=''


if [[ -z $PYTHON_BUILD_MIRROR_URL ]]; then
  echo "Invalid PYTHON_BUILD_MIRROR_URL."
  return 1
fi


OFFLINE_INSTALL_SCRIPT='pyenv-offline-installer'
PYENV_PACKAGE='pyenv-package.tar.gz'

TMP_DIR=$(mktemp -d)

# download files.
wget "$PYTHON_BUILD_MIRROR_URL/scripts/$OFFLINE_INSTALL_SCRIPT" -P "$TMP_DIR"
wget "$PYTHON_BUILD_MIRROR_URL/scripts/$PYENV_PACKAGE" -P "$TMP_DIR"

# install.
chmod +x "$TMP_DIR/$OFFLINE_INSTALL_SCRIPT"
bash "$TMP_DIR/$OFFLINE_INSTALL_SCRIPT"

# inform.
echo "# download from local mirror."
echo "export PYTHON_BUILD_MIRROR_URL=$PYTHON_BUILD_MIRROR_URL/pythons"
