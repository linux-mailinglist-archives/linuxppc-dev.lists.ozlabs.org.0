Return-Path: <linuxppc-dev+bounces-1002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3596C523
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 19:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzTjM33zLz2ykX;
	Thu,  5 Sep 2024 03:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.201
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725470311;
	cv=none; b=jcNEltL3cgcCxOf4qeMOBQrnrh3tCl10p9P8oZ7ez7+YYoF3oVdOlVQW8VFwrZIqxwPBZgGjFOgHcPWJThZqYq32nAO9y340jcZcPwwafybtxvZiO0Dd5e5Yn6uSha4tofEzHwAUF66f4vhxWf8iYdLsv2rcsD5yw+QGIQIhMbyZFzOZodSexiLCpMsVJ6h/GkGSU0pG8e1F430i4+WZhPtf8BqUIuuIlBAhl8s6p7T4EDBjlNvfElGYG45Zulv9h4uKaloZpvP+Do9afBBtkyUrjmvOWaRk8ZZnT6uK8AB0loiLSCq85FvKiiElL8Mz6XyQBdosBBsd3zDO1Ca7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725470311; c=relaxed/relaxed;
	bh=eLgqRBjfq+IEmP+JQkdUDjNiRmGAONy6pJkdpDUz4WA=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=SxwYhISO+fPkBmgAbgoPzHn8KnTTtcdUZHKzyX6T7S5XY4mAqafXiGeToSvxklY8AHYxJFkXuBIT28PmkqDwvFhO31NKReGBhjZBvpY2XrFP4nTqERF8YZe99XPFPuJdpZjEGgPCsLm3MYBMbpLm7ZmX7sHHFInuYEQ8JpXPJr48QCrRWOTIpyekP1z6Qdp1fhAsaYHkr4+2jxKT66K+J8D/9r4iIXEg4tGxdskRoMLHnAIcC66MvvkkXIP9DQEpRhOZNpOQ++dWrarczk28x9ocR/ROQVO2filN6unw2B/hOd8xokMtLiUvPFf15o/fZQbU3PaiJNCFpD14yI5iwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FhibXjuN; dkim-atps=neutral; spf=pass (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FhibXjuN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzTjL3lv7z2yfm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 03:18:29 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89C2F1BF208;
	Wed,  4 Sep 2024 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725470307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLgqRBjfq+IEmP+JQkdUDjNiRmGAONy6pJkdpDUz4WA=;
	b=FhibXjuNhrP9wnrhfNNG54+QSvoSRhcXIYK1PaTm8Jfblz+O1CURJuplNAxUKKt+5WkQ6l
	MDPtiwgGv4aFxSTdiiHixFEjpGilOqYaE3K6CDqrEHaWnqnCTWbMi8X3CYqGdmPRhBJ2uq
	cNZX5gX8SqhtVm6QQG8OLW6qDRpIyj6KZxL+3Z5usDgA0mu7ImcZbIaixrb7uM9nYsljAD
	5Gyp4dnClPJTs1uB9iq0Hdhhcnk9XDkc4rPTb7dTmPHyo99GIkbM5//PRmw3ra7yzKddJN
	z9e+w1IrpRjXNKt6gc09H5y51WEs3MtrLzm5rnZrHS7TydXC9WcpmZh0onYKJQ==
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
Subject: [PATCH net-next v3 2/8] net: ethernet: fs_enet: cosmetic cleanups
Date: Wed,  4 Sep 2024 19:18:15 +0200
Message-ID: <20240904171822.64652-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
References: <20240904171822.64652-1-maxime.chevallier@bootlin.com>
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

Due to the age of the driver and the slow recent activity on it, the code
has taken some layers of dust. Clean the main driver file up so that it
passes checkpatch and also conforms with the net coding style.

Changes include :
 - Re-ordering of the variable declarations for RCT
 - Fixing the comment styles to either one-line comments, or net-style
   comments
 - Adding braces around single-statement 'else' clauses
 - Aligning function/macro parameters on the opening parenthesis
 - Simplifying checks for NULL pointers
 - Splitting cascaded assignments into individual assignments
 - Fixing some typos
 - Fixing whitespace issues

This is a cosmetic change and doesn't introduce any change in behaviour.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../ethernet/freescale/fs_enet/fs_enet-main.c | 220 +++++++-----------
 1 file changed, 89 insertions(+), 131 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 5bfdd43ffdeb..2b48a2a5e32d 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -81,15 +81,14 @@ static void skb_align(struct sk_buff *skb, int align)
 static int fs_enet_napi(struct napi_struct *napi, int budget)
 {
 	struct fs_enet_private *fep = container_of(napi, struct fs_enet_private, napi);
-	struct net_device *dev = fep->ndev;
 	const struct fs_platform_info *fpi = fep->fpi;
-	cbd_t __iomem *bdp;
+	struct net_device *dev = fep->ndev;
+	int curidx, dirtyidx, received = 0;
+	int do_wake = 0, do_restart = 0;
+	int tx_left = TX_RING_SIZE;
 	struct sk_buff *skb, *skbn;
-	int received = 0;
+	cbd_t __iomem *bdp;
 	u16 pkt_len, sc;
-	int curidx;
-	int dirtyidx, do_wake, do_restart;
-	int tx_left = TX_RING_SIZE;
 
 	spin_lock(&fep->tx_lock);
 	bdp = fep->dirty_tx;
@@ -97,7 +96,6 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 	/* clear status bits for napi*/
 	(*fep->ops->napi_clear_event)(dev);
 
-	do_wake = do_restart = 0;
 	while (((sc = CBDR_SC(bdp)) & BD_ENET_TX_READY) == 0 && tx_left) {
 		dirtyidx = bdp - fep->tx_bd_base;
 
@@ -106,12 +104,9 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 
 		skb = fep->tx_skbuff[dirtyidx];
 
-		/*
-		 * Check for errors.
-		 */
+		 /* Check for errors. */
 		if (sc & (BD_ENET_TX_HB | BD_ENET_TX_LC |
 			  BD_ENET_TX_RL | BD_ENET_TX_UN | BD_ENET_TX_CSL)) {
-
 			if (sc & BD_ENET_TX_HB)	/* No heartbeat */
 				dev->stats.tx_heartbeat_errors++;
 			if (sc & BD_ENET_TX_LC)	/* Late collision */
@@ -127,16 +122,16 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 				dev->stats.tx_errors++;
 				do_restart = 1;
 			}
-		} else
+		} else {
 			dev->stats.tx_packets++;
+		}
 
 		if (sc & BD_ENET_TX_READY) {
 			dev_warn(fep->dev,
 				 "HEY! Enet xmit interrupt and TX_READY.\n");
 		}
 
-		/*
-		 * Deferred means some collisions occurred during transmit,
+		/* Deferred means some collisions occurred during transmit,
 		 * but we eventually sent the packet OK.
 		 */
 		if (sc & BD_ENET_TX_DEF)
@@ -150,25 +145,20 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 			dma_unmap_single(fep->dev, CBDR_BUFADDR(bdp),
 					 CBDR_DATLEN(bdp), DMA_TO_DEVICE);
 
-		/*
-		 * Free the sk buffer associated with this last transmit.
-		 */
+		/* Free the sk buffer associated with this last transmit. */
 		if (skb) {
 			dev_kfree_skb(skb);
 			fep->tx_skbuff[dirtyidx] = NULL;
 		}
 
-		/*
-		 * Update pointer to next buffer descriptor to be transmitted.
+		/* Update pointer to next buffer descriptor to be transmitted.
 		 */
 		if ((sc & BD_ENET_TX_WRAP) == 0)
 			bdp++;
 		else
 			bdp = fep->tx_bd_base;
 
-		/*
-		 * Since we have freed up a buffer, the ring is no longer
-		 * full.
+		/* Since we have freed up a buffer, the ring is no longer full.
 		 */
 		if (++fep->tx_free == MAX_SKB_FRAGS)
 			do_wake = 1;
@@ -185,8 +175,7 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 	if (do_wake)
 		netif_wake_queue(dev);
 
-	/*
-	 * First, grab all of the stats for the incoming packet.
+	/* First, grab all of the stats for the incoming packet.
 	 * These get messed up if we get called due to a busy condition.
 	 */
 	bdp = fep->cur_rx;
@@ -195,16 +184,13 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 	       received < budget) {
 		curidx = bdp - fep->rx_bd_base;
 
-		/*
-		 * Since we have allocated space to hold a complete frame,
+		/* Since we have allocated space to hold a complete frame,
 		 * the last indicator should be set.
 		 */
 		if ((sc & BD_ENET_RX_LAST) == 0)
 			dev_warn(fep->dev, "rcv is not +last\n");
 
-		/*
-		 * Check for errors.
-		 */
+		/* Check for errors. */
 		if (sc & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_CL |
 			  BD_ENET_RX_NO | BD_ENET_RX_CR | BD_ENET_RX_OV)) {
 			dev->stats.rx_errors++;
@@ -225,9 +211,7 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 		} else {
 			skb = fep->rx_skbuff[curidx];
 
-			/*
-			 * Process the incoming frame.
-			 */
+			/* Process the incoming frame */
 			dev->stats.rx_packets++;
 			pkt_len = CBDR_DATLEN(bdp) - 4;	/* remove CRC */
 			dev->stats.rx_bytes += pkt_len + 4;
@@ -235,15 +219,15 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 			if (pkt_len <= fpi->rx_copybreak) {
 				/* +2 to make IP header L1 cache aligned */
 				skbn = netdev_alloc_skb(dev, pkt_len + 2);
-				if (skbn != NULL) {
+				if (skbn) {
 					skb_reserve(skbn, 2);	/* align IP header */
-					skb_copy_from_linear_data(skb,
-						      skbn->data, pkt_len);
+					skb_copy_from_linear_data(skb, skbn->data,
+								  pkt_len);
 					swap(skb, skbn);
 					dma_sync_single_for_cpu(fep->dev,
-						CBDR_BUFADDR(bdp),
-						L1_CACHE_ALIGN(pkt_len),
-						DMA_FROM_DEVICE);
+								CBDR_BUFADDR(bdp),
+								L1_CACHE_ALIGN(pkt_len),
+								DMA_FROM_DEVICE);
 				}
 			} else {
 				skbn = netdev_alloc_skb(dev, ENET_RX_FRSIZE);
@@ -253,20 +237,18 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 
 					skb_align(skbn, ENET_RX_ALIGN);
 
-					dma_unmap_single(fep->dev,
-						CBDR_BUFADDR(bdp),
-						L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
-						DMA_FROM_DEVICE);
+					dma_unmap_single(fep->dev, CBDR_BUFADDR(bdp),
+							 L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
+							 DMA_FROM_DEVICE);
 
-					dma = dma_map_single(fep->dev,
-						skbn->data,
-						L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
-						DMA_FROM_DEVICE);
+					dma = dma_map_single(fep->dev, skbn->data,
+							     L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
+							     DMA_FROM_DEVICE);
 					CBDW_BUFADDR(bdp, dma);
 				}
 			}
 
