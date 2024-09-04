Return-Path: <linuxppc-dev+bounces-969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942E96B580
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:52:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGTK0jC2z2yR9;
	Wed,  4 Sep 2024 18:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::221"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439941;
	cv=none; b=cVM6VVJHMUGHlahIve0w0n2WP8eqKSLKIdg57JJC6PzOzCFbfUPTtk8YQI7ON2pqX4huQEuQduaAA+1sFNdMAOrzb2ViI+OlwGd5CVSP8vMngRhHIp2CkDEi9FawUFK7xDenTO7AkYqAex0+7UZYbiRekp60KyP6Av99Pe4onYO58hkiH1upTl4upEEq1dwmrD1JdSA6cPGLoPKqp9vq5QM3rg7edYFNHRH1Xbr2SzgC1i3LF5TbJnSU/mKSJoSetHagOoGQlRoiPokDuIOyjrepQPTeGqzWi9qQbSxPDTwqZ77pRZR7fUqiF7N+x7LGRKfNeB617rGrCIRJEyeHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439941; c=relaxed/relaxed;
	bh=/gQVLtPniH2vSqBzxSwNJZS10K7mVOFLUlzmTaph06o=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=CXQgdS27ttPJUrSCCpuWWvgOsfBmOiSbQ+MfLEni4ChlNL2Vx9IJ42AGLcg5/zHecXgqTVzIYwKXP3jtcGy/lb11obFMHELiXkTDs0EjivUb1GesWg1UhvT16noekhz/Pi+deRWEZhJ5TWwmuBEn4VMhiXewclh9wPb3Z58eR/3QbssrJ99fKaAHJ+faDqlf4x1bQxSGT2waodFgV3lIEfb89O4dATTh9uSVYdFnzwe/WnaK5uoVN4lMjwvja3wTfWFLksdizbHkefxvUfpa8oxmFA5E2pnr153uEEEJ5ElXT0yy5t8W0cKrT/LfK3jrlueF9XTarAqiEJAIEAFzgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=o6jghW40; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=o6jghW40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGTJ1t94z2yR5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:52:18 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAC3824000C;
	Wed,  4 Sep 2024 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725439936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gQVLtPniH2vSqBzxSwNJZS10K7mVOFLUlzmTaph06o=;
	b=o6jghW40e7NxWe+r/5ufjYWB0EyArQLTsDLkEjimsQpoxMs7ZrHLu2tFrBzlH3SE/vLF5d
	tnDBS5epwhzwX/E2hq6oGuPYi5ZrvXoOF3HkfohVPZKOLSpN4jrJZQCkhn2j7cxvr/52DP
	rBBNAdSOAeLIsIA1olc2I2fA1v4JneJ/5dTdAihY2nhHFzxKQFIY8C0+KhDkAh7KhkcG9m
	+yMrMTEvQlOzUaSqUoaNRrSuhc6bZEAqNCVa33UHaDQC7gtHk7VhqiFItyi7N08LRsCIIY
	Dma7a2qgvvlKh6X1vMiRzFQY/6FdSpHzrIgtHF3xJJrHmPIof1nXO5B1T+oPGQ==
Date: Wed, 4 Sep 2024 10:52:13 +0200
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
Subject: Re: [PATCH net-next v2 4/7] net: ethernet: fs_enet: drop unused
 phy_info and mii_if_info
Message-ID: <20240904105213.0756629d@fedora.home>
In-Reply-To: <a6eeb9e1-09f0-47a4-bf78-d59037398078@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
	<20240829161531.610874-5-maxime.chevallier@bootlin.com>
	<a6eeb9e1-09f0-47a4-bf78-d59037398078@lunn.ch>
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

On Fri, 30 Aug 2024 23:07:56 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Thu, Aug 29, 2024 at 06:15:27PM +0200, Maxime Chevallier wrote:
> > There's no user of the struct phy_info, the 'phy' field and the
> > mii_if_info in the fs_enet driver, probably dating back when phylib
> > wasn't as widely used.  Drop these from the driver code.  
> 
> There might be an include of linux/mii.h you can also drop?

Oh nice catch ! They are indeed no longer useful, I'll add that in V3.

Thanks,

Maxime

