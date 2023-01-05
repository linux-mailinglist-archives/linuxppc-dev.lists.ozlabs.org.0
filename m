Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 062CC65F5F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 22:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Np0L36jNdz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 08:42:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TfD9Tl7A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TfD9Tl7A;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnhXP6Sbmz2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 20:49:56 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so2146006wml.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Jan 2023 01:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=paARRJIFHIsVX4dtu4ZLJZE/XHiRymnBzrwux6NQcSI=;
        b=TfD9Tl7A4ZNOXf/np9wdrY4h25B4/4+S27TByz89hpIwQVT5QubrZ+w5ObaB4V6WS9
         4QCrQyZ/kV/5p7xakU4aaBLDeKPYJNXuSCvlAGKFsEVJSOCZI7Os92BwG2YhC1I2dmtb
         OYKN/1ALMzLnSc4CW1IUs38Xwn/sGp+uZEJM73FSLoYhajuXtmG8TBXML03CmI8IPGG8
         38z8sJqPpknRkGVNj7KsJIe+kpP79qnhp0zDdpyIPLu22mM1YPpoAbyEuNmv5dt0bnti
         6duYuXJUQDjrkyHa45PkG3Xkwx+4Iq+aczpwhaSTqmjtL4f4SyQl+TfC28Ooe1RVq/hD
         46uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paARRJIFHIsVX4dtu4ZLJZE/XHiRymnBzrwux6NQcSI=;
        b=13tbtu6J8UpparFYghOifh84SivCH3KIJM+RGAC5UZo20U6X5ddWBHL33Rt3sM31R5
         WuLwXIOm6OmefHBivPERcvfc3NHAwKtfaCKZmyl+jwV7//Qj6PdENKu4weZfOX8wl4Na
         hWPYN+xpJmNbnry1NpxNzV6pY5jrdAVcARjXdf0LmOO5uYaa91j34qodG2bkLmb7qumX
         BDgIThNZlEGg+wPCoxAnWHYLZ0tfRSpTUfMTEgGHFtqDp0HQsL4AAedW05MsFOdsK1M5
         7b5y5r8GaCcROg+IxA3Co8Nl+mQ1GeFnL4AtuhEZC5O0sA9jBXcBRr9oZbkOGQ4JX/lr
         V8tw==
X-Gm-Message-State: AFqh2kpaMjW7tfOPdXbtXb0qygWRqiNTmWR0NUSQMvNhjSqBoyRwArXL
	k1iN+g5k3k4IevcEFJ4wlpIhsDPT5wwEbLH7QYA=
X-Google-Smtp-Source: AMrXdXtlmxDg/o8Vf0/42UoL40MYP402jKJXPX3nFjs1O/tiK+hPd8h5neSgCEHYznNmo1SWhmeIhjbEqJHaJfH+tNA=
X-Received: by 2002:a05:600c:b42:b0:3cf:a851:d2ef with SMTP id
 k2-20020a05600c0b4200b003cfa851d2efmr2046752wmr.88.1672912189014; Thu, 05 Jan
 2023 01:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20230104025754.3019235-1-chancel.liu@nxp.com>
In-Reply-To: <20230104025754.3019235-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Jan 2023 17:49:37 +0800
Message-ID: <CAA+D8AO-_MFop-WS=XQa2L83aajibkY4DeJek-3khN5p_1rwig@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Correct the number of steps on SX controls
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000c447b305f18138d7"
X-Mailman-Approved-At: Fri, 06 Jan 2023 08:40:23 +1100
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c447b305f18138d7
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 10:58 AM Chancel Liu <chancel.liu@nxp.com> wrote:

> The parameter "max" of SOC_SINGLE_SX_TLV() means the number of steps
> rather than maximum value. This patch corrects the minimum value to -8
> and the number of steps to 15.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index d7e6fc996166..d4d3bc7ca87c 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -325,21 +325,21 @@ static int hwvad_detected(struct snd_kcontrol
> *kcontrol,
>
>  static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
>         SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(0), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(1), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(2), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(3), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(4), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(5), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(6), 0x8, 0xF, gain_tlv),
>         SOC_SINGLE_SX_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
> -                         MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
> +                         MICFIL_OUTGAIN_CHX_SHIFT(7), 0x8, 0xF, gain_tlv),
>         SOC_ENUM_EXT("MICFIL Quality Select",
>                      fsl_micfil_quality_enum,
>                      micfil_quality_get, micfil_quality_set),
> --
> 2.25.1
>
>

--000000000000c447b305f18138d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 4, 2023 at 10:58 AM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The pa=
rameter &quot;max&quot; of SOC_SINGLE_SX_TLV() means the number of steps<br=
>
rather than maximum value. This patch corrects the minimum value to -8<br>
and the number of steps to 15.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_micfil.c | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c<br>
index d7e6fc996166..d4d3bc7ca87c 100644<br>
--- a/sound/soc/fsl/fsl_micfil.c<br>
+++ b/sound/soc/fsl/fsl_micfil.c<br>
@@ -325,21 +325,21 @@ static int hwvad_detected(struct snd_kcontrol *kcontr=
ol,<br>
<br>
=C2=A0static const struct snd_kcontrol_new fsl_micfil_snd_controls[] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH0 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(0), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH1 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(1), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH2 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(2), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH3 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(3), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH4 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(4), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH5 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(5), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH6 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(6), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_SINGLE_SX_TLV(&quot;CH7 Volume&quot;, REG_M=
ICFIL_OUT_CTRL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MICFIL_OUTGAIN_CHX_SHIFT(7), 0x8, 0xF, gain_tlv),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC_ENUM_EXT(&quot;MICFIL Quality Select&quot;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fsl_micfil_quality_enum,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0micfil_quality_get, micfil_quality_set),<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000c447b305f18138d7--
