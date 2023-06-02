Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315071F8DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 05:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXSvk5Pn9z3dxf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 13:21:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q8+6gAwv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q8+6gAwv;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXS4V4Mynz3chl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 12:43:53 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so14799235e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 19:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685673826; x=1688265826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7cVgh41cB56ZwBQc5auMOmbHnoylbtnEaXxcEFXrCkg=;
        b=Q8+6gAwvQm3mkfBcjKfRHTMkg6VRwfRaARy8Or+hDZS8V8F07JEFXUyQbDSyUnVN05
         LpYm5oYnk6atD8VVstSc3Cl1ZsJcny86M/Bc3sbGg5/lLM6k/yt0PUbk5mchk728IRIK
         TU9esCVwGSFOAfVi9v+QTm3Rc7Hyvw+RCP7B0upSf7mSPiN+33Swkr+GTnZgAjP1DSNw
         RtnLAgTFfHJXIpckUF8FnCCe0bPNL7EUPOguBb4alMrdqAAM1+bWPdLS9GK+aRW2se8l
         oPKGQQRWEftF0kMp+RlYzAQ7EpbZ2IBowOWj3UftfX4F8UQ1/XFZ+HVph8eRdx8yfXQl
         K74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685673826; x=1688265826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cVgh41cB56ZwBQc5auMOmbHnoylbtnEaXxcEFXrCkg=;
        b=Gq+B1qs9pvotD02XNzIHXgkvI/eP2T9wJ9lq7OW90kO45EQ4eTGKm4/BFW6IVFb2b3
         2P+oC+B+tGfOY3QWxNlliES2CBaSMmB4uXxDklGeMRgKpfA9S3/JQBjkFm4ZS8J8EPVk
         Ooou1WciiSLQv8iVBNVcLcu5aYBbWLcbIYMU2kPFgElu6INO/UY5yOYWVku6pYttp7xK
         zltLXph4nqq9QnvY994pL9pDENBV2tJKMg4DZeXZ/bJJnvw+f7/EWbmCNPh2g45h4fn7
         e9Urkh4uoqhhjlI2WJaZQV4LOGuQt3enOpuGqo+olP3B7RHjdmlobsw1N9PBkyHT4HEE
         UmLQ==
X-Gm-Message-State: AC+VfDxnQLflskfJNRb9ObHifsxYNxE5cEQL+160+yoW/wwA9yyRRIb7
	885ahE0OS86/zLKUCzakCLkpA7KWGz16B51dti0=
X-Google-Smtp-Source: ACHHUZ4LtA8ru8OSkCtasFHOSmHlHQzQnBMH3+moMNHSO5F2m5tChotTQ58ICIWExoM5p70S0WdzAITRb7RTJsIp/X8=
X-Received: by 2002:a05:600c:292:b0:3f6:ae3:5948 with SMTP id
 18-20020a05600c029200b003f60ae35948mr891246wmk.33.1685673826427; Thu, 01 Jun
 2023 19:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230530103012.3448838-1-chancel.liu@nxp.com>
In-Reply-To: <20230530103012.3448838-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 2 Jun 2023 10:43:34 +0800
Message-ID: <CAA+D8AMKa2AVjFj+VDUG2uVpfrPD8fwpXrmK6_N05owQE+EN1w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable BCI bit if SAI works on synchronous
 mode with BYP asserted
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000a1a70905fd1c8515"
X-Mailman-Approved-At: Fri, 02 Jun 2023 13:20:41 +1000
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, festevam@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, perex@perex.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000a1a70905fd1c8515
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 6:30=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:

