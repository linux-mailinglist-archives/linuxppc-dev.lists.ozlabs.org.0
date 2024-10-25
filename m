Return-Path: <linuxppc-dev+bounces-2571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A348B9AF97C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 08:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZXHj5DDsz2xgp;
	Fri, 25 Oct 2024 17:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729836145;
	cv=none; b=LAbirOhx4oldeA/F4XtSFQ/WxrguScwfVB8GMxkJHYaRuaPKBnjsddqDYWrRGN8d/NPZppIB2mIm6ulDykME+QOgj0T6iS+poqr/y5rMhEbE9AIiyt6cBaxAMEwNaRBSIfohdjUD4djZjcVySZzDIeGsQ791sonGfdfjpvKH8HiJPfvU8U9ZvyxmXMcqvGi7fYpF82PI4uyFlk8pQN42WZZFcJ48obQKrD+W+eAGYxtxM4mslJ+00WP8O9yH7Cdql2VrluVmrb8QOo+m4ZGZPpt2+jsRkE2ZhqYu7BR6XWo4Uw3Z+uT+xQfrDTeReC/AvT3Hw5O3copd3tGEvco+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729836145; c=relaxed/relaxed;
	bh=mDg+Vcaf01znu6tLfRn2IhIdAlHb4VMVWFTZr0BKPgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQWH+w1Subu4QDANLQTdGEGYHo96IlVbS0P6lFSG5XFfSm7iTa0f0hW22eBaQhxT+IvxNpT7JO+a2z4tT4wctlS8TCbjG4vB96M8uHuJSYqxxyMI3xhkQI8Cjgf4GsmE3pszqqkkXbaVApHqyjHHnxMu09njd+FUvNCZHBGLGpA5/eDXTld/jmpZqpyFeziKp9zrg0Xrnm5mTbyEAs+7x0VvIorJzmBtHRQPRkb+HHfj6oSKfzmQCzpOOoHvmlYdZ0VHvV3xmDywPsHRAuwj8gkqqXKjlvRejDxu4rGXSSMvlUKISUR9/wk9hyi66DvIiKfBa0Oz2PvVOMTYgJZH3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lmh/e49C; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lmh/e49C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZXHg36gpz2xWY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 17:02:22 +1100 (AEDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a3b7442db5so6371615ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 23:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729836138; x=1730440938; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDg+Vcaf01znu6tLfRn2IhIdAlHb4VMVWFTZr0BKPgA=;
        b=Lmh/e49CByKGWbZA2fbV8dt5614NG6rWIswvpJSdiB7V4u0fDXib9KSwAlj9i+17Ti
         24vNdYFjuOpkKB6PqcKUPr7/mlQ2+vWheVeo5ia8iRG9S15c/1N7tf/7do0Jvj3S8A0V
         ASbwMFDthSfkxqcii2h2ID02dMrDqHjNRgpdStfqwFEmjpIFEmQjtHUKmWjrdz+Puk0g
         BmrkTGJugMNN7thJmcp99iP2othCcMRq1UNy8iWuLFvF97/W+2I0XJDsxd5Knbql6YKN
         XNNcTem1FteWOsxxjfymlFw1zI5BkAMzX6GSO2p1FsFt/PO9N86YxNd7SlQroKcHpDd/
         6rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836138; x=1730440938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDg+Vcaf01znu6tLfRn2IhIdAlHb4VMVWFTZr0BKPgA=;
        b=VJEcOl7KKF1rZJyTyxy0wyWdZAGfPdGsI7YqEavSNezuDMr/JdSvTbqL/m9FfFRtci
         rRn+0Tnj6hQDJDYpsZ4tC3KyoV4YMgOb/Z6bqcYu1RGZYxtWkmF9zrgotSIE3ZAUsRG/
         L8PqghDU4NxwiuV1laTKDIesTQlUclF4vU7irP7gr79gczcuFSDkpvknKjVMBsGm1oC1
         Y6iR+KYjyCFqJpVONHoQlIv0uxWCGg15hf/K7e2G/LZ27ANzpTP3pR49Xoah8pF0zyGo
         Lg4AMbOERAipSHpJeVsjwsoUD7ve+saE83nFYGcnLJ71tEDoCFRdT1ocSuPIJSgijbic
         JwXA==
X-Forwarded-Encrypted: i=1; AJvYcCV/QQxsUm+ShEDg37MxGe+hk2WHKeUa6SgWS80xF+UauAA77Jf+LAfPQR2pWmGqqZ2qLBoMGMyOHI779wg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0/KnmAtMuW6zq7cGNKSjIjJf44+csTH5WkE9emY2eQkMq4EAy
	uXN5jrj9LzMUdXHIUaWDKGuZ5qnbgGyVTKSGEBRD78hz1e4Xt7dIGWvpVXLUPJuKJXlsxpShFfg
	JlTzGnMxps1LYyv0s9a0cOwSQpXQ=
X-Google-Smtp-Source: AGHT+IHI96rZzZ22LDvmBdQuWwH021STYYNGPQR+XjhKSil2TgSc4rDCozUvDSoqdcK4KvzLi4ZSRjHMWOc3Tbh0J84=
X-Received: by 2002:a05:6e02:1c0e:b0:3a4:d9d0:55a6 with SMTP id
 e9e14a558f8ab-3a4de80b425mr47871735ab.19.1729836137602; Thu, 24 Oct 2024
 23:02:17 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <1728712330-4389-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1728712330-4389-1-git-send-email-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 25 Oct 2024 14:02:02 +0800
Message-ID: <CAA+D8ANM9QYe3idfkp5XJOXwqQUQ-qc_FcpQSKFDzQVhuTWZKw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Support accessing registers by scmi interface
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 12, 2024 at 2:15=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> On i.MX95, the MQS module in Always-on (AON) domain only can
> be accessed by System Controller Management Interface (SCMI)
> MISC Protocol. So define a specific regmap_config for the case.
>

find an issue when IMX_SCMI_MISC_DRV=3Dm but SND_SOC_FSL_MQS=3Dy
will send v2 to fix it.

Best regards
Shengjiu Wang

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_mqs.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
> index 145f9ca15e43..0513e9e8402e 100644
> --- a/sound/soc/fsl/fsl_mqs.c
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -6,6 +6,7 @@
>  // Copyright 2019 NXP
>
>  #include <linux/clk.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/mfd/syscon.h>
> @@ -74,6 +75,29 @@ struct fsl_mqs {
>  #define FSL_MQS_RATES  (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
>  #define FSL_MQS_FORMATS        SNDRV_PCM_FMTBIT_S16_LE
>
> +static int fsl_mqs_sm_read(void *context, unsigned int reg, unsigned int=
 *val)
> +{
> +       struct fsl_mqs *mqs_priv =3D context;
> +       int num =3D 1;
> +
> +       if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
> +           mqs_priv->soc->ctrl_off =3D=3D reg)
> +               return scmi_imx_misc_ctrl_get(SCMI_IMX_CTRL_MQS1_SETTINGS=
, &num, val);
> +
> +       return -EINVAL;
> +};
> +
> +static int fsl_mqs_sm_write(void *context, unsigned int reg, unsigned in=
t val)
> +{
> +       struct fsl_mqs *mqs_priv =3D context;
> +
> +       if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
> +           mqs_priv->soc->ctrl_off =3D=3D reg)
> +               return scmi_imx_misc_ctrl_set(SCMI_IMX_CTRL_MQS1_SETTINGS=
, val);
> +
> +       return -EINVAL;
> +};
> +
>  static int fsl_mqs_hw_params(struct snd_pcm_substream *substream,
>                              struct snd_pcm_hw_params *params,
>                              struct snd_soc_dai *dai)
> @@ -188,6 +212,13 @@ static const struct regmap_config fsl_mqs_regmap_con=
fig =3D {
>         .cache_type =3D REGCACHE_NONE,
>  };
>
> +static const struct regmap_config fsl_mqs_sm_regmap =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_read =3D fsl_mqs_sm_read,
> +       .reg_write =3D fsl_mqs_sm_write,
> +};
> +
>  static int fsl_mqs_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
> @@ -219,6 +250,16 @@ static int fsl_mqs_probe(struct platform_device *pde=
v)
>                         dev_err(&pdev->dev, "failed to get gpr regmap\n")=
;
>                         return PTR_ERR(mqs_priv->regmap);
>                 }
> +       } else if (mqs_priv->soc->type =3D=3D TYPE_REG_SM) {
> +               mqs_priv->regmap =3D devm_regmap_init(&pdev->dev,
> +                                                   NULL,
> +                                                   mqs_priv,
> +                                                   &fsl_mqs_sm_regmap);
> +               if (IS_ERR(mqs_priv->regmap)) {
> +                       dev_err(&pdev->dev, "failed to init regmap: %ld\n=
",
> +                               PTR_ERR(mqs_priv->regmap));
> +                       return PTR_ERR(mqs_priv->regmap);
> +               }
>         } else {
>                 regs =3D devm_platform_ioremap_resource(pdev, 0);
>                 if (IS_ERR(regs))
> --
> 2.34.1
>

