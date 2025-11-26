Return-Path: <linuxppc-dev+bounces-14495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF10C87E7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 04:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGPcr284kz2ynP;
	Wed, 26 Nov 2025 14:07:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764126460;
	cv=none; b=aA4Jd94bd5WqelOcfdFyJhD5kgNUxjFsjSWy5MboRLPZUrBdUOEhHUppuzS3XiyopzWvaJnYFOcLK76mYgIMXX+cQm87Fv5aLM/Qp+ZaYLXkuM7pOkqUTSQaxhL2byIT1HT3aDmim3PR2YsQEswea7P2RxSIv+0TWM+zciDPDEUFn2U6ohNh7SAJEvwaO7NJWxpdjxNrdpfL5OcyfyyDqxIJODxmm+ANfMsuRWRC9Id6QjGvHVH+bsMTjOIcZNSXBraIa6EUBsfhPFidwYYrZePw1gatpdUg2Mp7SsQYttcXioCBBPWQI7c8Gy1n/1eylNnE2FbIvSNJL3H1vMIGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764126460; c=relaxed/relaxed;
	bh=eY0pcDERUjgoEEcK9xxbVSj3spxlN7vhGwg4+2FcY/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+D+4RCHp60bdSBeY09ECAfh0byl+ypdJFPq8T/a7weqxhghW0zA+PWc2RsMTj/4Cym7pvIfneInuiQa15snvfNN0l2Xeo1he6Yn1spAdZbSSjbq1i6uhGrUEEsDa1qOcmeLO6NXsvubAcTEDHqCiX0Vc5hrfC5nKZ+1IMNkmljyjTcwOA8qOHJSQ+NeYDbHvIjZO7wUfXHolsqOFhygdTYoNFME4A3HgYQVgiXuuaSpuwPWVSo9QC9NnHbi6g5YTQn7DZQg7AuxbZx9Thg32gagdw5VS9dHiIvUk9CiNs3WAa4jbyWEuJ1ql4dFkR1NpVkBN4USnEOvKDKeowii+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=goTl1v3+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=goTl1v3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGPcn6PXJz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 14:07:36 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2955623e6faso72761995ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 19:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764126454; x=1764731254; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY0pcDERUjgoEEcK9xxbVSj3spxlN7vhGwg4+2FcY/c=;
        b=goTl1v3+9QnhFbVDfARwd+Z4E6pvcMqh5cPRVKEBMvUU7e3rtyRJ19H3SmJrzqJZzb
         Oncn0/onb++ca4ZT22t984rGtgcDK/uOE73H4BdRmn/i18CmE1Mdub6xwg4E62cBsAu6
         Wcj2yOpephavzxcJfFH+i9B++osjv+PrvxPELMZVT2Ue+HKbmPj9pz9oZN8bndWtVorj
         Bzf9pwhpmYgRIBJlfCUfbCl6Ey2YBGA+eBj9fl3iZgDuVWJ6Z6STzUIcJFv58rqyv89H
         bRCsa+Vz+7AYmJzlWrDcG+xDOZxZgJby+I3y1E7YZI+dp7m3pWcHcNNpteNO235u8rek
         JxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764126454; x=1764731254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY0pcDERUjgoEEcK9xxbVSj3spxlN7vhGwg4+2FcY/c=;
        b=d1fJ7UTm5RZ2eBldyx0mmao9yY0HuvSQMvlPXc+aFp7n7vDiryea1vbHdz785aqAst
         MmCl381nk5MhtB5GAA9haod+79lu1IpQrrXA2PsqvUhj5oplok6yr905j0o5W5ujkcy5
         F9uLGcsXQCy8xR+m00u15sj0Dp0Q6O3IlOufsnVQobPY0wznKVApazchq2TCHdpHtyin
         ORQgwo7NaEijPr2+WZdSLWuKppijzc75qU8e5zY6bnmNPmtQYDVGcCLIRUTkA9N2ba86
         97sytLpWgEAdtRt6dpjqo5JmKjQkpRV3fbNM4JJBevgjB1tCqzANzsrCd8O/0KTnvY6A
         tqKA==
X-Forwarded-Encrypted: i=1; AJvYcCUUtUs7F/mOQ3dFqxDgK5eQamnLeB8bQqIhb1Fdv7gvHwrrML9Wk3PL3sm7Vb+xcvICj5iIuRAtvVabd5o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxqhpwVPhufAn/VF0lyRV2++kG19NbLZitzfVHJ/gQxlW4JQjr
	4BIzM4Q4e1dL8OMEYPMH9X6e/KwUpW0r3nCwe2rEMa1y0tGL+pSkeEHObOnQzc8E1XANVQp94dD
	ablKMp+4UTGgEJ/pZxFAbiPGeGmoV3HQ=
