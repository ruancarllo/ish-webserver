# Baixa o cloudflared compilado no Mac
curl -O http://IP_DO_MAC:8888/cloudflared
chmod +x cloudflared

# Roda o túnel cloudflared
GODEBUG=asyncpreemptoff=1,pidfd=0,rseq=0 \
./cloudflared tunnel run \
  --protocol http2 \
  --token TOKEN_DA_CLOUDFLARE
