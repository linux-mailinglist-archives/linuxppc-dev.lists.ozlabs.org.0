Return-Path: <linuxppc-dev+bounces-953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2A96B477
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzFwd28Mpz2xVW;
	Wed,  4 Sep 2024 18:27:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::221"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725438449;
	cv=none; b=ROElfTtcLTL56UCw+CPmDb1VkUdXSLhKIzaGd9niJwQ5m/8F9mqI3xgrViZy7tU9Bo7PG1ik4j+g6C8SllTL1fWHwYG4MFftPXDJz2ZM+vYBIPShI9AQ/fXVoRgqNHQb8wJPN5kE+6icrlRwd/uUKQnOdVFIsxif3ilyncp+X7eKNCfFFLq4u7SDpj99fumqKmrhujNi1cD48Xa5r9ktjLEEwHqscdZVrxEnUx2BzmMRpZwyrEQ82LJ+m0oD+T0OzDjxqVllBr6ntz5tmFi5RSQGjHCwYRBtGeWZuQ/p03NI60qInfal+b9jBpmGNAArYoGIngbcIDQvgBn9ULXf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725438449; c=relaxed/relaxed;
	bh=06yNZMAas3qa1wzVuxc7+kvtibUzV5sjLz3xzS89tAQ=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=Zd8D0rbfrpVtlZN+3SOEZ+TuyiYp7o2cxQr/t/a1ZBdWSZZyI7zXwngQH6Q4AKDIX/ikGf2XPCVANQ+adNO4j91pdzMDrAH/7CSV93Xhk5f1fSXFyEoVQKNgFMuuaQk2aTHMtkcxek4levST18opP2GVsh+u1Rs3asOJP2NYmWa62qsBj7mXXN0143sfGJ9epbqLGfDpXsBZIUXGpWIxKwQTI4Yd/lkcxzUQCUIAsNuFTIF26WSyj6G8O9d5kGfkHCIx5/odWGdQYSUC+B+szV/DDmsn/j+xV3H9CgBhdSSWAYHV5E6E02jQ1A5CAIwM7jkNPMAvKQTz5ZK7fD8VvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cf/+eqqw; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cf/+eqqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzFwc1y3Wz2xTq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:27:24 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 841AC240007;
	Wed,  4 Sep 2024 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725438434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06yNZMAas3qa1wzVuxc7+kvtibUzV5sjLz3xzS89tAQ=;
	b=cf/+eqqweQOsre9lGOCoZlwQB82NF5KgHhFDxEBJ3kea7y34PrJG2YOJ8EcobMrFLr2VtP
	PduHnq68WowKQv/152sHG1bFevwnhehvSy+prbdWCMgvutCVdHy6hQwqymN53Ly4ReT3ci
	Xcg6OLN+ofMHeZMOiiaJm9bpIcnJ/DfrtNKktx+PmV97fK8zPgvUESZ/c5jtRVPK81gWig
	Ek2BhzUzPCPPxBIRAxCtXPCcjioKU0i93L1tNkykdVwX8sYRqAU6crvov4Ut1Prsd8bxmm
	BYi9PlhKUHygMWuQP5kQjUDu9udhOX87jyNXpoKNl/OupRx+dU7PponFQ9axLA==
Date: Wed, 4 Sep 2024 10:27:11 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>,
 Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 3/7] net: ethernet: fs_enet: drop the
 .adjust_link custom fs_ops
Message-ID: <20240904102711.1accc8ce@fedora.home>
In-Reply-To: <480a16fd-a1eb-4ea0-b859-5d874ecc3b15@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
	<20240829161531.610874-4-maxime.chevallier@bootlin.com>
	<480a16fd-a1eb-4ea0-b859-5d874ecc3b15@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Andrew,

On Fri, 30 Aug 2024 23:06:08 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > @@ -649,12 +649,7 @@ static void fs_adjust_link(struct net_device *dev)
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&fep->lock, flags);
> > -
> > -	if (fep->ops->adjust_link)
> > -		fep->ops->adjust_link(dev);
> > -	else
> > -		generic_adjust_link(dev);
> > -
> > +	generic_adjust_link(dev);
> >  	spin_unlock_irqrestore(&fep->lock, flags);  
> 
> Holding a spinlock is pretty unusual. We are in thread context, and
> the phydev mutex is held. Looking at generic_adjust_link, do any of
> the fep->foo variables actually need protecting, particularly from
> changes in interrupts context?

Yes there are, the interrupt mask/event registers are being accessed
from the interrupt handler and the ->restart() hook. I can try to
rework this a bit for a cleaner interrupt handling, but I don't have
means to test this on all mac flavors (fec/fcc/scc) :(

Thanks for reviewing this,

Maxime


