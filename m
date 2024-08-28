Return-Path: <linuxppc-dev+bounces-678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA459624DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:26:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0td6WYXz2yl1;
	Wed, 28 Aug 2024 20:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724839986;
	cv=none; b=O5rzNL8m66d2ECcs/r2LsAvEVo+NqzrGCGt22KY06ul6Z0x4xwJOczoFApgKDf3KdWyrgXMor5NvklaPAYuTz3PmrJ1YgWKqsY+mgZ2Etk7qXY24TGvkXEdyj4zHpRc+AU1mdRyT0m+UIpXIjy1DD5WJqBEKS42Migz/9k0q5iWa4GeA72K3/0lmjG070WoSNIRGn+Fqlj4nW82weYUXPu4X2GUnRcY/kZPdMs/kNqRzWJ/nDuU+5ESQZwseOfv8XXGOQq9Rj6ZOXoOJ+59sbR9g+tYveeSD/3OK0x7yu7UV8vGwNd9+dkOmynUPjakC+AixlEq00DFIJe3+f8czQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724839986; c=relaxed/relaxed;
	bh=AB0XOPA0BSLTuGqzb12PcXXNIGQxl3dQlrGtiNSzjB4=;
	h=Received:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-GND-Sasl; b=is4Dckjcos6BJ3I5OPRRxqK8lKHM5dSfBo0K1nunFVY+TbWj5m7RiS3HICy/9szri0+WlaBVycNERRo54AErCKMKBoONwlxWta/1aJgzfU0vWo0wJc1DCy6wrRATOc9I+DiWvsY+IpjmL2Qb9M4PQs3r1mF3hoKZ/4RB2gmUc40UYWIB9/lTdePlt34UdcjBLLvXXj7RtZFg1pOnOm1z/1VtgdVC7fIlu6o82pRGKfDhznMwrOPTWdHS3Y/qZfHbFrR5aRvVU/uW1GnonKcPwiy1fTh84NAg6GMoImxlir1S5lWN1fJoP7ms63Dqi0n0/TlbC3GpXov/Y4iYwwmQMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nAx2cz9L; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=nAx2cz9L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0bj2kqVz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:13:05 +1000 (AEST)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 27D01C80ED
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:51:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8C521C000B;
	Wed, 28 Aug 2024 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724838673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AB0XOPA0BSLTuGqzb12PcXXNIGQxl3dQlrGtiNSzjB4=;
	b=nAx2cz9L44hYwZCmWE1jSXchDluFbhfpzj+KIuCAvGpptBCjxcc6I5FfXNUF43JXkI7xzF
	An6gdfinfsYNQ8HOofpfzdcEtbvIJxMy+38treyE0GG7j7qLoFCzPXQkB3wTt+gHrNyWOP
	3+Vjd9+bjmMq1YQ2m8v/4r8Bv/m7JfE0H4XJt2x/wWyZflo+eGqQbDvrJS84DCT0ULB50a
	aPRFk5K+xb6IYTlT4uSdJKSX7ouh5JHinddvP4itRpqGi5CGFjBReSOTkrVZfmaWFNGuev
	+iYrkVqhQiNz3zoTpEa7JaosWq5Y1mzK/5x+kUNt1rMy1HuUq5DznQDf9hyziw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next 6/6] net: ethernet: fs_enet: phylink conversion
Date: Wed, 28 Aug 2024 11:51:02 +0200
Message-ID: <20240828095103.132625-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

fs_enet is a quite old but still used Ethernet driver found on some NXP
devices. It has support for 10/100 Mbps ethernet, with half and full
duplex. Some variants of it can use RMII, while other integrations are
MII-only.

Add phylink support, thus removing custom fixed-link hanldling.

This also allows removing some internal flags such as the use_rmii flag.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/freescale/fs_enet/Kconfig    |   2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c | 203 +++++++++---------
 .../net/ethernet/freescale/fs_enet/fs_enet.h  |  12 +-
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  11 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |   9 +-
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |   5 +-
 6 files changed, 120 insertions(+), 122 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/Kconfig b/drivers/net/ethernet/freescale/fs_enet/Kconfig
