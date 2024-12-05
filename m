Return-Path: <linuxppc-dev+bounces-3814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFDF9E4E71
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 08:32:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3mLy1T7Rz2xYw;
	Thu,  5 Dec 2024 18:32:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733383962;
	cv=none; b=N6hqasHS0PopuN0flLbPMu6Y3Ts4MruteRqqrgyk7/63rESlfvzn7dmLaXRcQOrAxBODSrchg/vx9PEVwBNuiu8+jy16jP7hoCxVctMrZXZB2wTRGHn0hU6wLJLSNanqRSEQXGzp9DZ2vVp46PnNI7AAIkOs/hk/WAelqoDg97t2lk1qh2GZj6awGMLAWM2JH0qEV6VbmZF+bJiIbOQ3u27ZndMRF9jxp0oAo9T856nnv1IrlIASKzVAeXmlCXYH+p9aGkHi5CjbVW92P8LR32q6jf0bumabNaSTUWcEy7tams6pkF0/7fzSX1lx/fzT6nqVPM+bZhxklFkoDopXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733383962; c=relaxed/relaxed;
	bh=M0uLzqoQedwirIumfnvNOpR0fEO9z6ZDDUf+XyF2k1c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvoHviTCvzv7HlPPtAAuse6VWnwkRtvxmX0sD4+33zj+21/D5XAViTaXDZ8nhRwWOgWC+x1to9sOwlV/lsIztqqQbh/uUY0ZKDAauKOFpo1QElmDoqyCBSbzjztEabdpol+lIRj90088CRct1pXT+eez8LnPy31qZ6vh9wlcI9krJw34dO89nQkCD9uqAbOrRiNzgromVemerL6hurY/rCwqHoLmfDcOqmtv5Xk1QcBLrzJT3Vh4kDCJkcXxtgPppxiOlLPwy8I9kspyb5gdwWrOWt1aAj5MApyIQWBUkJR/ZjYN7vY+bQA/k9QI6pdfCffhX+NFaCv+5n3yYd6guw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nmZGsgMg; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nmZGsgMg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3mLw1c4bz2xWt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 18:32:37 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9EE81BF205;
	Thu,  5 Dec 2024 07:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733383953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0uLzqoQedwirIumfnvNOpR0fEO9z6ZDDUf+XyF2k1c=;
	b=nmZGsgMgcL7R2GwptET0jTVmXpIGp030DPZr91xtkvYkN7Cbhgn+5o+k/w1uiDcxUXRUBb
	nQYNI5q+lXq8jiij00dhkF2LhqUP7QVd2YKMZYxDP+jOlVvf+XU3SqoZKb0Fe50G8cjOF8
	atXyTQKUbVvykP+QLV+cQQHbv4M17sRbuYYn8S1GEko7Fz9Z1mwj1gVUtDJOhuvnQcAdau
	cC38FReuOum3xlUvIBZOMB2WgEluDNL5/b3h2hddYkjpGg+JYIC7MzbKJqskeDLKgPL3pD
	74VL6NsE+0FVZ511rYCjBY1CSWT6eDrAOt5MDAosKIoaPMTllGDHFJlXFguk7Q==
Date: Thu, 5 Dec 2024 08:32:30 +0100
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
Message-ID: <20241205083230.2344d850@fedora.home>
In-Reply-To: <49fbbbf8-ec21-41a6-b87e-0172d0a4a2b3@lunn.ch>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
	<20241203124323.155866-10-maxime.chevallier@bootlin.com>
	<ce002489-2a88-47e3-ba9a-926c3a71dea9@lunn.ch>
	<20241204092232.02b8fb9a@fedora.home>
	<49fbbbf8-ec21-41a6-b87e-0172d0a4a2b3@lunn.ch>
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

On Wed, 4 Dec 2024 16:41:33 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Dec 04, 2024 at 09:22:32AM +0100, Maxime Chevallier wrote:
> > Hello Andrew,
> > 
> > On Wed, 4 Dec 2024 03:15:52 +0100
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >   
> > > > +static bool phy_interface_mode_is_reduced(phy_interface_t interface)
> > > > +{
> > > > +	return phy_interface_mode_is_rgmii(interface) ||
> > > > +	       interface == PHY_INTERFACE_MODE_RMII ||
> > > > +	       interface == PHY_INTERFACE_MODE_RTBI;
> > > > +}    
> > > 
> > > I wounder if this is useful anywhere else? Did you take a look around
> > > other MAC drivers? Maybe this should be in phy.h?  
> > 
> > Yes I did consider it but it looks like ucc_geth is the only driver
> > that has a configuration that applies to all R(MII/GMII/TBI) interfaces  
> 
> O.K. What is important is you considered it. Thanks. Too many
> developers are focus on just their driver and don't think about other
> drivers and code reuse.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks Andrew. I should have indicated that in the commit log or in the
cover in the first place though, I'll make sure to do it next time.

Maxime

