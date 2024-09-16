Return-Path: <linuxppc-dev+bounces-1411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A139A97A70A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 19:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6sr34LzXz2yDx;
	Tue, 17 Sep 2024 03:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726508995;
	cv=none; b=H67SadoDEmz+yLjfJtEF6L+sWPPtNdVXBou14S9aO5EJTC/txOEc6a+hyitCs6LJ7Yk6fnWL7NzaBXKIThDDxvj0l2eQkKt1wzYQG1TmIhjwMUKj9FhrvWQBWsta/sS9cm4TBBRblJ8bT1MQ7ipBTeb244sG6I1aCVswqzKBmtOUcFcS/M+zzgYc8GXTc7d7595gjE05z5LBXCZ4Pi0NciG6IS728dZ/FKfjQaWpsYF/UJgnd/hE8++/2Ddrbvg8EtnI4wNXiQCulog5yKmIUJ0zYV2ZcnS3n26u15q4htYRPANAU1QvTx++VZEM2vuGUAZJ3V8eDQ2wjnwvf8i5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726508995; c=relaxed/relaxed;
	bh=SbEcTwTiZECfedSamHPXD2T6PDmIOEI7aJtQ5uqY4i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmkqXGjZgFI3q0BgDsnxHU84kM6iXVgH/AZd2XMA1CY2AZGeJAdIM22ElOvXkFmuaby3F88y5l6qskYaBpdEBz81RpyOaoxGVDnADJFhNrIFETEifjzwsvp2fHEB2IGoRMuYe9QQflQY37LtyvivFbzaNkkzt2Nb89O/13lV62kw8wySz973tmERZ2glMfmCuDFsJhJyzB9LzyyvMcngBEylzxGscMu2hqPJkEYhO+mPbVB5AhMNCNw6XdsCL5purPBx+Zu03RNy3Icw8o/5oLDzVbvVvzIv/j4QuCtI/L2B+LiNDm9PSJdc56ggZqfNWgznlKdCDnvUeWkuUBCwhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=Lz56ntB8; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=Lz56ntB8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6sr146V0z2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 03:49:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SbEcTwTiZECfedSamHPXD2T6PDmIOEI7aJtQ5uqY4i4=; b=Lz56ntB8+9y7vM0XQ6VRkP4Gne
	yz7GbtAcc6mdafpNcoT44OAYl1GkrpFHkqkntHaxt6Nr+aR12f1n4MCSeRpdo3M6Lzz+OLGd2qZlK
	nmMww7Iplk/cUYDv/V1pAVeZVMUGp+AjiJow1QoEvxJfiIz9XyfrrreUYvphKgdAsHy73nXPA1vSN
	gF8YD4P+2h5633/EFAF2WQ/2+2yrwTryRA5AOd8nuytOjNF7o7AGbA8RcsIRuFuBrEJ1WZ9zWsflc
	5oMBUDTCq9YOStps6zVMKaivD0rHJ42nS/VD65WrpMQf8TciWVjH0DkQ1bjWs5UpnM48A90umfM9P
	PdDKRoZQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49730)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sqFqt-0006G8-30;
	Mon, 16 Sep 2024 18:49:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sqFqp-00079e-2c;
	Mon, 16 Sep 2024 18:49:27 +0100
Date: Mon, 16 Sep 2024 18:49:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 4/8] net: ethernet: fs_enet: only protect the
 .restart() call in .adjust_link
Message-ID: <Zuhvp5Y3w5Ukdb0C@shell.armlinux.org.uk>
References: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
 <20240904171822.64652-5-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240904171822.64652-5-maxime.chevallier@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Sep 04, 2024 at 07:18:17PM +0200, Maxime Chevallier wrote:
>  /* generic link-change handler - should be sufficient for most cases */
> -static void generic_adjust_link(struct  net_device *dev)
> +static void fs_adjust_link(struct  net_device *dev)

As you're changing the function name, I think getting rid of the double
space in 'struct  net_device' would be worthwhile.

Thanks.

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