index 7f20840fde07..57013bf14d7c 100644
--- a/drivers/net/ethernet/freescale/fs_enet/Kconfig
+++ b/drivers/net/ethernet/freescale/fs_enet/Kconfig
@@ -3,7 +3,7 @@ config FS_ENET
 	tristate "Freescale Ethernet Driver"
 	depends on NET_VENDOR_FREESCALE && (CPM1 || CPM2 || PPC_MPC512x)
 	select MII
-	select PHYLIB
+	select PHYLINK
 
 config FS_ENET_MPC5121_FEC
 	def_bool y if (FS_ENET && PPC_MPC512x)
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index caca81b3ccb6..89ad9697f225 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -32,11 +32,13 @@
 #include <linux/fs.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/phylink.h>
 #include <linux/property.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/pgtable.h>
+#include <linux/rtnetlink.h>
 
 #include <linux/vmalloc.h>
 #include <asm/irq.h>
@@ -69,6 +71,16 @@ static void fs_set_multicast_list(struct net_device *dev)
 	(*fep->ops->set_multicast_list)(dev);
 }
 
+static int fs_eth_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
+{
+	struct fs_enet_private *fep = netdev_priv(dev);
+
+	if (!netif_running(dev))
+		return -EINVAL;
+
+	return phylink_mii_ioctl(fep->phylink, ifr, cmd);
+}
+
 static void skb_align(struct sk_buff *skb, int align)
 {
 	int off = ((unsigned long)skb->data) & (align - 1);
@@ -582,15 +594,12 @@ static void fs_timeout_work(struct work_struct *work)
 
 	dev->stats.tx_errors++;
 
-	spin_lock_irqsave(&fep->lock, flags);
+	rtnl_lock();
+	phylink_stop(fep->phylink);
+	phylink_start(fep->phylink);
+	rtnl_unlock();
 
-	if (dev->flags & IFF_UP) {
-		phy_stop(dev->phydev);
-		(*fep->ops->stop)(dev);
-		(*fep->ops->restart)(dev);
-	}
-
-	phy_start(dev->phydev);
+	spin_lock_irqsave(&fep->lock, flags);
 	wake = fep->tx_free >= MAX_SKB_FRAGS &&
 	       !(CBDR_SC(fep->cur_tx) & BD_ENET_TX_READY);
 	spin_unlock_irqrestore(&fep->lock, flags);
@@ -606,74 +615,37 @@ static void fs_timeout(struct net_device *dev, unsigned int txqueue)
 	schedule_work(&fep->timeout_work);
 }
 
-/* generic link-change handler - should be sufficient for most cases */
-static void generic_adjust_link(struct  net_device *dev)
+static void fs_mac_link_up(struct phylink_config *config,
+			   struct phy_device *phy,
+			   unsigned int mode, phy_interface_t interface,
+			   int speed, int duplex,
+			   bool tx_pause, bool rx_pause)
 {
-	struct fs_enet_private *fep = netdev_priv(dev);
-	struct phy_device *phydev = dev->phydev;
-	int new_state = 0;
-
-	if (phydev->link) {
-		/* adjust to duplex mode */
-		if (phydev->duplex != fep->oldduplex) {
-			new_state = 1;
-			fep->oldduplex = phydev->duplex;
-		}
-
-		if (phydev->speed != fep->oldspeed) {
-			new_state = 1;
-			fep->oldspeed = phydev->speed;
-		}
-
-		if (!fep->oldlink) {
-			new_state = 1;
-			fep->oldlink = 1;
-		}
-
-		if (new_state)
-			fep->ops->restart(dev);
-	} else if (fep->oldlink) {
-		new_state = 1;
-		fep->oldlink = 0;
-		fep->oldspeed = 0;
-		fep->oldduplex = -1;
-	}
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct fs_enet_private *fep = netdev_priv(ndev);
+	unsigned long flags;
 
-	if (new_state && netif_msg_link(fep))
-		phy_print_status(phydev);
+	spin_lock_irqsave(&fep->lock, flags);
+	fep->ops->restart(ndev, interface, speed, duplex);
+	spin_unlock_irqrestore(&fep->lock, flags);
 }
 
