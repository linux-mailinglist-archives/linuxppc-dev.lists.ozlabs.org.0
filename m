Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECA21ED4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 22:04:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455K4S1Nm2zDqTV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 06:04:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ny71yutW"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455K2j0CzXzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 06:02:34 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z28so4193214pfk.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g9wIYCx00weLSQMcQnQUCOzdDyH/zzhQi5GjVSkJuLo=;
 b=ny71yutWOjQbwSHC80AkORAGocGy81alQ8++2MaM43zfVScDFceITy7F2+a7DW/kyt
 7nAXUgRsp4hWbHJKwwUj4ynO34TrAkwKJH4tzexBmAcnULLG6wVwYhZSI7V/UiEI4/Op
 WcmATzj49esMYFW+kYApeodr8LoTuMyJTbi1gvU3imlRfeaOrMSKS9IPpxDdrfA7I7Wv
 SsR5wStbloFrEDuL5GeC85tjsWyGAoEvV7y7oMJQ9fMZusq3/ajPqSl/64HI86VkpQXS
 hY+xJiEugIGQ949GOtknJZOhK+JaThp/Sa+rd8SwuvugWx/AvpjJcDGvpzzEpkAaZtqS
 odRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g9wIYCx00weLSQMcQnQUCOzdDyH/zzhQi5GjVSkJuLo=;
 b=gpJ0D1L1zcxAb/aH5xbwW0NQxsyzWJ0kKfAMrmNv35ESYl5WqmGx0oQqpuDDeF1HGg
 Fwuz/FwdsUI1by6TqS08HICw8X9P7vfHS3vzCINAKUGE0Mbc6/iZ+zi2byLF9ldgawIq
 4Tm1qOcaeirK4vDZy0Hmx+mfkcP2fVJOyyI5+h0J26MpmLgJdkAPswQmPoH3ZqW4ZI/t
 ydSFhKelXKApvc9cZjmdO2a9twUUdzWL1AKiyd1151OcpDETzYbz6QkNMrjVqqw76SMc
 gQu9JhIYMON5xwxW6tSnkp8bpp9yoOAWW4cfASavv/L5edmvH3nXpKVl0/70HB19pFrl
 cOCg==
X-Gm-Message-State: APjAAAV0//ppg3994bLB45bgCHLB2glM4AlbwnGlaWH1WBVoxz81i4xX
 r5ySQYuGXCVLU6NU5fEbKl8=
X-Google-Smtp-Source: APXvYqyEqY45/LSbPPjbR3puhM1JE7GS7ALQzydq4pmAfplcxzEl/0rb9l2x7ZzuZKK7zgBQMwqShQ==
X-Received: by 2002:a63:a84c:: with SMTP id i12mr59903032pgp.115.1558123352159; 
 Fri, 17 May 2019 13:02:32 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h18sm9639863pgv.38.2019.05.17.13.02.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 13:02:32 -0700 (PDT)
Date: Fri, 17 May 2019 13:01:10 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Message-ID: <20190517200110.GA22558@Asurada-Nvidia.nvidia.com>
References: <20190517030903.25731-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517030903.25731-1-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2019 at 03:09:22AM +0000, S.j. Wang wrote:
> There is chip errata ERR008000, the reference doc is
> (https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),
> 
> The issue is "While using ESAI transmit or receive and
> an underrun/overrun happens, channel swap may occur.
> The only recovery mechanism is to reset the ESAI."
> 
> In this commit add a tasklet to handle reset of ESAI
> after xrun happens
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_esai.c | 166 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 10d2210c91ef..149972894c95 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -52,17 +52,20 @@ struct fsl_esai {
>  	struct clk *extalclk;
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
> +	struct tasklet_struct task;
[...]
> +	u32 tx_channels;
[...]
> +	bool reset_at_xrun;

Please add descriptions for them in the comments of the struct.

  
> @@ -71,8 +74,14 @@ static irqreturn_t esai_isr(int irq, void *devid)
>  	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
>  	struct platform_device *pdev = esai_priv->pdev;
>  	u32 esr;
> +	u32 saisr;
>  
>  	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
> +
> +	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE))
> +		&& esai_priv->reset_at_xrun)

Please follow the coding style:
+	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
+	    esai_priv->reset_at_xrun)

> +		tasklet_schedule(&esai_priv->task);

And maybe a dev_dbg also to inform people it's recovering.

> @@ -552,6 +561,9 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	u32 pins = DIV_ROUND_UP(channels, esai_priv->slots);
>  	u32 mask;
>  
> +	if (tx)
> +		esai_priv->tx_channels = channels;
> +
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
> @@ -585,10 +597,16 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
>  				   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
>  
> +		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
> +				   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);

A line of comments please.

> +static void fsl_esai_reset(unsigned long arg)
> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;

