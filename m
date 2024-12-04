Return-Path: <linuxppc-dev+bounces-3763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55B9E3106
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 02:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y31104qdhz30T2;
	Wed,  4 Dec 2024 12:59:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733277572;
	cv=none; b=S2iiARAhJjaZXvC7Tnxn1NYtBMfR5RjfVhDZZ/kAAa015Vaa91tKRHbBFORz5qcBIkd/udZN/4N9hlfBixzuzl3xDNXHCs54mLGE0MhdYVwAa1cackjre1Wjy7RF6OjMXM3bexW4fGXQQQAya7gvSSMQ3rNTg2hW0pYPAUNCxr8UXIBLvtRnOVSfolPnAOaxrlzl2UeDtPzgP2pDqT8sT8qXXiCU7ON5TqxvFc+U5j7C32gnfW/xpYA+iNmqw7mQkKkr43PWN7j3KNtQ89nmGeckNw4eG+oTDkBFTQ8leZ7fvinAhiq5JiWCTuKrmHUHG/3MRiF+kwbYr3Z6uABoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733277572; c=relaxed/relaxed;
	bh=p7XICfgHZc4blY4tthT+SlGoVQXR/wj9/bfgbTsdLZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADouEowRin3r+ZsER62mCyZ6SdYG5p7r4pr5+eSwl62Jo3oTIU7L0WmGOSFGwQOADJlT+XAl8GRGVa542GCvEpIqwXKCzHD7Jy+Neo8hAxEpSuWnOy2xMYZvDnsPI4xCqV/xTGk44rua75QlWeGyPOMVdp/iROo8zVgyw/filPWtIOC7bxcUpl/zANo2OPxCt+Wqy99vXqsgUoN63m7/bVgbLjmyzP+nQ7bdXcW8tLTwY4CIRaaGg+AJSv6e5x416I7n1J5sfdqbwZjBUqXl8pEQHfLgSivLqETcP0iohQh3wIzO5YG8dmH0BQP6U3QX+M1ohKrryh9qDD1hpXuMvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3/CNdVWO; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3/CNdVWO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y310z5bVGz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 12:59:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p7XICfgHZc4blY4tthT+SlGoVQXR/wj9/bfgbTsdLZ4=; b=3/CNdVWOu8G5hnNE12k/JqJKGV
	tP8eYD01gnFW9Wldi8/lJ/pRS+drZA1UmDy9UsYPvebfwct2xdVkTZV35h2vV62kNnsy78G00+wlf
	ikww15oNLSXSRdla4ckdXd2Hp6Xkddq3NC5h3+az6HTjfKtVEoNGxQc618mmifXLlhjM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIefd-00F9cF-Ut; Wed, 04 Dec 2024 02:59:17 +0100
Date: Wed, 4 Dec 2024 02:59:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Simon Horman <horms@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 05/10] net: freescale: ucc_geth: Use the
 correct type to store WoL opts
Message-ID: <364e20f3-855d-423e-aef8-ab7126155457@lunn.ch>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
 <20241203124323.155866-6-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241203124323.155866-6-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 01:43:16PM +0100, Maxime Chevallier wrote:
> The WoL opts are represented through a bitmask stored in a u32. As this
> mask is copied as-is in the driver, make sure we use the exact same type
> to store them internally.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

