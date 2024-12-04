Return-Path: <linuxppc-dev+bounces-3765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2289E314A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 03:16:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y31NB2c5gz30Tm;
	Wed,  4 Dec 2024 13:16:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733278570;
	cv=none; b=B+rO193eg4hs1TD9MzRx65kllLZ3D4elmh0P8I84mYRF/Q+IlbIeVLfBfOMijk1aRRefcdogdixVQZYPsnZCrnCBcD9BOWWzvUKvaU25wuwViOURPRrtn8tWu4VQKqhWLnBmYEKmsXoryo1hckLkbMrvZePxJjWl8AwDH4HWBZmkI8Lk3XUARCNMsOOvNWEIktSNX6m1VovQGgMKIxLRRdchOqAzr9urwzBBdE6nVTMU1lrRwTqtgAzlP+DqjYtFkRVx4cB3rRAekSjM61LYxou6VEbdRlomI8t2MoiIDv1KlFVHmmFxEKubGAHL0OI0Qb37/+qyHebsxOHW6dW49w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733278570; c=relaxed/relaxed;
	bh=NoKIQzGC9lTfjHsqJVhywf18TYP1wUsxi/w7f9E14ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUBQLc0U0HRXbwtO2Zah7euh3J7n9qL9CzG8PobwwhJVfyG2WMxNpSBshn41CrS8B2f05MqiKM7Mnlv0wx2+z+AdfZgSskXElwqZIQ3vcr9JZMv50eSdBHQuokMyvMI62H4AvdNSPnL0t5uOmG+ESVOFebCFyqk9Pj/2dAQAcMgEfnBZx/eGHF28GYb+lCWJO/sFcvjItGwZ7n1CiE2cSDZLZ1ZvyLVTbF6uK2W+5biI6nZ+Mjxwb9xbsbymuwSxeOzRjj7ky91Kn3Pau3gXnjNuNvEmOYM73g3m/NpnFurn8VPYO3YwOyy5TMfQky6igu+JHt714SY9b3APNEr+gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aYbgezf7; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aYbgezf7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y31N60Tv4z30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 13:16:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NoKIQzGC9lTfjHsqJVhywf18TYP1wUsxi/w7f9E14ng=; b=aYbgezf75Ce3d+ZwwsU1DyFV6y
	ir5rUDyaTIyP+Zn5+XodO1yyP1rTPCw+NULoJu+p+sxgvcx4cYEv6BBzwF21mb/qw8nLlWi3hZ35N
	Srs7wQYZP5HERCHPfrvg05Ov6onQ9z59E3/kb0SJstam2TFYaHMrv6h2dwPrIN9rsuIE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIevg-00F9ho-Fz; Wed, 04 Dec 2024 03:15:52 +0100
Date: Wed, 4 Dec 2024 03:15:52 +0100
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
Message-ID: <ce002489-2a88-47e3-ba9a-926c3a71dea9@lunn.ch>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
 <20241203124323.155866-10-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241203124323.155866-10-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> +static bool phy_interface_mode_is_reduced(phy_interface_t interface)
> +{
> +	return phy_interface_mode_is_rgmii(interface) ||
> +	       interface == PHY_INTERFACE_MODE_RMII ||
> +	       interface == PHY_INTERFACE_MODE_RTBI;
> +}

I wounder if this is useful anywhere else? Did you take a look around
other MAC drivers? Maybe this should be in phy.h?

	Andrew

