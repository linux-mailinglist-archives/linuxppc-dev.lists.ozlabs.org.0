Return-Path: <linuxppc-dev+bounces-3776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0679E3522
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 09:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y39WB2FLjz30Vd;
	Wed,  4 Dec 2024 19:22:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.200
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733300566;
	cv=none; b=XAF2i+mS82EnpsD4aS7YZrmg7e3yPt08jOjNWcHmgHMW3/Tcy8f3md5Zycx+T6wclgVa7jkebv2VmaJKH4A8b1+SuzZvF/ucUwp1Lp/c1y/mibjB0/67GYPiWVS4YeQt9nnECtbLlAJcQZXe93Pct2skxlh5KVXcWg4AYmzIIRzupwX9a3wPRy6X6McKnEkPMZjuZ1ztorDvQyXiN4Nay18UNkQ8fNdkZbR3i8OL8kEEe8nH07QHVJ05caKnZP53hs5wH7xt7VJP/SZLnUC2BV1MScrPuAVE7qp7LgPNBD4WRKXr5GfJuipGJYgQ3xzfrn8LL27PeDGFMrbwxlsM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733300566; c=relaxed/relaxed;
	bh=F1RIotwJy9sqXQwL5qTyXf76s+adD7eN65AFmUkxujw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDij6EXqgCYeZxoTl5RZJDTnOzTXDcZM/dIg+C5GGvpPUd4j5nuapHe5c47iUybCpsAvHevzYDyuCuMjOPdNhDbfS244HTCuzXkCzgie3nATGRRbIpAmxrnHPt761MDUJYtXNnZVjNo2uyXJyZESRoJGH3VBUeu7ioW5R9XdmA6u079zTGZxAWxyo59xyPUaDpELmPRNvAwYXg20LsE5m7ImWnIJqAsJUmdtHD4MaDBEloxPRQbo6OEVbM8jgGk+XfrqdS0nISpeQ8xczQMdpLvd8/tUvxzn1IPpGfXt9gXOtBKKmgzBJwWY+t9h4wue74KtUk7DokZSZQl3DnLLJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Zka3L9u9; dkim-atps=neutral; spf=pass (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Zka3L9u9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 70749 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 19:22:44 AEDT
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y39W8183tz30VS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 19:22:41 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC03E20004;
	Wed,  4 Dec 2024 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733300555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1RIotwJy9sqXQwL5qTyXf76s+adD7eN65AFmUkxujw=;
	b=Zka3L9u9yi/YcYD5QweP2ZXtXKyh6ixJ+45+o1WWC4jNcqbyYglqucX4kVrxl/SgmBONQn
	+CMoQNjyuQ2jL5e507DyCdXjVtCJb7o+UsmDqOYLPOKCc3ggKnjam3bhx5N8/Z+i5rtjoV
	Dac8m/ylVEQWmQw+sXE6yKdNSjXOvo67jb+qJMy7DYPGfoBzFF57Lbm6VNZGPIqc2Lb5de
	eKD+pTOXvAyAPxQCGfxNa/GwQd02aQJe9kLFY+toFGGf4WNARoN2UxdXWNowRHddFXz7Qh
	4rt/FEV6UILiJRzwee84O8qIFPFD1TRuZPT5c7da+6Ys3q0pOmzX5MNlXwnyoA==
Date: Wed, 4 Dec 2024 09:22:32 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Simon Horman
 <horms@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 09/10] net: freescale: ucc_geth: Introduce a
 helper to check Reduced modes
Message-ID: <20241204092232.02b8fb9a@fedora.home>
In-Reply-To: <ce002489-2a88-47e3-ba9a-926c3a71dea9@lunn.ch>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
	<20241203124323.155866-10-maxime.chevallier@bootlin.com>
	<ce002489-2a88-47e3-ba9a-926c3a71dea9@lunn.ch>
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Andrew,

On Wed, 4 Dec 2024 03:15:52 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static bool phy_interface_mode_is_reduced(phy_interface_t interface)
> > +{
> > +	return phy_interface_mode_is_rgmii(interface) ||
> > +	       interface == PHY_INTERFACE_MODE_RMII ||
> > +	       interface == PHY_INTERFACE_MODE_RTBI;
> > +}  
> 
> I wounder if this is useful anywhere else? Did you take a look around
> other MAC drivers? Maybe this should be in phy.h?

Yes I did consider it but it looks like ucc_geth is the only driver
that has a configuration that applies to all R(MII/GMII/TBI) interfaces
:/ I didn't even know about RTBI mode before looking at that driver and
it does look like it's not supported by that many devices... I'd be
happy to put that in phy.h but I think ucc_geth is going to be the sole
user :)

Thanks,

Maxime


