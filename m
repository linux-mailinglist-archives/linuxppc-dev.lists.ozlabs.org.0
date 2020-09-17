Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927326D47A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 09:19:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsSyR4KsFzDqVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 17:19:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kfSDwjK/; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsSwb407GzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 17:17:50 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id q12so633118plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=elJEb2l35w0tALnlBgQjk/9l2iBwh6a2tE1YVDZoSvk=;
 b=kfSDwjK/583sxlPWBU4K30L6qY5yFOHg4TaP/g2kKTHVrbUMxPsSo3cr0oNyd9kK/I
 n6Vsy1v7d/rgMZQrlIWuK1z3+RZOa/gSSCG7sYeMKhkJT2JQvSzqbc2e3raCr0dOVN39
 XKMDGl9vfQOTodpBHV1eD8EgozdndmaBbqOAdPaW/2wFZ/f37Bo0XjiDqxgvhN8ddvjp
 KfHvl91euVMXY62y1FCqAbvCidWS9MdrG3Y6DHzHbR8EOFMHVg964SXT9ELd/KN5nttG
 mHb47XyEK+kpFNYeCiT/8Q1sRDO+I1EIjMyYurStOuDBW3epttxcwxSpXCDTkUJOH4lp
 mVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=elJEb2l35w0tALnlBgQjk/9l2iBwh6a2tE1YVDZoSvk=;
 b=I6aLI47K4CMts0h/0zF9wgOGzsF/jX3n9V/40NDvSV2KwND0ApiLSSzavR+9xV5EbZ
 W8JQ4IhKm8BVT8G+2NPoMvxH5iuSuNBKVwZc8Ao+Mkf92K81rbd9J053VSKxZ8vtYjgW
 uuuE0tNdXfE533HiMBj38IfPUICLLfm5nUUqFX25yqVpKmrY6Y/9Sx513Tkad6HTJS5k
 ANqSrvZlP60cGbAqSETNzXBHEGMltQTmxURDMo9/iTtUV98tWssE1f8dOjLFd70aXhQE
 uIUY7E9FPFfvkzHm5+HZkjdCURUyFOokRb72e8zecEbB8qpDtd682sp9AmdE2jnH30bw
 WSLw==
X-Gm-Message-State: AOAM530+EUXfMYXeBxqURHynPISNvQUNMzqs7J443R9C9ZYyd0VLIdNC
 h9nyJh4cyrahncBl5g40O7Q=
X-Google-Smtp-Source: ABdhPJyA7geCwMU1Brnj82CuOczTA8QY77ieRbYd6gK//+zTtaFvTP+ByLJcIbfYjqJna5Bxk8PXBg==
X-Received: by 2002:a17:90a:6a4e:: with SMTP id
 d14mr6885754pjm.63.1600327067650; 
 Thu, 17 Sep 2020 00:17:47 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 72sm18958272pfx.79.2020.09.17.00.17.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Sep 2020 00:17:47 -0700 (PDT)
Date: Thu, 17 Sep 2020 00:14:31 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20200917071431.GA17970@Asurada-Nvidia>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600247876-8013-2-git-send-email-viorel.suman@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Viorel Suman <viorel.suman@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Viorel,

It looks pretty clean to me, though some small comments inline.

On Wed, Sep 16, 2020 at 12:17:55PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a on-chip functional module found
> on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

> +static const u32 fsl_xcvr_earc_channels[] = { 1, 2, 8, 16, 32, }; /* one bit 6, 12 ? */

What's the meaning of the comments?

> +static const int fsl_xcvr_phy_arc_cfg[] = {
> +	FSL_XCVR_PHY_CTRL_ARC_MODE_SE_EN, FSL_XCVR_PHY_CTRL_ARC_MODE_CM_EN,
> +};

Nit: better be u32 vs. int?

> +/** phy: true => phy, false => pll */
> +static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
> +{
> +	u32 val, idx, tidx;
> +
> +	idx  = BIT(phy ? 26 : 24);
> +	tidx = BIT(phy ? 27 : 25);
> +
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF);
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg);
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_WDATA, data);
> +	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
> +
> +	do {
> +		regmap_read(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, &val);
> +	} while ((val & idx) != ((val & tidx) >> 1));

Might regmap_read_poll_timeout() be better? And it seems to poll
intentionally with no sleep nor timeout -- would be nice to have
a line of comments to explain why.

> > +static int fsl_xcvr_runtime_resume(struct device *dev)
> +{
> +	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(xcvr->ipg_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start IPG clock.\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->pll_ipg_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start PLL IPG clock.\n");

Should it disable ipg_clk?

> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->phy_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start PHY clock: %d\n", ret);
> +		clk_disable_unprepare(xcvr->ipg_clk);

Should it disable pll_ipg_clk?

> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->spba_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start SPBA clock.\n");
> +		clk_disable_unprepare(xcvr->phy_clk);
> +		clk_disable_unprepare(xcvr->ipg_clk);

Ditto

> +		return ret;
> +	}
> +
> +	regcache_cache_only(xcvr->regmap, false);
> +	regcache_mark_dirty(xcvr->regmap);
> +	ret = regcache_sync(xcvr->regmap);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to sync regcache.\n");
> +		return ret;

What about those clocks? Probably better to have some error-out
labels at the end of the function?

> +	}
> +
> +	reset_control_assert(xcvr->reset);
> +	reset_control_deassert(xcvr->reset);
> +
> +	ret = fsl_xcvr_load_firmware(xcvr);
> +	if (ret) {
> +		dev_err(dev, "failed to load firmware.\n");
> +		return ret;

Ditto

> +	}
> +
> +	/* Release M0+ reset */
> +	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
> +				 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "M0+ core release failed: %d\n", ret);
> +		return ret;

Ditto

> +	}
> +	mdelay(50);

Any reason to use mdelay over msleep for a 50ms wait? May add a
line of comments if mdelay is a must?
