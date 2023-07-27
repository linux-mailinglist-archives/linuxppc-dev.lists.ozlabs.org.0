Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 219EA764F7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:23:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YRHlRDEe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBQKk07dWz3cQM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 19:23:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YRHlRDEe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBQJs0JnVz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 19:22:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD68E61DE1;
	Thu, 27 Jul 2023 09:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5763DC433C7;
	Thu, 27 Jul 2023 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690449738;
	bh=brE446l0NnbsBdNTMz1eRg2anjy9QOxiUBOilEyPeeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRHlRDEeh2LbCOuSCaecwWzcjh/d/VRacQTDWyJZtGVeSclDSuaWppMwW2Jwuabcz
	 j5H7GBDTiQkLArSUNoX7MVpsKX2Jx4U81JMF9wSXoAGyrU/kkr9qOadAHd7qFHtqXe
	 lEuJpA10KIyKZn+bcTrj2P56hBcPXOsombqB+jeAX8sEO+SUUW1IBVCbkYO/j8vZmJ
	 MKJ3XXz6A0l3S/S3CuGJyywmVXvgaHYFDFetAI+ylH2b/wCW/iE/B/E4CklyuK25pG
	 U3/MVc260hsoEO5Fn78tyPIrcubBH49N5rNivS/jrIZsL6vBuu7n2qVTMKCFErFDvn
	 8kVC0m+MhinKQ==
Date: Thu, 27 Jul 2023 10:22:09 +0100
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230727092209.GA8175@google.com>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-23-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230726150225.483464-23-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jul 2023, Herve Codina wrote:

> The loop searching for a matching device based on its compatible
> string is aborted when a matching disabled device is found.
> This abort avoid to add devices as soon as one disabled device
> is found.
> 
> Continue searching for an other device instead of aborting on the
> first disabled one fixes the issue.
> 
> Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/mfd/mfd-core.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 0ed7c0d7784e..bcc26e64639a 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -146,6 +146,7 @@ static int mfd_add_device(struct device *parent, int id,
>  	struct platform_device *pdev;
>  	struct device_node *np = NULL;
>  	struct mfd_of_node_entry *of_entry, *tmp;
> +	bool disabled;
>  	int ret = -ENOMEM;
>  	int platform_id;
>  	int r;
> @@ -181,13 +182,13 @@ static int mfd_add_device(struct device *parent, int id,
>  		goto fail_res;
>  
>  	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
> +		disabled = false;

This does not appear to reside in a loop.

Why not set it to false on declaration?

>  		for_each_child_of_node(parent->of_node, np) {
>  			if (of_device_is_compatible(np, cell->of_compatible)) {
> -				/* Ignore 'disabled' devices error free */
> +				/* Skip 'disabled' devices */
>  				if (!of_device_is_available(np)) {
> -					of_node_put(np);

Doesn't this result in a resource leak?

> -					ret = 0;
> -					goto fail_alias;
> +					disabled = true;
> +					continue;
>  				}
>  
>  				ret = mfd_match_of_node_to_dev(pdev, np, cell);
> @@ -197,10 +198,17 @@ static int mfd_add_device(struct device *parent, int id,
>  				if (ret)
>  					goto fail_alias;
>  
> -				break;
> +				goto match;
>  			}
>  		}
>  
> +		if (disabled) {
> +			/* Ignore 'disabled' devices error free */
> +			ret = 0;
> +			goto fail_alias;
> +		}
> +
> +match:
>  		if (!pdev->dev.of_node)
>  			pr_warn("%s: Failed to locate of_node [id: %d]\n",
>  				cell->name, platform_id);
> -- 
> 2.41.0
> 

-- 
Lee Jones [李琼斯]
