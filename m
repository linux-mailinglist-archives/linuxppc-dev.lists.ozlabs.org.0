Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 922471FC249
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 01:30:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mkv867Q5zDr0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 09:29:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e6gwvDdV; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mksX1BcNzDqTM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 09:28:30 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id i12so104316pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 16:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nokaqO/7ikLY/CaZfj8RUoWXt7iRv0GsTFng8UE3qCw=;
 b=e6gwvDdVsFAYgNKppHkmPneIamMoxYKb+W8s99Afmhxm/8zE417O3gj6Fzg1PDGboS
 xWiqlnxIQTI3upPI0UHHS6mWgN7nJBr01/atAzaO7z4KWBo/iZVWgAfrTHDWt03gc88A
 wmmCNj9DhLunFnQjlyo+OPRItLYaHz/Xn6FWfd5bNfAw6LaYen9/0w0E+B4VY33cLY+8
 P0R4wMuKjyxOZ7IG1XCcDhfPBbCrW7kcpF9Hw6Y4kkUCxW0ybg885R88J2XovyyCGUS4
 2CEApyQqeu7SO77ui569hu6N5IyIbbUvNmkx0ZGgZH8aJ1DeUJOuA0crga3hn7rJHQzl
 Sh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nokaqO/7ikLY/CaZfj8RUoWXt7iRv0GsTFng8UE3qCw=;
 b=Q9b0pJxJ8uIOWTrtz+7eHucqsqI5p03ZK9rz2ggfah3FkalY/bbJLwCw0HjaHw5zFB
 wK7mSfooVIhUpfzcovo1YZ3xOpch/e7M76x3or6H3J97WpVlSXdMJxz80gmVCHjrX01C
 oZicxQxTZKUuboxQVn1Kg6Yv1DLeWg7vH5imEgBg5JkWp1dTAW2ggtL25PhjHQwh1fdt
 8dGHRcYv94iNxph95stoy2qHlwDSzQbQlgGH2lVDeNCmHskEHSlwX6DsmYrdK6ARVboM
 d6es4J87GTn0aJLDWLSJT1gDtfFv6xF5Cee37hnWIeB40d6IGYB8r3VrMFcy+oQQfCN6
 iTuw==
X-Gm-Message-State: AOAM531/8PJuyzHmNZCBlkenNitenrcHBsOanl4q4eelQxMrpg7ImzYR
 kMF5pemGi0xHmKcWyaMJWhM=
X-Google-Smtp-Source: ABdhPJyewwpFThwB7lVfDvCFj438Fo7Ix52QUxyvLW3sT2CUftR5ocnuBGDk+n7WlQXuxAkGZHplNg==
X-Received: by 2002:a17:902:ed14:: with SMTP id
 b20mr4118681pld.173.1592350108783; 
 Tue, 16 Jun 2020 16:28:28 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b1sm3547523pjc.33.2020.06.16.16.28.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 16:28:28 -0700 (PDT)
Date: Tue, 16 Jun 2020 16:28:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
Message-ID: <20200616232810.GA19896@Asurada-Nvidia>
References: <1592289761-29118-1-git-send-email-shengjiu.wang@nxp.com>
 <1592289761-29118-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592289761-29118-2-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, Jun 16, 2020 at 02:42:41PM +0800, Shengjiu Wang wrote:
> The one difference on imx6sx platform is that the root clock
> is shared with ASRC module, so we add a new flags "ind_root_clk"
> which means the root clock is independent, then we will not
> do the clk_set_rate and clk_round_rate to avoid impact ASRC
> module usage.
> 
> As add a new flags, we include the soc specific data struct.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_spdif.c | 43 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 1b2e516f9162..00e06803d32f 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -42,6 +42,17 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
>  
>  #define DEFAULT_RXCLK_SRC	1
>  
> +/**
> + * struct fsl_spdif_soc_data: soc specific data
> + *
> + * @imx: for imx platform
> + * @ind_root_clk: flag for round clk rate
> + */
> +struct fsl_spdif_soc_data {
> +	bool imx;
> +	bool ind_root_clk;

"ind" doesn't look very straightforward; maybe "shared_root_clock"?

And for its comments:
	* @shared_root_clock: flag of sharing a clock source with others;
	*		      so the driver shouldn't set root clock rate

> +};
> +
>  /*
>   * SPDIF control structure
>   * Defines channel status, subcode and Q sub
> @@ -93,6 +104,7 @@ struct fsl_spdif_priv {
>  	struct snd_soc_dai_driver cpu_dai_drv;
>  	struct platform_device *pdev;
>  	struct regmap *regmap;
> +	const struct fsl_spdif_soc_data *soc;

Looks better if we move it to the top of the list :)

> @@ -421,7 +448,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
>  	sysclk_df = spdif_priv->sysclk_df[rate];
>  
>  	/* Don't mess up the clocks from other modules */
> -	if (clk != STC_TXCLK_SPDIF_ROOT)
> +	if (clk != STC_TXCLK_SPDIF_ROOT || !spdif_priv->soc->ind_root_clk)
>  		goto clk_set_bypass;
>  
>  	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
> @@ -1186,7 +1213,8 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
>  			continue;
>  
>  		ret = fsl_spdif_txclk_caldiv(spdif_priv, clk, savesub, index,
> -					     i == STC_TXCLK_SPDIF_ROOT);
> +					     i == STC_TXCLK_SPDIF_ROOT &&
> +					     spdif_priv->soc->ind_root_clk);

Having more than one place that checks the condition, we can add:

/* Check if clk is a root clock that does not share clock source with others */
static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif, int clk)
{
	return (clk == STC_TXCLK_SPDIF_ROOT) && !spdif->soc->shared_root_clock;
}
