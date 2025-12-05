Return-Path: <linuxppc-dev+bounces-14658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB3CA8C94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 19:27:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNKbn5R9Hz2y8c;
	Sat, 06 Dec 2025 05:27:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764959237;
	cv=none; b=Vjj/S/nFKUZhdtAU9R8Ig3dKDzEhUkKhHvauIK13V2ktISapU7SRGsInuHp+0WnXN1CpDc0J/6beCcHQOXGWdosQbTzkl/mzigAuoIsf6WM8jJUuBP2B1XdMiTTP3B0ZCQB8pMJaJXFqr5z+Yy60r2vDGci2NNnGCxoEtAZfEiJTfXQeIhpYf3q+1iDfq1Aa5cxv+ziKP7GalhrbYpcViy2XHp0nClYw1E3V5zqx4zHC6qkVPe62m4rOp4FuyMAlNto/78Iy5ZWswXonp66RzgpHq5ZkV8VPGmK8UcDw7n0ZDKB8CLLm16xkwpgHz6kPla5zxp/ZH2fMsNY0VSfYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764959237; c=relaxed/relaxed;
	bh=MQ8dIiuQ1RvZuq3a+6+laYHtH9uSksOb5IgdNEId5a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP6Fk+i4lwsFduOmaiovKVnsJWZySjRWKEIHHzDo/lle4sXoD8S7SsWO79cCDnCz1lCIUPVsx/+iFp1IXDcJIBqvJSBmjMabmsbuOYmbQlt9N2gtcCF63iK4kYNvo9gvbz5/sjM7lfjPrPFFdoSqASNmNeRTEVxjPE6dFtIdRevMbrWJg03W3evgA7LHEth/Vwv3Vo9DSQyFjZ3R3Ig1JnvceXTKrK1YpLhTW2juohAuUD1I+zY4h3ced8306GLsGwRuFie/LMySaRMS/9LbXKpkX/VrG9OW+p5AGMunD+lWN6CNlU8nef2I+GFHPZ8I9fwFLorkjYkeipawIVZVcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UaczHTgE; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UaczHTgE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 2185 seconds by postgrey-1.37 at boromir; Sat, 06 Dec 2025 05:27:16 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNKbm4SZ1z2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 05:27:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MQ8dIiuQ1RvZuq3a+6+laYHtH9uSksOb5IgdNEId5a8=; b=UaczHTgEvBqI3zGutLf3vi8pOs
	7PRxwedzvPMC4H+Zl5aDoyIPFnmA3LBVi+mB7wKtWDxUUyidjoeXQ3n7SdCxX2HqZaAHIe62bUmOX
	qYQKxwbiCvK29+lIALcWUGlU3wYw3AQrhEQXL8zW5boPXRZgIfekXTQSp5xXQ6y0YO3U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vRZwx-00G7Pi-MM; Fri, 05 Dec 2025 18:50:35 +0100
Date: Fri, 5 Dec 2025 18:50:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH RFC] powerpc: switch two fixed phy links to full duplex
Message-ID: <5d302153-c7f6-48dc-95cc-0dc4f25045c6@lunn.ch>
References: <64533952-1299-4ae2-860d-b34b97a24d98@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64533952-1299-4ae2-860d-b34b97a24d98@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Dec 05, 2025 at 06:21:50PM +0100, Heiner Kallweit wrote:
> These two fixed links are the only ones in-kernel specifying half duplex.
> If these could be switched to full duplex, then half duplex handling
> could be removed from phylib fixed phy, phylink, swphy.
> 
> The SoC MAC's are capable of full duplex, fs_enet MAC driver is as well.
> Anything that would keep us from switching to full duplex?

What do we know about the device on the other end of the link? Maybe
that is what is limiting it to 10Half?

	Andrew