> There's an issue on SAI synchronous mode that TX/RX side can't get BCLK
> from RX/TX it sync with if BYP bit is asserted. It's a workaround to
> fix it that enable SION of IOMUX pad control and assert BCI.
>
> For example if TX sync with RX which means both TX and RX are using clk
> form RX and BYP=3D1. TX can get BCLK only if the following two conditions
> are valid:
> 1. SION of RX BCLK IOMUX pad is set to 1
> 2. BCI of TX is set to 1
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 11 +++++++++--
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index d9344025dc16..5e09f634c61b 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -491,14 +491,21 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai=
,
> bool tx, u32 freq)
>         regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
>                            FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
>
> -       if (savediv =3D=3D 1)
> +       if (savediv =3D=3D 1) {
>                 regmap_update_bits(sai->regmap, reg,
>                                    FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP=
,
>                                    FSL_SAI_CR2_BYP);
> -       else
> +               if (fsl_sai_dir_is_synced(sai, adir))
> +                       regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx,
> ofs),
> +                                          FSL_SAI_CR2_BCI,
> FSL_SAI_CR2_BCI);
> +               else
> +                       regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx,
> ofs),
> +                                          FSL_SAI_CR2_BCI, 0);
> +       } else {
>                 regmap_update_bits(sai->regmap, reg,
>                                    FSL_SAI_CR2_DIV_MASK | FSL_SAI_CR2_BYP=
,
>                                    savediv / 2 - 1);
> +       }
>
>         if (sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
>                 /* SAI is in master mode at this point, so enable MCLK */
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 3eb994aef36a..8254c3547b87 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -116,6 +116,7 @@
>
>  /* SAI Transmit and Receive Configuration 2 Register */
>  #define FSL_SAI_CR2_SYNC       BIT(30)
> +#define FSL_SAI_CR2_BCI                BIT(28)
>  #define FSL_SAI_CR2_MSEL_MASK  (0x3 << 26)
>  #define FSL_SAI_CR2_MSEL_BUS   0
>  #define FSL_SAI_CR2_MSEL_MCLK1 BIT(26)
> --
> 2.25.1
>
>

--000000000000a1a70905fd1c8515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 30, 2023 at 6:30=E2=80=AF=
PM Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">There&#39;s an issue on SAI synchronous mode that TX/RX side can&#39;t ge=
t BCLK<br>
from RX/TX it sync with if BYP bit is asserted. It&#39;s a workaround to<br=
>
fix it that enable SION of IOMUX pad control and assert BCI.<br>
<br>
For example if TX sync with RX which means both TX and RX are using clk<br>
form RX and BYP=3D1. TX can get BCLK only if the following two conditions<b=
r>
are valid:<br>
1. SION of RX BCLK IOMUX pad is set to 1<br>
2. BCI of TX is set to 1<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 11 +++++++++--<br>
=C2=A0sound/soc/fsl/fsl_sai.h |=C2=A0 1 +<br>
=C2=A02 files changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index d9344025dc16..5e09f634c61b 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -491,14 +491,21 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, =
bool tx, u32 freq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(sai-&gt;regmap, reg, FSL_SAI=
_CR2_MSEL_MASK,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_CR2_MSEL(sai-&gt;mclk_id[tx]));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (savediv =3D=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (savediv =3D=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(=
sai-&gt;regmap, reg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_CR2_DIV_MASK | =
FSL_SAI_CR2_BYP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_CR2_BYP);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fsl_sai_dir_is_=
synced(sai, adir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0regmap_update_bits(sai-&gt;regmap, FSL_SAI_xCR2(tx, ofs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F=
SL_SAI_CR2_BCI, FSL_SAI_CR2_BCI);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0regmap_update_bits(sai-&gt;regmap, FSL_SAI_xCR2(tx, ofs),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F=
SL_SAI_CR2_BCI, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(=
sai-&gt;regmap, reg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_CR2_DIV_MASK | =
FSL_SAI_CR2_BYP,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0savediv / 2 - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sai-&gt;soc_data-&gt;max_register &gt;=3D F=
SL_SAI_MCTL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* SAI is in master=
 mode at this point, so enable MCLK */<br>
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h<br>
index 3eb994aef36a..8254c3547b87 100644<br>
--- a/sound/soc/fsl/fsl_sai.h<br>
+++ b/sound/soc/fsl/fsl_sai.h<br>
@@ -116,6 +116,7 @@<br>
<br>
=C2=A0/* SAI Transmit and Receive Configuration 2 Register */<br>
=C2=A0#define FSL_SAI_CR2_SYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(30)<br>
+#define FSL_SAI_CR2_BCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(28)<br>
=C2=A0#define FSL_SAI_CR2_MSEL_MASK=C2=A0 (0x3 &lt;&lt; 26)<br>
=C2=A0#define FSL_SAI_CR2_MSEL_BUS=C2=A0 =C2=A00<br>
=C2=A0#define FSL_SAI_CR2_MSEL_MCLK1 BIT(26)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000a1a70905fd1c8515--
