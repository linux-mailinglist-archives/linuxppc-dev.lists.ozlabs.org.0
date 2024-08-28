Return-Path: <linuxppc-dev+bounces-686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FA96263F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 13:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv2dJ0J06z2xMW;
	Wed, 28 Aug 2024 21:44:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::223"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724845476;
	cv=none; b=KCYz/WRqNj4dPWX5Dyxu0q/hYV5FtMTcSGsoAHBr6CyfbUt76oYEPhYQY3zpXg9ojnjdC7As5qCJgmyekh2kUntv2jI2NiEeAQpU2IbvCihhvEU9pZ06BdS9SNKxUctr4OMDO1aANad91crs4+G+162s5Un54+LF4kNBPtzbP0nX48ssXXToIlgXmAU4dVos9yS8783Eitc9RBUVnXqlujRcIQK4MfO+ruYw6fdqPogErpUAkEWCYw+b1qEWW0sNIb9OQJ1L6fROTdGmhTAjkLfa1VwRpMkJIhw5VaeyttS3y/3mg8e3WyVIZfzH338yMlTaAlzPgKq5ijASUwhWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724845476; c=relaxed/relaxed;
	bh=hdD46+xqETLLnoGEn/pP5MsKWihrd270ooLz0K2h75c=;
	h=X-Greylist:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-GND-Sasl; b=mYgXWG/h3AZQV98zqBx0HbkDcbgP/BVJw9U61DCKb7RZ7rbgJmfUQ9yTHGzZ72210xAS9tcmINZHPaIaV1R1OYQ/XP7ZhjYlO+dkWhGWeoLX2XiueEXkwdKjqi3RNgMq6ptI/rKoS3y+JexfbrAl/Sc9vlMpN/e6mcb/urjkrp8zxpmknemdumEiAuR0BR2LDYI2rE3qGQAJtmsghAB2qp4gyljG6Y294us/m8fj0I3/lxLuDHq+kuXNDlswfDjcaF3LgnZDEYYXs23inPPrFRXrSgqTtzvYgzZBnPUOJh3dGxXqasmROrxNgV8tDn0foIU2As6xEafBXKTW19oaWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HcBGrfRj; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HcBGrfRj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6797 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 21:44:35 AEST
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv2dH1JTyz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 21:44:33 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84C0E60008;
	Wed, 28 Aug 2024 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724845464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdD46+xqETLLnoGEn/pP5MsKWihrd270ooLz0K2h75c=;
	b=HcBGrfRjAhBd30Zf6fNvkjki3tNGiz2EvkSsWYMAVN+lDUNQg5RZaypgzQ3B6udHdt8I6E
	2hfJT1I3x68NPMT4n+WAT+RpE71//VsJ0rrSGSrEtzXTcd1Vq/txPkGVg2AGzFfPIDxYeD
	SuUSb5cndSYqRV235OkubKvxp5DJyCsDmmve5t5n6SLPCOeYeD8aS41dJ0WjF6eC8FDENz
	PcLIhN++hlledYtERjnVkQGqrxvE4XQrIBqrHTv+heMzxXBdnaTxOEgv/4Ar5PAi+eg9We
	1yX7cqFx/5m1zitXg6JPsSEy6gIFOXVSlLDWUhRK08RY9JbsUzZdTLWq9aMATQ==
Date: Wed, 28 Aug 2024 13:44:13 +0200
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
Message-ID: <20240828134413.3da6f336@device-28.home>
In-Reply-To: <Zs7+J5JWpfvSQ8/T@shell.armlinux.org.uk>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
	<20240828095103.132625-7-maxime.chevallier@bootlin.com>
	<Zs7+J5JWpfvSQ8/T@shell.armlinux.org.uk>
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

Hi Russell,

On Wed, 28 Aug 2024 11:38:31 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Aug 28, 2024 at 11:51:02AM +0200, Maxime Chevallier wrote:
> > +static int fs_eth_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
> > +{
> > +	struct fs_enet_private *fep = netdev_priv(dev);
> > +
> > +	if (!netif_running(dev))
> > +		return -EINVAL;  
> 
> Why do you need this check?
> 

I included it as the original ioctl was phy_do_ioctl_running(), which
includes that check.

Is this check irrelevant with phylink ? I could only find macb and
xilinx_axienet that do the same check in their ioctl.

I can't tell you why that check is there in the first place in that
driver, a quick grep search leads back from a major driver rework in
2011, at which point the check was already there...

Regards,

Maxime

