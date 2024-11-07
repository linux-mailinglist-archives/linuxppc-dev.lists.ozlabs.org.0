Return-Path: <linuxppc-dev+bounces-3005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146DB9C0D3F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkqPQ047xz3blH;
	Fri,  8 Nov 2024 04:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731001865;
	cv=none; b=KlOdi46imyoK4fgFUAYYUpd9kQtMDJrt3S/8M0/H52+FjgYf0Zz3raiud5dy01OoBcVpWeuE8d3p6XpM04OFL3G0p5wDuZO/j6B0/sDK4sghCv2tIR0atCyyORnFr6hY9A/Upjc5KPt45rhn8lc8OWwiI5k0lkX0NJzXDsyNjiKCTBSfHfwQ58G3gpCq5NWvsLr1s1RchhfFpXns4Jivw5sAxEg3iC9/S3xgEebuUzfvRJ4+pZ2weq3CIOd9C7nXhz/zYplTQCKkC6u92w/io1kDtc0QXzOcQDznSVYGPMRNqeHWWlCSRvDHV3/JLW9zN3ARAP5PhiNtYNfN/BJVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731001865; c=relaxed/relaxed;
	bh=kEaAjPqxlbUokOSw8+r3h55hCl/NpE/YAzSPYHUSRiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI2WDb6L0j3eyuT31NnT1D1wBfAGinxf3//EAYHYDFrVYhB2wkMYkpRs2Pf9IeEg2wE4kuQJ7QBAUBD0oGbEwaBySdikG6baP5V+qFe8l0d40JtJPXqpKI6CBc5KQMiNct36NY3SU8REQ31ANb15WSMgoQ9vw9LmYVVA+IRZ40qDUjHHIwsdoYJfWADwaMpgjrsyW2XESYeyAQ8Zu7BEC2x6+GbQTS+aoFCzXs56uXSeFuQJSFV/uyVuGpdnB0LDD2QuRAoDWoJAh1vf/NSZ5JOoVql+FGrs2m+0FKMOLFUSli4keH2vdUr0yFmTCtvEKV02J7Rpz9G2VUX+XAcSNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kQaYL3Pj; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kQaYL3Pj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqPP0Hddz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:51:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kEaAjPqxlbUokOSw8+r3h55hCl/NpE/YAzSPYHUSRiQ=; b=kQaYL3PjHeX16/mJR/vEOUQBDk
	DTH3LISANAp9xaYvaj+2MBtXMYhBoqrGpjv7YIyTFppfFsiTybVmD4E0jGyH9YZJ/24IRo4Afdr+k
	kqRpCepI9mBOLuPD/OuKI4HkOfMq+3ohcO+q38TeyyxLNXUXaURhD4AjrS+cQ6g9bF3o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t96ei-00CUXE-9H; Thu, 07 Nov 2024 18:50:52 +0100
Date: Thu, 7 Nov 2024 18:50:52 +0100
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
Subject: Re: [PATCH net-next 5/7] net: freescale: ucc_geth: Simplify frame
 length check
Message-ID: <479444a6-8ee4-47b8-82fc-947bea9087cf@lunn.ch>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
 <20241107170255.1058124-6-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241107170255.1058124-6-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 06:02:52PM +0100, Maxime Chevallier wrote:
> The frame length check is configured when the phy interface is setup.
> However, it's configured according to an internal flag that is always
> false. So, just make so that we disable the relevant bit in the MACCFG2
> register upon accessing it for other MAC configuration operations.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

