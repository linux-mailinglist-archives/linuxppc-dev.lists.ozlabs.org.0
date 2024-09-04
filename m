Return-Path: <linuxppc-dev+bounces-974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA496B911
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzK542JmWz2yRd;
	Wed,  4 Sep 2024 20:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725447000;
	cv=none; b=CTExN7a+U0c/nW8cVjdyyD/HcYzW3CBKhCIoTtFWVpdNt+8peZ1cvjXeF/slc7DFYjtm0x2qpnBJ+4F++IgnhJ3fr1Uw8uF1G2ROCw2rhwTuryE7r35Yfosq4uLQQJO4uyMh4IKliYPJw3yiCWXXKlBGAvbMoLjgZnHssrZJAjIPdq08ubZMnH4awesnavqFU+ktpCt7SCYgAe4pF0FlX3QxMZT7S3xqKu01vF9RaO3ysDmy7l4QhXX2mweu8luO/clKmIoIFADsfs56CsmB8rbl6jlH4dPvQvflpU4T7YQy1zndHL2GENHtw4Sk9UUNwWFsSTw0YwZ2UlsYrXW9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725447000; c=relaxed/relaxed;
	bh=OlQwp//l7+YMqCwEc62IbsKJVaVaIN0kbujxzcaSERM=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=Di5KyQ9HorDFORf7M0UiQyBzqObUreW17M1pSkot/BXRP/QhslCAuZg8t9OgirwuzB12r0dwML+CfYkFmU7PWkmtomKcFqEqVni9f9nwmBLe8uDi8g6zcxCRBebp3bxqTkv8rxLExxfh5X06BfX7zBSspAA5va0eTC04VT7buIbuFXueKM1aBeHEX8JvzgD5l0sGnqYuNZ4ljHHt+I3QNdA84NKMLqP66Dl6qGA6clg39eluHrRi7/GmEPPlSakM4rIo8Osx7U3Y6bDnkmceMa8BVwDmDWX6qo2e5EQMAtKuzFs8YzvinlFc7oJklYqGYqJfjkQr2pwCTBbBREbZoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AjO+zJcz; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=AjO+zJcz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzK533lWQz2yRC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:49:57 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 805841BF206;
	Wed,  4 Sep 2024 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725446992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlQwp//l7+YMqCwEc62IbsKJVaVaIN0kbujxzcaSERM=;
	b=AjO+zJczyrIU9K82FhJ8IfAofM+yJtFx1/tB0Usq8CuxFJmN/lqMvG7f4uaUqRzzKIg32Y
	072cQqb2AYT+TcGFLby8CWj4hKXnCXptPUgIIXJ1a8KYaP8UNSiIFSV52DXfCMuy7V8Jbd
	67ZvV/uH0AlmbJ81czvB2WNIuDTpqwhNrOm2OUUojHecup2yvlEtUGdmNT6GUyJd3JihgY
	GjBlIAQUEwsCJoElvHxaqzCoGfd5HvX/ZgCtb3r5sM9HKrd/Y1q+k3RXuoL3bUPtv+xFt6
	RCfqul/llDwO58QjXYaEAQJF0+rROiGIUJskuUOfy9c8UGZN1Z7qFCCkeJHrCA==
Date: Wed, 4 Sep 2024 12:49:49 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>,
 Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 7/7] net: ethernet: fs_enet: phylink
 conversion
Message-ID: <20240904124949.563f1343@fedora.home>
In-Reply-To: <20240902185543.48d91e87@kernel.org>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
	<20240829161531.610874-8-maxime.chevallier@bootlin.com>
	<20240902185543.48d91e87@kernel.org>
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

Hi Jakub,

On Mon, 2 Sep 2024 18:55:43 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 29 Aug 2024 18:15:30 +0200 Maxime Chevallier wrote:
> > @@ -582,15 +591,12 @@ static void fs_timeout_work(struct work_struct *work)
> >  
> >  	dev->stats.tx_errors++;
> >  
> > -	spin_lock_irqsave(&fep->lock, flags);
> > -
> > -	if (dev->flags & IFF_UP) {
> > -		phy_stop(dev->phydev);
> > -		(*fep->ops->stop)(dev);
> > -		(*fep->ops->restart)(dev);
> > -	}
> > +	rtnl_lock();  
> 
> so we take rtnl_lock here..
> 
> > +	phylink_stop(fep->phylink);
> > +	phylink_start(fep->phylink);
> > +	rtnl_unlock();
> >  
> > -	phy_start(dev->phydev);
> > +	spin_lock_irqsave(&fep->lock, flags);
> >  	wake = fep->tx_free >= MAX_SKB_FRAGS &&
> >  	       !(CBDR_SC(fep->cur_tx) & BD_ENET_TX_READY);
> >  	spin_unlock_irqrestore(&fep->lock, flags);  
> 
> > @@ -717,19 +686,18 @@ static int fs_enet_close(struct net_device *dev)
> >  	unsigned long flags;
> >  
> >  	netif_stop_queue(dev);
> > -	netif_carrier_off(dev);
> >  	napi_disable(&fep->napi);
> >  	cancel_work_sync(&fep->timeout_work);  
> 
> ..and cancel_work_sync() under rtnl_lock here?
> 
> IDK if removing the the "dev->flags & IFF_UP" check counts as
> meaningfully making it worse, but we're going in the wrong direction.
> The _sync() has to go, and the timeout work needs to check if device
> has been closed under rtnl_lock ?

Arg that's true, I didn't consider that call path at all... Sorry about
that, I'll indeed rework that to address this deadlock waiting to
happen.

Thanks,

Maxime

