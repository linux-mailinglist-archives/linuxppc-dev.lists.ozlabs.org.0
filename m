Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0423F77C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 14:13:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BP1Mh0wnCzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 22:13:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=benyossef.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=gilad@benyossef.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=benyossef.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=benyossef-com.20150623.gappssmtp.com
 header.i=@benyossef-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=a27s0HjD; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BP1K95NhqzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 22:10:49 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id o5so2388442pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Aug 2020 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=benyossef-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EuDMSmp04hSHSVLRHL1PUWBPuYB4U3JnGDB9t2qv6ho=;
 b=a27s0HjDAgd0N2W+2hyaEb/r9U8rPWgKPcToKVqzsY6g1RHey3lP/n73NLKJYe/Ok9
 55O55oJSSu9auuHd0IZZMeayaFYrB0XkDdzao+sYMQoIml9w00hFjBH8r/pwdPpew/sz
 D4U3ycTuRW2hhSyGQ/+vQPPBrkxE9ZKOeqrJhg7L0PM3vPL7tG3pJcxpNVs3aBK4ByJe
 KCqGQqzLjn/hShsU0zUkoh4exC0lP0KHzK4vtrIfJ3N9ohkhYUxOT1oj/NDw/OG3J1d+
 9y8hysX2pQorUHhg24RtZ6E+WgR2WN28nXtkQnzysvPpbbsZGt1ljbQWW59Kk3ViJl54
 tcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EuDMSmp04hSHSVLRHL1PUWBPuYB4U3JnGDB9t2qv6ho=;
 b=Zh8200qx5hM3o02wo5i0LnwNiLPmZt1hZlRPUzHWSL7XuamV1pykYF+3hJu1F5HOIs
 mqm5YP8GD2jS0Yh7bvHea/cPMo7yPFbrBTRr/jUcWQ3ELwQhDt18Mq2tsw4sFzBoj8Ut
 Dq0sAFJORZPTKy6dfKV7BTXyeA+d5C1m3WhTfMgfN8L23WDYn6XF64bNkuELb32AKaQp
 nL99pHLgdD8OwiaUfrUAT46UP4mMV9JoESIjTNSixsL54ZL/a6FXjzpfvVKRDqTEm7Lo
 +lj835D7VJd9H0yXbxvAVZJ4mcopgupSwgIfm2/ajzLJQWWCeTLZAv4Vxzkliv1lacx5
 k+qw==
X-Gm-Message-State: AOAM530He4j8jX35MutMEgXXI25wlRcD5B82fVan3KT0baBgtjoOasb+
 MnVtbz3XlaVA7Z3cqbmymnv/M0fokbmLl8dPJYpzKw==
X-Google-Smtp-Source: ABdhPJzM1muWFLwLDSvo0MoNAYjZ2t7+UNajWvXxXMkjymrpkaeIPbZuHepCLbtxZZBVSatO1nbVYIIZ+/IHe775HYM=
X-Received: by 2002:a63:4b44:: with SMTP id k4mr15861573pgl.305.1596888644708; 
 Sat, 08 Aug 2020 05:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200807162010.18979-1-andrei.botila@oss.nxp.com>
 <20200807162010.18979-17-andrei.botila@oss.nxp.com>
In-Reply-To: <20200807162010.18979-17-andrei.botila@oss.nxp.com>
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Sat, 8 Aug 2020 15:10:33 +0300
Message-ID: <CAOtvUMero-gF5ZE1unnD_wcDnzZX_SL0tQ2yJNqzc3rg5RhuDA@mail.gmail.com>
Subject: Re: [PATCH 16/22] crypto: ccree - add check for xts input length
 equal to zero
To: Andrei Botila <andrei.botila@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Andrei Botila <andrei.botila@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@axis.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 7:22 PM Andrei Botila <andrei.botila@oss.nxp.com> wr=
ote:
>
> From: Andrei Botila <andrei.botila@nxp.com>
>
> Standardize the way input lengths equal to 0 are handled in all skcipher
> algorithms. All the algorithms return 0 for input lengths equal to zero.
> This change has implications not only for xts(aes) but also for cts(cbc(a=
es))
> and cts(cbc(paes)).
>
> Cc: Gilad Ben-Yossef <gilad@benyossef.com>
> Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
> ---
>  drivers/crypto/ccree/cc_cipher.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_c=
ipher.c
> index 076669dc1035..112bb8b4dce6 100644
> --- a/drivers/crypto/ccree/cc_cipher.c
> +++ b/drivers/crypto/ccree/cc_cipher.c
> @@ -912,17 +912,18 @@ static int cc_cipher_process(struct skcipher_reques=
t *req,
>
>         /* STAT_PHASE_0: Init and sanity checks */
>
> -       if (validate_data_size(ctx_p, nbytes)) {
> -               dev_dbg(dev, "Unsupported data size %d.\n", nbytes);
> -               rc =3D -EINVAL;
> -               goto exit_process;
> -       }
>         if (nbytes =3D=3D 0) {
>                 /* No data to process is valid */
>                 rc =3D 0;
>                 goto exit_process;
>         }
>
> +       if (validate_data_size(ctx_p, nbytes)) {
> +               dev_dbg(dev, "Unsupported data size %d.\n", nbytes);
> +               rc =3D -EINVAL;
> +               goto exit_process;
> +       }
> +
>         if (ctx_p->fallback_on) {
>                 struct skcipher_request *subreq =3D skcipher_request_ctx(=
req);
>
> --
> 2.17.1
>

Acked-by: Gilad Ben-Yossef <gilad@benyossef.com>

Thanks,
Gilad

--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
