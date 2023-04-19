Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93686E78A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:30:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1drG3qblz3g7K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:30:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=F2JBkCZI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=F2JBkCZI;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1SGG6KfXz3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 14:18:44 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id gw13so16443732wmb.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 21:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681877921; x=1684469921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vhNca8YLmfca4Op7ES/LC9OWSpn6i+BIs8xcyZhd0eI=;
        b=F2JBkCZIs+H541AoHGtbcEpZwCWyCLC5pcvrUZD7G8K5NIdPR2fhKkcGxiCfLkHVKj
         +1jjBLG95RaPKhQjYh76hDjDgjV2Sxw2oUgHO63w1rgADNk3p0cbnsjzuJBYwxqMz7G/
         dpKtUq882jPGF/XDAUq+hygUTOeyadsh2tKHpx8WJ70INKaDkS03qK2Ag5M2xELaDzvG
         b0M9NioWL9Q+wttOkEVRkDKhlwahckP6r3gfxba+aH7EFwbnS+CeR6Q+jvHyClYEZQYJ
         NFWoT75p9FX04GFjxp86nM2yn4Pi4LvIo1R6FAnQfW4++MJtmzqV9CBlcN3bYLd2r+xj
         7eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681877921; x=1684469921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhNca8YLmfca4Op7ES/LC9OWSpn6i+BIs8xcyZhd0eI=;
        b=AYqM3TLesC1u/eR+JXYUdabnAMdf7LzjSSylodiA1CM5Wj1f+tPLhMc3+utzo7MQ59
         c73QSQg6EaekriJIp6HP4nIm9mBmge4tFinYyiTWqSsPM/V2wSxzLsG80JzOVCdtxE8L
         Z+cFZLZW1khKHSI3F9RCFlVoaWTvSzojv20djlP3kv+AyVu6Tsmwsr3es3F0fhhDiVV8
         U3xyno9T6NCtNNIT2uGm1QBMBEUkfM2cbzyAKgnbulmoKlQyec/c0saMg/uAMG2GSfjY
         ljYVsdRWJJ+IKEtzf9/sTyK3zVupl3z8LQRMWntBBZTcoikC8xTKScKijHNjrmZR1uy/
         cRIg==
X-Gm-Message-State: AAQBX9fzCMhs9V75QGF+HvFVNJTgEygbSHv9f/UADpPJgL79/i3XSfoB
	pewmFFelAGCi8eYFmDfdl1VQ9RitpQj1zmoSx/s=
X-Google-Smtp-Source: AKy350YPlDNKOyx3BzgeJ9alViRGYwy/nxa9GJyIszMj+/Nd1dPOqRE4u8E6pnhtp/PAKQaL9dgjBL3qZAVkW0Z9AKg=
X-Received: by 2002:a05:600c:3792:b0:3f1:6fef:703e with SMTP id
 o18-20020a05600c379200b003f16fef703emr2124489wmr.7.1681877920550; Tue, 18 Apr
 2023 21:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Apr 2023 12:18:29 +0800
Message-ID: <CAA+D8AMRpObs+waOftBxHLrtmH97_=E7-bUtu6B77ZL5BZ+BfQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Simplify an error message
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: multipart/alternative; boundary="0000000000000293f605f9a8b8bd"
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000293f605f9a8b8bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 2:29=E2=80=AFPM Christophe JAILLET <
christophe.jaillet@wanadoo.fr> wrote:

> dev_err_probe() already display the error code. There is no need to
> duplicate it explicitly in the error message.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index bffa1048d31e..40870668ee24 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -858,7 +858,7 @@ static int fsl_asoc_card_probe(struct platform_device
> *pdev)
>
>         ret =3D devm_snd_soc_register_card(&pdev->dev, &priv->card);
>         if (ret) {
> -               dev_err_probe(&pdev->dev, ret, "snd_soc_register_card
> failed: %d\n", ret);
> +               dev_err_probe(&pdev->dev, ret, "snd_soc_register_card
> failed\n");
>                 goto asrc_fail;
>         }
>
> --
> 2.34.1
>
>

--0000000000000293f605f9a8b8bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 16, 2023 at 2:29=E2=80=AF=
PM Christophe JAILLET &lt;<a href=3D"mailto:christophe.jaillet@wanadoo.fr">=
christophe.jaillet@wanadoo.fr</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">dev_err_probe() already display the error code=
. There is no need to<br>
duplicate it explicitly in the error message.<br>
<br>
Signed-off-by: Christophe JAILLET &lt;<a href=3D"mailto:christophe.jaillet@=
wanadoo.fr" target=3D"_blank">christophe.jaillet@wanadoo.fr</a>&gt;<br></bl=
ockquote><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:=
shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></di=
v><div>Best regards</div><div>wang shengjiu=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl-asoc-card.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c<=
br>
index bffa1048d31e..40870668ee24 100644<br>
--- a/sound/soc/fsl/fsl-asoc-card.c<br>
+++ b/sound/soc/fsl/fsl-asoc-card.c<br>
@@ -858,7 +858,7 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_snd_soc_register_card(&amp;pdev-&g=
t;dev, &amp;priv-&gt;card);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_probe(&amp;=
pdev-&gt;dev, ret, &quot;snd_soc_register_card failed: %d\n&quot;, ret);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_probe(&amp;=
pdev-&gt;dev, ret, &quot;snd_soc_register_card failed\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto asrc_fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000000293f605f9a8b8bd--
