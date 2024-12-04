Return-Path: <linuxppc-dev+bounces-3762-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540D9E3101
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 02:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y310f6X2Fz2ymH;
	Wed,  4 Dec 2024 12:59:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733277554;
	cv=none; b=WdEu0lOZC8aSLVAQPB+2+aOUmoB5/Z3C9u5b5N31ecMZklieqme3ZbjWRwXYrRSApH30VoUXSntMwTQoPyoB8g2ddgXtpAwhuICoWRxqt9f3yIwAlyEtJD6gx71h7DdOxYwm7Kex9Sd4MdisAeNXNdmsp8zvnWVH3yjzBP5w0PMKX3BpMo174oHmzuSmZ4o92N+CiN9jojwfVAfoZ+xA+liDNwzZOZsMOUtZVOu6jmuLt9CamM2Dcv034bDxXatvLgLypD+KiVdvMNGUOjcbZvawyMzBA0oAG2Rw056ITIOjZtr8fCjcK9+G0583cyyx2Lq5zJ3tHljlMiLuRwDJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733277554; c=relaxed/relaxed;
	bh=4Gc5eRUdt6i47eRmmyZftOhvRJWmkHfc+4Lk40uszfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQqSEWf6JPfwjL4E5rrTQM2N3jtJP/S4PGa0xu4wsGxsYP7gzZexufGdb+7SImaXv03HVtODh2ST9Z8Yjmj0btEYfEEleEfIZg+sagMQanCmwCpz6sEWijfKGRMmdRHu7I9p21faXcC1KiT5kl9cTBfCECVwt6xFb9uQa0jOFKZvdXQb4rlsOZQ6k+9WkfktQJUu/xocIm7/e3OkCnFxyBKG3LvLBq2POmRQ0fiiYF6F0W1mUlQN8+7kgu8Hy4A/kQ5Peemimpp9YSezF3RQ+s6qwJYvGTx/fiZbt+lKL2ZluNWX3cAxr2KUiHS6wMGPBrgzmS2Sc11zgY0W1S5kaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pky3cQsb; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pky3cQsb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y310c1wpjz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 12:59:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4Gc5eRUdt6i47eRmmyZftOhvRJWmkHfc+4Lk40uszfU=; b=Pky3cQsb6N0D7N39MRKMYgnan4
	3qv32+LdLkRz/XAqE7Tp4Dn5PrGFpqxAa2Y998SJZi8w8KRRZmTWUhB2zn8YaSThwkDuYggvSowof
	CooDXXCavKYEBYa2KLUqx4Gj8ZNnq3VFPwrPL2uw1THrWl9EYMs+ICT5t1xyuU1Aehu4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIefG-00F9bS-8D; Wed, 04 Dec 2024 02:58:54 +0100
Date: Wed, 4 Dec 2024 02:58:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Simon Horman <horms@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 04/10] net: freescale: ucc_geth: Fix WOL
 configuration
Message-ID: <179742dc-2df2-4d69-99ac-4951dc36aa71@lunn.ch>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
 <20241203124323.155866-5-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241203124323.155866-5-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 01:43:15PM +0100, Maxime Chevallier wrote:
> The get/set_wol ethtool ops rely on querying the PHY for its WoL
> capabilities, checking for the presence of a PHY and a PHY interrupts
> isn't enough. Address that by cleaning up the WoL configuration
> sequence.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

This at least looks sensible.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

I don't think we are going to get a perfect implementation until we
move most of the logic into phylink. We need the MAC to declare a
bitmap of what WoL options it supports. And we need the PHY to declare
the same. And the core can then figure out which of the enabled WoL
options the PHY should do, which the MAC should do, if the MAC can be
powered off, etc.

But i doubt that will get implemented any time soon.

	Andrew

