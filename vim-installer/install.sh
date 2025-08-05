#!/usr/bin/env bash
set -euo pipefail

VIM_VERSION="${1:-9.1.1157}"
VIM_TARBALL="vim-${VIM_VERSION}.tar.gz"
VIM_DIR="vim-${VIM_VERSION}"
VIM_URL="https://github.com/vim/vim/archive/v${VIM_VERSION}.tar.gz"
INSTALL_PREFIX="${HOME}/local"
BUILD_CORES="$(nproc 2>/dev/null || sysctl -n hw.ncpu)"
CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

export LANG=C
export PATH="/usr/local/bin:$PATH"

log() { echo -e "\033[1;32m[INFO]\033[0m $*"; }
warn() { echo -e "\033[1;33m[WARN]\033[0m $*"; }
error() { echo -e "\033[1;31m[ERROR]\033[0m $*" >&2; exit 1; }

install_deps_macos() {
  log "Installing dependencies (macOS)"
  brew update
  brew install lua python3 ruby perl wget ctags gcc
}

install_deps_ubuntu() {
  log "Installing dependencies (Ubuntu)"
  sudo apt update
  sudo apt install -y \
    lua5.4 liblua5.4-dev \
    python3 python3-dev \
    ruby ruby-dev \
    perl \
    wget curl \
    build-essential \
    libgtk2.0-dev \
    ctags
}

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos";;
    Linux) echo "linux";;
    *) error "Unsupported OS: $(uname -s)";;
  esac
}

download_source() {
  log "Downloading Vim ${VIM_VERSION} source..."
  if [ ! -f "${CURRENT_DIR}/${VIM_TARBALL}" ]; then
    wget -O "${CURRENT_DIR}/${VIM_TARBALL}" "${VIM_URL}"
  else
    warn "Tarball already exists, skipping download."
  fi
}

extract_source() {
  log "Extracting source..."
  tar zxf "${CURRENT_DIR}/${VIM_TARBALL}" -C "${CURRENT_DIR}"
}

configure_build() {
  local lua_path
  lua_path="/usr/local/"
  [ "$1" = "linux" ] && lua_path="/usr/"

  log "Configuring Vim build..."
  ./configure \
    --prefix="${INSTALL_PREFIX}" \
    --enable-multibyte \
    --enable-perlinterp=yes \
    --enable-python3interp=yes \
    --enable-rubyinterp=yes \
    --enable-luainterp=yes \
    --with-lua-prefix="${lua_path}" \
    --with-python3-command="python3" \
    --enable-fontset \
    --disable-selinux \
    --enable-cscope \
    --enable-terminal \
    --enable-gui=gtk2 \
    --with-x \
    --with-compiledby="hiroshi.ikegami@magicdrive.jp"
}

build_and_install() {
  log "Building Vim (using ${BUILD_CORES} cores)..."
  make -j "${BUILD_CORES}"
  log "Installing Vim..."
  make install
}

cleanup() {
  log "Cleaning up..."
  rm -rf "${CURRENT_DIR:?}/${VIM_DIR}"
}

main() {
  local os
  os=$(detect_os)

  log "Detected OS: $os"
  [ "$os" = "macos" ] && install_deps_macos
  [ "$os" = "linux" ] && install_deps_ubuntu

  cd "${CURRENT_DIR}"
  download_source
  extract_source

  cd "${CURRENT_DIR}/${VIM_DIR}"
  mkdir -p "${INSTALL_PREFIX}/share/applications"
  configure_build "$os"
  build_and_install
  cleanup

  log "✅ Vim ${VIM_VERSION} installed successfully!"
  "${INSTALL_PREFIX}/bin/vim" --version | head -n 1
}

main "$@"

