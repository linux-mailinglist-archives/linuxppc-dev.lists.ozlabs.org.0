Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B075E119
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 11:34:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dwsh4kzHzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:34:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEzXQP7R"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dwqq68hRzDq9H
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 19:32:23 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w10so927371pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 02:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/0Sf7T61uUKW8C8wXwdWCRDXeImdhIeyIR/3laF3HyM=;
 b=mEzXQP7R1V8XIbe8Lr0s+G/4kNC5xNjBNZzmeTIBTzqFw5xaqVNElsXEEOYrMq1Eni
 V689Dl9KTZ6Hwpmn83oe5KBFfg7l/UtnBW5mqkwD3Elx30bWLTsHJM+fhDLK6XcJgG0K
 LmWi9ed8LgLEYQ9jKpZ44X3z6fM/VSLiRcfAjJslpRWN/YZ4ly0HSbA/AA6MoBM41MsB
 Zzeg9cgwhS8XLGxOjG52x/uWYE+TOSegRwu6eJ01dy0Z9yzGY9VuROJIgUFFXgr8j4/2
 v/AXHf1AO+csh1CN22EISwqC7PLlEn7z5y4615Fo7pVFDGx+no3x62CVNajF3F1xLEXy
 iQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/0Sf7T61uUKW8C8wXwdWCRDXeImdhIeyIR/3laF3HyM=;
 b=hRwFOJddFeyOOF4vJx3vA1NwD8EtOcstvhEXyKPGnUWZOXRPCaRQRi6oFiCMH16Vh8
 IXG16gtbldi8RGANedbwTch01hBhZ8MXBwmhkVcnsE9bKjeHHudtAINl6fdlZNZs0h5o
 p9MCoPBCphv9lWXjNU8QvG+K3EmAPgv31P6YfL3oiLzFkFz0ME3bBU2ff6T9KSgMkoxY
 kDre0pqvVhs8pP1wiWfOg1BfAj8oJNjsHTG/6NJCvKdtwcW9H05GlypP20RFAkoNSaz+
 Hh/AfrHwgpmUucDUyxCpkcQT/8RwkhFwTsrLuXXYj1pvanJGG7jj1FqnE0tqSR4aTH3A
 PV7A==
X-Gm-Message-State: APjAAAU54trTwDgGBDIZyJHR8TJdC3tlLyUEsF8Se5PpLXqECuqdP5AM
 PjEzuifJqNnqaEV2SN7nH3s=
X-Google-Smtp-Source: APXvYqxuYgiPEMSSeAJFu6CoA4QkEN5zm/N5GCJXbzOHPuioaAvpMm82K79rki3FzM3p31TVnAtxXw==
X-Received: by 2002:a17:90a:9f08:: with SMTP id
 n8mr11713529pjp.102.1562146338970; 
 Wed, 03 Jul 2019 02:32:18 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 a3sm2234049pfi.63.2019.07.03.02.32.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 02:32:18 -0700 (PDT)
Date: Wed, 3 Jul 2019 02:32:10 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Subject: Re: [PATCH V2 2/2] ASoC: fsl_esai: recover the channel swap after xrun
Message-ID: <20190703093209.GB8764@Asurada>
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
 <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 03, 2019 at 02:42:05PM +0800, shengjiu.wang@nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> There is chip errata ERR008000, the reference doc is
> (https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),
> 
> The issue is "While using ESAI transmit or receive and
> an underrun/overrun happens, channel swap may occur.
> The only recovery mechanism is to reset the ESAI."
> 
> This issue exist in imx3/imx5/imx6(partial) series.
> 
> In this commit add a tasklet to handle reset of ESAI
> after xrun happens to recover the channel swap.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_esai.c | 76 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 20039ae9893b..8c92e49ad6d8 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c

> +static void fsl_esai_reset(unsigned long arg)

Similarly fsl_esai_hw_reset? This one isn't really that bad though,
yet it feels better to have function naming in a similar style.

> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	u32 saisr, tfcr, rfcr;
> +
> +	/* save the registers */
> +	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);

Instead of having this implicit comments, we could have:
+	bool tx = true, rx = false, enabled[2];
+
+	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
+	enabled[tx] = tfcr & ESAI_xFCR_xFEN;
+	enabled[rx] = rfcr & ESAI_xFCR_xFEN;

> +
> +	/* stop the tx & rx */
> +	fsl_esai_trigger_stop(esai_priv, 1);
> +	fsl_esai_trigger_stop(esai_priv, 0);

And we could reuse the boolean 'tx' and 'rx' here.

> +
> +	/* reset the esai, and restore the registers */
> +	fsl_esai_init(esai_priv);
> +

[...]
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK,
> +			   ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK,
> +			   ESAI_xCR_xPR);

Mask and value might fit into one line?

> +
> +	/* restore registers by regcache_sync */
> +	fsl_esai_register_restore(esai_priv);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, 0);

And just for curious, can (or shall) we stuff this personal reset
to the reset() function? I found this one is a part of the reset
routine being mentioned in the RM -- it was done after ESAI reset
is done via ECR register.

[...]
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +			   ESAI_PRRC_PDC_MASK,
> +			   ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +			   ESAI_PCRC_PC_MASK,
> +			   ESAI_PCRC_PC(ESAI_GPIO));

Mask and value might fit into one line?
