Return-Path: <linuxppc-dev+bounces-3001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA69C0D01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkq4j6XtVz3bpG;
	Fri,  8 Nov 2024 04:36:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731000997;
	cv=none; b=iklWVSHo35iIA9gkldvQBM1h7s2wzouvtC8iYAVRtseyOuyzHN/14JJwAfqO/OzP0tCajw7oNS4v/dCQf4LDC5JIBYeMxVzKWljgUlFxPWMkLA0AmHnPQMb4QeCwF9inIqJ7NtRLYQ+9xPdxSF/HeV/hJb0H99Kn8u/J+80L4+Hx7+b951cdemSLSV6qWTFObYh1/mmTDmeaaJjlRmBF7BHsskW6db77pyw47ctnnfujTC/94GzaOHohB8wrdCC51YmvNIu84W9pcyb3w25Fo+p1ZoAguNlxJJk+RKeZ7mkV3PbtC6QdAHMKf0GAIelBai8rHWiuaw/Vep+Gh1ZxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731000997; c=relaxed/relaxed;
	bh=T6bHPI18tVLVeYJB4q1sHZ135CJsdmYKJyxnRPGYcWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfPecpSP3CcKlGgryT9UxJYTGNWImjdiH0Y1oLPRsUOGC5vSnxsu/T7TAmRdqAzNmzXom4djZWw6XA8yCWUgV+EPruZ7rtegSi/PHIQRJYbljSSnEkRs7HFrbNYUjkMgGrgHX/DDP0w0gHOF+5CqdryQphp3K+N80CIZB1ttmykJtQOYcHzhnPS4ky3OZDHuH7AMjiZYuxa4kiDz2j67wSeaQzOTkxamsTPl9Ai7gUTGbjLJQ/ZWLjlHtf4wnmrfbRtpoMS4pCZTLRpfVbWcMGY2FLMOlLbowI9Aph9ryncqQCtjyzgA+3De+Bhd3WinwfQKGTISVMDSFKIFNLYpMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aKJgnjX+; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=aKJgnjX+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 137 seconds by postgrey-1.37 at boromir; Fri, 08 Nov 2024 04:36:36 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkq4h5qfdz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:36:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=T6bHPI18tVLVeYJB4q1sHZ135CJsdmYKJyxnRPGYcWo=; b=aKJgnjX+vMQj6AQVYuPKmg/Wfk
	IuuX+Akhp7STCWM8QdrpzbU+LuTaOjxWVlKB36jv1f8ZCPDdnBPwzwOh+Ga2uOT4rik2oiFUwt3ft
	LqBkLi2je+8sUApsu0e4+IKebfoLV5EmlDu2KYU9hmFBvZj5pHHykpSIeKgM6DJVxMfg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t96Qk-00CUQf-SP; Thu, 07 Nov 2024 18:36:26 +0100
Date: Thu, 7 Nov 2024 18:36:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 2/7] net: freescale: ucc_geth: split adjust_link
 for phylink conversion
Message-ID: <9dcbc2ce-3d81-49ae-a6d6-2fc96df422c8@lunn.ch>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
 <20241107170255.1058124-3-maxime.chevallier@bootlin.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107170255.1058124-3-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 06:02:49PM +0100, Maxime Chevallier wrote:
> Preparing the phylink conversion, split the adjust_link callbaclk, by
> clearly separating the mac configuration, link_up and link_down phases.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