-			if (skbn != NULL) {
+			if (skbn) {
 				skb_put(skb, pkt_len);	/* Make room */
 				skb->protocol = eth_type_trans(skb, dev);
 				received++;
@@ -281,9 +263,7 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 		CBDW_DATLEN(bdp, 0);
 		CBDW_SC(bdp, (sc & ~BD_ENET_RX_STATS) | BD_ENET_RX_EMPTY);
 
-		/*
-		 * Update BD pointer to next entry.
-		 */
+		/* Update BD pointer to next entry */
 		if ((sc & BD_ENET_RX_WRAP) == 0)
 			bdp++;
 		else
@@ -305,19 +285,16 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 	return budget;
 }
 
-/*
- * The interrupt handler.
+/* The interrupt handler.
  * This is called from the MPC core interrupt.
  */
 static irqreturn_t
 fs_enet_interrupt(int irq, void *dev_id)
 {
 	struct net_device *dev = dev_id;
+	u32 int_events, int_clr_events;
 	struct fs_enet_private *fep;
-	u32 int_events;
-	u32 int_clr_events;
-	int nr, napi_ok;
-	int handled;
+	int nr, napi_ok, handled;
 
 	fep = netdev_priv(dev);
 
@@ -339,12 +316,12 @@ fs_enet_interrupt(int irq, void *dev_id)
 			(*fep->ops->napi_disable)(dev);
 			(*fep->ops->clear_int_events)(dev, fep->ev_napi);
 
-			/* NOTE: it is possible for FCCs in NAPI mode    */
-			/* to submit a spurious interrupt while in poll  */
+			/* NOTE: it is possible for FCCs in NAPI mode
+			 * to submit a spurious interrupt while in poll
+			 */
 			if (napi_ok)
 				__napi_schedule(&fep->napi);
 		}
-
 	}
 
 	handled = nr > 0;
