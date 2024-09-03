Return-Path: <linuxppc-dev+bounces-900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA645969127
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 03:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyTH93kCBz2y1W;
	Tue,  3 Sep 2024 11:55:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725328549;
	cv=none; b=g1oSUdlCy2KqILC2THUVv0sdv4PC89pLWY6Szh2i+NZtceiYcX9YFYTBjFdNmKAKCwJIsR+5SDMPf0MjJpHTX9BzGNpOIerqaq+CyRqpWtO1yca1UUAzgzmcOPFnmZVIc/tguHeD/6BneZGWZtWDISOwG9yRi2hQy+sP92994eQdlsFkWqVmDXINfCyLcPR6ZzGaPPEttzqeYzV5M5RQBpv/uUXU7QTbmChXKP+SeoBckzNpM4PIPMlQJvWLbJtVzRGFIQ3b3bwGBQkj5MdJcU9t4LjAk36RC8xjhxlsuoz3Ffy8IvNixF2i2JVKtnr3qR/dDXBkRtTgviu1To4oEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725328549; c=relaxed/relaxed;
	bh=UrElffEtYAJiA/i9CHeCTZE7DyohB5bf6CoqbQcHT2k=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=epz+mPtBzcuGI1gRMf9BmDxlcj5dKIV6Gjx4qEIQ927avEctciR0EQuPhRGymFEbJ63pF2G1nhMr/Wie9RLrgi/miTNFz7MEag0Jbh4zQdEsUCE6YiTp67CplUlucQa+Ul3F2R3tWQu+Rkcq+6qstQPuo2I/0y1ojgl/nE7iJ3YiV+VXOZNAC/R3I5HUaI6ixX7dvAoLcdskIDg/dBlk760/1SyueG4B1Sq0qdNH3p8dtuj625Uk89Xw4Xqgtg8yDdbUZ4vtZ3U2MBm3qs9DAYt9RmsiT9UYdNkYYjSJ0ar7BRB8Jv3+VA1CWGIPnvifk0tpOB2vrZWh9kiGBQe/5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JEesa1yz; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JEesa1yz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyTH91HL9z2xr4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 11:55:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 061D75C5988;
	Tue,  3 Sep 2024 01:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84481C4CEC2;
	Tue,  3 Sep 2024 01:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725328545;
	bh=v8xWr6M2051Rwz9iwqMbOx4x+nrK2/zcfwCjvgZQXZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JEesa1yzSepQanqA9PAXiL0AFqAwvxbRHqcqGpnIt58f47jqrp2kgaMwfuG0WRC1J
	 FnZfk2vgxSmniECctuc+gheU7NsOMjIrm51uppOvyzySjT76RnaL/0ElCSAAALDjwy
	 imh66B3rf2Co1GVqMTgLVFwWoZmzbsMDsuX9t6rFas/iYyT3hQo4SNq2lVr2gMJ426
	 IhwMImH0FRszRVnYYEaBwTYNFxJnEoUBTtaH4bJEYKH/xm5X/8HPGQjEL4ukKTz1ek
	 6knDoCMqfgTTqFtqXMh6Xz/dkmkzqYOBpQv4PaWChR+1BNcN5dEkmLFZIaT2Rk2lCo
	 WwAFqNDbnTaFg==
Date: Mon, 2 Sep 2024 18:55:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>,
 Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 7/7] net: ethernet: fs_enet: phylink
 conversion
Message-ID: <20240902185543.48d91e87@kernel.org>
In-Reply-To: <20240829161531.610874-8-maxime.chevallier@bootlin.com>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
	<20240829161531.610874-8-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Aug 2024 18:15:30 +0200 Maxime Chevallier wrote:
> @@ -582,15 +591,12 @@ static void fs_timeout_work(struct work_struct *work)
>  
>  	dev->stats.tx_errors++;
>  
> -	spin_lock_irqsave(&fep->lock, flags);
> -
> -	if (dev->flags & IFF_UP) {
> -		phy_stop(dev->phydev);
> -		(*fep->ops->stop)(dev);
> -		(*fep->ops->restart)(dev);
> -	}
> +	rtnl_lock();

so we take rtnl_lock here..

> +	phylink_stop(fep->phylink);
> +	phylink_start(fep->phylink);
> +	rtnl_unlock();
>  
> -	phy_start(dev->phydev);
> +	spin_lock_irqsave(&fep->lock, flags);
>  	wake = fep->tx_free >= MAX_SKB_FRAGS &&
>  	       !(CBDR_SC(fep->cur_tx) & BD_ENET_TX_READY);
>  	spin_unlock_irqrestore(&fep->lock, flags);

> @@ -717,19 +686,18 @@ static int fs_enet_close(struct net_device *dev)
>  	unsigned long flags;
>  
>  	netif_stop_queue(dev);
> -	netif_carrier_off(dev);
>  	napi_disable(&fep->napi);
>  	cancel_work_sync(&fep->timeout_work);

..and cancel_work_sync() under rtnl_lock here?

IDK if removing the the "dev->flags & IFF_UP" check counts as
meaningfully making it worse, but we're going in the wrong direction.
The _sync() has to go, and the timeout work needs to check if device
has been closed under rtnl_lock ?


> -	phy_stop(dev->phydev);
> +	phylink_stop(fep->phylink);
>  
>  	spin_lock_irqsave(&fep->lock, flags);
>  	spin_lock(&fep->tx_lock);
>  	(*fep->ops->stop)(dev);
>  	spin_unlock(&fep->tx_lock);
>  	spin_unlock_irqrestore(&fep->lock, flags);
> +	phylink_disconnect_phy(fep->phylink);
>  
>  	/* release any irqs */
> -	phy_disconnect(dev->phydev);
>  	free_irq(fep->interrupt, dev);
>  
>  	return 0;

