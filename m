Return-Path: <linuxppc-dev+bounces-734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C1963EF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 10:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvZdC03fhz2ysv;
	Thu, 29 Aug 2024 18:46:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::225"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724921182;
	cv=none; b=oWmujFXZSk/gPFxtfZHbnez5HXlkQInHrIRzGbujMBxJsO5rfmyge2jlL5TC0a7xuSpJGDo7KL9SO3pFxC4D3nPg6RC5+wzTX2Z3D8CA66ATdDv5leAshkt7GKeLTlJ/GNhhzRgLhNhkA07BEWL0dpS01htD337/7ERc/pPisWhLPClrDXWrO+kdBHc4bHsxcSKoVBLPzMOuPdNecaV6SW8eL61PmW2ubqov8fRLmhVTk7iSE9lq1UEiIy7TVUQSUo37WBrYhh83SFOXEALgy1AVhUQ7OBO8o/bxK649RmZRL8BUC/72iV86FvKZ78ybB1DdJdTAQnZuuSFqvlEPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724921182; c=relaxed/relaxed;
	bh=+T3omComrLDAWmGbNggJCqX9A019Fxez+XjpgJiOBzo=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-GND-Sasl; b=cyOpe1P5hImp0C/S7RCLbV+94pR0+cgCmOdiZi0y7YH0s/APw4cKzB/nameDZTgIkrOGag2jHWN/WxtSRIc1GpZIRFu9Sgr2ufw0Jv0Wy61SweXhO2Qpy6BeaK0SY5VMt1YLK+dWVWrYG3VknYuidkH96gkDBz2dtrDacHU9xhecO/XkQ3hTrmBhSeCvsykRxLkAHyVWy8TD35+ubRRALNj9iV7dMFlOUXHInaKMPcRHlSnPuygfWcfqOMvSYBDdGf91Y1Ejr7OFMG6X3PsNHc53ulGP8ymWG6fwnUJEKz9/d8a1IzeGOkl4lzDpEu2NOlk0y844WJjDBHb2up1fOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PjexuK6r; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PjexuK6r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvZd96MYcz2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:46:19 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CFF01C000E;
	Thu, 29 Aug 2024 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724921170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+T3omComrLDAWmGbNggJCqX9A019Fxez+XjpgJiOBzo=;
	b=PjexuK6rbszk7oaGN2/pHSDc4v+HR/T3nq+tk5ETvg/N0EiaTPwdoDaCgywoEma6CLQ3ii
	eqbUIkDSvBGoCfpS6h2tyC1HCDuu0Gzz2tA9axCqf0VFpuuxML4LdERD5D/sBG+/EihoKY
	9mVoYexdOzraQVHbYS391BcpTmUbDP6Pu4iE6yg09M2in+l3Ux22bFceXXkRCKEdI07qSc
	JioFW/sHo6SY1C0tqUUnWnCgvbOEahufon9hqTdtcQkI6JjiaAgkntSFHZe8wNLd7+NkF2
	12UQ1/omVjmUrmOfF65to9XU854JOshShxqvrOwrcVAwZCwrc4daedYkVOBF6A==
Date: Thu, 29 Aug 2024 10:46:06 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Herve Codina
 <herve.codina@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 6/6] net: ethernet: fs_enet: phylink conversion
Message-ID: <20240829104606.4ba68402@device-28.home>
In-Reply-To: <20240828163224.GT1368797@kernel.org>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
	<20240828095103.132625-7-maxime.chevallier@bootlin.com>
	<20240828163224.GT1368797@kernel.org>
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

Hello Simon,

On Wed, 28 Aug 2024 17:32:24 +0100
Simon Horman <horms@kernel.org> wrote:

> On Wed, Aug 28, 2024 at 11:51:02AM +0200, Maxime Chevallier wrote:
> > fs_enet is a quite old but still used Ethernet driver found on some NXP
> > devices. It has support for 10/100 Mbps ethernet, with half and full
> > duplex. Some variants of it can use RMII, while other integrations are
> > MII-only.
> > 
> > Add phylink support, thus removing custom fixed-link hanldling.
> > 
> > This also allows removing some internal flags such as the use_rmii flag.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> Hi Maxime,
> 
> Some minor issues from my side: not a full review by any stretch of
> the imagination.
> 
> ...
> 
> > @@ -911,7 +894,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
> >  	if (!IS_ERR(clk)) {
> >  		ret = clk_prepare_enable(clk);
> >  		if (ret)
> > -			goto out_deregister_fixed_link;
> > +			goto out_phylink;
> >  
> >  		fpi->clk_per = clk;
> >  	}  
> 
> This goto will result in a dereference of fep.
> But fep is not initialised until the following line,
> which appears a little below this hunk.
> 
> 	fep = netdev_priv(ndev);

Nice catch, the goto should rather go to out_free_fpi.

> 
> This goto will also result in the function returning without
> releasing clk.

ah yes, it's never disabled_unprepared, the phylink cleanup label is at
the wrong spot. I'll include a patch in the next iteration to make use
of devm_clk_get_enabled(), that should simplify all of that.

> Both flagged by Smatch.
> 
> > @@ -936,6 +919,26 @@ static int fs_enet_probe(struct platform_device *ofdev)
> >  	fep->fpi = fpi;
> >  	fep->ops = ops;
> >  
> > +	fep->phylink_config.dev = &ndev->dev;
> > +	fep->phylink_config.type = PHYLINK_NETDEV;
> > +	fep->phylink_config.mac_capabilities = MAC_10 | MAC_100;
> > +
> > +	__set_bit(PHY_INTERFACE_MODE_MII,
> > +		  fep->phylink_config.supported_interfaces);
> > +
> > +	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec"))
> > +		__set_bit(PHY_INTERFACE_MODE_RMII,
> > +			  fep->phylink_config.supported_interfaces);
> > +
> > +	phylink = phylink_create(&fep->phylink_config, dev_fwnode(fep->dev),
> > +				 phy_mode, &fs_enet_phylink_mac_ops);
> > +	if (IS_ERR(phylink)) {
> > +		ret = PTR_ERR(phylink);
> > +		goto out_free_fpi;  
> 
> This also appears to leak clk, as well as ndev.

Thanks, will be addressed in V2.

> I didn't look for other cases.

I'll go over the cleanup path, thanks for checking this !

Thanks,

Maxime

