Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EFF614876
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 12:25:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1nkD1yj6z3cN5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 22:25:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HAIa9cwc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HAIa9cwc;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1f9w5pJRz3br4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 16:45:06 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id d3so19509149ljl.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 22:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1fAuCRQsLNGwK/8BajgP7KDtZDIWOaW2Geb1akrfaI=;
        b=HAIa9cwcM+T3W3gWmie5gOU2sMid3j3+I3RlHixnP+cZDe+E6MkgOsffZQrWcICz7T
         cMadMi6jF7IMyMK+nUy1L9Te4WubSP/qg7nf7pgkR44HxiIxOx/sAiQcQG7MjJfRj5FO
         LejXCyMyfTsGL38BV+3HTJGBX5qt62XIQ3+rxDsDnrvNg/vB95o1x7+Zfy2P8M5Aor/Q
         qDX2L19FNoC55fTAsKlrsWaq4luZr4MkD/TSDPnKFQx6VgoTYOqEVP+Bemc3ZchZq3aQ
         SnSHP52OakvdV9R6N97jIpelILc4GpUZjD1jaAL/tF6VjAcBGxw30+RnHy/JB64o6srk
         C/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1fAuCRQsLNGwK/8BajgP7KDtZDIWOaW2Geb1akrfaI=;
        b=UhXXHooPYoPLtB/e8H1/A51wZfN/cEtbB/OqvmFHF/kJYqiPlCPDW3+MJV0yjHAMwV
         fy+TmWK2gznOja8/ziYOGpFlyAE/nH8uzWYdKGA4Dl5/r5Ko+V6nHXFa9SLnTezjd6dh
         q7tkzjCcZyQV2URZ9DZXSnxYcz3ckFXfwU4dvCv6J3EVVTHvsUbSZhu/P9flK7nW+9GG
         7Tcb1Cx1uxwuhlG2xEz9dG7XBvfRcy85FR88lWdf3gdrKcIriadRDvgArD2pFD5HRdao
         0rOEwBLzhhJekLddtRF6cM63T5hy/uUjBx7srllIRoZfGVxwg/PwKWSdeVxcOdyA0o1f
         cecg==
X-Gm-Message-State: ACrzQf2HC4yfC3DXoQn9wvjI+7Y/VGx6rPY+cm+2uOq25TdKE0CSIEvY
	e4AfsEWjNy++4l1BEN2j1001GiPBhAh9s6nFe0w=
X-Google-Smtp-Source: AMsMyM4AgJhVCDcxwCMn6l+76L77o81zW5OKs/V3dJ59vZ8cHH/ZsqraJ5ZcNEMAmIyWAuyO3wujs1/qBeRN3K6/90k=
X-Received: by 2002:a05:651c:c8a:b0:26f:a90a:fd82 with SMTP id
 bz10-20020a05651c0c8a00b0026fa90afd82mr419435ljb.248.1667281496096; Mon, 31
 Oct 2022 22:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221028082750.991822-1-chancel.liu@nxp.com> <20221028082750.991822-3-chancel.liu@nxp.com>
In-Reply-To: <20221028082750.991822-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Nov 2022 13:44:44 +0800
Message-ID: <CAA+D8AMt0VB4j8wYHyZfk3dnBhwwBvQeHe7bGh1FPPDP6ug8Wg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_micfil: Add support for i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="00000000000050c76a05ec6239c8"
X-Mailman-Approved-At: Tue, 01 Nov 2022 22:24:21 +1100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000050c76a05ec6239c8
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 4:28 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Add compatible string and specific soc data to support MICFIL on i.MX93
> platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index eeaa75fb9196..b8a9504441df 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -82,9 +82,18 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
>         .formats = SNDRV_PCM_FMTBIT_S32_LE,
>  };
>
> +static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
> +       .imx = true,
> +       .fifos = 8,
> +       .fifo_depth = 32,
> +       .dataline =  0xf,
> +       .formats = SNDRV_PCM_FMTBIT_S32_LE,
> +};
> +
>  static const struct of_device_id fsl_micfil_dt_ids[] = {
>         { .compatible = "fsl,imx8mm-micfil", .data = &fsl_micfil_imx8mm },
>         { .compatible = "fsl,imx8mp-micfil", .data = &fsl_micfil_imx8mp },
> +       { .compatible = "fsl,imx93-micfil", .data = &fsl_micfil_imx93 },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
> --
> 2.25.1
>
>

--00000000000050c76a05ec6239c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 28, 2022 at 4:28 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add co=
mpatible string and specific soc data to support MICFIL on i.MX93<br>
platform.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_micfil.c | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c<br>
index eeaa75fb9196..b8a9504441df 100644<br>
--- a/sound/soc/fsl/fsl_micfil.c<br>
+++ b/sound/soc/fsl/fsl_micfil.c<br>
@@ -82,9 +82,18 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =3D SNDRV_PCM_FMTBIT_S32_LE,<br>
=C2=A0};<br>
<br>
+static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.imx =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fifos =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_depth =3D 32,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dataline =3D=C2=A0 0xf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.formats =3D SNDRV_PCM_FMTBIT_S32_LE,<br>
+};<br>
+<br>
=C2=A0static const struct of_device_id fsl_micfil_dt_ids[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mm-micfil&quot;=
, .data =3D &amp;fsl_micfil_imx8mm },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mp-micfil&quot;=
, .data =3D &amp;fsl_micfil_imx8mp },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fsl,imx93-micfil&quot;,=
 .data =3D &amp;fsl_micfil_imx93 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {}<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000050c76a05ec6239c8--
