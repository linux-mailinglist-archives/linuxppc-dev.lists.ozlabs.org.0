Return-Path: <linuxppc-dev+bounces-842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBE966D1A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZrB3Z1Lz302T;
	Sat, 31 Aug 2024 09:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725052188;
	cv=none; b=VY0PyJXF0ZIQshCQaKP7aQFG7h3wkTa78lc/1ljRNUx6kvEQYP1rBMxLJcWMhZ2S6zdmsHjW+ayLWLqZfIkJiQb8hpQQssresgqiqVGQ2PIm1dbWBuZF43fVOHyWdkUGMFvI/SUTGh7dST0+RrWEWgX6OHzjzE3Y1EDJvqLJWlwm+W0OKl9wcxluAiVGcY/9Zu1OmejG/p/dj1El9wjx6SLuNcYrNaL/zksy5jA10i42DEdCOAAABo+y49qzrq7TAn4rxMWqAOcpQ1xirRaG/3Cxq6SbwEz3RSfKjNwnbUBDcIPLxXaDiGbkRShncCmfSUyAG0Hl+P7x9r1toRjKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725052188; c=relaxed/relaxed;
	bh=EhSusv/Ri0/6QWxoLI/hMvVgiEuQpxYNq9k+BHb3qoA=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=FsPKmbaOeLmhFXfqECJisu6iq4j7iUYL0Bi7qVMK4wcDTqeqliVsZt0j0EHhzHLNDdUqpxBpunsjDWyOA0/EU78DHnSaSFiJ37Qn4wFOFyph6ZWctFxTA00ST6aSqMhsz6IAPPBwrNgwSjxLAgDTEB9UJqBZrh90Bm0/N+UzlGKBu33sBOZ93uGTdjLYTz8OoK36815INTN+scfifpQhSrPGaykG/Bo5Wx+Okx1Velkfqegm5Zzrx+wG53R1494aBsB1pS1ZMeJQs8lVdM4TYF+2jOiRBuVSkTQ56+UBt5OUPwr95bpCVer4Nie9+HR9N35zmyhDgPoBkIhvNuFmDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Wpzhloxb; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Wpzhloxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwW4X2bH7z2yyb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:09:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EhSusv/Ri0/6QWxoLI/hMvVgiEuQpxYNq9k+BHb3qoA=; b=WpzhloxbfOXT+z/GYNIFyMNFIM
	ZxNEenSNW7FDURBlZxnL9RWJRfyKBKJ6Ou2Z3qmKX9lsMZ5cBn/QbxcvJJ7jJjDJmjxnfWC7U+bS8
	o9p3JhA9SXUVk8FixQln/CNlA/xdfVXTVFsHEL5IhpwKoSrpAJf20OHHby7C4h2S7H2o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8sC-006AKQ-Kc; Fri, 30 Aug 2024 23:09:36 +0200
Date: Fri, 30 Aug 2024 23:09:36 +0200
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
Subject: Re: [PATCH net-next v2 6/7] net: ethernet: fs_enet: simplify clock
 handling with devm accessors
Message-ID: <ab8fb701-c91b-4e66-8dac-fe74e3ee0ca1@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-7-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240829161531.610874-7-maxime.chevallier@bootlin.com>

On Thu, Aug 29, 2024 at 06:15:29PM +0200, Maxime Chevallier wrote:
> devm_clock_get_enabled() can be used to simplify clock handling for the
> PER register clock.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

