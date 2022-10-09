Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B1C5F89AC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlX8K1wyfz3dv4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 17:24:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NiQB3aeW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NiQB3aeW;
	dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlWzv2Xwwz301m
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 17:17:29 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id d24so5803130ljl.9
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 23:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/EErkgAu4+sS/bcjgyuBvc1y8OiXjbSXTk2pNqKv6c=;
        b=NiQB3aeWglXaGIEIV3/i/gSogfgbbLnH7z2zhGaWVC8Ub35+EPLO4wIbZ3w2Enaa9l
         fB7UB5wJWSb36Fch45szcwQU3MZlznBhIlqnGPb0pmsam/81Ks2xHnu5zEXQnAi2qg3i
         dSsS3qLBwN2nRgQiy7WEyA/iYlzFUAe+I0+UZ5rIYslvx4yOek0t8p6ZIcwI1dcemtzD
         wCxogl78aJiSWW4JWgTgmm3LRhzhjI2VrYtJk154WvGbRaFpgo0Rqd0FK57yM6UhW1My
         M3KW0kDTX6pXCCEaK+7tvZNKYZw6O0RQP1r2DShvVSsHV70ENra54bDLdNvk4lvzUoZM
         ivDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/EErkgAu4+sS/bcjgyuBvc1y8OiXjbSXTk2pNqKv6c=;
        b=2zED5fHYh+k/eblMtFCHS1ObPFCHMTfXJv7nBegvy0Wbp81kn6xI47k4W+Nsy6nO38
         nr5K7QtUT8MpUAmU7zB7ntIgCkM8Zs1+bmIUIYavNHbRxYZ4XrYjJkyVrS2ANW7xAngZ
         INXtzT0eV/fhvQ9CGehwBQNWPfVvO4Aq2eQaEpHfPDb0CSGojNyU4QdMpzdb8/LU2IR/
         jXoZX9C1mxYVuiD5PP9GS36EAlJ3FGfyMpOxlqUE3KOmYATuc0lMeQFUEj63YnP7nIwt
         T3EEMOHWA1O13AXZILaFOl+Kk3RM1Uugvf1EcvJzE0UjY8AGxoCfUnjwJcH2pevugmSE
         vkSg==
X-Gm-Message-State: ACrzQf0/mppyvG+EdH3wAaNP5tp1nmpIxlySu+Ni+AACBKxrRr8lmowV
	9+B3dOdP6clatysOETlpc9nvA3HOvCCmnRlCsSY=
X-Google-Smtp-Source: AMsMyM74mW1O13BDrUgKjgucSJwkxHRRPwFOF4F1NZN8tz2anvpWrby4cMCRmLTayTpZ4+F7W/YAc9K7fmz95kyZoXI=
X-Received: by 2002:a2e:960e:0:b0:26b:e5ae:cd78 with SMTP id
 v14-20020a2e960e000000b0026be5aecd78mr4454929ljh.129.1665296241279; Sat, 08
 Oct 2022 23:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com> <20220930064441.2548505-3-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:17:09 +0800
Message-ID: <CAA+D8AO5qoPA3m8_-8jq6nYhNOSHaXimDGX3HRqrX54pbcQn3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000e846a905ea93fe62"
X-Mailman-Approved-At: Sun, 09 Oct 2022 17:24:02 +1100
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

--000000000000e846a905ea93fe62
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Rpmsg channel for MICFIL can also be created through rpmsg name service
> announcement. If this driver is probed, Cortex-A can access MICFIL
> which is actually controlled by Cortex-M through rpmsg channel for
> MICFIL. This driver also helps register ASoC platform device thus use
> of PLATFORM_DEVID_AUTO macro in API can automatically create device for
> each rpmsg channel.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-audio-rpmsg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-audio-rpmsg.c
> b/sound/soc/fsl/imx-audio-rpmsg.c
> index 905c3a071300..d5234ac4b09b 100644
> --- a/sound/soc/fsl/imx-audio-rpmsg.c
> +++ b/sound/soc/fsl/imx-audio-rpmsg.c
> @@ -88,7 +88,7 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device
> *rpdev)
>         /* Register platform driver for rpmsg routine */
>         data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
>                                                          IMX_PCM_DRV_NAME,
> -
> PLATFORM_DEVID_NONE,
> +
> PLATFORM_DEVID_AUTO,
>                                                          NULL, 0);
>         if (IS_ERR(data->rpmsg_pdev)) {
>                 dev_err(&rpdev->dev, "failed to register rpmsg
> platform.\n");
> @@ -110,6 +110,7 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device
> *rpdev)
>
>  static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
>         { .name = "rpmsg-audio-channel" },
> +       { .name = "rpmsg-micfil-channel" },
>         { },
>  };
>
> --
> 2.25.1
>
>

--000000000000e846a905ea93fe62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 2:46 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rpmsg =
channel for MICFIL can also be created through rpmsg name service<br>
announcement. If this driver is probed, Cortex-A can access MICFIL<br>
which is actually controlled by Cortex-M through rpmsg channel for<br>
MICFIL. This driver also helps register ASoC platform device thus use<br>
of PLATFORM_DEVID_AUTO macro in API can automatically create device for<br>
each rpmsg channel.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/imx-audio-rpmsg.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpms=
g.c<br>
index 905c3a071300..d5234ac4b09b 100644<br>
--- a/sound/soc/fsl/imx-audio-rpmsg.c<br>
+++ b/sound/soc/fsl/imx-audio-rpmsg.c<br>
@@ -88,7 +88,7 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Register platform driver for rpmsg routine *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data-&gt;rpmsg_pdev =3D platform_device_registe=
r_data(&amp;rpdev-&gt;dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMX_PCM_DRV_NAME,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM_DEVID_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM_DEVID_AUTO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(data-&gt;rpmsg_pdev)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;rpdev-=
&gt;dev, &quot;failed to register rpmsg platform.\n&quot;);<br>
@@ -110,6 +110,7 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device =
*rpdev)<br>
<br>
=C2=A0static struct rpmsg_device_id imx_audio_rpmsg_id_table[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .name =3D &quot;rpmsg-audio-channel&quot; },<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rpmsg-micfil-channel&quot; },=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
=C2=A0};<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e846a905ea93fe62--