X-Gm-Gg: ASbGncv32rGzVkEWj3pxwFigc6rz0HHOXaJK2m5ZiiyktWjbQ2eWTicZAcuxBF4ltVZ
	xxb91KSlp3Scod2Ms9Gjg7dYYyhCpGgIJeeifa8DwdwjrsZ0feK9vWS28EtQQH6l4hgC+FX2yX6
	Za35AanveK7Xih5bUqCFV+f6NyyKxz+FgbnyDM4PsKpVxcty2joUNnG5Hv30MI1awxzf/41DytM
	+pX9uXSs5ylRKki5u4z6r6+M8KVAqbO7+CnNOYCm5HvTUV6YYLE8c0ECxCZmQI3j8BkGpI=
X-Google-Smtp-Source: AGHT+IFFg/D2z3lQmIYlqpWgxX94sTlaZ5yd+DZ7R2BIRgEfCPRJzE3/s+/VWYQ3udV/+cdHMX44TwAqzuWNyW/le5E=
X-Received: by 2002:a17:903:2acc:b0:298:33c9:ed9e with SMTP id
 d9443c01a7336-29bab169ab8mr62518365ad.28.1764126453648; Tue, 25 Nov 2025
 19:07:33 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251125101334.1596381-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 26 Nov 2025 11:07:20 +0800
