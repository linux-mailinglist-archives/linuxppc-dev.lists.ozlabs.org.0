Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF1561264F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 00:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FD62lhCz3cLf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 09:57:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TyVnnG3t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TyVnnG3t;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzFxG3Rynz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 19:25:52 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id g7so7115613lfv.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aze6Vdz40SivY/OyVTioHF5+ECKEXJzUkeeEGjpn7nM=;
        b=TyVnnG3t93HVnGlm8qTCubRTPGcFE9YxDMIwaj6tUIXcxzqTV5RF1jeMaCKF5KhAJx
         F8afYGGyJ4PNLRQPJ5QdXpQjRyDeWPcotAiWGC8XOGW9Nd7zGC8r8izjc5MH6bZ5Zu4y
         ix2uDYpfZvNgBKDUvbOnPEt9bgyg1aEelBblScvXdRfESu2l19o4P9qr+SA5j59N/h1+
         2gm7LtihzGfWuHQrICms9y19Pa8UPlghNsQSFvj0t2r+zwTZP92ZZxstBCFrcF6Y4OUq
         Sn6+WJdWUaJC6f7s8FAfHLjg3KhLvjrSLVbSSxJWgr2jvwVYjHCTQzQ4+tfgbSFwzTgf
         /aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aze6Vdz40SivY/OyVTioHF5+ECKEXJzUkeeEGjpn7nM=;
        b=XYzeeUsWeCDIH2jMUk4VY5PtBhBvIqEfgDUzItJQWDKRXN868t1uxTsnngIHc+B1fm
         s5PA0JR0+yai15+0aL6+BEU+jaDapDgJwubFTOALw6di8BzzgeonkW0rGm7mIZjbgkBM
         t3QA97FWEt2p7+jMYb3NlrDeH40MMOH7zDlFiksuKX1hIuFtasc7CD7pCf0WWdQUo8C6
         sR07uq5MeT0Xm/oVWpX0T3IGm5xMX+n2FtIiQseiV+7pUff4UJGeHKMvQcPFhqKFtRAV
         azJcTR0m12b095vsXUPtPScTgfdhLR577fYibpzHBL/dlzwvfSQlTUA2rnHPWNFalsUb
         oaHw==
X-Gm-Message-State: ACrzQf279eQkOuklz5qWBNqzmF6Q0r1Pyz5NtNyeVPeJCchL1oR3J0mc
	PNp4BbsSiK0/BVNZYEU1g+ptEAmGODN+GrtY9po=
X-Google-Smtp-Source: AMsMyM6Bt+HYyjCphx0irVeTv2U6ca6Ir+VpNl77yNcjGX2Nf4ffrXSzqEbrIuQOyZIuEHXTJwINuVPwwlXtijh03mo=
X-Received: by 2002:ac2:58d8:0:b0:4af:af1f:87e0 with SMTP id
 u24-20020ac258d8000000b004afaf1f87e0mr4354978lfo.283.1666945547756; Fri, 28
 Oct 2022 01:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221027060311.2549711-1-chancel.liu@nxp.com> <20221027060311.2549711-3-chancel.liu@nxp.com>
In-Reply-To: <20221027060311.2549711-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Oct 2022 16:25:36 +0800
Message-ID: <CAA+D8AOyyn+Ax9Bo=Dh4tUDq=Eh_Ep1RMehwENqiaWeAdWRa-w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_sai: Add support for i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="0000000000003be82905ec1401d5"
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:56:23 +1100
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

--0000000000003be82905ec1401d5
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 2:04 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Add compatible string and specific soc data to support SAI on i.MX93
> platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 81f89f6767a2..68e1cc4c369a 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1579,6 +1579,17 @@ static const struct fsl_sai_soc_data
> fsl_sai_imx8ulp_data = {
>         .max_register = FSL_SAI_RTCAP,
>  };
>
> +static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
> +       .use_imx_pcm = true,
> +       .use_edma = true,
> +       .fifo_depth = 128,
> +       .reg_offset = 8,
> +       .mclk0_is_mclk1 = false,
> +       .pins = 4,
> +       .flags = 0,
> +       .max_register = FSL_SAI_MCTL,
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
>         { .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>         { .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
> @@ -1590,6 +1601,7 @@ static const struct of_device_id fsl_sai_ids[] = {
>         { .compatible = "fsl,imx8mp-sai", .data = &fsl_sai_imx8mp_data },
>         { .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
>         { .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mp_data },
> +       { .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> --
> 2.25.1
>
>

--0000000000003be82905ec1401d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 2:04 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add co=
mpatible string and specific soc data to support SAI on i.MX93<br>
platform.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>best regards</div><d=
iv>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 81f89f6767a2..68e1cc4c369a 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1579,6 +1579,17 @@ static const struct fsl_sai_soc_data fsl_sai_imx8ulp=
_data =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_register =3D FSL_SAI_RTCAP,<br>
=C2=A0};<br>
<br>
+static const struct fsl_sai_soc_data fsl_sai_imx93_data =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.use_imx_pcm =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.use_edma =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_depth =3D 128,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mclk0_is_mclk1 =3D false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pins =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_register =3D FSL_SAI_MCTL,<br>
+};<br>
+<br>
=C2=A0static const struct of_device_id fsl_sai_ids[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,vf610-sai&quot;, .d=
ata =3D &amp;fsl_sai_vf610_data },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx6sx-sai&quot;, .=
data =3D &amp;fsl_sai_imx6sx_data },<br>
@@ -1590,6 +1601,7 @@ static const struct of_device_id fsl_sai_ids[] =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mp-sai&quot;, .=
data =3D &amp;fsl_sai_imx8mp_data },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8ulp-sai&quot;, =
.data =3D &amp;fsl_sai_imx8ulp_data },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;fsl,imx8mn-sai&quot;, .=
data =3D &amp;fsl_sai_imx8mp_data },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fsl,imx93-sai&quot;, .d=
ata =3D &amp;fsl_sai_imx93_data },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(of, fsl_sai_ids);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000003be82905ec1401d5--
