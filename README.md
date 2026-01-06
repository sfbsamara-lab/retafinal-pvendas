Instruções rápidas

1) Coloque as imagens do app em `assets/` com esses nomes (usamos JPG/PNG):
   - `fullbody.jpg` (print da tela Full Body Metabólico) — versões WebP: `fullbody.webp`
   - `kit.jpg` (print Kit Blindagem Carnaval) — versões WebP: `kit.webp`
   - `cardapio.jpg` (print Cardápio do Dia) — versões WebP: `cardapio.webp`
   - `arsenal.jpg` (print Arsenal de Guerra / Recompensas) — versões WebP: `arsenal.webp`
   - `sos.jpg` (imagem do Protocolo SOS) — versões WebP: `sos.webp`

2) Substitua as fotos das usuárias por selfies reais (estilo dia a dia), com esses nomes:
   - `selfie1.png`, `selfie2.png`, `selfie3.png` (versões WebP: `selfie1.webp` etc.)

3) Vídeo: o topo já está embedado do YouTube; se preferir usar um modal, substitua o iframe por um poster + modal player.

4) Checkout: o botão usa `https://pay.kiwify.com.br/Akrjt0G`. Para alterar, atualize a constante `CHECKOUT_URL` em `index.html`.

5) Analytics: o botão envia `trackEvent('click_checkout')` para `dataLayer`/`gtag` quando existente — confirme integração com GA4 / Meta Pixel / GTM.

6) Otimização: converta imagens para `webp`, gere `srcset` e use lazy-loading; compacte assets para melhorar LCP.

Próximos passos sugeridos:
- Gerar export (.zip) com `index.html`, `style.css`, `assets/` e este README.
- Integrar gateway de pagamento/teste de webhook.
- Criar página de obrigado com instruções de login e próximos passos (enviar e-mail automático com acesso).