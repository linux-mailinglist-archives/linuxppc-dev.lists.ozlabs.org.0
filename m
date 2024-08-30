Return-Path: <linuxppc-dev+bounces-838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D721A966D14
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZqC5grBz30K6;
	Sat, 31 Aug 2024 09:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725051981;
	cv=none; b=IG0dU9nuDOOSrcMG6uEZsUxdfK+SCWmJbgSFaGX7AczEy8+eb7iv7fGpIm3WbEwHTYyRF4IQu48RTw+xEtG7EqPrScHm1Ji4VqwOXTrZcZQPWpRgrHFat5bERRMzxFUxaGsPeittocRTva6CiMiz4GmQpv/O0mJO6jkC3wavZZ3U6nIFPDlcTY5gBBJbWJJh328h/gcNzmd9j0rbe/DrhuG/PmprTxIWB9xKh5QVtVLwHr4SOvx0om/cS5mijKoLHE6lJF4zAsSZqyuQNTFyaeUiCdCYIAge/nQzSRNxS45PqerZUuC3swKkKFBvtoB+fWh8mR4szSFOh0/Zm9bG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725051981; c=relaxed/relaxed;
	bh=w2SQawhjbomku3lmIoVoBV+XKTXKkwuxi3ZQVvH++ZU=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=QsFD70eafoYUiq7gAwhDU4S8XTA0h5kL+cGqtJAIfJC6miqWC4FxPC7DJ9cwFKEGBSOTIqlZjvahB310C2OCrjJxr9RAsrog+4A2YL4zxRy4BgFKm7sfmufb00YdRqIJYeJ5+TiiQ2KjAP5MxxBQx7qNRT9/qu4NyZaWsv/vR7Ke+++j6v2HEsK+2q6230MSeatfpl6c4TqwfDRUA7eiu1hNwb4FsNjtfqiiYrxOo8u3JMMr9dENZvzIkx2eBdPraWJbqpfTIcKlg1ChOv3pEgyFux4mnbaGhg+xgP1GrIAoTzKDdWRyIaiZyGj6p2eWmJ9pETapou8ho/GTZFu8Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=dlIjxBd3; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=dlIjxBd3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwW0X6jm1z30B3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:06:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w2SQawhjbomku3lmIoVoBV+XKTXKkwuxi3ZQVvH++ZU=; b=dlIjxBd32qTraVy3xmg938Cg9c
	grNyoQrFquaA1H2p6znqwBqEc0zLN67c6qR4GwLmzH2o9DQmpjtUcicXtZOZh0U6j2KlrOInojaXV
	iulFx2QzzyecBpRSXQw0u3RGnOOw4rllzftTefta4Btkpuic6FdUMQ/ZnjABsiDgV+WY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8oq-006AHF-ON; Fri, 30 Aug 2024 23:06:08 +0200
Date: Fri, 30 Aug 2024 23:06:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 3/7] net: ethernet: fs_enet: drop the
 .adjust_link custom fs_ops
Message-ID: <480a16fd-a1eb-4ea0-b859-5d874ecc3b15@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-4-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829161531.610874-4-maxime.chevallier@bootlin.com>

> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> @@ -649,12 +649,7 @@ static void fs_adjust_link(struct net_device *dev)
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&fep->lock, flags);
> -
> -	if (fep->ops->adjust_link)
> -		fep->ops->adjust_link(dev);
> -	else
> -		generic_adjust_link(dev);
> -
> +	generic_adjust_link(dev);
>  	spin_unlock_irqrestore(&fep->lock, flags);

Holding a spinlock is pretty unusual. We are in thread context, and
the phydev mutex is held. Looking at generic_adjust_link, do any of
the fep->foo variables actually need protecting, particularly from
changes in interrupts context?

	Andrew

