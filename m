Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734B953E1C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:50:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGnHd2JTVz3f2q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:50:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YxK8uSmp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YxK8uSmp;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGdGY2Lk0z2yK2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 12:48:35 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id h23so21246211lfe.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jun 2022 19:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sv6oZK17zG5gvA5QEnVohTQARmrTfyrgFMPCXyJ6Nxc=;
        b=YxK8uSmp4knvlPLa1cmR9hlwFc95gbYXpVzlMto5nfIcsC3ZLT0aP1aQPf5uv+moXg
         tWnfGqKYNy1Qr3ZFAy7KEFRkZ50DGvFameg0CeUDWckVcZkU9tV4DxLrjS9XehN50swp
         HhP3FOlgxpoFah4fMB9z+pg4iYNY2i3dnLOVxfqxyHLetCeMYMKOyWqK0z474Cc9ZNj9
         w13cN6ZEIrEK1biiTr9DvWz7mRvCRNxRsQmiFF50w6PzHLalu6y+NPNEbUNT4Ng9y3js
         RqXYg8O43eqRLDmwobIRlJfxHIThWRqndXOThQzJ9yoNie6KDPszi4nfrFjjyDNc0hOB
         yBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sv6oZK17zG5gvA5QEnVohTQARmrTfyrgFMPCXyJ6Nxc=;
        b=j5LNUtTpU44u+NMQpMTQaZg4jjweh8GV4m6o1sFuFc59dJsDcJ3x+JCMGlPVeXgCMO
         CtiVqcm7iuX9bCxyOorUZJPTN22U80TaAAtNqLgAvd2o99CPyThBIzR1GSYUXvD1WPP+
         FrxjqOKvCV0jdrEsuB+day4RyOWW0Nt1pBxpmNeRm7FmEtS0MNA/jDQhorj9ssPQk3nm
         Qhf3G7oWm1wbrspUBxt1iA1R74EPihQChhZu5gJz34DIUHQmS0hj+vOvVdEEOlV4l+ie
         nH/aePnRRdk/M5W7Wui0wM6d39Ku0c9hlTdGG6pXdbhDpZTz3easvkYeJQROqBZxl5Hb
         u39w==
X-Gm-Message-State: AOAM531x1ZMuvCm+RPq/9iaqAPpAF495QJgTvX64mQrCP9Q46aUX1FKE
	cAW6Ud/I1q7EmizLS9KXBZxrROF2ptLGnXvNOuEFF+SH2Cw=
X-Google-Smtp-Source: ABdhPJxguDa9DnaYK7r4Z2SKweViulzegbAUrScOFa7SaHNHi81lzmI5LDHNMrkF0P8kmDDqES8dZzNdIH7nlCCSkng=
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr19433458lfv.285.1654483710697; Sun, 05
 Jun 2022 19:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220601092342.3328644-1-m.felsch@pengutronix.de> <20220601092342.3328644-2-m.felsch@pengutronix.de>
In-Reply-To: <20220601092342.3328644-2-m.felsch@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 10:48:19 +0800
Message-ID: <CAA+D8AMKt8SH2M_zd-6dYBAb2X=3X1p5V=yW72bXohjBCBh9wg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_sai: convert to dev_err_probe
To: Marco Felsch <m.felsch@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000dce4d905e0be8195"
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

