Return-Path: <linuxppc-dev+bounces-992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187F96C2E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 17:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzRmD361mz2y8V;
	Thu,  5 Sep 2024 01:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::221"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725465052;
	cv=none; b=aO4/To9H1nx/z9aYgPYn78zzDnV2gmolkuWGwgvnKLiszxSx74h/vPGpwmQEUKvzJ1o2zZ14k9tNkKSV85BK1WoMGbhOXiS4ujOL5haFkRlGKcBiPyp1XuF83ofsjLxJYvPbIqcBdwDT6uL8SCcNq5jWYGPp8O+8EXlnfDYVVCy66LyAF7BsQVvYVdl2gQv0cL0hXUkt2ZPaydGXfTYZ4j+4ssombM6MsU870V99juVGU8Ha/AydACQA7RcaNMqyh9z4384CQaZ7RmQn8aEjdyCnbSMpP4ceVQdPPxOPDko0F7BeZloq6aCoC2LKjzWXV5FV877PcEsTQ8rN1B+irA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725465052; c=relaxed/relaxed;
	bh=DxBVOgy6vP4MJ5wq+/uQVrDnftB3/9gQPnLp2KgLr6s=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=K3CI9bfTsdyrZw88D4VGxijjNTgMJxQoz0CeyrFOP8TxO7T8UsgVOFgKEKT/MY9aCEapnbtGTZq/g3p91o9gWK96AwhbZNxTur9Svyj0oaJgvOeEVR0CtqiU12CtRCIvFrjekrNzL29yrSiT4xDUUIMs6erPsnTqWCZENP3FFHys5oWEDf3LRDvWFm7RSCQGuEpyQbd9bps9aV1otSW1duvvX8WHZ/l+J1oNg2DbQkCKBtnm4p6brr839sRFKjn77fM5w0oEj+4a2gJhKhNwfTUkAxsV5ffzF7ryl2PmQLkJMvQsnCPEO21JlcR8bb3JZJnSSs0aljV+KgGG9XC/pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=iO71J4k0; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=iO71J4k0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzRmC43KRz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 01:50:48 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B809240003;
	Wed,  4 Sep 2024 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725465046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxBVOgy6vP4MJ5wq+/uQVrDnftB3/9gQPnLp2KgLr6s=;
	b=iO71J4k0L60TPnkLcYV2Yzzo2S9KLm2KzdH/Pfewgw22XIEyt8Tjx9NZhhOIp/OAmpg5dt
	qGgBIvaBUSTXZ75BPmYrWSjw6uqjiFsFM2BLUMaPx9YcTejSGOCXHW7A5xfxerTP1odFRY
	DVw82mewO618HsWL3rBhvTis4oMkq2PowP1dlFcIWL+kCUZq7e+N3BP3kibLFv/2iH+MRe
	2J8Y1LPOEbiWpoWC+cZDnKzGg5DUt4G6dNlfC6HLuWEJVg5rGhXDsfIl+Kv+ta5NutYulh
	JYnRy79HRyD2phWbYU1iiU2H4nJuh7yBUM7Y/MJGHXruXGciFOYNaVHQViSDGw==
Date: Wed, 4 Sep 2024 17:50:43 +0200
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
Message-ID: <20240904175043.0f198836@fedora.home>
In-Reply-To: <58cf7db3-4321-4bd9-a422-3642ce59f21f@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
	<20240829161531.610874-4-maxime.chevallier@bootlin.com>
	<480a16fd-a1eb-4ea0-b859-5d874ecc3b15@lunn.ch>
	<20240904102711.1accc8ce@fedora.home>
	<58cf7db3-4321-4bd9-a422-3642ce59f21f@lunn.ch>
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

On Wed, 4 Sep 2024 14:36:58 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Sep 04, 2024 at 10:27:11AM +0200, Maxime Chevallier wrote:
> > Hi Andrew,
> > 
> > On Fri, 30 Aug 2024 23:06:08 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >   
> > > > --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > > > +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> > > > @@ -649,12 +649,7 @@ static void fs_adjust_link(struct net_device *dev)
> > > >  	unsigned long flags;
> > > >  
> > > >  	spin_lock_irqsave(&fep->lock, flags);
> > > > -
> > > > -	if (fep->ops->adjust_link)
> > > > -		fep->ops->adjust_link(dev);
> > > > -	else
> > > > -		generic_adjust_link(dev);
> > > > -
> > > > +	generic_adjust_link(dev);
> > > >  	spin_unlock_irqrestore(&fep->lock, flags);    
> > > 
> > > Holding a spinlock is pretty unusual. We are in thread context, and
> > > the phydev mutex is held. Looking at generic_adjust_link, do any of
> > > the fep->foo variables actually need protecting, particularly from
> > > changes in interrupts context?  
> > 
> > Yes there are, the interrupt mask/event registers are being accessed
> > from the interrupt handler and the ->restart() hook. I can try to
> > rework this a bit for a cleaner interrupt handling, but I don't have
> > means to test this on all mac flavors (fec/fcc/scc) :(  
> 
> As far as i can see, none of the fep->old* members are accessed
> outside of fs_enet-main.c. There values are not important for the
> restart call. So the spinlock has nothing to do with adjust_link as
> such, but restart. So maybe narrow down the lock to just the restart
> call? But it is not a big issues, just unusual.

I agree with you on that, and this is actually what end-up happening in
the final phylink conversion patch (only the restart() call gets called
wthin the spinlock).

I'll however include a patch that does exactly what you suggest as part
of the phylink conversion, both to make the big port-to-phylink patch
smaller, but also to better document why we only need to care about the
restart() part, if that's ok :)

Thanks,

Maxime

