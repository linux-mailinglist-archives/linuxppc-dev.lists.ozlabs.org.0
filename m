Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C810251F21C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 03:13:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxNTk3cbCz3cCX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gIUFYKCQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gIUFYKCQ; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwxWw6Rjqz2xF8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 17:58:51 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id y3so9015379qtn.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZVhWVA+EdiAZkxXcgq5S21iMUVQBopURuPfX+xp/uQ=;
 b=gIUFYKCQeN/B58sPwgdDuch1cOCuxKNjSrwNzscjlympP+cuTuAqg6INyjeEzu+6IS
 bRycio946YWHG+w+7Bp5XrUWI2XN1IT4YCifS0wpudFLVHnWZFbp/lHFggVF2vttzAqH
 xlUhPfrdJjGLwLADAOT7Co+88F8jg4wQnE1Eh3xFTP+KNJRC9ZGFP6d7UptIvt96K3Hf
 HlEh/D7PObgDVhcwbmltRjJWQa7aIesVj/38/0J94Vt5Nf/WlPHKGoElLqw+Tw2n/ltE
 uAuJJ8ALz0zU/hHVjOevEy83NwQyIRC22RwP9odiQgljHRxq8Jsy0GNFcg8sSvpfZcVz
 kThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZVhWVA+EdiAZkxXcgq5S21iMUVQBopURuPfX+xp/uQ=;
 b=p+tw3+sINpnIQ+ri9v8pc8hpkaGDubCBqXVZ9/VygO4nAOY6kohM3hYlCq1YfqCgio
 savw1l4I9iq7aAYWftrPJMzdhoHiYFIihOcqwZvEoZbFIYHzJ51rh+uOyIHKfTPkvfZC
 D+/9d6B8uQLtgQCzNKlx4katxlwkd5WvnBKoGd+a/R82sNW6yJvnDDskztvxVnWJxBuE
 6PUpJsijfADnjEK+8IAXaThVFt6ofucVCnM7WyhqyIsjFUKakvCo0vSBcRISSNJbBikL
 sMr4FLHe155w8R83VUOkL8Fs2rmvMNobRF2eieJt1XTg7EO6lw7waoa++yUvqAS9tNzw
 F9Rw==
X-Gm-Message-State: AOAM531u7jCIZI9J0YEVirljHCHMNI1o6DgOMtmJiXNsD+gcAtE0Ij4L
 fICUKuQ5czsR3bmZlY+4/k++8v6xnIsfoxQJpKE=
X-Google-Smtp-Source: ABdhPJyNd2eXVDqLQaJ2XSfZasJbZg++pVfPsBuzCeYRWHOHlaLxUTCqb6BQaZtTG0xKbNsZQYf7XOr/kc7ZoH7vedI=
X-Received: by 2002:ac8:5ad1:0:b0:2f3:cf42:b3bc with SMTP id
 d17-20020ac85ad1000000b002f3cf42b3bcmr5076602qtd.120.1651996726562; Sun, 08
 May 2022 00:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
In-Reply-To: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 8 May 2022 15:58:35 +0800
Message-ID: <CAA+D8APkCt4N9_Gm8324ffR-vAvX5e6eq7tegMy-MLMy4zRZVQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
To: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000e930105de7b7641"
X-Mailman-Approved-At: Mon, 09 May 2022 11:12:57 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000e930105de7b7641
Content-Type: text/plain; charset="UTF-8"

On Sat, May 7, 2022 at 8:31 PM Pieterjan Camerlynck <
pieterjan.camerlynck@gmail.com> wrote:

> In commit <c3ecef21c3f26> ("ASoC: fsl_sai: add sai master mode support")
> the loop was changed to start iterating from 1 instead of 0. The error
> message however was not updated, reporting the wrong clock to the user.
>
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best Regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index ffc24afb5a7a..f0602077b385 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
>                         dev_err(&pdev->dev, "failed to get mclk%d clock:
> %ld\n",
> -                                       i + 1, PTR_ERR(sai->mclk_clk[i]));
> +                                       i, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
>         }
> --
> 2.25.1
>
>

--0000000000000e930105de7b7641
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 7, 2022 at 8:31 PM Pieter=
jan Camerlynck &lt;<a href=3D"mailto:pieterjan.camerlynck@gmail.com">pieter=
jan.camerlynck@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">In commit &lt;c3ecef21c3f26&gt; (&quot;ASoC: fsl_sa=
i: add sai master mode support&quot;)<br>
the loop was changed to start iterating from 1 instead of 0. The error<br>
message however was not updated, reporting the wrong clock to the user.<br>
<br>
Signed-off-by: Pieterjan Camerlynck &lt;<a href=3D"mailto:pieterjan.camerly=
nck@gmail.com" target=3D"_blank">pieterjan.camerlynck@gmail.com</a>&gt;<br>=
</blockquote><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mai=
lto:shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br>=
</div><div>Best Regards</div><div>Wang Shengjiu=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index ffc24afb5a7a..f0602077b385 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;mclk_clk[i]=
 =3D devm_clk_get(&amp;pdev-&gt;dev, tmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;=
mclk_clk[i])) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(&amp;pdev-&gt;dev, &quot;failed to get mclk%d clock: %ld=
\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i + 1, PT=
R_ERR(sai-&gt;mclk_clk[i]));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, PTR_ER=
R(sai-&gt;mclk_clk[i]));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sai-&gt;mclk_clk[i] =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000e930105de7b7641--
