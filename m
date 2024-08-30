Return-Path: <linuxppc-dev+bounces-840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2E966D16
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZqq38YFz30RK;
	Sat, 31 Aug 2024 09:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725052088;
	cv=none; b=UkOPf8l/t4KzXeuAShdLCRd/fnCeL2DWR3Vv7HVIxC+L4oqEDPkIvUIr6Qwn5r4XYtsh6C38TwzVXCgEcHBqdPoJ91XEpMXrujvoKSVxr1HAVcrzjC3pzo6F/m/d3D+zSKTZdOhArZu5XQg+hEw4LK271bdf6UKotZt4HRQcXKVbUvaEV3O4f7aakBziE+KsC38A9bimjAadXZE5zU+4lE1ho1OZ0JDgYem4Mx6FS3bZMx0biOXZ0mMDXIkGWMJ+CAg9yU1BvIbRn8hnyPZhH+TM5XOj4umF0c9VuE/V7h8mhyMhqvOmSfzM4dy8pEtsH331kqvkd0yZiU6LP0YAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725052088; c=relaxed/relaxed;
	bh=nlSRRJPy5Y/nvSGgNo8LGfd03y58qST4jCBIfpLyAlM=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=jHWwq4jX0yy8rw0pI1HReO0q7iFJuDzt78yVdFUQDQUQemMpYOx58nw8CruJlUMxA8svuhYPwXyc+2F6QBy3vLCUTwlR9SZNrRTYnJ9qxO/BNUZyl1R/HMa/8cZCKo1hiIsptT1ioBfCTijB9FcNPZw9NFuAWc4A3woMFH0JXSRRsllCNXD14MDBV/F1dg3XshyZrXdmfTaLVeMi++5qhsIojDUkK7dbOdxMiainNza7LXDVHpUlzx0HBBZ33iJBVc8Z8JTaT/OiDuP1xG21mSuaBzcViChbNYBcTJZ78iFeIuD2PgLLXhM4WudovuXFZJX6Es2IXSDqYukXVWxvig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cZbzZPrA; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cZbzZPrA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwW2c3y0Xz30B3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:08:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nlSRRJPy5Y/nvSGgNo8LGfd03y58qST4jCBIfpLyAlM=; b=cZbzZPrA83+6VP8QY1GzOWqCjM
	eJ2hkcIFpfpn9E1GKfZnCBXtpGd7Z9jE5QlZdp/mkwfo6g2/pEMYY0ocTYa4lZkAB7K7wgeYi6szz
	vV3hyPIHlCcRUS7zXZJaJhD/kxp9fYjFRrC/UeEvfm3Zo9NVzQexOLNAxwelEjNAmKlg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8qa-006AIn-MK; Fri, 30 Aug 2024 23:07:56 +0200
Date: Fri, 30 Aug 2024 23:07:56 +0200
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
Subject: Re: [PATCH net-next v2 4/7] net: ethernet: fs_enet: drop unused
 phy_info and mii_if_info
Message-ID: <a6eeb9e1-09f0-47a4-bf78-d59037398078@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-5-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240829161531.610874-5-maxime.chevallier@bootlin.com>

On Thu, Aug 29, 2024 at 06:15:27PM +0200, Maxime Chevallier wrote:
> There's no user of the struct phy_info, the 'phy' field and the
> mii_if_info in the fs_enet driver, probably dating back when phylib
> wasn't as widely used.  Drop these from the driver code.

There might be an include of linux/mii.h you can also drop?

	Andrew      	   

