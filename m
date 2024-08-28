Return-Path: <linuxppc-dev+bounces-696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A11962A46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 16:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv6LY4tQ6z2yYy;
	Thu, 29 Aug 2024 00:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::222"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724855525;
	cv=none; b=LxftZVY2py840fNk1BwnHJIjcghCRAzYKs/AETuxgukZLRAviHPtsU5rfGVabiRPZoA5AjyravbJBi/ixAEcT1uabDif7ODM3CidnyuY6T/ENBjQaueB3K4rIaptUpMk9BF06bEzMunInpmKlHziPszJcvTfkumUlZLcjp7BGyVMC+AawTM6pLPS58QOw6yrJ0App8U8Q207fmOJtEcyjETbC+ZBYi4ACiCVVHsRwnKs6e1VRDbPytAAfUkxxqpHTTkxMhTSvVFz7yPmqE7I82O+A2RdhNLe65w81fqBX3S8/p/5tE6aK/16LaHOUnL3TikLUJRvOC32GahQyKoyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724855525; c=relaxed/relaxed;
	bh=zBp11t92VbRmerW/yNZLIw8ZxxUVRQYze0GfI/bV7yg=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-GND-Sasl; b=I2MeXgSLSlZ8zEYzYFR0t6E1l5mfvZdCZU3Gq0GqLi+lOmAIA9Wp568EsoCAx/BsJmnHujD/9JOi8aUr7Y5hH0w8lqH9ccK2nJMks8OA5zxT1fwBqRHDakjkJWBOqh9/AwzkWVt4BxoxytXfput5STQwzVEMEfgngdwSlKSOodbvRVOWIcdLqlTVRn0tXzTFQLXOR4jJ+PreAvoxQtxZ3BTm6nTUAGOaRCa8oDM7u8of8/qzTD6lNf1nHIHwuebVNXSkc8qhkdzj7eL7mXgp43LB9a6usGbyS9rOQiVXSgzwvlIgEuboxRa14bj4jnMrfI9NufvRebe/Oetotn1yzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RLLj6mIJ; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RLLj6mIJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv6LX3rFVz2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 00:32:01 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D26BE40003;
	Wed, 28 Aug 2024 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724855514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBp11t92VbRmerW/yNZLIw8ZxxUVRQYze0GfI/bV7yg=;
	b=RLLj6mIJwOxD4F4Ih3EczWnuu0JhM2qh58gi/MD1Sa3Lta75YgjMDUJ8+uO4MQSDz4FYY6
	m8q3NAJDXBcl6KQ3rey/8CZFJRZkJwZRvIyJXJFN6zOPmzKGitwfvLSAenmXterpgvmyoc
	+WKxz/AXSepM4tFICNISb9sq6b7YdrfNa90wu9NgaXtxY/RAW9ygw77MjHquEFC2q4JoOS
	fXuh1jHZy+dp/9swBngkuOou+yOZDndmZbb494c5+1QUkUYMxcLb+c/DChDr61ycP/sV9L
	VJneaxmD6ees3e5lFbVyaLPED7bcNJ8JPsGdfeeQJWHxgKoc+aJvQrW+LWP5YQ==
Date: Wed, 28 Aug 2024 16:31:51 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 6/6] net: ethernet: fs_enet: phylink conversion
Message-ID: <20240828163151.485b2907@device-28.home>
In-Reply-To: <Zs8sMUxX7mnWZQnA@shell.armlinux.org.uk>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
	<20240828095103.132625-7-maxime.chevallier@bootlin.com>
	<Zs7+J5JWpfvSQ8/T@shell.armlinux.org.uk>
	<20240828134413.3da6f336@device-28.home>
	<Zs8sMUxX7mnWZQnA@shell.armlinux.org.uk>
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

Hello Russell,

On Wed, 28 Aug 2024 14:54:57 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Aug 28, 2024 at 01:44:13PM +0200, Maxime Chevallier wrote:
> > Hi Russell,
> > 
> > On Wed, 28 Aug 2024 11:38:31 +0100
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> >   
> > > On Wed, Aug 28, 2024 at 11:51:02AM +0200, Maxime Chevallier wrote:  
> > > > +static int fs_eth_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
> > > > +{
> > > > +	struct fs_enet_private *fep = netdev_priv(dev);
> > > > +
> > > > +	if (!netif_running(dev))
> > > > +		return -EINVAL;    
> > > 
> > > Why do you need this check?
> > >   
> > 
> > I included it as the original ioctl was phy_do_ioctl_running(), which
> > includes that check.
> > 
> > Is this check irrelevant with phylink ? I could only find macb and
> > xilinx_axienet that do the same check in their ioctl.
> > 
> > I can't tell you why that check is there in the first place in that
> > driver, a quick grep search leads back from a major driver rework in
> > 2011, at which point the check was already there...  
> 
> int phylink_mii_ioctl(struct phylink *pl, struct ifreq *ifr, int cmd)
> {
> 	if (pl->phydev) {
> 		... do PHY based access / pass on to phylib ...
> 	} else {
> 		... for reads:
> 		...  return emulated fixed-phy state if in fixed mode
> 		...  return emulated inband state if in inband mode
> 		... for writes:
> 		...  ignore writes in fixed and inband modes
> 		... otherwise return -EOPNOTSUPP
> 	}
> }
> 
> So, if a driver decides to connect the PHY during probe, the PHY will
> always be accessible.
> 
> If a driver decides to connect the PHY during .ndo_open, the PHY will
> only be accessible while the netdev is open, otherwise -EOPNOTSUPP
> will be returned.

That makes sense, so there's no point keeping that check then.

I'll update the patch, thanks for this clarification.

[...]

> At this point... this email has eaten up a substantial amount of time,
> and I can't spend anymore time in front of the screen today so that's
> the end of my contributions for today. Sorry.

I've been in the same rabbit-hole today debating in my head whether or
not to add this check, I'm sorry that I dragged you in there... With
what you stressed-out, I have a good enough justification to drop the
check in the current patch.

As for the current situation with the ioctl return codes, there indeed
room for lots of improvements. For drivers that simply forward the
ioctl to phylib/phylink, I think we could pretty easily add some
consistency on the return code, provided we agree on the proper one to
return.

Thanks for your time,

Maxime 

