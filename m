Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D12A7511
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 02:49:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRRK70dS8zDqGn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 12:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C3KFKDSk; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRRH00FFczDqcx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 12:47:39 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id c20so64933pfr.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 17:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OCTxfpsphzxslAOqNQCh/cdk0CoQXDuv6GMoNdJRd5A=;
 b=C3KFKDSkz8PewNH1jl/sP84lpxdqfKrg0VJoTP1+puWG7ySV+gTJkxexOQcONJq9sN
 Ov6tBqvITJXazba66PI2+9AiQBbWk92CPcuz7+OVt+u1DM77atUE+KM7qEfwKuoEh/Pq
 H57luRoyXAlMC8uEH9u3ey10S4uAlnK5rTU3PPiEnLuhwiBi2ggPPrUuA6Nf03bM88mW
 D7iUUAW667Xzea/DmvPtbnxA/KgQ8p6pplYmOwtv+YUUfQMcaq0N/98pi2Dgqlb5rNho
 C0aZjwD1+QDlEvSHqiHsdWdueHDChaBsOmXYmcZLY1pkLm/kmMH8RreeSIYLrV/7OHF2
 GXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OCTxfpsphzxslAOqNQCh/cdk0CoQXDuv6GMoNdJRd5A=;
 b=IlNUCQZIWy/pPWHtFlF9Pk2/OblyXQ+gI+7NztOEEmUP/1O6k3yVSSp1+UXwsnPJKU
 gxMhmqqLxMqSuegbvX4xji82NE9l8h1olEdAdtQixS17N29bdaZwSPW219bKHJn1O5be
 J4mm+KRWVJGzMz/4h4CtRSDimVHat3p8ZjUgpBltLC89ASWunwhqAR7+iU2UHRAXWYPi
 0wj477Jt8TYVoOYqODDMr+a9I8uUpEdR0ZuJgljOC958ZpnxxPLvkx+Jn/0NanxqcPN6
 Gm0DqPSANiTN+AHxdPRKv3Z6opYTakNeQSPv9fAJ4GWfMWWF5TWqpCbPgvyeT67V9NJ6
 EIsA==
X-Gm-Message-State: AOAM531N4t65dZ3WxGAa2FWs/8Pkpj3oPacf9wKfuH3dBGirGbNYZeaR
 26C+XcNaKEXOqnr4NKTAPmo=
X-Google-Smtp-Source: ABdhPJzYRJ54bpr7y5aGP5sXGN6tDVE4C64FR/ZVNJa5T6GGER3l/r0hcDTBiMTAovWtsz5k9zEixA==
X-Received: by 2002:a17:90b:1011:: with SMTP id gm17mr346pjb.73.1604540852758; 
 Wed, 04 Nov 2020 17:47:32 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id b3sm132830pfd.66.2020.11.04.17.47.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Nov 2020 17:47:32 -0800 (PST)
Date: Wed, 4 Nov 2020 17:35:40 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
Message-ID: <20201105013539.GA16459@Asurada-Nvidia>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <1604281947-26874-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604281947-26874-2-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 02, 2020 at 09:52:27AM +0800, Shengjiu Wang wrote:
> The AUD2HTX is a digital module that provides a bridge between
> the Audio Subsystem and the HDMI RTX Subsystem. This module
> includes intermediate storage to queue SDMA transactions prior
> to being synchronized and passed to the HDMI RTX Subsystem over
> the Audio Link.
> 
> The AUD2HTX contains a DMA request routed to the SDMA module.
> This DMA request is controlled based on the watermark level in
> the 32-entry sample buffer.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Despite some small comments inline.

> +static int fsl_aud2htx_dai_probe(struct snd_soc_dai *cpu_dai)
> +{
> +	struct fsl_aud2htx *aud2htx = dev_get_drvdata(cpu_dai->dev);
> +
> +	/* DMA request when number of entries < WTMK_LOW */
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_DT_MASK, 0);
> +
> +	/* Disable interrupts*/
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_IRQ_MASK,
> +			   AUD2HTX_WM_HIGH_IRQ_MASK |
> +			   AUD2HTX_WM_LOW_IRQ_MASK |
> +			   AUD2HTX_OVF_MASK,
> +			   AUD2HTX_WM_HIGH_IRQ_MASK |
> +			   AUD2HTX_WM_LOW_IRQ_MASK |
> +			   AUD2HTX_OVF_MASK);
> +
> +	/* Configure watermark */
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_WL_MASK,
> +			   AUD2HTX_WTMK_LOW << AUD2HTX_CTRE_WL_SHIFT);
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_WH_MASK,
> +			   AUD2HTX_WTMK_HIGH << AUD2HTX_CTRE_WH_SHIFT);

If there isn't a hard requirement from hardware, feels better to
combine all the writes to AUD2HTX_CTRL_EXT into one single MMIO.

> +static irqreturn_t fsl_aud2htx_isr(int irq, void *dev_id)
> +{
> +	return IRQ_HANDLED;

Empty isr? Perhaps can drop the request_irq() at all?

> +static int fsl_aud2htx_probe(struct platform_device *pdev)
> +{
> +	struct fsl_aud2htx *aud2htx;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int ret, irq;
> +
> +	aud2htx = devm_kzalloc(&pdev->dev, sizeof(*aud2htx), GFP_KERNEL);
> +	if (!aud2htx)
> +		return -ENOMEM;
> +
> +	aud2htx->pdev = pdev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(regs)) {
> +		dev_err(&pdev->dev, "failed ioremap\n");
> +		return PTR_ERR(regs);
> +	}
> +
> +	aud2htx->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
> +						&fsl_aud2htx_regmap_config);
> +	if (IS_ERR(aud2htx->regmap)) {
> +		dev_err(&pdev->dev, "failed to init regmap");
> +		return PTR_ERR(aud2htx->regmap);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no irq for node %s\n",
> +			dev_name(&pdev->dev));

dev_err() already prints dev_name, so not necessary to print again.
