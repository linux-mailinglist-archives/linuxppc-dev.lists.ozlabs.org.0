Return-Path: <linuxppc-dev+bounces-695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B7962964
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 15:55:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv5XB5dM2z2yY1;
	Wed, 28 Aug 2024 23:55:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724853322;
	cv=none; b=Ig6kvcdrBaPBQez1pzTi1IqYeSI1BD1LfQqx/pCh3v8zbfdNDjkVntiwb0wPhF3MgYVBtZ0xYyG14/tgNYWG+OndMWpwKfWQADHP9NMBkz+LNkaCbbGFqVEOSKFdry7TPY4lHBsCYjezro7BJvQOaqCQ/5Tl+mv/WHFx7msN7uYX/LvmtRlQVZa059rCbFO/Ds6JXqeKnwRIMPDD0jsYRyoV+jPetgubMXnRASghrUuaLn7Ws2eRG9pfRcZxkPIBrled01IzFAm6g7jOcW1WzOGWhFPtr6TOwadMyQPxMyTP9+vy/KTfqVTAo4w0TMTeVJ5v3wJTv0KpQ9Q8BPxQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724853322; c=relaxed/relaxed;
	bh=NmywIJ2PG1CPZd5ewQ7jLHlE1VCegbqWinVyn5dLAu8=;
	h=DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Sender; b=APVLnXRRX8l1Sd97vfvwG620Kgg0QOTXpzDFbhoLXhhHqCtsbayalIw56djAJPfyUBrJjeQ8DbVbHR+/ix5SkpO5FJQCzH+8osN1ovBQKoSG819uBQkKF7quJJdaM+P3z3J8gebzd7A/96XHwfAPaSpwTh/a0j2//QhFMEiVbPIxVxg0LJtKyKvivW1bIGLnENbzCzjoZkogUNkWPY+Bc+9u6qkPxKRCLOhd+u2Asgg0IEbFJAw23uS12DUQ24jX5fp5XNpvamW5bDto4WbhN+Fksr7Q/hRat9WiPvUWBEVPllh+wc2epON9c72t8Kcr4nyiSLrTgAE6HDA4yNKDFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=U6z/ZYRl; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=U6z/ZYRl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv5X949Frz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 23:55:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NmywIJ2PG1CPZd5ewQ7jLHlE1VCegbqWinVyn5dLAu8=; b=U6z/ZYRlyPqQqGqmoGpOCepykq
	elNuTl4bmtGU55+ZYHVomWHiov1bKd64JARYpSjblmxu0brE290XrAzHYJ3aWx61Tg8dHTasTxyoV
	HiUKuMslCsUZUh+Ff1rxClPj2mzXm+vzZZh0EH5kPftuyCr1TLsmRE0CEnhyWpFaeqA+3jV8h15Fs
	6F6efehYJgJpniES8SI99TXslRAOBWzAR5HBPX0JC4n8LfILUGRzWmkcwWkGvZn0Tsj7ddQOxfmYH
	CKKbCXp4y/fQSaiR1EdhNM79t8izWCIwgRQebxvfwnb/+rifS2iDSODAId75ddOh8XzKx4+Q044Jy
	ussCYiDg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42986)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sjJ8Z-0000Ha-2i;
	Wed, 28 Aug 2024 14:55:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sjJ8T-0004Ww-2u;
	Wed, 28 Aug 2024 14:54:57 +0100