@@ -354,45 +331,40 @@ fs_enet_interrupt(int irq, void *dev_id)
 void fs_init_bds(struct net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
-	cbd_t __iomem *bdp;
 	struct sk_buff *skb;
+	cbd_t __iomem *bdp;
 	int i;
 
 	fs_cleanup_bds(dev);
 
-	fep->dirty_tx = fep->cur_tx = fep->tx_bd_base;
+	fep->dirty_tx = fep->tx_bd_base;
+	fep->cur_tx = fep->tx_bd_base;
 	fep->tx_free = fep->tx_ring;
 	fep->cur_rx = fep->rx_bd_base;
 
-	/*
-	 * Initialize the receive buffer descriptors.
-	 */
+	/* Initialize the receive buffer descriptors */
 	for (i = 0, bdp = fep->rx_bd_base; i < fep->rx_ring; i++, bdp++) {
 		skb = netdev_alloc_skb(dev, ENET_RX_FRSIZE);
-		if (skb == NULL)
+		if (!skb)
 			break;
 
 		skb_align(skb, ENET_RX_ALIGN);
 		fep->rx_skbuff[i] = skb;
-		CBDW_BUFADDR(bdp,
-			dma_map_single(fep->dev, skb->data,
-				L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
-				DMA_FROM_DEVICE));
+		CBDW_BUFADDR(bdp, dma_map_single(fep->dev, skb->data,
+						 L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
+						 DMA_FROM_DEVICE));
 		CBDW_DATLEN(bdp, 0);	/* zero */
 		CBDW_SC(bdp, BD_ENET_RX_EMPTY |
 			((i < fep->rx_ring - 1) ? 0 : BD_SC_WRAP));
 	}
-	/*
-	 * if we failed, fillup remainder
-	 */
+
+	/* if we failed, fillup remainder */
 	for (; i < fep->rx_ring; i++, bdp++) {
 		fep->rx_skbuff[i] = NULL;
 		CBDW_SC(bdp, (i < fep->rx_ring - 1) ? 0 : BD_SC_WRAP);
 	}
 
-	/*
-	 * ...and the same for transmit.
-	 */
+	/* ...and the same for transmit. */
 	for (i = 0, bdp = fep->tx_bd_base; i < fep->tx_ring; i++, bdp++) {
 		fep->tx_skbuff[i] = NULL;
 		CBDW_BUFADDR(bdp, 0);
@@ -408,32 +380,30 @@ void fs_cleanup_bds(struct net_device *dev)
 	cbd_t __iomem *bdp;
 	int i;
 
-	/*
-	 * Reset SKB transmit buffers.
-	 */
+	/* Reset SKB transmit buffers. */
 	for (i = 0, bdp = fep->tx_bd_base; i < fep->tx_ring; i++, bdp++) {
-		if ((skb = fep->tx_skbuff[i]) == NULL)
+		skb = fep->tx_skbuff[i];
+		if (!skb)
 			continue;
 
 		/* unmap */
 		dma_unmap_single(fep->dev, CBDR_BUFADDR(bdp),
-				skb->len, DMA_TO_DEVICE);
+				 skb->len, DMA_TO_DEVICE);
 
 		fep->tx_skbuff[i] = NULL;
 		dev_kfree_skb(skb);
 	}
 
-	/*
-	 * Reset SKB receive buffers
-	 */
+	/* Reset SKB receive buffers */
 	for (i = 0, bdp = fep->rx_bd_base; i < fep->rx_ring; i++, bdp++) {
-		if ((skb = fep->rx_skbuff[i]) == NULL)
+		skb = fep->rx_skbuff[i];
+		if (!skb)
 			continue;
 
 		/* unmap */
 		dma_unmap_single(fep->dev, CBDR_BUFADDR(bdp),
-			L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
-			DMA_FROM_DEVICE);
+				 L1_CACHE_ALIGN(PKT_MAXBUF_SIZE),
+				 DMA_FROM_DEVICE);
 
 		fep->rx_skbuff[i] = NULL;
 
@@ -441,12 +411,8 @@ void fs_cleanup_bds(struct net_device *dev)
 	}
 }
 
