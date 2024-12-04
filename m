Return-Path: <linuxppc-dev+bounces-3796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B39E3E84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 16:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3MFy3Fz5z30Mn;
	Thu,  5 Dec 2024 02:41:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733326918;
	cv=none; b=CoWYq24ni5yWDKui0mfw/58BnGyISZECQZqkCt7UWCgjeWJs1w2Ou/m+vqnnQI4H2BsfmgBESzkyFiG7dM6uEtqWeXXnWa/JU7vY+j5bEgXTTc7UAA6fHnN4P0qmzJ394PsioR4NetKvwG0Z+LJPuQs+C/IuVM2PodMoSeXhVagKh2fP7TCCv837PdBjTp4WxVLHhxUjR45+ccOBgT2LI0i4/43X6mST6Ju8E/EOyL3kNjT0zBwh1DvzODag9bO2gLxCHw/k023P4Y5yKPH/j6zO2iZLucejeqejHwKZzx8hVjaX7oGkBy7O2F3I9gw+C5o1CbRMSy1eLKZ1sraXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733326918; c=relaxed/relaxed;
	bh=8JU87dSOgGQ075F3cYH/0T2VM64sEmEqoWMT1OVF2IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAdxZyNSRII08ERyoIxUWQzs3pXx+Ea/EJ2vxyU47uKKazftaaBoMbvcYFrKzjVo7usk0kHLbuNVGFCAp6tleWp8PU4F4se0ObXML51IWApTjGwrmjbnVIQ5GgzmmDzrKAjeInIZCLftrFLsqJDCZYbbTY+RqWoePyXLl1iSHrCF1EMZ6v6mTV8b5mOGEgthe1KdPcQ4cQEVb4kvcoGF8mIkrIRT1kGlCJ+5KCt8qpq7NHRKermjYlhYSdfHVkJ/pxBWEx8p9OzwYnrNaOhs69kqss7M5ZfzhDXfMA1Oihv3oC3tHufYhshpCzK95nczwl+RP3a1GyHWFP0KXgus8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rYB0+3jl; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rYB0+3jl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3MFw53Qlz300C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 02:41:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8JU87dSOgGQ075F3cYH/0T2VM64sEmEqoWMT1OVF2IM=; b=rYB0+3jlJp0NLAn7kVWU+IS3/b
	6J6OdNYPyDJWBkGBE5JB2BP1/4WXwZv/Hr9DUXjtex+ZKCa7ipsABYcqAGgMugEHhAz4UaJaNwZnJ
	WWEUa2B49PipFPPSnLJ/bZ4GwUesKkvcanU/UswuvCI+KR7oiLbuHOrnLoegi6BiJ23o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIrVN-00FE0Q-0y; Wed, 04 Dec 2024 16:41:33 +0100
Date: Wed, 4 Dec 2024 16:41:33 +0100
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
Subject: Re: [PATCH net-next v3 09/10] net: freescale: ucc_geth: Introduce a
 helper to check Reduced modes
Message-ID: <49fbbbf8-ec21-41a6-b87e-0172d0a4a2b3@lunn.ch>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
 <20241203124323.155866-10-maxime.chevallier@bootlin.com>
 <ce002489-2a88-47e3-ba9a-926c3a71dea9@lunn.ch>
 <20241204092232.02b8fb9a@fedora.home>
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
In-Reply-To: <20241204092232.02b8fb9a@fedora.home>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 04, 2024 at 09:22:32AM +0100, Maxime Chevallier wrote:
> Hello Andrew,
> 
> On Wed, 4 Dec 2024 03:15:52 +0100
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > > +static bool phy_interface_mode_is_reduced(phy_interface_t interface)
> > > +{
> > > +	return phy_interface_mode_is_rgmii(interface) ||
> > > +	       interface == PHY_INTERFACE_MODE_RMII ||
> > > +	       interface == PHY_INTERFACE_MODE_RTBI;
> > > +}  
> > 
> > I wounder if this is useful anywhere else? Did you take a look around
> > other MAC drivers? Maybe this should be in phy.h?
> 
> Yes I did consider it but it looks like ucc_geth is the only driver
> that has a configuration that applies to all R(MII/GMII/TBI) interfaces

O.K. What is important is you considered it. Thanks. Too many
developers are focus on just their driver and don't think about other
drivers and code reuse.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

