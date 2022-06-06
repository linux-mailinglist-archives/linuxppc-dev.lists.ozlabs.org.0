Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F753E1C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGnK037CHz3fBT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:51:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jsu9VIl9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jsu9VIl9;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGdx50cMkz2yyM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 13:18:32 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id a17so14367405lfs.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jun 2022 20:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYV/s+XdTrp51h0m3iHkp7+B6YHRFew7BBznSGqnGvQ=;
        b=Jsu9VIl92GVcM25IcagXtGSOCYPSusp7itsUDAkRl6aeBbieiL+gW/oljIEKQ99RnU
         Tu+1SOz+IIwZNTQnwlrvJpXfZiBpblQpujdLhrsA5/gRyNpZoWc+R532G/BBKYZvdwVA
         4zCE2zuysY7lbCYI05nW+DEWuDzL2cR+2kJL/Srwv0GodRiWACOZf7qEsIfyvubbBiw9
         wGQytoGras9/aA6jPq7FfKWPM+qXWtUQX0zRbdIKuYx7LPwJ8vMCuKranL35jlHVSfT1
         QmKWGgksRzTuGFjwbnRIcruQMjvZrAEfyYIxVaF136QmVkMWoWAMMIKd9OioeeESeeUW
         mOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYV/s+XdTrp51h0m3iHkp7+B6YHRFew7BBznSGqnGvQ=;
        b=JeWjI2wqbnGUIS7h2+wOk7uOe/JFoBwBKxOghWRnP90fWdLTnwOFDRr7rp9/cZyYUv
         Hd6tDGR1fxvPimrZz6qROx+4OFxe1XtDxHXtW9aQBZqoSpdC8vw+riIZfGNetXDSc+hc
         DoR58Ot6Fv9QFCTjdzgLKRt0R7tJayy7SMooZPJMtM5l7HQUf6JA2fyy1uLwoPWz/yVo
         ENpV0HYG4dt8jeOw653hvH2TGv3NTM3iO1RVCuFqLG74yJMLrFi35F0KHpAVemTthmfa
         JAeXZJ0kM/Bc5S39O/s92y/R/XUPzQg05YVeDxIwnIuXmEGSztEe6uTm/1690mjIUqJJ
         yS4w==
X-Gm-Message-State: AOAM531XvS41ptnsQcDmj1MxcpyYAQg75MMBKRs9ngaPJKYRogkA+q7q
	Vje6OfBcdxtTl8Hqf3E4DyKlU5HHAmX2OfI8X3A=
X-Google-Smtp-Source: ABdhPJwYqXK4EOPtozSFEpBjVxSmfarI1fmQMyKnBROF0i/rAwAZ7QEn0uVIVjCSFi17v2PFRnTPZbNG7I3rbncxQ8o=
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr19488016lfv.285.1654485507911; Sun, 05
 Jun 2022 20:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
In-Reply-To: <20220601092342.3328644-1-m.felsch@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 11:18:16 +0800
Message-ID: <CAA+D8ANDU0bb-u5Tvg+Sad3Y-MW32eysXThOLmYRNwiZXN3OeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: use local device pointer
To: Marco Felsch <m.felsch@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000fc31d005e0beecf2"
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