-/**********************************************************************************/
-
 #ifdef CONFIG_FS_ENET_MPC5121_FEC
-/*
- * MPC5121 FEC requeries 4-byte alignment for TX data buffer!
- */
+/* MPC5121 FEC requires 4-byte alignment for TX data buffer! */
 static struct sk_buff *tx_skb_align_workaround(struct net_device *dev,
 					       struct sk_buff *skb)
 {
@@ -478,15 +444,12 @@ static netdev_tx_t
 fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
+	int curidx, nr_frags, len;
 	cbd_t __iomem *bdp;
-	int curidx;
-	u16 sc;
-	int nr_frags;
 	skb_frag_t *frag;
-	int len;
+	u16 sc;
 #ifdef CONFIG_FS_ENET_MPC5121_FEC
-	int is_aligned = 1;
-	int i;
+	int i, is_aligned = 1;
 
 	if (!IS_ALIGNED((unsigned long)skb->data, 4)) {
 		is_aligned = 0;
@@ -504,8 +467,7 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (!is_aligned) {
 		skb = tx_skb_align_workaround(dev, skb);
 		if (!skb) {
-			/*
-			 * We have lost packet due to memory allocation error
+			/* We have lost packet due to memory allocation error
 			 * in tx_skb_align_workaround(). Hopefully original
 			 * skb is still valid, so try transmit it later.
 			 */
@@ -516,9 +478,7 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	spin_lock(&fep->tx_lock);
 
-	/*
-	 * Fill in a Tx ring entry
-	 */
+	/* Fill in a Tx ring entry */
 	bdp = fep->cur_tx;
 
 	nr_frags = skb_shinfo(skb)->nr_frags;
@@ -526,8 +486,7 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		netif_stop_queue(dev);
 		spin_unlock(&fep->tx_lock);
 
-		/*
-		 * Ooops.  All transmit buffers are full.  Bail out.
+		/* Ooops.  All transmit buffers are full.  Bail out.
 		 * This should not happen, since the tx queue should be stopped.
 		 */
 		dev_warn(fep->dev, "tx queue full!.\n");
@@ -540,12 +499,12 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	dev->stats.tx_bytes += len;
 	if (nr_frags)
 		len -= skb->data_len;
+
 	fep->tx_free -= nr_frags + 1;
-	/*
-	 * Push the data cache so the CPM does not get stale memory data.
+	/* Push the data cache so the CPM does not get stale memory data.
 	 */
 	CBDW_BUFADDR(bdp, dma_map_single(fep->dev,
-				skb->data, len, DMA_TO_DEVICE));
+					 skb->data, len, DMA_TO_DEVICE));
 	CBDW_DATLEN(bdp, len);
 
 	fep->mapped_as_page[curidx] = 0;
@@ -582,9 +541,11 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* note that while FEC does not have this bit
 	 * it marks it as available for software use
-	 * yay for hw reuse :) */
+	 * yay for hw reuse :)
+	 */
 	if (skb->len <= 60)
 		sc |= BD_ENET_TX_PAD;
