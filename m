Return-Path: <linuxppc-dev+bounces-837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9E966D0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:57:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZpB0PyGz30Jy;
	Sat, 31 Aug 2024 09:57:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725051626;
	cv=none; b=X6icEzVNe0yrG+beib6erRljIS3b9A/h5NSkLuMZo0dWabxE+7l1Bax5kiqXu8WzGsZjeNLgsFhTYOX1A9BgUlHRPD5s4kaAs9DSbjipqL/f39Y3XMkGBdBiOaEZHilw1mpZ8Lepofl624fBkt9pPkJuQqtc+4dGnzc+5KuWWi99NWFRhZYHKpKO/O0CPbw3pyUj0PbWUC3QNHNQEKLoFModgPH6q51vOuHldd6NmZRbpezyBDpPDnhflN6al9eR6gBNA0nItHGVApwa0HRviWMfUjzZdhvB43VwRBmZplJh4grHCzYKd+hxZX5223QMPAXsYrmyXM57ki1jsmJVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725051626; c=relaxed/relaxed;
	bh=5jMQ5PsZq54MPA7xWEMe58isTrj2xTtba8YYcseqKz0=;
	h=X-Greylist:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LCvlW8KczrMzoGr6UpYEcBSlWtCK1TQ9DUQifJ7uzfJKoBAnmlJdgsP1lDFWQLyYN3pr5hOCGDtdXQHeMVBRYkhBXdmssLoBDUL788VuJolXgHxOe9q1t3KYU4xQCPGM7yO3iqza6yr0TB14iYVaDOwM2PZLoG8Zp7Ut00jnloT2C1cSrjnBsM/Ihl5JE+0RT6wFSmKo6WuLl5G64NO0xQdGzvcnREtAWYsygmPrkKQbMGaVC7NKtmRsEjKTlGCeYfogVZDmhYaEqMk8y8t3kQ2n8ThS7uKcz0wTDpKUaK64+SJana5m+okrDNFhPkHIcplAA9eY4XnkusdlpP+0Og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ODMqYvFw; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ODMqYvFw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 241 seconds by postgrey-1.37 at boromir; Sat, 31 Aug 2024 07:00:24 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwVsh4MXQz2yvw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:00:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5jMQ5PsZq54MPA7xWEMe58isTrj2xTtba8YYcseqKz0=; b=ODMqYvFwI2/7zngbRJ8po0zcdS
	IObsoE5VEzrCyVYeBDba3DRuy+VJr8fcSnuw6+oHO32nAlof71NRP7zd6ivHaC1uO9tipJ8otsuLs
	iJx2RQyetokWBwk/p4yUtTJBsE8oLQrNJo93KPAqhnrNB44f3rMYAw0be6/eGkn4/sOA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8j6-006ADw-By; Fri, 30 Aug 2024 23:00:12 +0200
Date: Fri, 30 Aug 2024 23:00:12 +0200
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
Subject: Re: [PATCH net-next v2 2/7] net: ethernet: fs_enet: cosmetic cleanups
Message-ID: <0232c636-112e-4345-b70d-90f8696704ff@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-3-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240829161531.610874-3-maxime.chevallier@bootlin.com>

> @@ -235,15 +219,15 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
>  			if (pkt_len <= fpi->rx_copybreak) {
>  				/* +2 to make IP header L1 cache aligned */
>  				skbn = netdev_alloc_skb(dev, pkt_len + 2);
> -				if (skbn != NULL) {
> +				if (skbn) {
>  					skb_reserve(skbn, 2);	/* align IP header */
> -					skb_copy_from_linear_data(skb,
> -						      skbn->data, pkt_len);
> +					skb_copy_from_linear_data(skb, skbn->data,
> +								  pkt_len);
>  					swap(skb, skbn);
>  					dma_sync_single_for_cpu(fep->dev,
> -						CBDR_BUFADDR(bdp),
> -						L1_CACHE_ALIGN(pkt_len),
> -						DMA_FROM_DEVICE);
> +								CBDR_BUFADDR(bdp),
> +								L1_CACHE_ALIGN(pkt_len),
> +								DMA_FROM_DEVICE);

The indentation level here suggest refactoring into helpers might be
nice. But not a prerequisite for merging.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