Date: Wed, 28 Aug 2024 14:54:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 6/6] net: ethernet: fs_enet: phylink conversion
Message-ID: <Zs8sMUxX7mnWZQnA@shell.armlinux.org.uk>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
 <20240828095103.132625-7-maxime.chevallier@bootlin.com>
 <Zs7+J5JWpfvSQ8/T@shell.armlinux.org.uk>
 <20240828134413.3da6f336@device-28.home>
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
In-Reply-To: <20240828134413.3da6f336@device-28.home>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Aug 28, 2024 at 01:44:13PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Wed, 28 Aug 2024 11:38:31 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Wed, Aug 28, 2024 at 11:51:02AM +0200, Maxime Chevallier wrote:
> > > +static int fs_eth_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
> > > +{
> > > +	struct fs_enet_private *fep = netdev_priv(dev);
> > > +
> > > +	if (!netif_running(dev))
> > > +		return -EINVAL;  
> > 
> > Why do you need this check?
> > 
> 
> I included it as the original ioctl was phy_do_ioctl_running(), which
> includes that check.
> 
> Is this check irrelevant with phylink ? I could only find macb and
> xilinx_axienet that do the same check in their ioctl.
> 
> I can't tell you why that check is there in the first place in that
> driver, a quick grep search leads back from a major driver rework in
> 2011, at which point the check was already there...

int phylink_mii_ioctl(struct phylink *pl, struct ifreq *ifr, int cmd)
{
	if (pl->phydev) {
		... do PHY based access / pass on to phylib ...
	} else {
		... for reads:
		...  return emulated fixed-phy state if in fixed mode
		...  return emulated inband state if in inband mode
		... for writes:
		...  ignore writes in fixed and inband modes
		... otherwise return -EOPNOTSUPP
	}
}

So, if a driver decides to connect the PHY during probe, the PHY will
always be accessible.

If a driver decides to connect the PHY during .ndo_open, the PHY will
only be accessible while the netdev is open, otherwise -EOPNOTSUPP
will be returned.

What do ethernet drivers return when they're not open or not having a
PHY? The answer is pretty random error codes.

drivers/net/ethernet/renesas/ravb_main.c-       if (!netif_running(ndev))
drivers/net/ethernet/renesas/ravb_main.c-               return -EINVAL;
drivers/net/ethernet/renesas/ravb_main.c-
drivers/net/ethernet/renesas/ravb_main.c-       if (!phydev)
drivers/net/ethernet/renesas/ravb_main.c-               return -ENODEV;
...
drivers/net/ethernet/renesas/ravb_main.c:       return phy_mii_ioctl(phydev, req, cmd);

drivers/net/ethernet/renesas/rswitch.c- if (!netif_running(ndev))
drivers/net/ethernet/renesas/rswitch.c-         return -EINVAL;

drivers/net/ethernet/8390/ax88796.c-    if (!netif_running(dev))
drivers/net/ethernet/8390/ax88796.c-            return -EINVAL;
drivers/net/ethernet/8390/ax88796.c-
drivers/net/ethernet/8390/ax88796.c-    if (!phy_dev)
drivers/net/ethernet/8390/ax88796.c-            return -ENODEV;

drivers/net/ethernet/marvell/mv643xx_eth.c-     if (!dev->phydev)
drivers/net/ethernet/marvell/mv643xx_eth.c-             return -ENOTSUPP;

drivers/net/ethernet/xilinx/xilinx_emaclite.c-  if (!dev->phydev || !netif_running(dev))
drivers/net/ethernet/xilinx/xilinx_emaclite.c-          return -EINVAL;

drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c-     if (!(netif_running(netdev)))
drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c-             return -EINVAL;

drivers/net/ethernet/actions/owl-emac.c-        if (!netif_running(netdev))
drivers/net/ethernet/actions/owl-emac.c-                return -EINVAL;

drivers/net/ethernet/engleder/tsnep_main.c-     if (!netif_running(netdev))
drivers/net/ethernet/engleder/tsnep_main.c-             return -EINVAL;

drivers/net/ethernet/ti/davinci_emac.c- if (!(netif_running(ndev)))
drivers/net/ethernet/ti/davinci_emac.c-         return -EINVAL;
drivers/net/ethernet/ti/davinci_emac.c- if (ndev->phydev)
drivers/net/ethernet/ti/davinci_emac.c:         return phy_mii_ioctl(ndev->phydev, ifrq, cmd);
drivers/net/ethernet/ti/davinci_emac.c- else
drivers/net/ethernet/ti/davinci_emac.c-         return -EOPNOTSUPP;

drivers/net/ethernet/ti/netcp_ethss.c-  if (phy)
drivers/net/ethernet/ti/netcp_ethss.c:          return phy_mii_ioctl(phy, req, cmd);
drivers/net/ethernet/ti/netcp_ethss.c-
drivers/net/ethernet/ti/netcp_ethss.c-  return -EOPNOTSUPP;

drivers/net/ethernet/ti/cpsw_priv.c-    if (phy)
drivers/net/ethernet/ti/cpsw_priv.c:            return phy_mii_ioctl(phy, req, cmd);
drivers/net/ethernet/ti/cpsw_priv.c-
drivers/net/ethernet/ti/cpsw_priv.c-    return -EOPNOTSUPP;

drivers/net/ethernet/xscale/ixp4xx_eth.c-       if (!netif_running(dev))
drivers/net/ethernet/xscale/ixp4xx_eth.c-               return -EINVAL;

drivers/net/ethernet/freescale/gianfar.c-       if (!netif_running(dev))
drivers/net/ethernet/freescale/gianfar.c-               return -EINVAL;
...
drivers/net/ethernet/freescale/gianfar.c-       if (!phydev)
drivers/net/ethernet/freescale/gianfar.c-               return -ENODEV;
drivers/net/ethernet/freescale/gianfar.c-
drivers/net/ethernet/freescale/gianfar.c:       return phy_mii_ioctl(phydev, rq, cmd);

drivers/net/ethernet/freescale/ucc_geth.c-      if (!netif_running(dev))
drivers/net/ethernet/freescale/ucc_geth.c-              return -EINVAL;
drivers/net/ethernet/freescale/ucc_geth.c-
drivers/net/ethernet/freescale/ucc_geth.c-      if (!ugeth->phydev)
drivers/net/ethernet/freescale/ucc_geth.c-              return -ENODEV;

drivers/net/ethernet/mediatek/mtk_star_emac.c-  if (!netif_running(ndev))
drivers/net/ethernet/mediatek/mtk_star_emac.c-          return -EINVAL;

drivers/net/ethernet/microchip/lan743x_main.c-  if (!netif_running(netdev))
drivers/net/ethernet/microchip/lan743x_main.c-          return -EINVAL;

drivers/net/ethernet/ethoc.c-   if (!netif_running(dev))
drivers/net/ethernet/ethoc.c-           return -EINVAL;

drivers/net/ethernet/broadcom/b44.c-    int err = -EINVAL;
drivers/net/ethernet/broadcom/b44.c-
drivers/net/ethernet/broadcom/b44.c-    if (!netif_running(dev))
drivers/net/ethernet/broadcom/b44.c-            goto out;

drivers/net/ethernet/broadcom/sb1250-mac.c-     if (!netif_running(dev) || !sc->phy_dev)
drivers/net/ethernet/broadcom/sb1250-mac.c-             return -EINVAL;

drivers/net/usb/smsc95xx.c-     if (!netif_running(netdev))
drivers/net/usb/smsc95xx.c-             return -EINVAL;

Of 28 drivers that call phy_mii_ioctl():
 - 17 drivers return EINVAL if !netif_running().
 - 11 drivers do not check netif_running().
and if there's no phydev:
 - 4 drivers return ENODEV
 - 3 drivers return EOPNOTSUPP (plus all drivers converted to phylink)
 - 2 drivers return EINVAL
 - 1 driver returns ENOTSUPP

Phylib itself doesn't want NULL passed to phy_mii_ioctl(), so its up to
the driver to trap this if its calling phy_mii_ioctl(). However, phylib
also provides phy_do_ioctl() for hooking directly into .ndo_eth_ioctl,
which is:

int phy_do_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
{
        if (!dev->phydev)
                return -ENODEV;

        return phy_mii_ioctl(dev->phydev, ifr, cmd);
}

then there's (as you point out) phy_do_ioctl_running(), which is:

int phy_do_ioctl_running(struct net_device *dev, struct ifreq *ifr, int cmd)
{
        if (!netif_running(dev))
                return -ENODEV;

        return phy_do_ioctl(dev, ifr, cmd);
}

and this returns ENODEV if the netif isn't running, not EINVAL which
the majority of net drivers that manually check are doing. Maybe phylib
has the error code wrong?

In any case, I think it's pretty clear that there's no single "right"
error code for these cases, everyone just puts up on a piece of paper
with a donkey the names of various error codes, and while blindfolded
sticks a pin in to find the "right" error code to use! So, I don't see
any point in debating what is the "One True Right Error Code" for these
conditions.

Now, the question is... why do drivers do this netif_running() check?
Is it because "other drivers do" or is it because there's a valid
reason. There's no way to know, no one ever documents why the check
is there - and based on your response, it's "because other drivers do".

Without looking at the history, I wouldn't make any assumption about
using phy_do_ioctl_running() - that could be the result of a drive-by
cleanup patch converting code to use that helper.

At this point... this email has eaten up a substantial amount of time,
and I can't spend anymore time in front of the screen today so that's
the end of my contributions for today. Sorry.

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

