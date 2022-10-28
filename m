Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01348612650
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 00:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FF74K48z3cfF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 09:58:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AMw5gLO/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AMw5gLO/;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzFxg1MBKz2xvr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 19:26:14 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id b2so7107752lfp.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JTAoFfCzD+YZJ52QXBVgIgRDdphXv1Exc5UUJ2CJh7A=;
        b=AMw5gLO/O2bdq0e279HlR7nPSV6uyL2X4UpxBm9MZntKIZnrf67da4dUR1wE3wuVyG
         psJS7YnPfS1pyBsTjc/eLWvaTp4EBPzDEbTEh4bxVnQC2ruf90bIXDlYczWG+GAkhcqP
         MsSmm4udfThNuONXfYSFgpkTzqztv/s0F96+9SYrixG6WiTCQMFE+qq/50oE7gPT77D6
         ynIuqSw4MfhjqCiw4gRbxoAFgWBbFv70IvHX5fqR+VutxtwjYNvsYjnLeHOkYa5/bCYT
         6qc9bM0sSS57VIdcMvErh7cm2B3ydXhYru9Y2PRDDaOgN9bNGx2G2ya5n+sm3WXc1bq0
         Sw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTAoFfCzD+YZJ52QXBVgIgRDdphXv1Exc5UUJ2CJh7A=;
        b=Z3+IQFqFdHKWn5N+GwPPdH6CgqLsmqPy2uQlCjSWMxa3L+R2ZZLNUH15BvvPgXl8QN
         c+2x/A7b8DhpRVVipViFLC1qYhB7lPXCbHmpPl7A99KezvHAqUpYGaaS2RlmT386Zozg
         hzwGnhEp8ZctT6nit81ZfhHkfegKKBa/DXq5Mks8cU8IMx6X/l2yV0Cxr5y2dJL7caC0
         oE4MdJuu71EiP1W3he18Ki3ZjRCuRMMk3SUTioLEA0rC2GaFjSWBVvyTgw8HdOyqHpHt
         2EQutrToXSa/FSU72muoc8ZxHtcPUZAdhdQy28oWjdOlJ2d84I/yTQPEvRfRcINvro09
         rhgQ==
X-Gm-Message-State: ACrzQf2OmZ25H1BuDuUazWwCL7DYYHgAI6isMSWPkwN7eF3ot/tpyNfO
	OwMWAF9O68yM6R9HUc6Xu9U+b0QT37pBS1Iz1Tk=
X-Google-Smtp-Source: AMsMyM7FYIVxEh1fD5TJVccfh+/7H4U8HYdcXOwDwowp0lrEqjvD2RqrIEuu0WAsMYvwVOjKJhpKlp5sNN+lTMBk2c8=
X-Received: by 2002:a05:6512:1093:b0:4a2:69f9:310f with SMTP id
 j19-20020a056512109300b004a269f9310fmr21042462lfg.433.1666945571466; Fri, 28
 Oct 2022 01:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221027060311.2549711-1-chancel.liu@nxp.com> <20221027060311.2549711-4-chancel.liu@nxp.com>
In-Reply-To: <20221027060311.2549711-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Oct 2022 16:25:58 +0800
Message-ID: <CAA+D8APan2fjZjBHbF8hap=0kLcEg5Dhs17kvVR_c=uStWAZ0Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000a5b1db05ec1402a7"
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

