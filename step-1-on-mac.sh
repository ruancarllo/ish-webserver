# Instala Go 1.24
curl -L --output go1.24.tar.gz https://go.dev/dl/go1.24.8.darwin-arm64.tar.gz
mkdir -p ~/go1.24
tar -C ~/go1.24 --strip-components=1 -xzf go1.24.tar.gz

# Clona uma versão do cloudflared compatível
git clone --branch 2024.6.1 --depth 1 https://github.com/cloudflare/cloudflared.git ~/cloudflared-build
cd ~/cloudflared-build

# Compila estático pra linux/386
GOOS=linux \
GOARCH=386 \
CGO_ENABLED=0 \
~/go1.24/bin/go build -o cloudflared ./cmd/cloudflared

# Serve o binário na rede local pro iPhone baixar
python3 -m http.server 8888

# Descobre o IP do Mac na rede local
ipconfig getifaddr en0
