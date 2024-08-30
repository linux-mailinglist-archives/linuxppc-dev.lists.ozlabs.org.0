Return-Path: <linuxppc-dev+bounces-843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B0966D1F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2024 01:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwZrh0ltJz30TK;
	Sat, 31 Aug 2024 09:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725052301;
	cv=none; b=RWZI0x73rMX8vtPSRD+qfWc4H6qGalomKYJ+ZbsaCs0Cwi3RwfafgFBSsU4m1+9f727ZwQJasPxEFDnB2p8+EAtFt3LTt/sUNmWyUWnJxgKF8fW5LQi8fqqPDEOKlffL9j1IQjLKvcau3WyMKSLx0cXz5+CRtLsbP12Zc1qyNHXDaZHQETZIbjeL05Zs5Jp4g9uELjmuKvq07teTESOkt0+am+cDD+gbusCxpkJt4Fb1CMt/0iiMI88RGSsG5ol8pYRuP4DcS76xw3Z0ZyWBwtIQqNbyw2BqnPYCGZipakv7ePL/XoYTZ6lQZEBLoAbWYuNAG7j7X+fHS2xZua+tRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725052301; c=relaxed/relaxed;
	bh=UVZGQRW9Ken7HNme42NE5TCtOSWgwWn4aMTFggNfm8o=;
	h=DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=m0+yYiFJOReIm5yAujxjRS+wPGsxv9ajMrqqHTssmJOkOgBCbK965is5q7+hWRMee2BW/EkHEEkXoe1pI1Y2L2aOo5AOhmhNk7DKyKUdS7nqWa+f2rlRH2F/g9XwaMHMJMpzYSu9+HECxexcQm42k+RggTnBE/SfQgKfsiHxjhGyMKrI2996pyTMKjCxWuhapkzAPzev992y7K/Wk6Mp8OC+0uygaza4dncilUC55ak9VuFwn8eFKm9pXtg99DFUVZKTvaUyrZhYCBfgVwYn30nEau7sul6dWh14TqeDA9HG0t9WuY9hTcV40RDdCqHZjfqMP9hvfsXlmxxu/hfMNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gmGMHDFE; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gmGMHDFE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwW6h6dkHz2yyb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 07:11:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UVZGQRW9Ken7HNme42NE5TCtOSWgwWn4aMTFggNfm8o=; b=gmGMHDFEQNAMv7GhbyEDmEOg66
	2VAQCZWXcEUO52EhEqYUoKTQ+iuLfst/vYC2qnhAQlw3DA6dWXV3vIgPodRHgSpmeCMaTyy1QYMQt
	LDKodTXriAX8VpKwPKvO/KaVyP0BFEbo3AS7EfrLRg9DnSpj3kgQuPZR9eSwxGcTF/ok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sk8f9-006AD4-C9; Fri, 30 Aug 2024 22:56:07 +0200
Date: Fri, 30 Aug 2024 22:56:07 +0200
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
Subject: Re: [PATCH net-next v2 1/7] net: ethernet: fs_enet: convert to SPDX
Message-ID: <65bccc31-4756-45ea-ae81-a0686c632229@lunn.ch>
References: <20240829161531.610874-1-maxime.chevallier@bootlin.com>
 <20240829161531.610874-2-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20240829161531.610874-2-maxime.chevallier@bootlin.com>

On Thu, Aug 29, 2024 at 06:15:24PM +0200, Maxime Chevallier wrote:
> The ENET driver has SPDX tags in the header files, but they were missing
> in the C files. Change the licence information to SPDX format.
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