--000000000000a5b1db05ec1402a7
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 2:04 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> There is a limit to eDMA AXI on i.MX93. Only TCD that has NBYTES in a
> multiple of 8bytes can enable scatter-gather. NBYTES is calculated by
> bus width times maxburst. On i.MX93 platform the value of maxburst is
> specified to 8. It makes sure that NBYTES is a multiple of 8bytes.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 11 +++++++----
>  sound/soc/fsl/fsl_sai.h |  1 +
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 68e1cc4c369a..a0ea27f06997 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -872,10 +872,10 @@ static int fsl_sai_dai_probe(struct snd_soc_dai
> *cpu_dai)
>
>         regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
>                            FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
> -                          sai->soc_data->fifo_depth -
> FSL_SAI_MAXBURST_TX);
> +                          sai->soc_data->fifo_depth -
> sai->dma_params_tx.maxburst);
>         regmap_update_bits(sai->regmap, FSL_SAI_RCR1(ofs),
>                            FSL_SAI_CR1_RFW_MASK(sai->soc_data->fifo_depth),
> -                          FSL_SAI_MAXBURST_RX - 1);
> +                          sai->dma_params_rx.maxburst - 1);
>
>         snd_soc_dai_init_dma_data(cpu_dai, &sai->dma_params_tx,
>                                 &sai->dma_params_rx);
> @@ -1416,8 +1416,10 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>
>         sai->dma_params_rx.addr = sai->res->start + FSL_SAI_RDR0;
>         sai->dma_params_tx.addr = sai->res->start + FSL_SAI_TDR0;
> -       sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
> -       sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
> +       sai->dma_params_rx.maxburst =
> +               sai->soc_data->max_burst[RX] ?
> sai->soc_data->max_burst[RX] : FSL_SAI_MAXBURST_RX;
> +       sai->dma_params_tx.maxburst =
> +               sai->soc_data->max_burst[TX] ?
> sai->soc_data->max_burst[TX] : FSL_SAI_MAXBURST_TX;
>
>         sai->pinctrl = devm_pinctrl_get(&pdev->dev);
>
> @@ -1588,6 +1590,7 @@ static const struct fsl_sai_soc_data
> fsl_sai_imx93_data = {
>         .pins = 4,
>         .flags = 0,
>         .max_register = FSL_SAI_MCTL,
> +       .max_burst = {8, 8},
>  };
>
>  static const struct of_device_id fsl_sai_ids[] = {
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 697f6690068c..197748a888d5 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -235,6 +235,7 @@ struct fsl_sai_soc_data {
>         unsigned int reg_offset;
>         unsigned int flags;
>         unsigned int max_register;
> +       unsigned int max_burst[2];
>  };
>
>  /**
> --
> 2.25.1
>
>

--000000000000a5b1db05ec1402a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 2:04 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There =
is a limit to eDMA AXI on i.MX93. Only TCD that has NBYTES in a<br>
multiple of 8bytes can enable scatter-gather. NBYTES is calculated by<br>
bus width times maxburst. On i.MX93 platform the value of maxburst is<br>
specified to 8. It makes sure that NBYTES is a multiple of 8bytes.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>best regards</div><d=
iv>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 11 +++++++----<br>
=C2=A0sound/soc/fsl/fsl_sai.h |=C2=A0 1 +<br>
=C2=A02 files changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 68e1cc4c369a..a0ea27f06997 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -872,10 +872,10 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_=
dai)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(sai-&gt;regmap, FSL_SAI_TCR1=
(ofs),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_CR1_RFW_MASK(sai-&gt;soc_data-&gt;fifo_dept=
h),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sai-&gt;soc_data-&gt;fifo_depth - FSL_SAI_MAXBURST_TX);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sai-&gt;soc_data-&gt;fifo_depth - sai-&gt;dma_params_tx.m=
axburst);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 regmap_update_bits(sai-&gt;regmap, FSL_SAI_RCR1=
(ofs),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0FSL_SAI_CR1_RFW_MASK(sai-&gt;soc_data-&gt;fifo_dept=
h),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 FSL_SAI_MAXBURST_RX - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sai-&gt;dma_params_rx.maxburst - 1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 snd_soc_dai_init_dma_data(cpu_dai, &amp;sai-&gt=
;dma_params_tx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sai-&gt;dma_params_rx);<br>
@@ -1416,8 +1416,10 @@ static int fsl_sai_probe(struct platform_device *pde=
v)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;dma_params_rx.addr =3D sai-&gt;res-&gt;=
start + FSL_SAI_RDR0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;dma_params_tx.addr =3D sai-&gt;res-&gt;=
start + FSL_SAI_TDR0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;dma_params_rx.maxburst =3D FSL_SAI_MAXB=
URST_RX;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;dma_params_tx.maxburst =3D FSL_SAI_MAXB=
URST_TX;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;dma_params_rx.maxburst =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;soc_data-&g=
t;max_burst[RX] ? sai-&gt;soc_data-&gt;max_burst[RX] : FSL_SAI_MAXBURST_RX;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;dma_params_tx.maxburst =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sai-&gt;soc_data-&g=
t;max_burst[TX] ? sai-&gt;soc_data-&gt;max_burst[TX] : FSL_SAI_MAXBURST_TX;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;pinctrl =3D devm_pinctrl_get(&amp;pdev-=
&gt;dev);<br>
<br>
@@ -1588,6 +1590,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx93_da=
ta =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pins =3D 4,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_register =3D FSL_SAI_MCTL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_burst =3D {8, 8},<br>
=C2=A0};<br>
<br>
=C2=A0static const struct of_device_id fsl_sai_ids[] =3D {<br>
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h<br>
index 697f6690068c..197748a888d5 100644<br>
--- a/sound/soc/fsl/fsl_sai.h<br>
+++ b/sound/soc/fsl/fsl_sai.h<br>
@@ -235,6 +235,7 @@ struct fsl_sai_soc_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int reg_offset;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int flags;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int max_register;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int max_burst[2];<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000a5b1db05ec1402a7--
