set -e
export DEBFULLNAME="alive4ever"
export DEBEMAIL="alive4ever@users.noreply.github.com"
mkdir -p ~/build
cd ~/build
git clone https://github.com/cloudflare/boringtun
echo "Installing latest rust..."
curl -Lo ~/rust-bootstrap.sh https://sh.rustup.rs
chmod +x ~/rust-bootstrap.sh
~/rust-bootstrap.sh -y -v
echo "Finished installing latest rust..."
export PATH="$HOME/.cargo/bin:$PATH"
rustc --version
cargo install cargo-deb
cd boringtun
cargo deb --deb-version 0.0.1-bpo01
mkdir -p /tmp/hosttmp/boringtun_deb
cp -v ./target/debian/*deb /tmp/hosttmp/boringtun_deb/

