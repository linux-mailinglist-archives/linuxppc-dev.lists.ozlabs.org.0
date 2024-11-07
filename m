Return-Path: <linuxppc-dev+bounces-3004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 057999C0D38
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:49:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkqMC67Szz3bc2;
	Fri,  8 Nov 2024 04:49:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731001751;
	cv=none; b=KxBz/rFub0cKnjL1Wlr4TKtYUutYttl8oGV61S0IVaBlXt84LZOp7i+ePo6gU6aYQQP8b8+XR37UxYihXcNjafC3vmeQHd+hSxsdin7pI+t+E+7qx8mQ1GKRQm+G64O3CL6muAtlRxOA31QAaMjZXBeEU3g1DMoStiPF+V+j5CCYOKGEoxhCfS2rriZPPSDTYm02zD0nQvzIC+gEedeZ004XbIDEa7Qob/y9p6GpJmciIK5FL+Xt0dIFhk8I1ytBizLTD14Ki0h8Iu4vIjdmYSCqLdXPBqs+s+k71mYzCKaub8kJTmmfvnTQZPN3V/HjpM6T6E/urUkrO/uwjoCLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731001751; c=relaxed/relaxed;
	bh=JxlI633Vi9SiSAjqeqLcQKh/Kt9yzivuoR6FozTYQ8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhdJcUFisC1DyXyEvMfkBvcoV1jbstJwmGAZY5jCseV4qxhtOymT7jrBra7eaUN6tnfY+uNhyhrQp2LMQo6NcpNJWOXgVkdOl9tICWUB9wEPHjiQa8RZuuhPF4F8Fle4O8t0xgZOzYgIXWX9SsHfq1UtRly1vCMwxiSJg7fykJ+Jhn3RS0H+6dqRAnAoTE12npT8FHi927CaxGucv9veUjMKc/z5xbXii+FjVrrFkYpP5qES2p+JEBYwSWkxCUik83g5ttLAFtAuGZaKx8xQOSUm7mfiZgJj+Iter7kqsJ3gJsRj7G+kR9UeQmA9T0jYyIQ/+twDuUCCgGTyN5J1aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qtfJnzid; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=qtfJnzid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqMB6mCcz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:49:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JxlI633Vi9SiSAjqeqLcQKh/Kt9yzivuoR6FozTYQ8E=; b=qtfJnzid187QTXDBwyB7nSHuY6
	aa/6phVBaR+76CjQyFyPbpvNpVG4Ea6GvTrHvlYAxFA/iYLqBnNcDD0QngVsgQOjt9y0ORHyEFStO
	Wh/BdRGJvv1Vo6Z3pfPYP3wbK5jNOC1rCi9qsPY281dvdiWbD2GtBgqeTLPCUwzvfCdU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t96cv-00CUVr-0A; Thu, 07 Nov 2024 18:49:01 +0100
Date: Thu, 7 Nov 2024 18:49:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 4/7] net: freescale: ucc_geth: Fix WOL
 configuration
Message-ID: <83151aa4-62e9-4be9-ae64-a728be004dae@lunn.ch>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
 <20241107170255.1058124-5-maxime.chevallier@bootlin.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107170255.1058124-5-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 06:02:51PM +0100, Maxime Chevallier wrote:
> The get/set_wol ethtool ops rely on querying the PHY for its WoL
> capabilities, checking for the presence of a PHY and a PHY interrupts
> isn't enough. Address that by cleaning up the WoL configuration
> sequence.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../net/ethernet/freescale/ucc_geth_ethtool.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
> index fb5254d7d1ba..2a085f8f34b2 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
> @@ -346,26 +346,37 @@ static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
>  	struct ucc_geth_private *ugeth = netdev_priv(netdev);
>  	struct phy_device *phydev = netdev->phydev;
>  
> -	if (phydev && phydev->irq)
> -		wol->supported |= WAKE_PHY;
> +	wol->supported = 0;
> +	wol->wolopts = 0;
> +
> +	if (phydev)
> +		phy_ethtool_get_wol(phydev, wol);
> +
>  	if (qe_alive_during_sleep())
>  		wol->supported |= WAKE_MAGIC;

So get WoL will return whatever methods the PHY supports, plus
WAKE_MAGIC is added because i assume the MAC can do that. So depending
on the PHY, it could be the full list:

#define WAKE_PHY		(1 << 0)
#define WAKE_UCAST		(1 << 1)
#define WAKE_MCAST		(1 << 2)
#define WAKE_BCAST		(1 << 3)
#define WAKE_ARP		(1 << 4)
#define WAKE_MAGIC		(1 << 5)
#define WAKE_MAGICSECURE	(1 << 6) /* only meaningful if WAKE_MAGIC */
#define WAKE_FILTER		(1 << 7)

>  
> -	wol->wolopts = ugeth->wol_en;
> +	wol->wolopts |= ugeth->wol_en;
>  }
>  
>  static int uec_set_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
>  {
>  	struct ucc_geth_private *ugeth = netdev_priv(netdev);
>  	struct phy_device *phydev = netdev->phydev;
> +	int ret = 0;
>  
>  	if (wol->wolopts & ~(WAKE_PHY | WAKE_MAGIC))
>  		return -EINVAL;
> -	else if (wol->wolopts & WAKE_PHY && (!phydev || !phydev->irq))
> +	else if ((wol->wolopts & WAKE_PHY) && !phydev)
>  		return -EINVAL;
>  	else if (wol->wolopts & WAKE_MAGIC && !qe_alive_during_sleep())
>  		return -EINVAL;
>  
> +	if (wol->wolopts & WAKE_PHY)
> +		ret = phy_ethtool_set_wol(phydev, wol);

Here, the code only calls into the PHY for WAKE_PHY, when in fact the
PHY could be handling WAKE_UCAST, WAKE_MCAST, WAKE_ARP etc.

So these conditions are wrong. It could we be that X years ago when
this code was added only WAKE_PHY and WAKE_MAGIC existed?

	Andrew