-static void fs_adjust_link(struct net_device *dev)
+static void fs_mac_link_down(struct phylink_config *config,
+			     unsigned int mode, phy_interface_t interface)
 {
-	struct fs_enet_private *fep = netdev_priv(dev);
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct fs_enet_private *fep = netdev_priv(ndev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&fep->lock, flags);
-	generic_adjust_link(dev);
+	fep->ops->stop(ndev);
 	spin_unlock_irqrestore(&fep->lock, flags);
 }
 
-static int fs_init_phy(struct net_device *dev)
+static void fs_mac_config(struct phylink_config *config, unsigned int mode,
+			  const struct phylink_link_state *state)
 {
-	struct fs_enet_private *fep = netdev_priv(dev);
-	struct phy_device *phydev;
-	phy_interface_t iface;
-
-	fep->oldlink = 0;
-	fep->oldspeed = 0;
-	fep->oldduplex = -1;
-
-	iface = fep->fpi->use_rmii ?
-		PHY_INTERFACE_MODE_RMII : PHY_INTERFACE_MODE_MII;
-
-	phydev = of_phy_connect(dev, fep->fpi->phy_node, &fs_adjust_link, 0,
-				iface);
-	if (!phydev) {
-		dev_err(&dev->dev, "Could not attach to PHY\n");
-		return -ENODEV;
-	}
-
-	return 0;
+	/* Nothing to do */
 }
 
 static int fs_enet_open(struct net_device *dev)
@@ -698,13 +670,13 @@ static int fs_enet_open(struct net_device *dev)
 		return -EINVAL;
 	}
 
-	err = fs_init_phy(dev);
+	err = phylink_of_phy_connect(fep->phylink, fep->dev->of_node, 0);
 	if (err) {
 		free_irq(fep->interrupt, dev);
 		napi_disable(&fep->napi);
 		return err;
 	}
-	phy_start(dev->phydev);
+	phylink_start(fep->phylink);
 
 	netif_start_queue(dev);
 
@@ -717,19 +689,18 @@ static int fs_enet_close(struct net_device *dev)
 	unsigned long flags;
 
 	netif_stop_queue(dev);
-	netif_carrier_off(dev);
 	napi_disable(&fep->napi);
 	cancel_work_sync(&fep->timeout_work);
-	phy_stop(dev->phydev);
+	phylink_stop(fep->phylink);
 
 	spin_lock_irqsave(&fep->lock, flags);
 	spin_lock(&fep->tx_lock);
 	(*fep->ops->stop)(dev);
 	spin_unlock(&fep->tx_lock);
 	spin_unlock_irqrestore(&fep->lock, flags);
+	phylink_disconnect_phy(fep->phylink);
 
 	/* release any irqs */
-	phy_disconnect(dev->phydev);
 	free_irq(fep->interrupt, dev);
 
 	return 0;
@@ -817,6 +788,22 @@ static int fs_set_tunable(struct net_device *dev,
 	return ret;
 }
 
