Return-Path: <linuxppc-dev+bounces-3098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C79C4D5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 04:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnX6P4Skjz2xrJ;
	Tue, 12 Nov 2024 14:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731382349;
	cv=none; b=U0m5AaVJAlrV3g/L6wLstgDv2kgeoTgn/1Oj5yYT+lVNPXrZL0noN8QY/kyxK0RcX2DIl0jWxCm5cgv+R5yoadUJ6ikKHH4Umwt/XMStXnKXIhRlveXxhw8O9s5WXWsXK8boD2l+bhQecAmxrg3L1m5XQdLTqXsXnY6ObPEfVQAKK26gjw7iGjv+gjLzZtkSLDJRGv1q8aj5/3OPzTR9Ih6sJt5yxl7sSq8nM1W7XSB0x4Tf2E0MzmE+Gjm+4HSz4arvuoCRyoaOOXPKBszHi0ZtzNDJSbaEFT+FMkkerrq9yC3Vw/Y0/vg/8zC91oJEd0WAfleweIb4KyIs6ddAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731382349; c=relaxed/relaxed;
	bh=4z306/5tuG2l03Ei8VaLJo5265ji9YS3yh7bt9hEGdI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9wLd5DayrdKQEEmoj+kwm3UwMkfprah2sqKyeYsLL/TgiI/TuiCvwF7OQIHIToJurFkhnKmt6XXACK7UkXR/H9Tfxm9OFFbcuXBL+SZizKh9Z0erHnFhm/F1aw/OopVh9AtCoq309MHMIbYUGZjuGx6HOa1+QT5MBkaVCs9EhwxOqbhLTvPM+GYzX7p5K4q/ZNPLDSCu2RLga3D1uWh+iVLqEDA83bmNujestXg7ttU5e57Sjaja1ROolP0aaEIZjqvgRmqe7mRYeDJCxXZ+xTIttIi/NAJN0F54VH+0wVwW5Q0XNO4X6x1n7ZR6YOfS2jgflBHOPz/MU9cslsDJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPHS1LaR; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPHS1LaR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnX6N1t25z2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 14:32:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C9E7A40297;
	Tue, 12 Nov 2024 03:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CC2C4CECD;
	Tue, 12 Nov 2024 03:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731382345;
	bh=CRaC5wjfbFfQA5LdfDrUsa3MI7ETN4OH4NFZVHy3LZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qPHS1LaRS738ZEdxN0SIOOejrDNeR3mIZxf8FoqvHVzE+3P3HSDY/j89/4CNJY/Yf
	 8hhjNmzYPFoAGbat558J4jia9L6DHohhw0myhq/FXq5DCXErxtsPeIeOtlclyDs4tR
	 LfkjrG0cQozV0elK6PBJl7JWLZP514f7/Y3EWaSRIJmk9w4wF+9bgZ52aUjfiJMbcB
	 N/ITfrxNiOAELhQo9fW15NPfJJq2o9RZ25mV2R+apxtOA0SrGqeurIZ9SvEQLUNYNo
	 TmkKiKJ3HtXv96XDD6L6cva4MvyIkSREmIoMo3a0fij2iRWm9tbbDpNfMAzK1xkj99
	 4cbvrSuUZL8ng==
Date: Mon, 11 Nov 2024 19:32:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Pantelis Antoniou
 <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Byungho An <bh74.an@samsung.com>, Kevin Brace
 <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Michal Simek <michal.simek@amd.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Zhao Qiang
 <qiang.zhao@nxp.com>, linux-can@vger.kernel.org (open list:CAN NETWORK
 DRIVERS), linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC
 FS_ENET DRIVER)
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
Message-ID: <20241111193222.00ae2f3e@kernel.org>
In-Reply-To: <20241111210316.15357-1-rosenp@gmail.com>
References: <20241111210316.15357-1-rosenp@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 11 Nov 2024 13:03:16 -0800 Rosen Penev wrote:
> --- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> +++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
> @@ -111,7 +111,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Get the SXGBE common INT information */
> -	priv->irq  = irq_of_parse_and_map(node, 0);
> +	priv->irq = platform_get_irq(pdev, 0);
>  	if (priv->irq <= 0) {
>  		dev_err(dev, "sxgbe common irq parsing failed\n");
>  		goto err_drv_remove;
> @@ -122,7 +122,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
>  
>  	/* Get the TX/RX IRQ numbers */
>  	for (i = 0, chan = 1; i < SXGBE_TX_QUEUES; i++) {
> -		priv->txq[i]->irq_no = irq_of_parse_and_map(node, chan++);
> +		priv->txq[i]->irq_no = platform_get_irq(pdev, chan++);
>  		if (priv->txq[i]->irq_no <= 0) {
>  			dev_err(dev, "sxgbe tx irq parsing failed\n");
>  			goto err_tx_irq_unmap;
> @@ -130,14 +130,14 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
>  	}
>  
>  	for (i = 0; i < SXGBE_RX_QUEUES; i++) {
> -		priv->rxq[i]->irq_no = irq_of_parse_and_map(node, chan++);
> +		priv->rxq[i]->irq_no = platform_get_irq(pdev, chan++);
>  		if (priv->rxq[i]->irq_no <= 0) {
>  			dev_err(dev, "sxgbe rx irq parsing failed\n");
>  			goto err_rx_irq_unmap;
>  		}
>  	}
>  
> -	priv->lpi_irq = irq_of_parse_and_map(node, chan);
> +	priv->lpi_irq = platform_get_irq(pdev, chan);
>  	if (priv->lpi_irq <= 0) {
>  		dev_err(dev, "sxgbe lpi irq parsing failed\n");
>  		goto err_rx_irq_unmap;

Coccicheck wants you to drop the errors:

drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:116:2-9: line 116 is redundant because platform_get_irq() already prints an error
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:127:3-10: line 127 is redundant because platform_get_irq() already prints an error
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:135:3-10: line 135 is redundant because platform_get_irq() already prints an error
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:142:2-9: line 142 is redundant because platform_get_irq() already prints an error

You can make it a separate patch in a series, for clarity.
-- 
pw-bot: cr

