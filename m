Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8B65E0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 18:56:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45l2JN3NYYzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 02:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LA7j/cO4"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45l2GH0wtCzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 02:54:30 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s27so3235729pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fq6WHQqIPWVCMU7ZkFfC4oSgGVvcorBZ3Dq6pBzcxHo=;
 b=LA7j/cO4M89kcVx3e6n4nfhoFhINbRv6vd7JT7WJFzQOUPxwSckcJ2rYqU0v25WI5S
 Nyu5P+fdvPArJtJiIRE4OtkE0R1mRE53Oy+cJ7vQhTEvC5EcUfIVHjn5ivS0d3IMVvSn
 H5paRse+u29OFk6/lI0zgNuYMtXB+YcG+hOn+ogRkN85B2ldAtfhs7Su1fS9QqNyRq2I
 Cg9cDAGjAy34fvB0WMKnUbGuLtm5YeIehXbJbqyRZYJ7yRXHl6WAjgPk+i22kMxSv12N
 vaaJdmrwDM30Ly4SACH6+d0qgs1QMUEif0V+ygVHgVxTGla7U5Vtfnfqy3l5MiRbjsOj
 wyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fq6WHQqIPWVCMU7ZkFfC4oSgGVvcorBZ3Dq6pBzcxHo=;
 b=J3eXkK1s6nJrNKMN5KBtCLBWDUrgZGEF0GyXNPERmIyGPNpZd8jV1GF4mdj9Vnkqv8
 fTtV5g5XMTpC7tnN3DTeYpS3bdIgQ6ru8NB5hwUYZAAJHiBtw48nbFR9eEllpzDsTDxu
 CePBvBaYSi7bn57eXnMBkU4HfofvEaP17QX2yJgpXQ0oYa6P5aL8Qm1DHxIR4elkg5+h
 SQuKhKQ4dsgUa6cVwcLX1tpUaNeBWK2KKRgp6uMwY+a9vuC2xGA8UpABG6P+rSdNeEvs
 aWYSDJdtg63H7kGm1z/xwmqbJagf6x4quH/BsC9kAlKCSNO5yYEkPLGIgt/hoGsetVwu
 o2LA==
X-Gm-Message-State: APjAAAXr4kN5aPhNfh1YKMJgxtjZsCkZGsuMUi276W+Jw644eGnlLXmM
 NNASXlAETQxmK+61JIg0gvI=
X-Google-Smtp-Source: APXvYqyC06UAsgjIIOFjc1j8lXIWIQBK1kitqWKAvKUudWZ44wALY9Iy7uk5Az9zegjynRwH9ESbRw==
X-Received: by 2002:a17:90a:f488:: with SMTP id
 bx8mr5899804pjb.91.1562864067277; 
 Thu, 11 Jul 2019 09:54:27 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id h26sm6256695pfq.64.2019.07.11.09.54.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jul 2019 09:54:27 -0700 (PDT)
