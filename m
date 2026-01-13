Return-Path: <linuxppc-dev+bounces-15660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB46D1AE23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 19:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drJC5613Vz2xWP;
	Wed, 14 Jan 2026 05:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.32.30.218
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768330049;
	cv=none; b=ox3S+1Ub0FBZeMtAHst9XXqMxr1LO3I6yT6sYk2kxr2hEGMBP1boz1n24+wLjG52FfKsQiJHTAaU/1FT5wqiLa6hfTd3kZYxDheM44i7tM2XBn+uxQy57y7oBcHUPt3yzuKu+yGB5ZgVJai3VxjEaBKUL5jhYt/extFNPUwXRx7CxC+XteI1l/9uOFzx1OWz25McrTKMPHZLZcejnK/qlB6W7yHZ4yZ7SgNv9bp+yK2FkQyFw7Mhd069E0tY8X1OBPOC25ABHVTRYVjSnSCU49EQrzhEem6kXR0Q0UdrZLGsIXlI26KpJsKvKfDbscCJilYZUDwdKKxMyDoy8jekfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768330049; c=relaxed/relaxed;
	bh=jKtoDk43UnDtrx3CwO7HNH0Si8rMrFbLT6eAxKpAHcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADeyPo0JEZH7EaRaRHHGPe3kwhJ6FOLGxHWdVqToehEJeCHnQ5EP7GIEHEmr0Wnz4CcOf5mXbHazQ1R2SgGOb9FFhj6SZi7S7PQetBR7M0XQQe8nLAT1cjM69j2t7IDtuQxZ9NafkoVsfgKFhQ76Tokn6ieJ8Zk0LV5JCxjb5PKrMXlMdUH2dTPxyTtEbXmX8VakolihH3hFXvw7VXZB9zKCDgvheWt/WVVFC8RYvjBPcIHqEEpN7l89OM1bbjoUElKxhHfvN8kaNMhxmR0mzrvUWCtI3B/XQ72m35t6h4DH19SR6g6NgZHFQq450PbQm7jHlGvkvzk7ijaTnj7vXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=x5L4mwpy; dkim-atps=neutral; spf=none (client-ip=78.32.30.218; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=x5L4mwpy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=78.32.30.218; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drJC22NG9z2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 05:47:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jKtoDk43UnDtrx3CwO7HNH0Si8rMrFbLT6eAxKpAHcA=; b=x5L4mwpyvVpXTleXSTA4E7TB3x
	PqA0EFm3g+ADDRa9RRrchtOtp6ieun8dXwnrsSCngYksIOzLTsbduJGHO93EJ5sOmTiopDikrI2W1
	Q8ax2P98YDpsczL0Zc0iK7HY9RCHuKVTZVtqdNu73ghhxJVok54d0lPGUxUjqkfTn1U6uJVhV0fZz
	m+jTOB9IGzXsFfAtxqO7S7Y9km8DXM5EvpxKlPFYsnxmZdRCk91uYE3SLfMJZDZHjfWS2hwp2QEX9
	NihTgk+QmcNcL9S75eoUCpaLW0+DpTXskcwjiqgJh+s8Bnb6Kvtoc9KXPZiORwxY6qyROiEx6dYal
	5yterFBA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50244)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vfjNs-000000007ks-3HYJ;
	Tue, 13 Jan 2026 18:44:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vfjNl-000000000u1-2HNB;
	Tue, 13 Jan 2026 18:44:45 +0000
Date: Tue, 13 Jan 2026 18:44:45 +0000
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
Message-ID: <aWaSnRbINHoAerGo@shell.armlinux.org.uk>
References: <20260113074316.145077-1-maxime.chevallier@bootlin.com>
 <d89cb3a7-3a55-4bdf-805a-b3386572b220@bootlin.com>
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
In-Reply-To: <d89cb3a7-3a55-4bdf-805a-b3386572b220@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 09:16:29AM +0100, Maxime Chevallier wrote:
> Hi,
> 
> On 13/01/2026 08:43, Maxime Chevallier wrote:
> > In ucc_geth's .mac_config(), we configure the TBI block represented by a
> > struct phy_device that we get from firmware.
> > 
> > While porting to phylink, a check was missed to make sure we don't try
> > to access the TBI PHY if we can't get it. Let's add it and return early
> > in case of error
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202601130843.rFGNXA5a-lkp@intel.com/
> > Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Heh that's what I get from sending patches while having mild fever, the
> patch title is all wrong and should be :
> 
> net: freescale: ucc_geth: Return early when TBI PHY can't be found
> 
> I'll wait for the 24h cooldown, grab some honey + milk and resend after :)

A question - based on dwmac:

When implementing dwmac to support 1000base-X, the dwmac doesn't
implement the _full_ 1000base-X, but only up to the PCS. The PCS
provides a TBI interface to the SerDes PHY provided by the SoC
designer which acts as the PMA layer.

The talk here of TBI makes me wonder whether the same thing is going
on with ucc_geth. Is the "TBI PHY" in fact the SerDes ?

Traditionally, we've represented the SerDes using drivers/phy rather
than the drivers/net/phy infrastructure, mainly because implementations
hvaen't provided anything like an 802.3 PHY register set, but moreover
because the SerDes tends to be generic across ethernet, PCIe, USB, SATA
etc (basically, anything that is a high speed balanced pair serial
communication) and thus the "struct phy" from drivers/phy can be used
by any of these subsystems.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

