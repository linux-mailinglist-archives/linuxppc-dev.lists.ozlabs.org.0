Return-Path: <linuxppc-dev+bounces-839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8305F966D15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZqP37J6z30PJ;
	Sat, 31 Aug 2024 09:58:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725052009;
	cv=none; b=ousGD83ZZRqBiWjQOIXLNqcjg+Gs/KRDc6nXODFhMP9Vlkz1fPmMZK+qnCTvFtk+ZerTkmOQb40cW31kBmttXdm+3+xp5FTLqDcyqszo39lAYUyi4hy/p1lC5ive5IKAN0HRSg8hl4FyvIWlZsR0QpXi3rERg6NsFpt9yVKA01j6UnSL11jPcT1SiTQI4wwP8wUZ50sQTcLKV2+nV+YLLV2QrBOwrZVogPStU47bexrWF33c2AgGWE5HDE3H3E8KUJ7WnCptoFstxUdnNRJU7CGhSoQanvdBqTVYFhZuj5dft6BBV5y44nH43+797Pak2foWYBq1r4BXA92zbPdjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725052009; c=relaxed/relaxed;
	bh=mFZyqa+CojbUYnJNo0CayNqKOThSnfiFIOpByRbiXS4=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=ksLW2y/H4j6zNBuRqTYnaSjFEaWe9PLHliamAOf47zMGeqESD25GtxQKSqkWCXRcw/z7/pH20PEKNVpcmAhax9CMS1TgKaHlWh19FbEMLNLQVQurJIqHGC9LhG1lSHaR7hkLRRLbdvinAQtN/pmolELJRYCjVvW2cCk6a8YBoMN3RHfyhS2S5X+5JlOq5AwCyFcbL88dnOa7WJTGkZiZc2EJIv1PtNUtGTVsypy7F11fN53/ItlzOmaIQEqLtLxgMio04LaCBosGA2IPin+S2L0oaGGNLkTQzchfHdVzTcEkVQV7YMHinedwvHsdx2OaLdqOdVzx0Bgt/RueWz8vnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Rsrvr1TM; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Rsrvr1TM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwW150YsRz30B3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:06:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mFZyqa+CojbUYnJNo0CayNqKOThSnfiFIOpByRbiXS4=; b=Rsrvr1TMQ72S2YVb/HKmtvr2yn
	FvO9q3VA7D2my2HVJb41qeIe2zEOrT1UmPteEZiy2g8+kr4mrr4B1v7R+clHjkg7USBGmQCK8+tn7
	kZk92hRXHeY+z0DuNIvFcqiI7uNbQaTIkZUPSmZnmoviK06hSU5RuqmJ0pLO/+0xSY74=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8pJ-006AI1-7y; Fri, 30 Aug 2024 23:06:37 +0200
Date: Fri, 30 Aug 2024 23:06:37 +0200
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
Subject: Re: [PATCH net-next v2 4/7] net: ethernet: fs_enet: drop unused
 phy_info and mii_if_info
Message-ID: <470013f7-39d3-4bd1-b13c-96f851db234d@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-5-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240829161531.610874-5-maxime.chevallier@bootlin.com>

On Thu, Aug 29, 2024 at 06:15:27PM +0200, Maxime Chevallier wrote:
> There's no user of the struct phy_info, the 'phy' field and the
> mii_if_info in the fs_enet driver, probably dating back when phylib
> wasn't as widely used.  Drop these from the driver code.
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

