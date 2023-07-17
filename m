Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0305756264
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:06:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XKEPOH1U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4LRP45Dgz2yVK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XKEPOH1U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4GH75wtWz2y1d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 18:59:30 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-78358268d1bso220976939f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689584367; x=1692176367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FidUuCc90iKxWP9xmktGfbcetSq0w1DH2NjPyFBcWd0=;
        b=XKEPOH1UFavLPMoQFyejnLHCl6ZqZEAVw1UqvO8bkWjZkW2UxOjNaIoPDdYpqsC+z7
         3+GS/ipoLO7eS4MJ9iQ9hrkpgPxIPg9sIIXP6c0lZgxAKGuWOMKAEJDhRs+K6HnEogWO
         NFcDoGesET6FTJ3KUmrNGxBrYAzh3fzBaeZA4iDR7PpRrvv1XJjpZVzGio077NWTG1ud
         0scKqezrIT/4WmR6oSIP6ngCBrkDn/LbTtgnThRr6Jw00tRg/kHe2Us8Po0g8Nt5zJqV
         O7QMrkhJP8lXvsLJhs0it5J9daqxMi9UxS7CO3Lx4fODzlCAz/3me0cm3ZivRBjTYfTs
         ro9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689584367; x=1692176367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FidUuCc90iKxWP9xmktGfbcetSq0w1DH2NjPyFBcWd0=;
        b=JnlQidLHAHHNGYLXT34UPimBNrmpfQ46R+Bevj0o8iEzHN4YLgsW7mpdi06KWyRdxw
         S3lmwxFfRySFCl6EPV3KzQqu9DUcd3AfkZndYy+HWqOyrOkyLzWOGbtpC2t7yOgk2fAU
         vP9RRQ6XOjkF68ltsI373LwpXRb4THQxXFEgxSjXwWVKydKoGdP5jrb21yM6KxCKM1Kd
         h4YKo1m5PL/afwRmd5k3o5hdEtVld+XMZ+NxpGkSqziK/iNLumMjaNQOGW2L1xUcZnzf
         9g9bJlWAoKlFmrwo+lo+mPiC+xTW+4V+fWkVBc7u6FKwy/qbvwxLbINpFYcbrvNVPbVQ
         8xaQ==
X-Gm-Message-State: ABy/qLYayWwYJSMcI5f5yt1MRa3JPWqY9JfGMmTedqoT6hu/B0RkNGPg
	Kp9cldEpg2zVYqX/RzifMVX/A2KQ2q9r2tHiHSs=
X-Google-Smtp-Source: APBJJlE8hJ5Bd69MBMPbGVDFfJuymqw2mD4Tj4Qdbk79jgg3c5ylwt86wy+Uj8QR0+Yo3N+3FncId7gCaIWHeeX8gi8=
X-Received: by 2002:a92:d782:0:b0:346:7329:8e8d with SMTP id
 d2-20020a92d782000000b0034673298e8dmr10148628iln.8.1689584367563; Mon, 17 Jul
 2023 01:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230714092913.1591195-1-chancel.liu@nxp.com> <20230714092913.1591195-3-chancel.liu@nxp.com>
In-Reply-To: <20230714092913.1591195-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 17 Jul 2023 16:59:15 +0800
Message-ID: <CAA+D8ANZdEKUskTNfh=24vcMLjQM===PA061Z2MvNxTNsOT+Yg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_rpmsg: Add support for i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="0000000000000bf9610600ab0471"
X-Mailman-Approved-At: Mon, 17 Jul 2023 22:06:13 +1000
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000bf9610600ab0471
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 5:30=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:

> Add compatible string and specific soc data to support rpmsg sound card
> on i.MX93 platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_rpmsg.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index 15b48b5ea856..abe19a8a7aa7 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -170,12 +170,20 @@ static const struct fsl_rpmsg_soc_data imx8mp_data =
=3D
> {
>                    SNDRV_PCM_FMTBIT_S32_LE,
>  };
>
> +static const struct fsl_rpmsg_soc_data imx93_data =3D {
> +       .rates =3D SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 |
> +                SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000,
> +       .formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
> +                  SNDRV_PCM_FMTBIT_S32_LE,
> +};
> +
>  static const struct of_device_id fsl_rpmsg_ids[] =3D {
>         { .compatible =3D "fsl,imx7ulp-rpmsg-audio", .data =3D &imx7ulp_d=
ata},
>         { .compatible =3D "fsl,imx8mm-rpmsg-audio", .data =3D &imx8mm_dat=
a},
>         { .compatible =3D "fsl,imx8mn-rpmsg-audio", .data =3D &imx8mn_dat=
a},
>         { .compatible =3D "fsl,imx8mp-rpmsg-audio", .data =3D &imx8mp_dat=
a},
>         { .compatible =3D "fsl,imx8ulp-rpmsg-audio", .data =3D &imx7ulp_d=
ata},
> +       { .compatible =3D "fsl,imx93-rpmsg-audio", .data =3D &imx93_data}=
,
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
> --
> 2.25.1
>
>

--0000000000000bf9610600ab0471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 14, 2023 at 5:30=E2=80=AF=
PM Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Add compatible string and specific soc data to support rpmsg sound card<b=
r>
on i.MX93 platform.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_rpmsg.c | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c<br>
index 15b48b5ea856..abe19a8a7aa7 100644<br>
--- a/sound/soc/fsl/fsl_rpmsg.c<br>
+++ b/sound/soc/fsl/fsl_rpmsg.c<br>
@@ -170,12 +170,20 @@ static const struct fsl_rpmsg_soc_data imx8mp_data =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SNDRV_=
PCM_FMTBIT_S32_LE,<br>
=C2=A0};<br>
<br>
+static const struct fsl_rpmsg_soc_data imx93_data =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.rates =3D SNDRV_PCM_RATE_16000 | SNDRV_PCM_RAT=
E_32000 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SNDRV_PCM_RATE_480=
00 | SNDRV_PCM_RATE_96000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PC=
M_FMTBIT_S24_LE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SNDRV_PCM_F=
MTBIT_S32_LE,<br>
+};<br>
+<br>
=C2=A0static const struct of_device_id fsl_rpmsg_ids[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx7ulp-rpmsg-audio=
&quot;, .data =3D &amp;imx7ulp_data},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mm-rpmsg-audio&=
quot;, .data =3D &amp;imx8mm_data},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mn-rpmsg-audio&=
quot;, .data =3D &amp;imx8mn_data},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mp-rpmsg-audio&=
quot;, .data =3D &amp;imx8mp_data},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8ulp-rpmsg-audio=
&quot;, .data =3D &amp;imx7ulp_data},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fsl,imx93-rpmsg-audio&q=
uot;, .data =3D &amp;imx93_data},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000bf9610600ab0471--
