Return-Path: <linuxppc-dev+bounces-3008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943779C0D69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 19:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkqcd1hTHz3bpn;
	Fri,  8 Nov 2024 05:00:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731002449;
	cv=none; b=Cd+DGuXN90c9nC9SNT00lzsXSB0AOLQ+YDfBe8yr3C9TAoEybvLvtKRweCEqswfGJbUAlRQq48f2iDwiWJOjN9Rohz8rHxDJejoUjJs/dk8/L9kaeSWiAZJEOwOpzCTWxxfst8VfN76DID75lGcSNMoZk0LezzSSXH6JeWarMwZYuJ+A57AxryxKF8x6iy4EXvLT9RkvVh3RZGeHzNeQ1o92znVh1xditrEEKQ14HyZGz+Fgc76vG4oNoDlPmDFzwy6vEN7pwnaU50p/CUhbGzb9vfdL/ZLfLapFF9pLYG2s5HZZRMMymY5mDy/ESoFL65e3D3iYKA8IEwTWVL1E5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731002449; c=relaxed/relaxed;
	bh=3ZjI5bVISFgrCE/xP6ZKnp6e6AW65IJOtxsC7dqm3II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBnqvbBe/OsGKxMfjXLIRJjiUJAU3emkNFhtmcck6dO5Lz5jSqWzWUwPFoq+GFWOXKSqRXFjqfimAP58SYuNh8xh05RI0LPiL5oe86z6bEQ7zNOuIGbOb8et1lR+JOUErjfgyGnsX2qqOU/mxwaFDbcRN9j/eAhObbLT0pZOULdaEnhfOqX3Au/cb5rTKJpYZF9xla7LJZWElTUryyJNC2OlKeEqtFfV22Uc+o/uJHIq4v9Sv57z4q2hVxQc+K8CBHFvXPiiqFtMyxFd867hE5VNjgAdZMAzHGfwRtoaQ5yUsdd1H76JuA24YGNHGyR44tcYV3xnGMrXo/co/mz0LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=XLVZ4gSe; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=XLVZ4gSe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 553 seconds by postgrey-1.37 at boromir; Fri, 08 Nov 2024 05:00:45 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqcY08qzz3blc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 05:00:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3ZjI5bVISFgrCE/xP6ZKnp6e6AW65IJOtxsC7dqm3II=; b=XLVZ4gSeBQYGLf2fIefGLyZsDy
	nqeGeXQpxeRgb1XHS3+SkVu8898FvRotg9X1lpbvV6SNqEC7qo9v/3uFy5IOGz5poFykhbQ1gMDHy
	k7NTwhJwg+t0hztPbCGEA3Q27VOof4QFyh9JcCWWC1jKPkBeyoV6dZ0DFHEGgYX5msqaRADS0CbEi
	MYna/+GKPnuA6CI/8d2P0En0pHPpQedYGEFytM08SJcRdVLRuHsE7BjdtD/h/hNH1HzuOd1W+LSAO
	CvmAaVPrnKTgjgSgXhAYOBjihghvb5QEdKChyLgk+L+hAHWWf3XcKuHcAHbkuq3hfJYFaKdsQ5O2R
	/xIkojSg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48104)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1t96ez-0003aF-08;
	Thu, 07 Nov 2024 17:51:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1t96ev-0001TM-1g;
	Thu, 07 Nov 2024 17:51:05 +0000
Date: Thu, 7 Nov 2024 17:51:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/7] net: freescale: ucc_geth: split adjust_link
 for phylink conversion
Message-ID: <Zyz-CcO1inN06mtm@shell.armlinux.org.uk>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
 <20241107170255.1058124-3-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241107170255.1058124-3-maxime.chevallier@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 06:02:49PM +0100, Maxime Chevallier wrote:
> Preparing the phylink conversion, split the adjust_link callbaclk, by
> clearly separating the mac configuration, link_up and link_down phases.

I'm not entirely sure what the point of this patch is, given that in
patch 7, all this code gets deleted, or maybe moved?

If it's moved, it may be better in patch 7 to ensure that doesn't
happen, and move it in a separate patch - right now patch 7 is horrible
to review as there's no way to see what the changes are in these
link_up()/link_down() functions.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