Date: Thu, 11 Jul 2019 09:54:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Subject: Re: [PATCH V4 2/2] ASoC: fsl_esai: recover the channel swap after xrun
Message-ID: <20190711165458.GA17728@Asurada-Nvidia.nvidia.com>
References: <cover.1562842206.git.shengjiu.wang@nxp.com>
 <326035cb99975361699d9ed748054b08bc06a341.1562842206.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <326035cb99975361699d9ed748054b08bc06a341.1562842206.git.shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 11, 2019 at 06:49:46PM +0800, shengjiu.wang@nxp.com wrote:
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

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
>  sound/soc/fsl/fsl_esai.c | 74 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index ab460d6d7432..4ce8ac769244 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -32,6 +32,7 @@
>   * @extalclk: esai clock source to derive HCK, SCK and FS
>   * @fsysclk: system clock source to derive HCK, SCK and FS
>   * @spbaclk: SPBA clock (optional, depending on SoC design)
> + * @task: tasklet to handle the reset operation
>   * @fifo_depth: depth of tx/rx FIFO
>   * @slot_width: width of each DAI slot
>   * @slots: number of slots
> @@ -42,6 +43,7 @@
>   * @sck_div: if using PSR/PM dividers for SCKx clock
>   * @slave_mode: if fully using DAI slave mode
>   * @synchronous: if using tx/rx synchronous mode
> + * @reset_at_xrun: flags for enable reset operaton
>   * @name: driver name
>   */
>  struct fsl_esai {
> @@ -53,6 +55,7 @@ struct fsl_esai {
>  	struct clk *extalclk;
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
> +	struct tasklet_struct task;
>  	u32 fifo_depth;
>  	u32 slot_width;
>  	u32 slots;
> @@ -65,6 +68,7 @@ struct fsl_esai {
>  	bool sck_div[2];
>  	bool slave_mode;
>  	bool synchronous;
> +	bool reset_at_xrun;
>  	char name[32];
>  };
>  
> @@ -73,8 +77,16 @@ static irqreturn_t esai_isr(int irq, void *devid)
>  	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
>  	struct platform_device *pdev = esai_priv->pdev;
>  	u32 esr;
> +	u32 saisr;
>  
>  	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
> +
> +	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE)) &&
> +	    esai_priv->reset_at_xrun) {
> +		dev_dbg(&pdev->dev, "reset module for xrun\n");
> +		tasklet_schedule(&esai_priv->task);
> +	}
>  
>  	if (esr & ESAI_ESR_TINIT_MASK)
>  		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
> @@ -635,10 +647,17 @@ static void fsl_esai_trigger_start(struct fsl_esai *esai_priv, bool tx)
>  			   ESAI_xSMB_xS_MASK, ESAI_xSMB_xS(mask));
>  	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
>  			   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
> +
> +	/* Enable Exception interrupt */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
> +			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);
>  }
>  
>  static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
>  {
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
> +			   ESAI_xCR_xEIE_MASK, 0);
> +
>  	regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
>  			   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
>  	regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
> @@ -653,6 +672,51 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
>  			   ESAI_xFCR_xFR, 0);
>  }
>  
> +static void fsl_esai_hw_reset(unsigned long arg)
> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	bool tx = true, rx = false, enabled[2];
> +	u32 tfcr, rfcr;
> +
> +	/* Save the registers */
> +	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
> +	enabled[tx] = tfcr & ESAI_xFCR_xFEN;
> +	enabled[rx] = rfcr & ESAI_xFCR_xFEN;
> +
> +	/* Stop the tx & rx */
> +	fsl_esai_trigger_stop(esai_priv, tx);
> +	fsl_esai_trigger_stop(esai_priv, rx);
> +
> +	/* Reset the esai, and ignore return value */
> +	fsl_esai_hw_init(esai_priv);
> +
> +	/* Enforce ESAI personal resets for both TX and RX */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> +
> +	/* Restore registers by regcache_sync, and ignore return value */
> +	fsl_esai_register_restore(esai_priv);
> +
> +	/* Remove ESAI personal resets by configuring PCRC and PRRC also */
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +			   ESAI_PRRC_PDC_MASK, ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +			   ESAI_PCRC_PC_MASK, ESAI_PCRC_PC(ESAI_GPIO));
> +
> +	/* Restart tx / rx, if they already enabled */
> +	if (enabled[tx])
> +		fsl_esai_trigger_start(esai_priv, tx);
> +	if (enabled[rx])
> +		fsl_esai_trigger_start(esai_priv, rx);
> +}
> +
>  static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			    struct snd_soc_dai *dai)
>  {
> @@ -857,6 +921,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  	esai_priv->pdev = pdev;
>  	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
>  
> +	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
> +	    of_device_is_compatible(np, "fsl,imx35-esai"))
> +		esai_priv->reset_at_xrun = true;
> +
>  	/* Get the addresses and IRQ */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	regs = devm_ioremap_resource(&pdev->dev, res);
> @@ -956,6 +1024,9 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	tasklet_init(&esai_priv->task, fsl_esai_hw_reset,
> +		     (unsigned long)esai_priv);
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	regcache_cache_only(esai_priv->regmap, true);
> @@ -969,7 +1040,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  
>  static int fsl_esai_remove(struct platform_device *pdev)
>  {
> +	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
> +
>  	pm_runtime_disable(&pdev->dev);
> +	tasklet_kill(&esai_priv->task);
>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