--000000000000dce4d905e0be8195
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 5:23 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Make use of the new macro to get device defered information for free
> and to cleanup the code a bit. No functional changes.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  sound/soc/fsl/fsl_sai.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index a7637d602f3c..3e54f1f71c1e 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1034,21 +1034,15 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         }
>
>         sai->regmap = devm_regmap_init_mmio(dev, base,
> &fsl_sai_regmap_config);
> -       if (IS_ERR(sai->regmap)) {
> -               dev_err(dev, "regmap init failed\n");
> -               return PTR_ERR(sai->regmap);
> -       }
> +       if (IS_ERR(sai->regmap))
> +               return dev_err_probe(dev, PTR_ERR(sai->regmap), "regmap
> init failed\n");
>
>         sai->bus_clk = devm_clk_get(dev, "bus");
>         /* Compatible with old DTB cases */
>         if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
>                 sai->bus_clk = devm_clk_get(dev, "sai");
> -       if (IS_ERR(sai->bus_clk)) {
> -               dev_err(dev, "failed to get bus clock: %ld\n",
> -                               PTR_ERR(sai->bus_clk));
> -               /* -EPROBE_DEFER */
> -               return PTR_ERR(sai->bus_clk);
> -       }
> +       if (IS_ERR(sai->bus_clk))
> +               return dev_err_probe(dev, PTR_ERR(sai->bus_clk), "failed
> to get bus clock\n");
>
>         for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
>                 sprintf(tmp, "mclk%d", i);
> @@ -1067,14 +1061,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         irq = platform_get_irq(pdev, 0);
>         if (irq < 0)
> -               return irq;
> +               return dev_err_probe(dev, irq, "failed to get the irq\n");
>

This change is not needed,  platform_get_irq() has done the same operation.

best regards
wang shengjiu

>
>         ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
>                                np->name, sai);
> -       if (ret) {
> -               dev_err(dev, "failed to claim irq %u\n", irq);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to claim irq %u\n",
> irq);
>
>         memcpy(&sai->cpu_dai_drv, &fsl_sai_dai_template,
>                sizeof(fsl_sai_dai_template));
> @@ -1089,8 +1081,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
>             of_find_property(np, "fsl,sai-asynchronous", NULL)) {
>                 /* error out if both synchronous and asynchronous are
> present */
> -               dev_err(dev, "invalid binding for synchronous mode\n");
> -               return -EINVAL;
> +               return dev_err_probe(dev, -EINVAL, "invalid binding for
> synchronous mode\n");
>         }
>
>         if (of_find_property(np, "fsl,sai-synchronous-rx", NULL)) {
> @@ -1109,14 +1100,12 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
>             of_device_is_compatible(np, "fsl,imx6ul-sai")) {
>                 gpr =
> syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
> -               if (IS_ERR(gpr)) {
> -                       dev_err(dev, "cannot find iomuxc registers\n");
> -                       return PTR_ERR(gpr);
> -               }
> +               if (IS_ERR(gpr))
> +                       return dev_err_probe(dev, PTR_ERR(gpr), "cannot
> find iomuxc registers\n");
>
>                 index = of_alias_get_id(np, "sai");
>                 if (index < 0)
> -                       return index;
> +                       return dev_err_probe(dev, index, "cannot find sai
> aliases\n");
>
>                 regmap_update_bits(gpr, IOMUXC_GPR1, MCLK_DIR(index),
>                                    MCLK_DIR(index));
> --
> 2.30.2
>
>

--000000000000dce4d905e0be8195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 5:23 PM Marco =
Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de">m.felsch@pengutronix.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Make use of the new macro to get device defered information for free<br>
and to cleanup the code a bit. No functional changes.<br>
<br>
Signed-off-by: Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de" =
target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 33 +++++++++++----------------------<br>
=C2=A01 file changed, 11 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index a7637d602f3c..3e54f1f71c1e 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1034,21 +1034,15 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;regmap =3D devm_regmap_init_mmio(dev, b=
ase, &amp;fsl_sai_regmap_config);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sai-&gt;regmap)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
regmap init failed\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sai-=
&gt;regmap);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sai-&gt;regmap))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_prob=
e(dev, PTR_ERR(sai-&gt;regmap), &quot;regmap init failed\n&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;bus_clk =3D devm_clk_get(dev, &quot;bus=
&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Compatible with old DTB cases */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;bus_clk) &amp;&amp; PTR_ERR(=
sai-&gt;bus_clk) !=3D -EPROBE_DEFER)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;bus_clk =3D=
 devm_clk_get(dev, &quot;sai&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sai-&gt;bus_clk)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to get bus clock: %ld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PTR_ERR(sai-&gt;bus_clk));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* -EPROBE_DEFER */=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(sai-=
&gt;bus_clk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(sai-&gt;bus_clk))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_prob=
e(dev, PTR_ERR(sai-&gt;bus_clk), &quot;failed to get bus clock\n&quot;);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt; FSL_SAI_MCLK_MAX; i++) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(tmp, &quot;=
mclk%d&quot;, i);<br>
@@ -1067,14 +1061,12 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D platform_get_irq(pdev, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (irq &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_prob=
e(dev, irq, &quot;failed to get the irq\n&quot;);<br></blockquote><div><br>=
</div><div>This change is not needed,=C2=A0 platform_get_irq() has done the=
 same operation.</div><div><br></div><div>best regards</div><div>wang sheng=
jiu</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_request_irq(dev, irq, fsl_sai_isr,=
 IRQF_SHARED,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0np-&gt;name, sai);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
failed to claim irq %u\n&quot;, irq);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_prob=
e(dev, ret, &quot;failed to claim irq %u\n&quot;, irq);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(&amp;sai-&gt;cpu_dai_drv, &amp;fsl_sai_d=
ai_template,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(fsl_sai_dai_t=
emplate));<br>
@@ -1089,8 +1081,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_find_property(np, &quot;fsl,sai-synchron=
ous-rx&quot;, NULL) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_find_property(np, &quot;fsl,sa=
i-asynchronous&quot;, NULL)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* error out if bot=
h synchronous and asynchronous are present */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
invalid binding for synchronous mode\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev_err_prob=
e(dev, -EINVAL, &quot;invalid binding for synchronous mode\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_find_property(np, &quot;fsl,sai-synchron=
ous-rx&quot;, NULL)) {<br>
@@ -1109,14 +1100,12 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (of_find_property(np, &quot;fsl,sai-mclk-dir=
ection-output&quot;, NULL) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_device_is_compatible(np, &quot=
;fsl,imx6ul-sai&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpr =3D syscon_regm=
ap_lookup_by_compatible(&quot;fsl,imx6ul-iomuxc-gpr&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gpr)) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(dev, &quot;cannot find iomuxc registers\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return PTR_ERR(gpr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gpr))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return dev_err_probe(dev, PTR_ERR(gpr), &quot;cannot find iomuxc =
registers\n&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D of_alias_=
get_id(np, &quot;sai&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (index &lt; 0)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return dev_err_probe(dev, index, &quot;cannot find sai aliases\n&=
quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(=
gpr, IOMUXC_GPR1, MCLK_DIR(index),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MCLK_DIR(index));<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000dce4d905e0be8195--
