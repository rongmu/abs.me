# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Eric Yu <eric.rongmu@gmail.com>

pkgname=NAME # required
pkgver=VERSION # required
pkgrel=1 # required
epoch=
pkgdesc=""
arch=('i686' 'x86_64') # required
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=() # only considered when the check() function is present
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.patch)
noextract=()
md5sums=() # generate with 'makepkg -g'

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim:set ft=sh ts=2 sw=2 et:
