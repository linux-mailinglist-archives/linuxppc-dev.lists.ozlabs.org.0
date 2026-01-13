Return-Path: <linuxppc-dev+bounces-15664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE0D1B245
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 21:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drKxR3f8qz2xl0;
	Wed, 14 Jan 2026 07:05:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.32.30.218
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768334747;
	cv=none; b=ZuEUZUwczkL3SsHo/zuffnLe8b1mcCc8Uel0Dpyvj0VrgURBTYwB3NaaCJdl0QKBMC3xSpa0LMESThgkglRqwTqrSnRe7dCky6EtxTFQN2PaSYZ4c+duixBQHYXXrIUL2ny9BYkUKgQMrgDuwyRuz9SeFomgXGxaZ3I6ISqimI4br0iuwF5zpgkmZR4qofMjVyn5pLTX4j5rGPLI0NA2jiUDeGZuxaEJgW4FkT1TVqWQp3CghHuvtAb9oL8F8Ud0JEsylyuDj+zh0NnQwoRZCBVCHD8UZIDn7eIgKaltLAkt50jaWyCkhqyVHV9BJetJ1gEabjMcGcxtFAJDP4w0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768334747; c=relaxed/relaxed;
	bh=R4xqXbi0Q6/KYvVejxl+JdEUTYv8X6JqtJIUMrlC0/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXSfuCBgT9RoArODV7X98hpZ8djcgO0dXbUKtPuiI7lUWHOMrUgIEOXmfetr5BYpqIRmD7U3Ob7XmPc1pWgr8TCzwmozwMEHgzjpTSVBRVIuRar01sMtfsnn2zn6grQBLroNmbV1VoL0ssXqv2gEIYV7ioOVB/xPINiJepjQf3sbOVJRlYypNBUdTpi06ygE/9Ym8BKPHS5AM+CCs2ONqkalbR6JoCOSvO7UtQxyd9k8GOXFBqo9wVgk5MLJZAj6260kGqJVz1AIXdMLsFSLMcefqRCihPV3c0oGj9TVOFBPi5WxBEnU7CiTf5RZM+CqOdPtVln2GBoSE4whHcFu6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=vaXTZFop; dkim-atps=neutral; spf=none (client-ip=78.32.30.218; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=vaXTZFop;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=78.32.30.218; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drKxQ56H8z2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 07:05:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R4xqXbi0Q6/KYvVejxl+JdEUTYv8X6JqtJIUMrlC0/k=; b=vaXTZFopVYFJ+1D12g7VeYnimX
	j2qvYhj1URhpdStAcJsG1wgRMWXqo5YWlcH1/1AdiZbJW1VVriiayZ813j1Uu0nEVHxm8X2f1Gws8
	f8Gf0Wjih1q6PpZ52poe6txIDIcMjI7F7gPx8rhptWQJnQHAuhFZoC8spSb/Yf6jeQcJHQBadGBbf
	XItxE1KBBgPM75frlDd8yk/HWi5CVtW9RO6ZT8xesIHgquzWo58y5XUAfcD3c7gygm+WP/mYbEAkh
	E7EWr0QA4ZnYNMW7zdyAPVvuzz2zM7oTcU+qmqWpFePAdC72RhKLUGRx6Fw/o1PIfH7nl9qIzm9QO
	0BhT84fQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39018)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vfkbm-000000007nt-0s0Q;
	Tue, 13 Jan 2026 20:03:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vfkbg-000000000wo-1dCM;
	Tue, 13 Jan 2026 20:03:12 +0000
Date: Tue, 13 Jan 2026 20:03:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Dan Carpenter <dan.carpenter@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net] net: freescale: ucc_geth: Return early when TBI
 found can't be found
Message-ID: <aWalAMC2FWKlXK0E@shell.armlinux.org.uk>
References: <20260113074316.145077-1-maxime.chevallier@bootlin.com>
 <d89cb3a7-3a55-4bdf-805a-b3386572b220@bootlin.com>
 <aWaSnRbINHoAerGo@shell.armlinux.org.uk>
 <6b8aebe7-495e-40e5-a99d-57f8f7b2e683@bootlin.com>
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
In-Reply-To: <6b8aebe7-495e-40e5-a99d-57f8f7b2e683@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 08:24:49PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> > Traditionally, we've represented the SerDes using drivers/phy rather
> > than the drivers/net/phy infrastructure, mainly because implementations
> > hvaen't provided anything like an 802.3 PHY register set, but moreover
> > because the SerDes tends to be generic across ethernet, PCIe, USB, SATA
> > etc (basically, anything that is a high speed balanced pair serial
> > communication) and thus the "struct phy" from drivers/phy can be used
> > by any of these subsystems.
> > 
> 
> True, and I completely agree with that. The reason I didn't touch that
> when porting to phylink is that the device I'm using, that has a
> Motorola/Freescale/NXP MPC832x, doesn't have that TBI/RTBI block, so I
> can't test that at all should we move to a more modern SerDes driver
> (modern w.r.t when this driver was written) :(

Over the last few days, I've been adding "generic" stmmac SerDes
support (which basically means not in the platform glue) to replace
the qcom-ethqos stuff, and while doing so, the thought did cross my
mind whether I should be adding that to phylink rather than stmmac.

stmmac's "I can't reset without all the clocks running" makes it
rather special though, but we already have phylink_rx_clk_stop_block()
to guarantee that the PHY itself won't stop its receive clock when
entering LPI, so phylink already knows when the clock is required
(although with a slight abuse of the names of these functions.)

Given that the two qcom-ethqos patches I sent last night failed to
build (oops) I may change the patch order... it does need the stmmac
PCS work to be merged first though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