+static int fs_ethtool_set_link_ksettings(struct net_device *dev,
+					 const struct ethtool_link_ksettings *cmd)
+{
+	struct fs_enet_private *fep = netdev_priv(dev);
+
+	return phylink_ethtool_ksettings_set(fep->phylink, cmd);
+}
+
+static int fs_ethtool_get_link_ksettings(struct net_device *dev,
+					 struct ethtool_link_ksettings *cmd)
+{
+	struct fs_enet_private *fep = netdev_priv(dev);
+
+	return phylink_ethtool_ksettings_get(fep->phylink, cmd);
+}
+
 static const struct ethtool_ops fs_ethtool_ops = {
 	.get_drvinfo = fs_get_drvinfo,
 	.get_regs_len = fs_get_regs_len,
@@ -826,8 +813,8 @@ static const struct ethtool_ops fs_ethtool_ops = {
 	.set_msglevel = fs_set_msglevel,
 	.get_regs = fs_get_regs,
 	.get_ts_info = ethtool_op_get_ts_info,
-	.get_link_ksettings = phy_ethtool_get_link_ksettings,
-	.set_link_ksettings = phy_ethtool_set_link_ksettings,
+	.get_link_ksettings = fs_ethtool_get_link_ksettings,
+	.set_link_ksettings = fs_ethtool_set_link_ksettings,
 	.get_tunable = fs_get_tunable,
 	.set_tunable = fs_set_tunable,
 };
@@ -844,7 +831,7 @@ static const struct net_device_ops fs_enet_netdev_ops = {
 	.ndo_start_xmit		= fs_enet_start_xmit,
 	.ndo_tx_timeout		= fs_timeout,
 	.ndo_set_rx_mode	= fs_set_multicast_list,
-	.ndo_eth_ioctl		= phy_do_ioctl_running,
+	.ndo_eth_ioctl		= fs_eth_ioctl,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
 #ifdef CONFIG_NET_POLL_CONTROLLER
@@ -852,14 +839,21 @@ static const struct net_device_ops fs_enet_netdev_ops = {
 #endif
 };
 
+static const struct phylink_mac_ops fs_enet_phylink_mac_ops = {
+	.mac_config = fs_mac_config,
+	.mac_link_down = fs_mac_link_down,
+	.mac_link_up = fs_mac_link_up,
+};
+
 static int fs_enet_probe(struct platform_device *ofdev)
 {
-	int err, privsize, len, ret = -ENODEV;
-	const char *phy_connection_type;
+	int privsize, len, ret = -ENODEV;
 	struct fs_platform_info *fpi;
 	struct fs_enet_private *fep;
+	phy_interface_t phy_mode;
 	const struct fs_ops *ops;
 	struct net_device *ndev;
+	struct phylink *phylink;
 	const u32 *data;
 	struct clk *clk;
 
@@ -879,29 +873,18 @@ static int fs_enet_probe(struct platform_device *ofdev)
 		fpi->cp_command = *data;
 	}
 
+	ret = of_get_phy_mode(ofdev->dev.of_node, &phy_mode);
+	if (ret) {
+		/* For compatibility, if the mode isn't specified in DT,
+		 * assume MII
+		 */
+		phy_mode = PHY_INTERFACE_MODE_MII;
+	}
+
 	fpi->rx_ring = RX_RING_SIZE;
 	fpi->tx_ring = TX_RING_SIZE;
 	fpi->rx_copybreak = 240;
 	fpi->napi_weight = 17;
-	fpi->phy_node = of_parse_phandle(ofdev->dev.of_node, "phy-handle", 0);
-	if (!fpi->phy_node && of_phy_is_fixed_link(ofdev->dev.of_node)) {
-		err = of_phy_register_fixed_link(ofdev->dev.of_node);
-		if (err)
-			goto out_free_fpi;
-
-		/* In the case of a fixed PHY, the DT node associated
-		 * to the PHY is the Ethernet MAC DT node.
-		 */
-		fpi->phy_node = of_node_get(ofdev->dev.of_node);
-	}
-
-	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec")) {
-		phy_connection_type = of_get_property(ofdev->dev.of_node,
-						      "phy-connection-type",
-						      NULL);
-		if (phy_connection_type && !strcmp("rmii", phy_connection_type))
-			fpi->use_rmii = 1;
-	}
 
 	/* make clock lookup non-fatal (the driver is shared among platforms),
 	 * but require enable to succeed when a clock was specified/found,
@@ -911,7 +894,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	if (!IS_ERR(clk)) {
 		ret = clk_prepare_enable(clk);
 		if (ret)
-			goto out_deregister_fixed_link;
+			goto out_phylink;
 
 		fpi->clk_per = clk;
 	}
@@ -936,6 +919,26 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	fep->fpi = fpi;
 	fep->ops = ops;
 
+	fep->phylink_config.dev = &ndev->dev;
+	fep->phylink_config.type = PHYLINK_NETDEV;
+	fep->phylink_config.mac_capabilities = MAC_10 | MAC_100;
+
+	__set_bit(PHY_INTERFACE_MODE_MII,
+		  fep->phylink_config.supported_interfaces);
+
+	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec"))
+		__set_bit(PHY_INTERFACE_MODE_RMII,
+			  fep->phylink_config.supported_interfaces);
+
+	phylink = phylink_create(&fep->phylink_config, dev_fwnode(fep->dev),
+				 phy_mode, &fs_enet_phylink_mac_ops);
+	if (IS_ERR(phylink)) {
+		ret = PTR_ERR(phylink);
+		goto out_free_fpi;
+	}
+
+	fep->phylink = phylink;
+
 	ret = fep->ops->setup_data(ndev);
 	if (ret)
 		goto out_free_dev;
@@ -968,8 +971,6 @@ static int fs_enet_probe(struct platform_device *ofdev)
 
 	ndev->ethtool_ops = &fs_ethtool_ops;
 
-	netif_carrier_off(ndev);
-
 	ndev->features |= NETIF_F_SG;
 
 	ret = register_netdev(ndev);
@@ -988,10 +989,8 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	free_netdev(ndev);
 out_put:
 	clk_disable_unprepare(fpi->clk_per);
-out_deregister_fixed_link:
-	of_node_put(fpi->phy_node);
-	if (of_phy_is_fixed_link(ofdev->dev.of_node))
-		of_phy_deregister_fixed_link(ofdev->dev.of_node);
+out_phylink:
+	phylink_destroy(fep->phylink);
 out_free_fpi:
 	kfree(fpi);
 	return ret;
@@ -1007,10 +1006,8 @@ static void fs_enet_remove(struct platform_device *ofdev)
 	fep->ops->free_bd(ndev);
 	fep->ops->cleanup_data(ndev);
 	dev_set_drvdata(fep->dev, NULL);
-	of_node_put(fep->fpi->phy_node);
 	clk_disable_unprepare(fep->fpi->clk_per);
-	if (of_phy_is_fixed_link(ofdev->dev.of_node))
-		of_phy_deregister_fixed_link(ofdev->dev.of_node);
+	phylink_destroy(fep->phylink);
 	free_netdev(ndev);
 }
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index 781f506c933c..2c436cdd4626 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/list.h>
 #include <linux/phy.h>
+#include <linux/phylink.h>
 #include <linux/dma-mapping.h>
 
 #ifdef CONFIG_CPM1
@@ -77,7 +78,8 @@ struct fs_ops {
 	void (*free_bd)(struct net_device *dev);
 	void (*cleanup_data)(struct net_device *dev);
 	void (*set_multicast_list)(struct net_device *dev);
-	void (*restart)(struct net_device *dev);
+	void (*restart)(struct net_device *dev, phy_interface_t interface,
+			int speed, int duplex);
 	void (*stop)(struct net_device *dev);
 	void (*napi_clear_event)(struct net_device *dev);
 	void (*napi_enable)(struct net_device *dev);
@@ -113,14 +115,10 @@ struct fs_platform_info {
 
 	u32 dpram_offset;
 
-	struct device_node *phy_node;
-
 	int rx_ring, tx_ring;	/* number of buffers on rx	*/
 	int rx_copybreak;	/* limit we copy small frames	*/
 	int napi_weight;	/* NAPI weight			*/
 
-	int use_rmii;		/* use RMII mode		*/
-
 	struct clk *clk_per;	/* 'per' clock for register access */
 };
 