+
 	CBDC_SC(bdp, BD_ENET_TX_STATS);
 	CBDS_SC(bdp, sc);
 
@@ -596,6 +557,7 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		bdp++;
 	else
 		bdp = fep->tx_bd_base;
+
 	fep->cur_tx = bdp;
 
 	if (fep->tx_free < MAX_SKB_FRAGS)
@@ -644,9 +606,7 @@ static void fs_timeout(struct net_device *dev, unsigned int txqueue)
 	schedule_work(&fep->timeout_work);
 }
 
-/*-----------------------------------------------------------------------------
- *  generic link-change handler - should be sufficient for most cases
- *-----------------------------------------------------------------------------*/
+/* generic link-change handler - should be sufficient for most cases */
 static void generic_adjust_link(struct  net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
@@ -683,7 +643,6 @@ static void generic_adjust_link(struct  net_device *dev)
 		phy_print_status(phydev);
 }
 
-
 static void fs_adjust_link(struct net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
@@ -691,7 +650,7 @@ static void fs_adjust_link(struct net_device *dev)
 
 	spin_lock_irqsave(&fep->lock, flags);
 
-	if(fep->ops->adjust_link)
+	if (fep->ops->adjust_link)
 		fep->ops->adjust_link(dev);
 	else
 		generic_adjust_link(dev);
@@ -728,8 +687,9 @@ static int fs_enet_open(struct net_device *dev)
 	int r;
 	int err;
 
-	/* to initialize the fep->cur_rx,... */
-	/* not doing this, will cause a crash in fs_enet_napi */
+	/* to initialize the fep->cur_rx,...
+	 * not doing this, will cause a crash in fs_enet_napi
+	 */
 	fs_init_bds(fep->ndev);
 
 	napi_enable(&fep->napi);
@@ -780,10 +740,8 @@ static int fs_enet_close(struct net_device *dev)
 	return 0;
 }
 