> +	u32 saisr;
> +	u32 tsma, tsmb, rsma, rsmb, tcr, rcr, tfcr, rfcr;

Could we merge these two lines?

> +	/*
> +	 * stop the tx & rx
> +	 */

Single-line style please.

> +	regmap_read(esai_priv->regmap, REG_ESAI_TSMA, &tsma);
> +	regmap_read(esai_priv->regmap, REG_ESAI_TSMB, &tsmb);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RSMA, &rsma);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RSMB, &rsmb);
> +
> +	regmap_read(esai_priv->regmap, REG_ESAI_TCR, &tcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RCR, &rcr);
> +
> +	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);

I think this chunk is to save register values other than "stop".

> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +				ESAI_xCR_xEIE_MASK | ESAI_xCR_TE_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +				ESAI_xCR_xEIE_MASK | ESAI_xCR_RE_MASK, 0);

Indentation:
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xEIE_MASK | ESAI_xCR_RE_MASK, 0);

> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMA,
> +				ESAI_xSMA_xS_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMB,
> +				ESAI_xSMB_xS_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMA,
> +				ESAI_xSMA_xS_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMB,
> +				ESAI_xSMB_xS_MASK, 0);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
> +				ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
> +				ESAI_xFCR_xFR, 0);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
> +				ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
> +				ESAI_xFCR_xFR, 0);

Just a thought that I'd like to discuss: since these operations
are completely same as TRIGGER_STOP(tx) + TRIGGER_STOP(rx), can
we abstract a function of fsl_esai_trigger_stop(.., bool tx)?

Benefits would be A) easier to read B) Won't miss an operation,
as we might add something new to one of the stop routines while
forgetting the other side.

> +	/*
> +	 * reset the esai, and restore the registers
> +	 */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
> +				ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
> +				ESAI_ECR_ESAIEN | ESAI_ECR_ERST);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
> +				ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
> +				ESAI_ECR_ESAIEN);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +				ESAI_xCR_xPR_MASK,
> +				ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +				ESAI_xCR_xPR_MASK,
> +				ESAI_xCR_xPR);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +				ESAI_PRRC_PDC_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +				ESAI_PCRC_PC_MASK, 0);

And this could be abstracted too by sharing with probe().

> +	/*
> +	 * Add fifo reset here, because the regcache_sync will
> +	 * write one more data to ETDR.
> +	 * Which will cause channel shift.

Sounds like a bug to me...should fix it first by marking the
data registers as volatile.

> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
> +				ESAI_xFCR_xFR_MASK, ESAI_xFCR_xFR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
> +				ESAI_xFCR_xFR_MASK, ESAI_xFCR_xFR);
> +
> +	regcache_mark_dirty(esai_priv->regmap);
> +	regcache_sync(esai_priv->regmap);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
> +				ESAI_xFCR_xFR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
> +				ESAI_xFCR_xFR_MASK, 0);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +				ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +				ESAI_xCR_xPR_MASK, 0);

Also same as suspend()-resume().

> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +				ESAI_PRRC_PDC_MASK,
> +				ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +				ESAI_PCRC_PC_MASK,
> +				ESAI_PCRC_PC(ESAI_GPIO));
> +
> +	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
> +
> +	/*
> +	 * restart tx / rx, if they already enabled
> +	 */
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
> +				ESAI_xFCR_xFEN_MASK, tfcr & ESAI_xFCR_xFEN);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
> +				ESAI_xFCR_xFEN_MASK, rfcr & ESAI_xFCR_xFEN);

Btw, this xFEN should be xFE...a typo in the driver itself...

> +
> +	/* Write initial words reqiured by ESAI as normal procedure */
> +	for (i = 0; i < esai_priv->tx_channels; i++)
> +		regmap_write(esai_priv->regmap, REG_ESAI_ETDR, 0x0);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +				ESAI_xCR_TE_MASK,
> +				ESAI_xCR_TE_MASK & tcr);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +				ESAI_xCR_RE_MASK,
> +				ESAI_xCR_RE_MASK & rcr);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMB,
> +				ESAI_xSMB_xS_MASK,
> +				ESAI_xSMB_xS_MASK & tsmb);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMA,
> +				ESAI_xSMA_xS_MASK,
> +				ESAI_xSMA_xS_MASK & tsma);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMB,
> +				ESAI_xSMB_xS_MASK,
> +				ESAI_xSMB_xS_MASK & rsmb);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMA,
> +				ESAI_xSMA_xS_MASK,
> +				ESAI_xSMA_xS_MASK & rsma);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE & tcr);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE & rcr);

Similarly having an fsl_esai_trigger_start() could do:
	if (tfcr & ESAI_xFCR_xFE)
		fsl_esai_trigger_start(tx);
	if (rfcr & ESAI_xFCR_xFE)
		fsl_esai_trigger_start(rx);

Thank you