X-Gm-Features: AWmQ_blIAktxcZbVljGntxUziif_7LFuT8bNxvakIOqTxB0_4vsIgkUA0aXXSeI
Message-ID: <CAA+D8AOChOYy_OY0er8d+3_XxkzG-fTUonWviF=j=AMyooCPUg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_xcvr: use dev_err_probe() replacing
 dev_err() + return
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 25, 2025 at 6:14=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Use dev_err_probe() to simplify the code. This also silences -517 errors.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
shengjiu wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 86 ++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 52 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 5d804860f7d8c..07c9fef45b0f0 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1548,28 +1548,24 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>         xcvr->soc_data =3D of_device_get_match_data(&pdev->dev);
>
>         xcvr->ipg_clk =3D devm_clk_get(dev, "ipg");
> -       if (IS_ERR(xcvr->ipg_clk)) {
> -               dev_err(dev, "failed to get ipg clock\n");
> -               return PTR_ERR(xcvr->ipg_clk);
> -       }
> +       if (IS_ERR(xcvr->ipg_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->ipg_clk),
> +                                    "failed to get ipg clock\n");
>
>         xcvr->phy_clk =3D devm_clk_get(dev, "phy");
> -       if (IS_ERR(xcvr->phy_clk)) {
> -               dev_err(dev, "failed to get phy clock\n");
> -               return PTR_ERR(xcvr->phy_clk);
> -       }
> +       if (IS_ERR(xcvr->phy_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->phy_clk),
> +                                    "failed to get phy clock\n");
>
>         xcvr->spba_clk =3D devm_clk_get(dev, "spba");
> -       if (IS_ERR(xcvr->spba_clk)) {
> -               dev_err(dev, "failed to get spba clock\n");
> -               return PTR_ERR(xcvr->spba_clk);
> -       }
> +       if (IS_ERR(xcvr->spba_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->spba_clk),
> +                                    "failed to get spba clock\n");
>
>         xcvr->pll_ipg_clk =3D devm_clk_get(dev, "pll_ipg");
> -       if (IS_ERR(xcvr->pll_ipg_clk)) {
> -               dev_err(dev, "failed to get pll_ipg clock\n");
> -               return PTR_ERR(xcvr->pll_ipg_clk);
> -       }
> +       if (IS_ERR(xcvr->pll_ipg_clk))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->pll_ipg_clk),
> +                                    "failed to get pll_ipg clock\n");
>
>         fsl_asoc_get_pll_clocks(dev, &xcvr->pll8k_clk,
>                                 &xcvr->pll11k_clk);
> @@ -1593,51 +1589,42 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>
>         xcvr->regmap =3D devm_regmap_init_mmio_clk(dev, NULL, regs,
>                                                  &fsl_xcvr_regmap_cfg);
> -       if (IS_ERR(xcvr->regmap)) {
> -               dev_err(dev, "failed to init XCVR regmap: %ld\n",
> -                       PTR_ERR(xcvr->regmap));
> -               return PTR_ERR(xcvr->regmap);
> -       }
> +       if (IS_ERR(xcvr->regmap))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->regmap), "failed =
to init XCVR regmap\n");
>
>         if (xcvr->soc_data->use_phy) {
>                 xcvr->regmap_phy =3D devm_regmap_init(dev, NULL, xcvr,
>                                                     &fsl_xcvr_regmap_phy_=
cfg);
> -               if (IS_ERR(xcvr->regmap_phy)) {
> -                       dev_err(dev, "failed to init XCVR PHY regmap: %ld=
\n",
> -                               PTR_ERR(xcvr->regmap_phy));
> -                       return PTR_ERR(xcvr->regmap_phy);
> -               }
> +               if (IS_ERR(xcvr->regmap_phy))
> +                       return dev_err_probe(dev, PTR_ERR(xcvr->regmap_ph=
y),
> +                                            "failed to init XCVR PHY reg=
map\n");
>
>                 switch (xcvr->soc_data->pll_ver) {
>                 case PLL_MX8MP:
>                         xcvr->regmap_pll =3D devm_regmap_init(dev, NULL, =
xcvr,
>                                                             &fsl_xcvr_reg=
map_pllv0_cfg);
> -                       if (IS_ERR(xcvr->regmap_pll)) {
> -                               dev_err(dev, "failed to init XCVR PLL reg=
map: %ld\n",
> -                                       PTR_ERR(xcvr->regmap_pll));
> -                               return PTR_ERR(xcvr->regmap_pll);
> -                       }
> +                       if (IS_ERR(xcvr->regmap_pll))
> +                               return dev_err_probe(dev, PTR_ERR(xcvr->r=
egmap_pll),
> +                                                    "failed to init XCVR=
 PLL regmap\n");
>                         break;
>                 case PLL_MX95:
>                         xcvr->regmap_pll =3D devm_regmap_init(dev, NULL, =
xcvr,
>                                                             &fsl_xcvr_reg=
map_pllv1_cfg);
> -                       if (IS_ERR(xcvr->regmap_pll)) {
> -                               dev_err(dev, "failed to init XCVR PLL reg=
map: %ld\n",
> -                                       PTR_ERR(xcvr->regmap_pll));
> -                               return PTR_ERR(xcvr->regmap_pll);
> -                       }
> +                       if (IS_ERR(xcvr->regmap_pll))
> +                               return dev_err_probe(dev, PTR_ERR(xcvr->r=
egmap_pll),
> +                                                    "failed to init XCVR=
 PLL regmap\n");
>                         break;
>                 default:
> -                       dev_err(dev, "Error for PLL version %d\n", xcvr->=
soc_data->pll_ver);
> -                       return -EINVAL;
> +                       return dev_err_probe(dev, -EINVAL,
> +                                            "Error for PLL version %d\n"=
,
> +                                            xcvr->soc_data->pll_ver);
>                 }
>         }
>
>         xcvr->reset =3D devm_reset_control_get_optional_exclusive(dev, NU=
LL);
> -       if (IS_ERR(xcvr->reset)) {
> -               dev_err(dev, "failed to get XCVR reset control\n");
> -               return PTR_ERR(xcvr->reset);
> -       }
> +       if (IS_ERR(xcvr->reset))
> +               return dev_err_probe(dev, PTR_ERR(xcvr->reset),
> +                                    "failed to get XCVR reset control\n"=
);
>
>         /* get IRQs */
>         irq =3D platform_get_irq(pdev, 0);
> @@ -1645,17 +1632,13 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>                 return irq;
>
>         ret =3D devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr)=
;
> -       if (ret) {
> -               dev_err(dev, "failed to claim IRQ0: %i\n", ret);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
>
>         rx_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "rx=
fifo");
>         tx_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "tx=
fifo");
> -       if (!rx_res || !tx_res) {
> -               dev_err(dev, "could not find rxfifo or txfifo resource\n"=
);
> -               return -EINVAL;
> -       }
> +       if (!rx_res || !tx_res)
> +               return dev_err_probe(dev, -EINVAL, "could not find rxfifo=
 or txfifo resource\n");
>         xcvr->dma_prms_rx.chan_name =3D "rx";
>         xcvr->dma_prms_tx.chan_name =3D "tx";
>         xcvr->dma_prms_rx.addr =3D rx_res->start;
> @@ -1678,8 +1661,7 @@ static int fsl_xcvr_probe(struct platform_device *p=
dev)
>         ret =3D devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>         if (ret) {
>                 pm_runtime_disable(dev);
> -               dev_err(dev, "failed to pcm register\n");
> -               return ret;
> +               return dev_err_probe(dev, ret, "failed to pcm register\n"=
);
>         }
>
>         ret =3D devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
> --
> 2.43.0
>