-/*************************************************************************/
-
 static void fs_get_drvinfo(struct net_device *dev,
-			    struct ethtool_drvinfo *info)
+			   struct ethtool_drvinfo *info)
 {
 	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
 }
@@ -796,7 +754,7 @@ static int fs_get_regs_len(struct net_device *dev)
 }
 
 static void fs_get_regs(struct net_device *dev, struct ethtool_regs *regs,
-			 void *p)
+			void *p)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
 	unsigned long flags;
@@ -815,12 +773,14 @@ static void fs_get_regs(struct net_device *dev, struct ethtool_regs *regs,
 static u32 fs_get_msglevel(struct net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
+
 	return fep->msg_enable;
 }
 
 static void fs_set_msglevel(struct net_device *dev, u32 value)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
+
 	fep->msg_enable = value;
 }
 
@@ -877,8 +837,6 @@ static const struct ethtool_ops fs_ethtool_ops = {
 	.set_tunable = fs_set_tunable,
 };
 
-/**************************************************************************************/
-
 #ifdef CONFIG_FS_ENET_HAS_FEC
 #define IS_FEC(ops) ((ops) == &fs_fec_ops)
 #else
@@ -901,15 +859,14 @@ static const struct net_device_ops fs_enet_netdev_ops = {
 
 static int fs_enet_probe(struct platform_device *ofdev)
 {
+	int err, privsize, len, ret = -ENODEV;
+	const char *phy_connection_type;
+	struct fs_platform_info *fpi;
+	struct fs_enet_private *fep;
 	const struct fs_ops *ops;
 	struct net_device *ndev;
-	struct fs_enet_private *fep;
-	struct fs_platform_info *fpi;
 	const u32 *data;
 	struct clk *clk;
-	int err;
-	const char *phy_connection_type;
-	int privsize, len, ret = -ENODEV;
 
 	ops = device_get_match_data(&ofdev->dev);
 	if (!ops)
@@ -945,7 +902,8 @@ static int fs_enet_probe(struct platform_device *ofdev)
 
 	if (of_device_is_compatible(ofdev->dev.of_node, "fsl,mpc5125-fec")) {
 		phy_connection_type = of_get_property(ofdev->dev.of_node,
-						"phy-connection-type", NULL);
+						      "phy-connection-type",
+						      NULL);
 		if (phy_connection_type && !strcmp("rmii", phy_connection_type))
 			fpi->use_rmii = 1;
 	}
@@ -964,7 +922,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	}
 
 	privsize = sizeof(*fep) +
-	           sizeof(struct sk_buff **) *
+		   sizeof(struct sk_buff **) *
 		     (fpi->rx_ring + fpi->tx_ring) +
 		   sizeof(char) * fpi->tx_ring;
 
@@ -1111,9 +1069,9 @@ static struct platform_driver fs_enet_driver = {
 #ifdef CONFIG_NET_POLL_CONTROLLER
 static void fs_enet_netpoll(struct net_device *dev)
 {
-       disable_irq(dev->irq);
-       fs_enet_interrupt(dev->irq, dev);
-       enable_irq(dev->irq);
+	disable_irq(dev->irq);
+	fs_enet_interrupt(dev->irq, dev);
+	enable_irq(dev->irq);
 }
 #endif
 
-- 
2.46.0