@@ -146,10 +144,10 @@ struct fs_enet_private {
 	cbd_t __iomem *cur_tx;
 	int tx_free;
 	u32 msg_enable;
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 	int interrupt;
 
-	int oldduplex, oldspeed, oldlink;	/* current settings */
-
 	/* event masks */
 	u32 ev_napi;		/* mask of NAPI events */
 	u32 ev;			/* event mask          */
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index 056909156b4f..3cb88fd91eaf 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -236,7 +236,8 @@ static void set_multicast_list(struct net_device *dev)
 		set_promiscuous_mode(dev);
 }
 
-static void restart(struct net_device *dev)
+static void restart(struct net_device *dev, phy_interface_t interface,
+		    int speed, int duplex)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
 	const struct fs_platform_info *fpi = fep->fpi;
@@ -360,8 +361,8 @@ static void restart(struct net_device *dev)
 	fs_init_bds(dev);
 
 	/* adjust to speed (for RMII mode) */
-	if (fpi->use_rmii) {
-		if (dev->phydev->speed == SPEED_100)
+	if (interface == PHY_INTERFACE_MODE_RMII) {
+		if (speed == SPEED_100)
 			C8(fcccp, fcc_gfemr, 0x20);
 		else
 			S8(fcccp, fcc_gfemr, 0x20);
@@ -383,11 +384,11 @@ static void restart(struct net_device *dev)
 
 	W32(fccp, fcc_fpsmr, FCC_PSMR_ENCRC);
 
-	if (fpi->use_rmii)
+	if (interface == PHY_INTERFACE_MODE_RMII)
 		S32(fccp, fcc_fpsmr, FCC_PSMR_RMII);
 
 	/* adjust to duplex mode */
-	if (dev->phydev->duplex == DUPLEX_FULL)
+	if (duplex == DUPLEX_FULL)
 		S32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
 	else
 		C32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index 855ee9e3f042..9442847efa13 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -221,7 +221,8 @@ static void set_multicast_list(struct net_device *dev)
 		set_promiscuous_mode(dev);
 }
 
-static void restart(struct net_device *dev)
+static void restart(struct net_device *dev, phy_interface_t interface,
+		    int speed, int duplex)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
 	struct fec __iomem *fecp = fep->fec.fecp;
@@ -303,13 +304,13 @@ static void restart(struct net_device *dev)
 	 * Only set MII/RMII mode - do not touch maximum frame length
 	 * configured before.
 	 */
-	FS(fecp, r_cntrl, fpi->use_rmii ?
-			FEC_RCNTRL_RMII_MODE : FEC_RCNTRL_MII_MODE);
+	FS(fecp, r_cntrl, interface == PHY_INTERFACE_MODE_RMII ?
+			  FEC_RCNTRL_RMII_MODE : FEC_RCNTRL_MII_MODE);
 #endif
 	/*
 	 * adjust to duplex mode
 	 */
-	if (dev->phydev->duplex == DUPLEX_FULL) {
+	if (duplex == DUPLEX_FULL) {
 		FC(fecp, r_cntrl, FEC_RCNTRL_DRT);
 		FS(fecp, x_cntrl, FEC_TCNTRL_FDEN);	/* FD enable */
 	} else {
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 9e5e29312c27..846aafff6951 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -227,7 +227,8 @@ static void set_multicast_list(struct net_device *dev)
  * change.  This only happens when switching between half and full
  * duplex.
  */
-static void restart(struct net_device *dev)
+static void restart(struct net_device *dev, phy_interface_t interface,
+		    int speed, int duplex)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
 	scc_t __iomem *sccp = fep->scc.sccp;
@@ -338,7 +339,7 @@ static void restart(struct net_device *dev)
 	W16(sccp, scc_psmr, SCC_PSMR_ENCRC | SCC_PSMR_NIB22);
 
 	/* Set full duplex mode if needed */
-	if (dev->phydev->duplex == DUPLEX_FULL)
+	if (duplex == DUPLEX_FULL)
 		S16(sccp, scc_psmr, SCC_PSMR_LPB | SCC_PSMR_FDE);
 
 	/* Restore multicast and promiscuous settings */
-- 
2.45.2


