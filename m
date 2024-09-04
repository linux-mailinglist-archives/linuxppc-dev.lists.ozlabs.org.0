Return-Path: <linuxppc-dev+bounces-987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19196BC88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 14:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzMSv1WYjz2yGD;
	Wed,  4 Sep 2024 22:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725453439;
	cv=none; b=KesKZ9AFKL4Geb8pviq++9YWBnpc5PWS7gYc3cBqAoW+JBoqE886diG0zAQ5KiklRcAEBPxjqlWS3PI6ZaZm5f5MSxOwVIG2EM9ExU8uIokqZ9V6549iKYe6+uK1Q8aM8Z4WNiasiYV5warCgfQhq0KtWnoKmmxwkMUkhw72ZnzyNGoCey0ZnAZHoH0V6i7I9zJxtSMBseH6Yuw1gSZuVLmUlIFJdz0u2AtoYi0+w4pwWq4yk1PBfohSCOYfP3wFjy6a/9xGlRmMXqGEn2rglAYt1qxLT7tTmmgSh7Z1lsU8dkCBqaPm2W9r3nH8EOfRFY1R2Q3UaEsM/KKWztGbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725453439; c=relaxed/relaxed;
	bh=QeHS5gYeBwIHKYodExNcm3Ca29cLrkM3gWUGPTXMyb8=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=aPhm4JIycC60o2frVzYSjQ4Cbw10RMwcXnphQmAhtWbCNfP4v5AoIlEsgt76UhppXrT1KSiOtKyLTzw/GCvnN/njLuFF3f1KvQtHaHyblhRPdJZ3W7XtKYjLDsk2aPzviC86EvOQwTk2jjiSjavZB6HD+zKGs3/ukvb9e8URaePmvkSUUAN39Fi89jTSDZxjwcw37ItKsWnuagNfQJPkqLlFZfmLm1ocN6NXCl2mCpTE+Ig81lIgnDuapyBkkdIHda6TMZ0BLUbIn90d+yz+O7QrliDpZ0cePLUAYPxeJlllyufwnrmCNBTp8Sk+eFDvTLw2Z5rUL/QfyGHdKF62Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=G4Z+/pMB; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=G4Z+/pMB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzMSs20mkz2y8G
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 22:37:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QeHS5gYeBwIHKYodExNcm3Ca29cLrkM3gWUGPTXMyb8=; b=G4Z+/pMByzWepvK55PL6wa7XUD
	2+e/gb3tIQpEcc9KItRjA5l2RTcx+56kge/vEJBIVgK2JhQiH2Le4yJHkI2VV5hW4VRDo8hz5ni+1
	ChdCZwh7/IY32fgzuZhizTJKd6K8zf+ISozo5hZkP4rqginFvDV3Q7tMp2yvmz/2FBiA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slpFq-006YP3-49; Wed, 04 Sep 2024 14:36:58 +0200
Date: Wed, 4 Sep 2024 14:36:58 +0200
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
Message-ID: <58cf7db3-4321-4bd9-a422-3642ce59f21f@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-4-maxime.chevallier@bootlin.com>
 <480a16fd-a1eb-4ea0-b859-5d874ecc3b15@lunn.ch>
 <20240904102711.1accc8ce@fedora.home>
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
In-Reply-To: <20240904102711.1accc8ce@fedora.home>

On Wed, Sep 04, 2024 at 10:27:11AM +0200, Maxime Chevallier wrote:
> Hi Andrew,
> 
> On Fri, 30 Aug 2024 23:06:08 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > > --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > > +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > > @@ -649,12 +649,7 @@ static void fs_adjust_link(struct net_device *dev)
> > >  	unsigned long flags;
> > >  
> > >  	spin_lock_irqsave(&fep->lock, flags);
> > > -
> > > -	if (fep->ops->adjust_link)
> > > -		fep->ops->adjust_link(dev);
> > > -	else
> > > -		generic_adjust_link(dev);
> > > -
> > > +	generic_adjust_link(dev);
> > >  	spin_unlock_irqrestore(&fep->lock, flags);  
> > 
> > Holding a spinlock is pretty unusual. We are in thread context, and
> > the phydev mutex is held. Looking at generic_adjust_link, do any of
> > the fep->foo variables actually need protecting, particularly from
> > changes in interrupts context?
> 
> Yes there are, the interrupt mask/event registers are being accessed
> from the interrupt handler and the ->restart() hook. I can try to
> rework this a bit for a cleaner interrupt handling, but I don't have
> means to test this on all mac flavors (fec/fcc/scc) :(

As far as i can see, none of the fep->old* members are accessed
outside of fs_enet-main.c. There values are not important for the
restart call. So the spinlock has nothing to do with adjust_link as
such, but restart. So maybe narrow down the lock to just the restart
call? But it is not a big issues, just unusual.

	Andrew


