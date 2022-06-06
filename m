Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23953E1C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:51:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGnKh1VPrz3dyy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:51:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fop1j2gU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fop1j2gU;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGdzM1m1Lz2yw1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 13:20:30 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id u23so21343538lfc.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jun 2022 20:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JBBOhm/oySl2buTR87HVpULyvrffJzB9SuPNOzesUIk=;
        b=Fop1j2gUIvRQGO/VLsO1X+nPzEtD8XZPr1/5f8bzCpn9rIW75ux7KENBir8L7SNM4h
         xwrBMjvmeQA199O8iY7h6mg08LJc2HyLjWtQRiimpOmzht76OyoWv31diaUjx1XNeizd
         TE0MZz3gZIlhkoH6qC8aGb2xi07EbfaS1JGgD2kSRxXcoCo2g8ILwsOYpQwipbZ3eSkC
         L10zfxnM8QW2k1iIRHRr1vYMxVH2vOoBiIXhA0s5sIaHBC2nvddydx2za7zmiSODBaB7
         w7Qt7wuekuNTq7ZRjbb1zQ+HEDnS2nnKKDknpaY7G0Lp/vJrqQNwN5CLHPvp0n1e2SIj
         OqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBBOhm/oySl2buTR87HVpULyvrffJzB9SuPNOzesUIk=;
        b=bWHmLtTYxeQ1Bhm04Hl84/QcBcT/OACI9pvsTBSkwRhmby+FMEfQou9atec/89hFK9
         c0rQeRcidhYw1m06MGkPhF9neA6osYG+K8Ofgo25ajXF110YAmCFZKONHSspMdxaK6BM
         3zjI0G9VF6itopndRIri6m8j5eKF/HH229DNoqcUP4zQkp+pKM76uvvua3qGPCtjnitV
         n1vpOZ8ngHN7HaeRe9Poq6kQY+PCY3JGREVnpHJXbC9Uq7PaXoWBkL03E2MjO69k65+K
         okmY+1fJSyJqDQRwovmc/jwxrApj9pBw5yCOFtsEhsOUYQWEyG684HmNbQXy+QyziqP1
         txbA==
X-Gm-Message-State: AOAM531ICX2U4YBG9KQdSkulc081Z2xapU4n457JGOb3Y+5hcS0mX869
	5GPM7VI8W3Nc2SvBDzhhFqaxN3LtVkHM4zsKDOc=
X-Google-Smtp-Source: ABdhPJyP6Fkw9PeAHNVSWk158HTkNrRp5yhF5FLfqD995zmg8kNq70vYnbiZhMkZ/nUeX90kYWBgB0eBPWA7vYBIAtc=
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr19491762lfv.285.1654485627593; Sun, 05
 Jun 2022 20:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092342.3328644-1-m.felsch@pengutronix.de> <20220601092342.3328644-3-m.felsch@pengutronix.de>
In-Reply-To: <20220601092342.3328644-3-m.felsch@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 11:20:16 +0800
Message-ID: <CAA+D8APDR7w3T5ek5q-mvNsrp-u7sAXCzdT+OCYEr7GkH3L2QA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_sai: add error message in case of missing
 imx-pcm-dma support
To: Marco Felsch <m.felsch@pengutronix.de>
Content-Type: multipart/alternative; boundary="0000000000001e698e05e0bef459"
X-Mailman-Approved-At: Mon, 06 Jun 2022 18:49:00 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000001e698e05e0bef459
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 5:23 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> If the imx-pcm-dma is required we need to have the module enabled. For
> all NXP/FSL sound cards using the ASoC architecture this is the case but
> in case of using the simple-audio-card sound card this isn't the case.
>
> In such case the driver probe fails silently and the card isn't
> available. It took a while to find the missing Kconfig. Make this easier
> for others by printing a error if this the module isn't available but
> required by the HW.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 3e54f1f71c1e..2371da814b09 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1152,8 +1152,11 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>          */
>         if (sai->soc_data->use_imx_pcm) {
>                 ret = imx_pcm_dma_init(pdev);
> -               if (ret)
> +               if (ret) {
> +                       if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
> +                               dev_err(dev, "Error: You must enable the
> imx-pcm-dma support!\n");
>                         goto err_pm_get_sync;
> +               }
>         } else {
>                 ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>                 if (ret)
> --
> 2.30.2
>
>

--0000000000001e698e05e0bef459
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 5:23 PM Marco =
Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de">m.felsch@pengutronix.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">If the imx-pcm-dma is required we need to have the module enabled. For<br=
>
all NXP/FSL sound cards using the ASoC architecture this is the case but<br=
>
in case of using the simple-audio-card sound card this isn&#39;t the case.<=
br>
<br>
In such case the driver probe fails silently and the card isn&#39;t<br>
available. It took a while to find the missing Kconfig. Make this easier<br=
>
for others by printing a error if this the module isn&#39;t available but<b=
r>
required by the HW.<br>
<br>
Signed-off-by: Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de" =
target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br></blockquote><div><br>=
</div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmai=
l.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regard=
s</div><div>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 3e54f1f71c1e..2371da814b09 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1152,8 +1152,11 @@ static int fsl_sai_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sai-&gt;soc_data-&gt;use_imx_pcm) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D imx_pcm_dma=
_init(pdev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Error: You must en=
able the imx-pcm-dma support!\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_get_sync;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_snd_dm=
aengine_pcm_register(dev, NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--0000000000001e698e05e0bef459--