--000000000000fc31d005e0beecf2
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 5:23 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Use a local variable to dereference the device pointer once and use the
> local variable in further calls. No functional changes.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 53 +++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 26 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index fa950dde5310..a7637d602f3c 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1004,6 +1004,7 @@ static int fsl_sai_runtime_resume(struct device
> *dev);
>  static int fsl_sai_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
>         struct fsl_sai *sai;
>         struct regmap *gpr;
>         struct resource *res;
> @@ -1012,12 +1013,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         int irq, ret, i;
>         int index;
>
> -       sai = devm_kzalloc(&pdev->dev, sizeof(*sai), GFP_KERNEL);
> +       sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
>         if (!sai)
>                 return -ENOMEM;
>
>         sai->pdev = pdev;
> -       sai->soc_data = of_device_get_match_data(&pdev->dev);
> +       sai->soc_data = of_device_get_match_data(dev);
>
>         sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
>
> @@ -1032,18 +1033,18 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                         ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
>         }
>
> -       sai->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> &fsl_sai_regmap_config);
> +       sai->regmap = devm_regmap_init_mmio(dev, base,
> &fsl_sai_regmap_config);
>         if (IS_ERR(sai->regmap)) {
> -               dev_err(&pdev->dev, "regmap init failed\n");
> +               dev_err(dev, "regmap init failed\n");
>                 return PTR_ERR(sai->regmap);
>         }
>
> -       sai->bus_clk = devm_clk_get(&pdev->dev, "bus");
> +       sai->bus_clk = devm_clk_get(dev, "bus");
>         /* Compatible with old DTB cases */
>         if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
> -               sai->bus_clk = devm_clk_get(&pdev->dev, "sai");
> +               sai->bus_clk = devm_clk_get(dev, "sai");
>         if (IS_ERR(sai->bus_clk)) {
> -               dev_err(&pdev->dev, "failed to get bus clock: %ld\n",
> +               dev_err(dev, "failed to get bus clock: %ld\n",
>                                 PTR_ERR(sai->bus_clk));
>                 /* -EPROBE_DEFER */
>                 return PTR_ERR(sai->bus_clk);
> @@ -1051,9 +1052,9 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
>                 sprintf(tmp, "mclk%d", i);
> -               sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
> +               sai->mclk_clk[i] = devm_clk_get(dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
> -                       dev_err(&pdev->dev, "failed to get mclk%d clock:
> %ld\n",
> +                       dev_err(dev, "failed to get mclk%d clock: %ld\n",
>                                         i + 1, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
> @@ -1068,10 +1069,10 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (irq < 0)
>                 return irq;
>
> -       ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, IRQF_SHARED,
> +       ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
>                                np->name, sai);
>         if (ret) {
> -               dev_err(&pdev->dev, "failed to claim irq %u\n", irq);
> +               dev_err(dev, "failed to claim irq %u\n", irq);
>                 return ret;
>         }
>
> @@ -1088,7 +1089,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
>             of_find_property(np, "fsl,sai-asynchronous", NULL)) {
>                 /* error out if both synchronous and asynchronous are
> present */
> -               dev_err(&pdev->dev, "invalid binding for synchronous
> mode\n");
> +               dev_err(dev, "invalid binding for synchronous mode\n");
>                 return -EINVAL;
>         }
>
> @@ -1109,7 +1110,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>             of_device_is_compatible(np, "fsl,imx6ul-sai")) {
>                 gpr =
> syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
>                 if (IS_ERR(gpr)) {
> -                       dev_err(&pdev->dev, "cannot find iomuxc
> registers\n");
> +                       dev_err(dev, "cannot find iomuxc registers\n");
>                         return PTR_ERR(gpr);
>                 }
>
> @@ -1127,23 +1128,23 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
>
>         platform_set_drvdata(pdev, sai);
> -       pm_runtime_enable(&pdev->dev);
> -       if (!pm_runtime_enabled(&pdev->dev)) {
> -               ret = fsl_sai_runtime_resume(&pdev->dev);
> +       pm_runtime_enable(dev);
> +       if (!pm_runtime_enabled(dev)) {
> +               ret = fsl_sai_runtime_resume(dev);
>                 if (ret)
>                         goto err_pm_disable;
>         }
>
> -       ret = pm_runtime_get_sync(&pdev->dev);
> +       ret = pm_runtime_get_sync(dev);
>         if (ret < 0) {
> -               pm_runtime_put_noidle(&pdev->dev);
> +               pm_runtime_put_noidle(dev);
>                 goto err_pm_get_sync;
>         }
>
>         /* Get sai version */
> -       ret = fsl_sai_check_version(&pdev->dev);
> +       ret = fsl_sai_check_version(dev);
>         if (ret < 0)
> -               dev_warn(&pdev->dev, "Error reading SAI version: %d\n",
> ret);
> +               dev_warn(dev, "Error reading SAI version: %d\n", ret);
>
>         /* Select MCLK direction */
>         if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
> @@ -1152,7 +1153,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                                    FSL_SAI_MCTL_MCLK_EN,
> FSL_SAI_MCTL_MCLK_EN);
>         }
>
> -       ret = pm_runtime_put_sync(&pdev->dev);
> +       ret = pm_runtime_put_sync(dev);
>         if (ret < 0)
>                 goto err_pm_get_sync;
>
> @@ -1165,12 +1166,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 if (ret)
>                         goto err_pm_get_sync;
>         } else {
> -               ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +               ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>                 if (ret)
>                         goto err_pm_get_sync;
>         }
>
> -       ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
> +       ret = devm_snd_soc_register_component(dev, &fsl_component,
>                                               &sai->cpu_dai_drv, 1);
>         if (ret)
>                 goto err_pm_get_sync;
> @@ -1178,10 +1179,10 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         return ret;
>
>  err_pm_get_sync:
> -       if (!pm_runtime_status_suspended(&pdev->dev))
> -               fsl_sai_runtime_suspend(&pdev->dev);
> +       if (!pm_runtime_status_suspended(dev))
> +               fsl_sai_runtime_suspend(dev);
>  err_pm_disable:
> -       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_disable(dev);
>
>         return ret;
>  }
> --
> 2.30.2
>
>

--000000000000fc31d005e0beecf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 5:23 PM Marco =
Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de">m.felsch@pengutronix.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Use a local variable to dereference the device pointer once and use the<b=
r>
local variable in further calls. No functional changes.<br>
<br>
Signed-off-by: Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de" =
target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br></blockquote><div><br>=
</div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmai=
l.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regard=
s</div><div>Wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 53 +++++++++++++++++++++-------------------=
-<br>
=C2=A01 file changed, 27 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index fa950dde5310..a7637d602f3c 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1004,6 +1004,7 @@ static int fsl_sai_runtime_resume(struct device *dev)=
;<br>
=C2=A0static int fsl_sai_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D pdev-&gt;dev.of_node=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fsl_sai *sai;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct regmap *gpr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
@@ -1012,12 +1013,12 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq, ret, i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int index;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sai =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*sai), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sai =3D devm_kzalloc(dev, sizeof(*sai), GFP_KER=
NEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sai)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;pdev =3D pdev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;soc_data =3D of_device_get_match_data(&=
amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;soc_data =3D of_device_get_match_data(d=
ev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;is_lsb_first =3D of_property_read_bool(=
np, &quot;lsb-first&quot;);<br>
<br>
@@ -1032,18 +1033,18 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;regmap =3D devm_regmap_init_mmio(&amp;p=
dev-&gt;dev, base, &amp;fsl_sai_regmap_config);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;regmap =3D devm_regmap_init_mmio(dev, b=
ase, &amp;fsl_sai_regmap_config);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;regmap)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;regmap init failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
regmap init failed\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(sai-=
&gt;regmap);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;bus_clk =3D devm_clk_get(&amp;pdev-&gt;=
dev, &quot;bus&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;bus_clk =3D devm_clk_get(dev, &quot;bus=
&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Compatible with old DTB cases */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;bus_clk) &amp;&amp; PTR_ERR(=
sai-&gt;bus_clk) !=3D -EPROBE_DEFER)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;bus_clk =3D=
 devm_clk_get(&amp;pdev-&gt;dev, &quot;sai&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;bus_clk =3D=
 devm_clk_get(dev, &quot;sai&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;bus_clk)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to get bus clock: %ld\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to get bus clock: %ld\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTR_ERR(sai-&gt;bus_clk));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* -EPROBE_DEFER */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(sai-=
&gt;bus_clk);<br>
@@ -1051,9 +1052,9 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt; FSL_SAI_MCLK_MAX; i++) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(tmp, &quot;=
mclk%d&quot;, i);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;mclk_clk[i]=
 =3D devm_clk_get(&amp;pdev-&gt;dev, tmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;mclk_clk[i]=
 =3D devm_clk_get(dev, tmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;=
mclk_clk[i])) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;failed to get mclk%d clock: %ld\=
n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(dev, &quot;failed to get mclk%d clock: %ld\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i + 1, P=
TR_ERR(sai-&gt;mclk_clk[i]));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sai-&gt;mclk_clk[i] =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -1068,10 +1069,10 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(&amp;pdev-&gt;dev, irq=
, fsl_sai_isr, IRQF_SHARED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, irq, fsl_sai_isr,=
 IRQF_SHARED,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0np-&gt;name, sai);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;failed to claim irq %u\n&quot;, irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to claim irq %u\n&quot;, irq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -1088,7 +1089,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_find_property(np, &quot;fsl,sai-synchron=
ous-rx&quot;, NULL) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_find_property(np, &quot;fsl,sa=
i-asynchronous&quot;, NULL)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* error out if bot=
h synchronous and asynchronous are present */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;invalid binding for synchronous mode\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
invalid binding for synchronous mode\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -1109,7 +1110,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_device_is_compatible(np, &quot=
;fsl,imx6ul-sai&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr =3D syscon_regm=
ap_lookup_by_compatible(&quot;fsl,imx6ul-iomuxc-gpr&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(gpr)) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;cannot find iomuxc registers\n&q=
uot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(dev, &quot;cannot find iomuxc registers\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return PTR_ERR(gpr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -1127,23 +1128,23 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;dma_params_tx.maxburst =3D FSL_SAI_MAXB=
URST_TX;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, sai);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_enable(&amp;pdev-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pm_runtime_enabled(&amp;pdev-&gt;dev)) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fsl_sai_run=
time_resume(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_enable(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pm_runtime_enabled(dev)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fsl_sai_run=
time_resume(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_disable;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_get_sync(&amp;pdev-&gt;dev);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_get_sync(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_noid=
le(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_noid=
le(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_pm_get_syn=
c;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get sai version */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fsl_sai_check_version(&amp;pdev-&gt;dev=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fsl_sai_check_version(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-=
&gt;dev, &quot;Error reading SAI version: %d\n&quot;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot=
;Error reading SAI version: %d\n&quot;, ret);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Select MCLK direction */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_find_property(np, &quot;fsl,sai-mclk-dir=
ection-output&quot;, NULL) &amp;&amp;<br>
@@ -1152,7 +1153,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_MCTL_MCLK_EN, F=
SL_SAI_MCTL_MCLK_EN);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_put_sync(&amp;pdev-&gt;dev);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_put_sync(dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_pm_get_syn=
c;<br>
<br>
@@ -1165,12 +1166,12 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_get_sync;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_snd_dm=
aengine_pcm_register(&amp;pdev-&gt;dev, NULL, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_snd_dm=
aengine_pcm_register(dev, NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_get_sync;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_snd_soc_register_component(&amp;pd=
ev-&gt;dev, &amp;fsl_component,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_snd_soc_register_component(dev, &a=
mp;fsl_component,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;sai-&gt;cpu_dai_drv, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_pm_get_syn=
c;<br>
@@ -1178,10 +1179,10 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
=C2=A0err_pm_get_sync:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pm_runtime_status_suspended(&amp;pdev-&gt;=
dev))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsl_sai_runtime_sus=
pend(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pm_runtime_status_suspended(dev))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsl_sai_runtime_sus=
pend(dev);<br>
=C2=A0err_pm_disable:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(dev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000fc31d005e0beecf2--
