Return-Path: <linuxppc-dev+bounces-3446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438EE9D35BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 09:44:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtZf76Qksz2xpx;
	Wed, 20 Nov 2024 19:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::223"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732092239;
	cv=none; b=TpflzP49OEXeXpA2/xTJY20texCr6gs6vQmRi9L+CTjOs+TFFa7zJfbiNi5Hq46OjR8lRSC+lhmf/yRm3solAuZujaV08wcAEeNJGgKN7DBDcAF7CYr6v1pc8l9jLlUbFS+6rzKOUEbxxX83O6jOYpyaGky8jvV8V4s6+qyg2JKyyqj+BcYk1AxAXhz/1H0gvv21XDlzCmCMvW4dWFt2ibfsYjwd9oNZT33QcvcrIeB0sY/Geq3fk26UMR/I4Un5Dkz+mtFeQRBuJQO0NJ/Znv3qdyAdfyb8tClMfMORpNxcRLP24GBCuF6glInWhYC80HgIlK9l2sODJjCFtkDMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732092239; c=relaxed/relaxed;
	bh=1Stw1ZeJMKJorc1lwBQ/6FvPBootFID/HdRZ4NSNz5E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7g3cQeH5WJDJF/1Pb4AVRFs8IdOiQN2lrKTMRTgdU4xVM+dOrN7n9MN88t+hgYdA7db2anWHsgdR40azOBdj7qmTLQXO0FFdxiwk7rPJdAhlONYbNW5aTfaR5gwMd7UYo7aRjcUNLASxK5WoWmjvARAd6aedcjNzqanbnrc+XhZR9fESbJRUm9yDx3oUADyUC7n3pVUpOQ4+n/kZ4FHHqFppzUxpg7MLZivf+3hb/03Q93bCAKj1LbZeAP04tjg6YboSHUUE8v1Gm/eZkE4pk+tX7rgBf9qbRsCgR9ObT/OhZG8O3zMDYIraaHuwwBglnizRzutJJ3VutcRrsvIvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=S3N26LNU; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=S3N26LNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtZf562ktz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 19:43:57 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 990346000F;
	Wed, 20 Nov 2024 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732092220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Stw1ZeJMKJorc1lwBQ/6FvPBootFID/HdRZ4NSNz5E=;
	b=S3N26LNUg+yg4Gfy6ATW+vUqdJuEV2u5/+u4AK1NRHLMMu6ElvUZ+OYjtWGDzzHXUEV7dj
	FZLMmAPGySelqyxEnTsln7iqvrYUr+I0lL4ox+5rhA+zRSaxVUlZ5bA5pRNzMfXFlmLZqQ
	NjzKeS6NhpIuQ8wNBaN736iGKLjTDIw4X8eU9NwVAY34kjOXSF1coM5KNTFQPGfQ7sLQes
	qOiKCuim7BQaMrbHAlZOeZ8CH3R7GWuWS0bKZNsJ5tlDNQsKNYbcZsTNaubAlLzfMac+oT
	MMRjOBXrAmGlVq4QDcOl+PPJNYLOimVyFdSX46ctYavffMkMjdDkgHyA6eLnvQ==
Date: Wed, 20 Nov 2024 09:43:36 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 01/10] net: freescale: ucc_geth: Drop
 support for the "interface" DT property
Message-ID: <20241120094336.22f95926@fedora-2.home>
In-Reply-To: <20241115121914.GL1062410@kernel.org>
References: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
	<20241114153603.307872-2-maxime.chevallier@bootlin.com>
	<20241115121914.GL1062410@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Simon,

On Fri, 15 Nov 2024 12:19:14 +0000
Simon Horman <horms@kernel.org> wrote:

[...]
> > @@ -3627,18 +3588,17 @@ static int ucc_geth_probe(struct platform_device* ofdev)
> >  	/* Find the TBI PHY node.  If it's not there, we don't support SGMII */
> >  	ug_info->tbi_node = of_parse_phandle(np, "tbi-handle", 0);
> >  
> > -	/* get the phy interface type, or default to MII */
> > -	prop = of_get_property(np, "phy-connection-type", NULL);
> > -	if (!prop) {
> > -		/* handle interface property present in old trees */
> > -		prop = of_get_property(ug_info->phy_node, "interface", NULL);
> > -		if (prop != NULL) {
> > -			phy_interface = enet_to_phy_interface[*prop];
> > -			max_speed = enet_to_speed[*prop];
> > -		} else
> > -			phy_interface = PHY_INTERFACE_MODE_MII;
> > -	} else {
> > -		phy_interface = to_phy_interface((const char *)prop);
> > +	prop = of_get_property(ug_info->phy_node, "interface", NULL);
> > +	if (prop) {
> > +		dev_err(&ofdev->dev,
> > +			"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
> > +		goto err_put_tbi;  
> 
> Hi Maxime,
> 
> This goto will result in err being returned by this function.
> But here err is 0. Should it be set to an error value instead?
> 
> Flagged by Smatch.

arg yes you're right. I'll address this in the next iteration.

Thanks,

Maxime


