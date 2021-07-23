Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46863D419C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWgzH4hB8z3dj5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:34:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=zdsjXqxD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=zdsjXqxD; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgwK71Gmz30FR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8i+jCTrjlh3u6Je/3uC2P+mEOj3uX6LJPnWFq2dYxyU=; b=zdsjXqxDfBSVx8ql2xDre4qsjk
 F5WEXJv1MRNH3RafuDqnyvvBZEilMKNu1Ag1P0m6WuxhY7xLJZ8bRE1ARryW/UBPdi8d6s6fxA1uI
 UAb8aRxx8CEe5fwamglOwn0IM2CqIWDYk+zTffOeZSytTp51D55E1TxMquqSDb9Z3Smz71td4wT2A
 7Pu6emg7Ya9r1KT0QlUTfAoQ/lHUC9qXaAJwoKrNVq2/kLt58z+Hrk+9oSI3m4K7cpZP/ykcY7qlB
 lpAET48jBnCSjaFtGRKZ3+JMznSO5SoaFMZAXGq64U/LhwY7Ol0UOmeXciDp4EpWzEVfH1ZKvuT9q
 Ow7I9HwA==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m71pj-009Bil-3S; Fri, 23 Jul 2021 20:31:47 +0000
Message-Id: <56efff53fcf563a1741904ea0f078d50c378b6cc.1627068552.git.geoff@infradead.org>
In-Reply-To: <cover.1627068552.git.geoff@infradead.org>
References: <cover.1627068552.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 24 Jul 2021 13:02:14 -0700
Subject: [PATCH v4 03/10] net/ps3_gelic: Format cleanups
To: David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 23 Jul 2021 20:31:47 +0000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In an effort to make the PS3 gelic driver easier to maintain, cleanup the
the driver source file formatting to be more consistent.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 379 ++++++++++---------
 1 file changed, 193 insertions(+), 186 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index ba008a98928a..ded467d81f36 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -44,8 +44,6 @@ MODULE_AUTHOR("SCE Inc.");
 MODULE_DESCRIPTION("Gelic Network driver");
 MODULE_LICENSE("GPL");
 
-
-/* set irq_mask */
 int gelic_card_set_irq_mask(struct gelic_card *card, u64 mask)
 {
 	struct device *dev = ctodev(card);
@@ -65,6 +63,7 @@ static void gelic_card_rx_irq_on(struct gelic_card *card)
 	card->irq_mask |= GELIC_CARD_RXINT;
 	gelic_card_set_irq_mask(card, card->irq_mask);
 }
+
 static void gelic_card_rx_irq_off(struct gelic_card *card)
 {
 	card->irq_mask &= ~GELIC_CARD_RXINT;
@@ -72,15 +71,14 @@ static void gelic_card_rx_irq_off(struct gelic_card *card)
 }
 
 static void gelic_card_get_ether_port_status(struct gelic_card *card,
-					     int inform)
+	int inform)
 {
 	u64 v2;
 	struct net_device *ether_netdev;
 
 	lv1_net_control(bus_id(card), dev_id(card),
-			GELIC_LV1_GET_ETH_PORT_STATUS,
-			GELIC_LV1_VLAN_TX_ETHERNET_0, 0, 0,
-			&card->ether_port_status, &v2);
+		GELIC_LV1_GET_ETH_PORT_STATUS, GELIC_LV1_VLAN_TX_ETHERNET_0, 0,
+		0, &card->ether_port_status, &v2);
 
 	if (inform) {
 		ether_netdev = card->netdev[GELIC_PORT_ETHERNET_0];
@@ -100,7 +98,8 @@ static void gelic_card_get_ether_port_status(struct gelic_card *card,
 static enum gelic_descr_dma_status
 gelic_descr_get_status(struct gelic_descr *descr)
 {
-	return be32_to_cpu(descr->hw_regs.dmac_cmd_status) & GELIC_DESCR_DMA_STAT_MASK;
+	return be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
+		GELIC_DESCR_DMA_STAT_MASK;
 }
 
 static int gelic_card_set_link_mode(struct gelic_card *card, int mode)
@@ -110,8 +109,9 @@ static int gelic_card_set_link_mode(struct gelic_card *card, int mode)
 	u64 v1, v2;
 
 	status = lv1_net_control(bus_id(card), dev_id(card),
-				 GELIC_LV1_SET_NEGOTIATION_MODE,
-				 GELIC_LV1_PHY_ETHERNET_0, mode, 0, &v1, &v2);
+		GELIC_LV1_SET_NEGOTIATION_MODE, GELIC_LV1_PHY_ETHERNET_0, mode,
+		0, &v1, &v2);
+
 	if (status) {
 		dev_err(dev, "%s:%d: Failed setting negotiation mode: %d\n",
 			__func__, __LINE__, status);
@@ -138,7 +138,8 @@ static void gelic_card_disable_txdmac(struct gelic_card *card)
 	status = lv1_net_stop_tx_dma(bus_id(card), dev_id(card));
 
 	if (status) {
-		dev_err(dev, "lv1_net_stop_tx_dma failed, status=%d\n", status);
+		dev_err(dev, "%s:%d: lv1_net_stop_tx_dma failed: %d\n",
+			__func__, __LINE__, status);
 	}
 }
 
@@ -166,10 +167,11 @@ static void gelic_card_enable_rxdmac(struct gelic_card *card)
 	}
 #endif
 	status = lv1_net_start_rx_dma(bus_id(card), dev_id(card),
-				card->rx_chain.head->link.cpu_addr, 0);
+		card->rx_chain.head->link.cpu_addr, 0);
+
 	if (status) {
-		dev_err(dev, "lv1_net_start_rx_dma failed, status=%d\n",
-			status);
+		dev_err(dev, "%s:%d: lv1_net_start_rx_dma failed: %d\n",
+			__func__, __LINE__, status);
 	}
 }
 
@@ -189,7 +191,8 @@ static void gelic_card_disable_rxdmac(struct gelic_card *card)
 	status = lv1_net_stop_rx_dma(bus_id(card), dev_id(card));
 
 	if (status) {
-		dev_err(dev, "lv1_net_stop_rx_dma failed, %d\n", status);
+		dev_err(dev, "%s:%d: lv1_net_stop_rx_dma failed: %d\n",
+			__func__, __LINE__, status);
 	}
 }
 
@@ -202,11 +205,11 @@ static void gelic_card_disable_rxdmac(struct gelic_card *card)
  * in the status
  */
 static void gelic_descr_set_status(struct gelic_descr *descr,
-				   enum gelic_descr_dma_status status)
+	enum gelic_descr_dma_status status)
 {
 	descr->hw_regs.dmac_cmd_status = cpu_to_be32(status |
-			(be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
-			 ~GELIC_DESCR_DMA_STAT_MASK));
+		(be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
+		~GELIC_DESCR_DMA_STAT_MASK));
 	/*
 	 * dma_cmd_status field is used to indicate whether the descriptor
 	 * is valid or not.
@@ -226,14 +229,14 @@ static void gelic_descr_set_status(struct gelic_descr *descr,
  * and re-initialize the hardware chain for later use
  */
 static void gelic_card_reset_chain(struct gelic_card *card,
-				   struct gelic_descr_chain *chain,
-				   struct gelic_descr *start_descr)
+	struct gelic_descr_chain *chain, struct gelic_descr *start_descr)
 {
 	struct gelic_descr *descr;
 
 	for (descr = start_descr; start_descr != descr->next; descr++) {
 		gelic_descr_set_status(descr, GELIC_DESCR_DMA_CARDOWNED);
-		descr->hw_regs.next_descr_addr = cpu_to_be32(descr->next->link.cpu_addr);
+		descr->hw_regs.next_descr_addr =
+			cpu_to_be32(descr->next->link.cpu_addr);
 	}
 
 	chain->head = start_descr;
@@ -249,11 +252,8 @@ void gelic_card_up(struct gelic_card *card)
 	mutex_lock(&card->updown_lock);
 	if (atomic_inc_return(&card->users) == 1) {
 		dev_dbg(dev, "%s:%d: Starting...\n", __func__, __LINE__);
-		/* enable irq */
 		gelic_card_set_irq_mask(card, card->irq_mask);
-		/* start rx */
 		gelic_card_enable_rxdmac(card);
-
 		napi_enable(&card->napi);
 	}
 	mutex_unlock(&card->updown_lock);
@@ -269,17 +269,14 @@ void gelic_card_down(struct gelic_card *card)
 		dev_dbg(dev, "%s:%d: Stopping...\n", __func__, __LINE__);
 		napi_disable(&card->napi);
 		/*
-		 * Disable irq. Wireless interrupts will
-		 * be disabled later if any
+		 * Disable irq. Wireless interrupts will be disabled later.
 		 */
 		mask = card->irq_mask & (GELIC_CARD_WLAN_EVENT_RECEIVED |
-					 GELIC_CARD_WLAN_COMMAND_COMPLETED);
+			GELIC_CARD_WLAN_COMMAND_COMPLETED);
 		gelic_card_set_irq_mask(card, mask);
-		/* stop rx */
 		gelic_card_disable_rxdmac(card);
 		gelic_card_reset_chain(card, &card->rx_chain,
-				       card->descr + GELIC_NET_TX_DESCRIPTORS);
-		/* stop tx */
+			card->descr + GELIC_NET_TX_DESCRIPTORS);
 		gelic_card_disable_txdmac(card);
 	}
 	mutex_unlock(&card->updown_lock);
@@ -291,12 +288,13 @@ void gelic_card_down(struct gelic_card *card)
  * @descr_in: address of desc
  */
 static void gelic_card_free_chain(struct gelic_card *card,
-				  struct gelic_descr *descr_in)
+	struct gelic_descr *descr_in)
 {
 	struct device *dev = ctodev(card);
 	struct gelic_descr *descr;
 
-	for (descr = descr_in; descr && descr->link.cpu_addr; descr = descr->next) {
+	for (descr = descr_in; descr && descr->link.cpu_addr;
+		descr = descr->next) {
 		dma_unmap_single(dev, descr->link.cpu_addr, descr->link.size,
 			DMA_BIDIRECTIONAL);
 		descr->link.cpu_addr = 0;
@@ -316,8 +314,8 @@ static void gelic_card_free_chain(struct gelic_card *card,
  * returns 0 on success, <0 on failure
  */
 static int gelic_card_init_chain(struct gelic_card *card,
-				 struct gelic_descr_chain *chain,
-				 struct gelic_descr *start_descr, int no)
+	struct gelic_descr_chain *chain, struct gelic_descr *start_descr,
+	int no)
 {
 	int i;
 	struct gelic_descr *descr;
@@ -326,7 +324,6 @@ static int gelic_card_init_chain(struct gelic_card *card,
 	descr = start_descr;
 	memset(descr, 0, sizeof(*descr) * no);
 
-	/* set up the hardware pointers in each descriptor */
 	for (i = 0; i < no; i++, descr++) {
 		descr->link.size = sizeof(struct gelic_hw_regs);
 		gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
@@ -340,14 +337,14 @@ static int gelic_card_init_chain(struct gelic_card *card,
 		descr->next = descr + 1;
 		descr->prev = descr - 1;
 	}
-	/* make them as ring */
+
 	(descr - 1)->next = start_descr;
 	start_descr->prev = (descr - 1);
 
-	/* chain bus addr of hw descriptor */
 	descr = start_descr;
 	for (i = 0; i < no; i++, descr++) {
-		descr->hw_regs.next_descr_addr = cpu_to_be32(descr->next->link.cpu_addr);
+		descr->hw_regs.next_descr_addr =
+			cpu_to_be32(descr->next->link.cpu_addr);
 	}
 
 	chain->head = start_descr;
@@ -378,7 +375,7 @@ static int gelic_card_init_chain(struct gelic_card *card,
  * Activate the descriptor state-wise
  */
 static int gelic_descr_prepare_rx(struct gelic_card *card,
-				  struct gelic_descr *descr)
+	struct gelic_descr *descr)
 {
 	struct device *dev = ctodev(card);
 	int offset;
@@ -439,14 +436,13 @@ static void gelic_card_release_rx_chain(struct gelic_card *card)
 	do {
 		if (descr->skb) {
 			dma_unmap_single(dev,
-					 be32_to_cpu(descr->hw_regs.payload.dev_addr),
-					 descr->skb->len,
-					 DMA_FROM_DEVICE);
+				be32_to_cpu(descr->hw_regs.payload.dev_addr),
+				descr->skb->len, DMA_FROM_DEVICE);
 			descr->hw_regs.payload.dev_addr = 0;
 			dev_kfree_skb_any(descr->skb);
 			descr->skb = NULL;
 			gelic_descr_set_status(descr,
-					       GELIC_DESCR_DMA_NOT_IN_USE);
+				GELIC_DESCR_DMA_NOT_IN_USE);
 		}
 		descr = descr->next;
 	} while (descr != card->rx_chain.head);
@@ -504,15 +500,16 @@ static int gelic_card_alloc_rx_skbs(struct gelic_card *card)
  * releases a used tx descriptor (unmapping, freeing of skb)
  */
 static void gelic_descr_release_tx(struct gelic_card *card,
-				       struct gelic_descr *descr)
+	struct gelic_descr *descr)
 {
 	struct sk_buff *skb = descr->skb;
 	struct device *dev = ctodev(card);
 
-	BUG_ON(!(be32_to_cpu(descr->hw_regs.data_status) & GELIC_DESCR_TX_TAIL));
+	BUG_ON(!(be32_to_cpu(descr->hw_regs.data_status) &
+		GELIC_DESCR_TX_TAIL));
 
-	dma_unmap_single(dev, be32_to_cpu(descr->hw_regs.payload.dev_addr), skb->len,
-			 DMA_TO_DEVICE);
+	dma_unmap_single(dev, be32_to_cpu(descr->hw_regs.payload.dev_addr),
+		skb->len, DMA_TO_DEVICE);
 	dev_kfree_skb_any(skb);
 
 	descr->hw_regs.payload.dev_addr = 0;
@@ -524,7 +521,6 @@ static void gelic_descr_release_tx(struct gelic_card *card,
 	descr->hw_regs.data_error = 0;
 	descr->skb = NULL;
 
-	/* set descr status */
 	gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
 }
 
@@ -580,19 +576,19 @@ static void gelic_card_release_tx_chain(struct gelic_card *card, int stop)
 			}
 			break;
 
-		case GELIC_DESCR_DMA_CARDOWNED:
-			/* pending tx request */
 		default:
-			/* any other value (== GELIC_DESCR_DMA_NOT_IN_USE) */
-			if (!stop)
+			if (!stop) {
 				goto out;
+			}
 		}
+
 		gelic_descr_release_tx(card, tx_chain->tail);
-		release ++;
+		release++;
 	}
 out:
-	if (!stop && release)
+	if (!stop && release) {
 		gelic_card_wake_queues(card);
+	}
 }
 
 /**
@@ -613,18 +609,18 @@ void gelic_net_set_multi(struct net_device *netdev)
 	u64 addr;
 	int status;
 
-	/* clear all multicast address */
 	status = lv1_net_remove_multicast_address(bus_id(card), dev_id(card),
-						  0, 1);
+		0, 1);
+
 	if (status) {
 		dev_err(dev,
 			"%s:%d: lv1_net_remove_multicast_address failed %d\n",
 			__func__, __LINE__, status);
 	}
 
-	/* set broadcast address */
 	status = lv1_net_add_multicast_address(bus_id(card), dev_id(card),
-					       GELIC_NET_BROADCAST_ADDR, 0);
+		GELIC_NET_BROADCAST_ADDR, 0);
+
 	if (status) {
 		dev_err(dev,
 			"%s:%d: lv1_net_add_multicast_address failed, %d\n",
@@ -634,8 +630,8 @@ void gelic_net_set_multi(struct net_device *netdev)
 	if ((netdev->flags & IFF_ALLMULTI) ||
 	    (netdev_mc_count(netdev) > GELIC_NET_MC_COUNT_MAX)) {
 		status = lv1_net_add_multicast_address(bus_id(card),
-						       dev_id(card),
-						       0, 1);
+			dev_id(card), 0, 1);
+
 		if (status) {
 			dev_err(dev,
 				"%s:%d: lv1_net_add_multicast_address failed, %d\n",
@@ -644,7 +640,6 @@ void gelic_net_set_multi(struct net_device *netdev)
 		return;
 	}
 
-	/* set multicast addresses */
 	netdev_for_each_mc_addr(ha, netdev) {
 		addr = 0;
 		p = ha->addr;
@@ -653,8 +648,8 @@ void gelic_net_set_multi(struct net_device *netdev)
 			addr |= *p++;
 		}
 		status = lv1_net_add_multicast_address(bus_id(card),
-						       dev_id(card),
-						       addr, 0);
+			dev_id(card), addr, 0);
+
 		if (status) {
 			dev_err(dev,
 				"%s:%d: lv1_net_add_multicast_address failed, %d\n",
@@ -698,8 +693,8 @@ gelic_card_get_next_tx_descr(struct gelic_card *card)
 		return NULL;
 	/*  see if the next descriptor is free */
 	if (card->tx_chain.tail != card->tx_chain.head->next &&
-	    gelic_descr_get_status(card->tx_chain.head) ==
-	    GELIC_DESCR_DMA_NOT_IN_USE)
+		gelic_descr_get_status(card->tx_chain.head) ==
+			GELIC_DESCR_DMA_NOT_IN_USE)
 		return card->tx_chain.head;
 	else
 		return NULL;
@@ -716,12 +711,12 @@ gelic_card_get_next_tx_descr(struct gelic_card *card)
  * has executed before.
  */
 static void gelic_descr_set_tx_cmdstat(struct gelic_descr *descr,
-				       struct sk_buff *skb)
+	struct sk_buff *skb)
 {
 	if (skb->ip_summed != CHECKSUM_PARTIAL)
 		descr->hw_regs.dmac_cmd_status =
 			cpu_to_be32(GELIC_DESCR_DMA_CMD_NO_CHKSUM |
-				    GELIC_DESCR_TX_DMA_FRAME_TAIL);
+				GELIC_DESCR_TX_DMA_FRAME_TAIL);
 	else {
 		/* is packet ip?
 		 * if yes: tcp? udp? */
@@ -747,14 +742,15 @@ static void gelic_descr_set_tx_cmdstat(struct gelic_descr *descr,
 }
 
 static struct sk_buff *gelic_put_vlan_tag(struct sk_buff *skb,
-						 unsigned short tag)
+	unsigned short tag)
 {
 	struct vlan_ethhdr *veth;
 	static unsigned int c;
 
 	if (skb_headroom(skb) < VLAN_HLEN) {
 		struct sk_buff *sk_tmp = skb;
-		pr_debug("%s: hd=%d c=%ud\n", __func__, skb_headroom(skb), c);
+		pr_debug("%s:%d: hd=%d c=%ud\n", __func__, __LINE__,
+			skb_headroom(skb), c);
 		skb = skb_realloc_headroom(sk_tmp, VLAN_HLEN);
 		if (!skb)
 			return NULL;
@@ -781,8 +777,7 @@ static struct sk_buff *gelic_put_vlan_tag(struct sk_buff *skb,
  *
  */
 static int gelic_descr_prepare_tx(struct gelic_card *card,
-				  struct gelic_descr *descr,
-				  struct sk_buff *skb)
+	struct gelic_descr *descr, struct sk_buff *skb)
 {
 	struct device *dev = ctodev(card);
 	dma_addr_t cpu_addr;
@@ -792,10 +787,11 @@ static int gelic_descr_prepare_tx(struct gelic_card *card,
 		enum gelic_port_type type;
 
 		type = netdev_port(skb->dev)->type;
-		skb_tmp = gelic_put_vlan_tag(skb,
-					     card->vlan[type].tx);
-		if (!skb_tmp)
+		skb_tmp = gelic_put_vlan_tag(skb, card->vlan[type].tx);
+
+		if (!skb_tmp) {
 			return -ENOMEM;
+		}
 		skb = skb_tmp;
 	}
 
@@ -890,7 +886,8 @@ netdev_tx_t gelic_net_xmit(struct sk_buff *skb, struct net_device *netdev)
 	 * link this prepared descriptor to previous one
 	 * to achieve high performance
 	 */
-	descr->prev->hw_regs.next_descr_addr = cpu_to_be32(descr->link.cpu_addr);
+	descr->prev->hw_regs.next_descr_addr =
+		cpu_to_be32(descr->link.cpu_addr);
 	/*
 	 * as hardware descriptor is modified in the above lines,
 	 * ensure that the hardware sees it
@@ -926,9 +923,7 @@ netdev_tx_t gelic_net_xmit(struct sk_buff *skb, struct net_device *netdev)
  * stack. The descriptor state is not changed.
  */
 static void gelic_net_pass_skb_up(struct gelic_descr *descr,
-				  struct gelic_card *card,
-				  struct net_device *netdev)
-
+	struct gelic_card *card, struct net_device *netdev)
 {
 	struct device *dev = ctodev(card);
 	struct sk_buff *skb = descr->skb;
@@ -938,19 +933,18 @@ static void gelic_net_pass_skb_up(struct gelic_descr *descr,
 	data_error = be32_to_cpu(descr->hw_regs.data_error);
 	/* unmap skb buffer */
 	dma_unmap_single(dev, be32_to_cpu(descr->hw_regs.payload.dev_addr),
-			 GELIC_NET_MAX_MTU,
-			 DMA_FROM_DEVICE);
+			 GELIC_NET_MAX_MTU, DMA_FROM_DEVICE);
 
-	skb_put(skb, be32_to_cpu(descr->hw_regs.valid_size)?
+	skb_put(skb, be32_to_cpu(descr->hw_regs.valid_size) ?
 		be32_to_cpu(descr->hw_regs.valid_size) :
 		be32_to_cpu(descr->hw_regs.result_size));
 
 	if (!descr->hw_regs.valid_size) {
 		dev_err(dev, "%s:%d: buffer full %x %x %x\n", __func__,
 			__LINE__,
-			 be32_to_cpu(descr->hw_regs.result_size),
-			 be32_to_cpu(descr->hw_regs.payload.size),
-			 be32_to_cpu(descr->hw_regs.dmac_cmd_status));
+			be32_to_cpu(descr->hw_regs.result_size),
+			be32_to_cpu(descr->hw_regs.payload.size),
+			be32_to_cpu(descr->hw_regs.dmac_cmd_status));
 	}
 
 	descr->skb = NULL;
@@ -1028,8 +1022,8 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 		netdev = card->netdev[GELIC_PORT_ETHERNET_0];
 
 	if ((status == GELIC_DESCR_DMA_RESPONSE_ERROR) ||
-	    (status == GELIC_DESCR_DMA_PROTECTION_ERROR) ||
-	    (status == GELIC_DESCR_DMA_FORCE_END)) {
+		(status == GELIC_DESCR_DMA_PROTECTION_ERROR) ||
+		(status == GELIC_DESCR_DMA_FORCE_END)) {
 		dev_info(dev, "%s:%d: dropping RX descriptor with state %x\n",
 			__func__, __LINE__, status);
 		netdev->stats.rx_dropped++;
@@ -1064,8 +1058,7 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 refill:
 
 	/* is the current descriptor terminated with next_descr == NULL? */
-	dmac_chain_ended =
-		be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
+	dmac_chain_ended = be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
 		GELIC_DESCR_RX_DMA_CHAIN_END;
 	/*
 	 * So that always DMAC can see the end
@@ -1089,15 +1082,17 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	/*
 	 * Set this descriptor the end of the chain.
 	 */
-	descr->prev->hw_regs.next_descr_addr = cpu_to_be32(descr->link.cpu_addr);
+	descr->prev->hw_regs.next_descr_addr =
+		cpu_to_be32(descr->link.cpu_addr);
 
 	/*
 	 * If dmac chain was met, DMAC stopped.
 	 * thus re-enable it
 	 */
 
-	if (dmac_chain_ended)
+	if (dmac_chain_ended) {
 		gelic_card_enable_rxdmac(card);
+	}
 
 	return 1;
 }
@@ -1116,9 +1111,9 @@ static int gelic_net_poll(struct napi_struct *napi, int budget)
 	int packets_done = 0;
 
 	while (packets_done < budget) {
-		if (!gelic_card_decode_one_descr(card))
+		if (!gelic_card_decode_one_descr(card)) {
 			break;
-
+		}
 		packets_done++;
 	}
 
@@ -1126,6 +1121,7 @@ static int gelic_net_poll(struct napi_struct *napi, int budget)
 		napi_complete_done(napi, packets_done);
 		gelic_card_rx_irq_on(card);
 	}
+
 	return packets_done;
 }
 
@@ -1140,8 +1136,9 @@ static irqreturn_t gelic_card_interrupt(int irq, void *ptr)
 
 	status = card->irq_status;
 
-	if (!status)
+	if (!status) {
 		return IRQ_NONE;
+	}
 
 	status &= card->irq_mask;
 
@@ -1160,13 +1157,15 @@ static irqreturn_t gelic_card_interrupt(int irq, void *ptr)
 	}
 
 	/* ether port status changed */
-	if (status & GELIC_CARD_PORT_STATUS_CHANGED)
+	if (status & GELIC_CARD_PORT_STATUS_CHANGED) {
 		gelic_card_get_ether_port_status(card, 1);
+	}
 
 #ifdef CONFIG_GELIC_WIRELESS
 	if (status & (GELIC_CARD_WLAN_EVENT_RECEIVED |
-		      GELIC_CARD_WLAN_COMMAND_COMPLETED))
+		GELIC_CARD_WLAN_COMMAND_COMPLETED)) {
 		gelic_wl_interrupt(card->netdev[GELIC_PORT_WIRELESS], status);
+	}
 #endif
 
 	return IRQ_HANDLED;
@@ -1211,14 +1210,14 @@ int gelic_net_open(struct net_device *netdev)
 }
 
 void gelic_net_get_drvinfo(struct net_device *netdev,
-			   struct ethtool_drvinfo *info)
+	struct ethtool_drvinfo *info)
 {
 	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
 	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static int gelic_ether_get_link_ksettings(struct net_device *netdev,
-					  struct ethtool_link_ksettings *cmd)
+	struct ethtool_link_ksettings *cmd)
 {
 	struct gelic_card *card = netdev_card(netdev);
 	struct device *dev = ctodev(card);
@@ -1248,10 +1247,12 @@ static int gelic_ether_get_link_ksettings(struct net_device *netdev,
 	}
 
 	supported = SUPPORTED_TP | SUPPORTED_Autoneg |
-			SUPPORTED_10baseT_Half | SUPPORTED_10baseT_Full |
-			SUPPORTED_100baseT_Half | SUPPORTED_100baseT_Full |
-			SUPPORTED_1000baseT_Full;
+		SUPPORTED_10baseT_Half | SUPPORTED_10baseT_Full |
+		SUPPORTED_100baseT_Half | SUPPORTED_100baseT_Full |
+		SUPPORTED_1000baseT_Full;
+
 	advertising = supported;
+
 	if (card->link_mode & GELIC_LV1_ETHER_AUTO_NEG) {
 		cmd->base.autoneg = AUTONEG_ENABLE;
 	} else {
@@ -1261,16 +1262,15 @@ static int gelic_ether_get_link_ksettings(struct net_device *netdev,
 	cmd->base.port = PORT_TP;
 
 	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.supported,
-						supported);
+		supported);
 	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.advertising,
-						advertising);
+		advertising);
 
 	return 0;
 }
 
-static int
-gelic_ether_set_link_ksettings(struct net_device *netdev,
-			       const struct ethtool_link_ksettings *cmd)
+static int gelic_ether_set_link_ksettings(struct net_device *netdev,
+	const struct ethtool_link_ksettings *cmd)
 {
 	struct gelic_card *card = netdev_card(netdev);
 	struct device *dev = ctodev(card);
@@ -1293,6 +1293,7 @@ gelic_ether_set_link_ksettings(struct net_device *netdev,
 		default:
 			return -EINVAL;
 		}
+
 		if (cmd->base.duplex == DUPLEX_FULL) {
 			mode |= GELIC_LV1_ETHER_FULL_DUPLEX;
 		} else if (cmd->base.speed == SPEED_1000) {
@@ -1305,25 +1306,28 @@ gelic_ether_set_link_ksettings(struct net_device *netdev,
 
 	ret = gelic_card_set_link_mode(card, mode);
 
-	if (ret)
+	if (ret) {
 		return ret;
+	}
 
 	return 0;
 }
 
 static void gelic_net_get_wol(struct net_device *netdev,
-			      struct ethtool_wolinfo *wol)
+	struct ethtool_wolinfo *wol)
 {
-	if (0 <= ps3_compare_firmware_version(2, 2, 0))
+	if (ps3_compare_firmware_version(2, 2, 0) >= 0) {
 		wol->supported = WAKE_MAGIC;
-	else
+	} else {
 		wol->supported = 0;
+	}
 
 	wol->wolopts = ps3_sys_manager_get_wol() ? wol->supported : 0;
 	memset(&wol->sopass, 0, sizeof(wol->sopass));
 }
+
 static int gelic_net_set_wol(struct net_device *netdev,
-			     struct ethtool_wolinfo *wol)
+	struct ethtool_wolinfo *wol)
 {
 	struct gelic_card *card = netdev_card(netdev);
 	struct device *dev = ctodev(card);
@@ -1331,56 +1335,56 @@ static int gelic_net_set_wol(struct net_device *netdev,
 	u64 v1, v2;
 
 	if (ps3_compare_firmware_version(2, 2, 0) < 0 ||
-	    !capable(CAP_NET_ADMIN))
+		!capable(CAP_NET_ADMIN)) {
 		return -EPERM;
+	}
 
-	if (wol->wolopts & ~WAKE_MAGIC)
+	if (wol->wolopts & ~WAKE_MAGIC) {
 		return -EINVAL;
+	}
 
 	if (wol->wolopts & WAKE_MAGIC) {
 		status = lv1_net_control(bus_id(card), dev_id(card),
-					 GELIC_LV1_SET_WOL,
-					 GELIC_LV1_WOL_MAGIC_PACKET,
-					 0, GELIC_LV1_WOL_MP_ENABLE,
-					 &v1, &v2);
+			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_MAGIC_PACKET, 0,
+			GELIC_LV1_WOL_MP_ENABLE, &v1, &v2);
+
 		if (status) {
 			dev_dbg(dev, "%s:%d: Enabling WOL failed: %d\n",
 				__func__, __LINE__, status);
 			status = -EIO;
 			goto done;
 		}
+
 		status = lv1_net_control(bus_id(card), dev_id(card),
-					 GELIC_LV1_SET_WOL,
-					 GELIC_LV1_WOL_ADD_MATCH_ADDR,
-					 0, GELIC_LV1_WOL_MATCH_ALL,
-					 &v1, &v2);
-		if (!status)
+			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_ADD_MATCH_ADDR, 0,
+			GELIC_LV1_WOL_MATCH_ALL, &v1, &v2);
+
+		if (!status) {
 			ps3_sys_manager_set_wol(1);
-		else {
+		} else {
 			dev_dbg(dev, "%s:%d: Enabling WOL filter failed: %d\n",
 				__func__, __LINE__, status);
 			status = -EIO;
 		}
 	} else {
 		status = lv1_net_control(bus_id(card), dev_id(card),
-					 GELIC_LV1_SET_WOL,
-					 GELIC_LV1_WOL_MAGIC_PACKET,
-					 0, GELIC_LV1_WOL_MP_DISABLE,
-					 &v1, &v2);
+			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_MAGIC_PACKET,
+			0, GELIC_LV1_WOL_MP_DISABLE, &v1, &v2);
+
 		if (status) {
 			dev_dbg(dev, "%s:%d: Disabling WOL failed: %d\n",
 				__func__, __LINE__, status);
 			status = -EIO;
 			goto done;
 		}
+
 		status = lv1_net_control(bus_id(card), dev_id(card),
-					 GELIC_LV1_SET_WOL,
-					 GELIC_LV1_WOL_DELETE_MATCH_ADDR,
-					 0, GELIC_LV1_WOL_MATCH_ALL,
-					 &v1, &v2);
-		if (!status)
+			GELIC_LV1_SET_WOL, GELIC_LV1_WOL_DELETE_MATCH_ADDR,
+			0, GELIC_LV1_WOL_MATCH_ALL, &v1, &v2);
+
+		if (!status) {
 			ps3_sys_manager_set_wol(0);
-		else {
+		} else {
 			dev_dbg(dev, "%s:%d: Removing WOL filter failed: %d\n",
 				__func__, __LINE__, status);
 			status = -EIO;
@@ -1415,8 +1419,9 @@ static void gelic_net_tx_timeout_task(struct work_struct *work)
 
 	dev_info(dev, "%s:%d: Timed out. Restarting...\n", __func__, __LINE__);
 
-	if (!(netdev->flags & IFF_UP))
+	if (!(netdev->flags & IFF_UP)) {
 		goto out;
+	}
 
 	netif_device_detach(netdev);
 	gelic_net_stop(netdev);
@@ -1441,10 +1446,12 @@ void gelic_net_tx_timeout(struct net_device *netdev, unsigned int txqueue)
 
 	card = netdev_card(netdev);
 	atomic_inc(&card->tx_timeout_task_counter);
-	if (netdev->flags & IFF_UP)
+
+	if (netdev->flags & IFF_UP) {
 		schedule_work(&card->tx_timeout_task);
-	else
+	} else {
 		atomic_dec(&card->tx_timeout_task_counter);
+	}
 }
 
 static const struct net_device_ops gelic_netdevice_ops = {
@@ -1468,7 +1475,7 @@ static const struct net_device_ops gelic_netdevice_ops = {
  * fills out function pointers in the net_device structure
  */
 static void gelic_ether_setup_netdev_ops(struct net_device *netdev,
-					 struct napi_struct *napi)
+	struct napi_struct *napi)
 {
 	netdev->watchdog_timeo = GELIC_NET_WATCHDOG_TIMEOUT;
 	/* NAPI */
@@ -1494,20 +1501,23 @@ int gelic_net_setup_netdev(struct net_device *netdev, struct gelic_card *card)
 	u64 v1, v2;
 
 	netdev->hw_features = NETIF_F_IP_CSUM | NETIF_F_RXCSUM;
-
 	netdev->features = NETIF_F_IP_CSUM;
-	if (GELIC_CARD_RX_CSUM_DEFAULT)
+
+	if (GELIC_CARD_RX_CSUM_DEFAULT) {
 		netdev->features |= NETIF_F_RXCSUM;
+	}
 
 	status = lv1_net_control(bus_id(card), dev_id(card),
-				 GELIC_LV1_GET_MAC_ADDRESS,
-				 0, 0, 0, &v1, &v2);
+		GELIC_LV1_GET_MAC_ADDRESS, 0, 0, 0, &v1, &v2);
+
 	v1 <<= 16;
+
 	if (status || !is_valid_ether_addr((u8 *)&v1)) {
 		dev_dbg(dev, "%s:%d: lv1_net_control GET_MAC_ADDR failed: %d\n",
 			__func__, __LINE__, status);
 		return -EINVAL;
 	}
+
 	memcpy(netdev->dev_addr, &v1, ETH_ALEN);
 
 	if (card->vlan_required) {
@@ -1557,34 +1567,32 @@ static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
 	 */
 	BUILD_BUG_ON(offsetof(struct gelic_card, irq_status) % 8);
 	BUILD_BUG_ON(offsetof(struct gelic_card, descr) % 32);
-	alloc_size =
-		sizeof(struct gelic_card) +
+	alloc_size = sizeof(struct gelic_card) +
 		sizeof(struct gelic_descr) * GELIC_NET_RX_DESCRIPTORS +
 		sizeof(struct gelic_descr) * GELIC_NET_TX_DESCRIPTORS +
 		GELIC_ALIGN - 1;
 
 	p  = kzalloc(alloc_size, GFP_KERNEL);
-	if (!p)
+
+	if (!p) {
 		return NULL;
+	}
+
 	card = PTR_ALIGN(p, GELIC_ALIGN);
 	card->unalign = p;
 
-	/*
-	 * alloc netdev
-	 */
 	*netdev = alloc_etherdev(sizeof(struct gelic_port));
+
 	if (!*netdev) {
 		kfree(card->unalign);
 		return NULL;
 	}
 	port = netdev_priv(*netdev);
 
-	/* gelic_port */
 	port->netdev = *netdev;
 	port->card = card;
 	port->type = GELIC_PORT_ETHERNET_0;
 
-	/* gelic_card */
 	card->netdev[GELIC_PORT_ETHERNET_0] = *netdev;
 
 	INIT_WORK(&card->tx_timeout_task, gelic_net_tx_timeout_task);
@@ -1619,9 +1627,9 @@ static void gelic_card_get_vlan_info(struct gelic_card *card)
 	for (i = 0; i < ARRAY_SIZE(vlan_id_ix); i++) {
 		/* tx tag */
 		status = lv1_net_control(bus_id(card), dev_id(card),
-					 GELIC_LV1_GET_VLAN_ID,
-					 vlan_id_ix[i].tx,
-					 0, 0, &v1, &v2);
+			GELIC_LV1_GET_VLAN_ID, vlan_id_ix[i].tx, 0, 0, &v1,
+			&v2);
+
 		if (status || !v1) {
 			if (status != LV1_NO_ENTRY) {
 				dev_dbg(dev,
@@ -1637,9 +1645,9 @@ static void gelic_card_get_vlan_info(struct gelic_card *card)
 
 		/* rx tag */
 		status = lv1_net_control(bus_id(card), dev_id(card),
-					 GELIC_LV1_GET_VLAN_ID,
-					 vlan_id_ix[i].rx,
-					 0, 0, &v1, &v2);
+			GELIC_LV1_GET_VLAN_ID, vlan_id_ix[i].rx, 0, 0, &v1,
+			&v2);
+
 		if (status || !v1) {
 			if (status != LV1_NO_ENTRY) {
 				dev_dbg(dev,
@@ -1651,6 +1659,7 @@ static void gelic_card_get_vlan_info(struct gelic_card *card)
 			card->vlan[i].rx = 0;
 			continue;
 		}
+
 		card->vlan[i].rx = (u16)v1;
 
 		dev_dbg(dev, "%s:%d: vlan_id[%d] tx=%02x rx=%02x\n", __func__,
@@ -1672,6 +1681,7 @@ static void gelic_card_get_vlan_info(struct gelic_card *card)
 	dev_dbg(dev, "%s:%d: internal vlan %s\n", __func__, __LINE__,
 		card->vlan_required ? "enabled" : "disabled");
 }
+
 /*
  * ps3_gelic_driver_probe - add a device to the control of this driver
  */
@@ -1703,27 +1713,24 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 		goto fail_dma_region;
 	}
 
-	/* alloc card/netdevice */
 	card = gelic_alloc_card_net(&netdev);
+
 	if (!card) {
 		dev_info(dev, "%s:%d: gelic_net_alloc_card failed.\n", __func__,
 			__LINE__);
 		result = -ENOMEM;
 		goto fail_alloc_card;
 	}
+
 	ps3_system_bus_set_drvdata(sb_dev, card);
 	card->dev = sb_dev;
 
-	/* get internal vlan info */
 	gelic_card_get_vlan_info(card);
 
 	card->link_mode = GELIC_LV1_ETHER_AUTO_NEG;
 
-	/* setup interrupt */
 	result = lv1_net_set_interrupt_status_indicator(bus_id(card),
-							dev_id(card),
-		ps3_mm_phys_to_lpar(__pa(&card->irq_status)),
-		0);
+		dev_id(card), ps3_mm_phys_to_lpar(__pa(&card->irq_status)), 0);
 
 	if (result) {
 		dev_dbg(dev,
@@ -1742,8 +1749,9 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 		result = -EPERM;
 		goto fail_alloc_irq;
 	}
-	result = request_irq(card->irq, gelic_card_interrupt,
-			     0, netdev->name, card);
+
+	result = request_irq(card->irq, gelic_card_interrupt, 0, netdev->name,
+		card);
 
 	if (result) {
 		dev_dbg(dev, "%s:%d: request_irq failed: %d\n",
@@ -1751,22 +1759,24 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 		goto fail_request_irq;
 	}
 
-	/* setup card structure */
 	card->irq_mask = GELIC_CARD_RXINT | GELIC_CARD_TXINT |
 		GELIC_CARD_PORT_STATUS_CHANGED;
 
+	result = gelic_card_init_chain(card, &card->tx_chain, card->descr,
+		GELIC_NET_TX_DESCRIPTORS);
 
-	result = gelic_card_init_chain(card, &card->tx_chain,
-				       card->descr, GELIC_NET_TX_DESCRIPTORS);
-	if (result)
+	if (result) {
 		goto fail_alloc_tx;
+	}
+
 	result = gelic_card_init_chain(card, &card->rx_chain,
-				       card->descr + GELIC_NET_TX_DESCRIPTORS,
-				       GELIC_NET_RX_DESCRIPTORS);
-	if (result)
+		card->descr + GELIC_NET_TX_DESCRIPTORS,
+		GELIC_NET_RX_DESCRIPTORS);
+
+	if (result) {
 		goto fail_alloc_rx;
+	}
 
-	/* head of chain */
 	card->tx_top = card->tx_chain.head;
 	card->rx_top = card->rx_chain.head;
 
@@ -1774,19 +1784,21 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 		__func__, __LINE__, card->rx_top, card->tx_top,
 		sizeof(struct gelic_descr), GELIC_NET_RX_DESCRIPTORS);
 
-	/* allocate rx skbs */
 	result = gelic_card_alloc_rx_skbs(card);
-	if (result)
+
+	if (result) {
 		goto fail_alloc_skbs;
+	}
 
 	spin_lock_init(&card->tx_lock);
 	card->tx_dma_progress = 0;
 
-	/* setup net_device structure */
 	netdev->irq = card->irq;
 	SET_NETDEV_DEV(netdev, dev);
 	gelic_ether_setup_netdev_ops(netdev, &card->napi);
+
 	result = gelic_net_setup_netdev(netdev, card);
+
 	if (result) {
 		dev_err(dev, "%s:%d: setup_netdev failed: %d\n", __func__,
 			__LINE__, result);
@@ -1795,6 +1807,7 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 
 #ifdef CONFIG_GELIC_WIRELESS
 	result = gelic_wl_driver_probe(card);
+
 	if (result) {
 		dev_dbg(dev, "%s:%d: WL init failed\n", __func__, __LINE__);
 		goto fail_setup_netdev;
@@ -1814,9 +1827,8 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 fail_request_irq:
 	ps3_sb_event_receive_port_destroy(sb_dev, card->irq);
 fail_alloc_irq:
-	lv1_net_set_interrupt_status_indicator(bus_id(card),
-					       bus_id(card),
-					       0, 0);
+	lv1_net_set_interrupt_status_indicator(bus_id(card), bus_id(card), 0,
+		0);
 fail_status_indicator:
 	ps3_system_bus_set_drvdata(sb_dev, NULL);
 	kfree(netdev_card(netdev)->unalign);
@@ -1842,20 +1854,16 @@ static void ps3_gelic_driver_remove(struct ps3_system_bus_device *sb_dev)
 
 	dev_dbg(dev, "%s:%d: >\n", __func__, __LINE__);
 
-	/* set auto-negotiation */
 	gelic_card_set_link_mode(card, GELIC_LV1_ETHER_AUTO_NEG);
 
 #ifdef CONFIG_GELIC_WIRELESS
 	gelic_wl_driver_remove(card);
 #endif
-	/* stop interrupt */
 	gelic_card_set_irq_mask(card, 0);
 
-	/* turn off DMA, force end */
 	gelic_card_disable_rxdmac(card);
 	gelic_card_disable_txdmac(card);
 
-	/* release chains */
 	gelic_card_release_tx_chain(card, 1);
 	gelic_card_release_rx_chain(card);
 
@@ -1863,16 +1871,16 @@ static void ps3_gelic_driver_remove(struct ps3_system_bus_device *sb_dev)
 	gelic_card_free_chain(card, card->rx_top);
 
 	netdev0 = card->netdev[GELIC_PORT_ETHERNET_0];
-	/* disconnect event port */
+
 	free_irq(card->irq, card);
 	netdev0->irq = 0;
 	ps3_sb_event_receive_port_destroy(card->dev, card->irq);
 
 	wait_event(card->waitq,
-		   atomic_read(&card->tx_timeout_task_counter) == 0);
+		atomic_read(&card->tx_timeout_task_counter) == 0);
 
-	lv1_net_set_interrupt_status_indicator(bus_id(card), dev_id(card),
-					       0 , 0);
+	lv1_net_set_interrupt_status_indicator(bus_id(card), dev_id(card), 0,
+		0);
 
 	unregister_netdev(netdev0);
 	kfree(netdev_card(netdev0)->unalign);
@@ -1896,14 +1904,14 @@ static struct ps3_system_bus_driver ps3_gelic_driver = {
 	.core.owner = THIS_MODULE,
 };
 
-static int __init ps3_gelic_driver_init (void)
+static int __init ps3_gelic_driver_init(void)
 {
 	return firmware_has_feature(FW_FEATURE_PS3_LV1)
 		? ps3_system_bus_driver_register(&ps3_gelic_driver)
 		: -ENODEV;
 }
 
-static void __exit ps3_gelic_driver_exit (void)
+static void __exit ps3_gelic_driver_exit(void)
 {
 	ps3_system_bus_driver_unregister(&ps3_gelic_driver);
 }
@@ -1912,4 +1920,3 @@ module_init(ps3_gelic_driver_init);
 module_exit(ps3_gelic_driver_exit);
 
 MODULE_ALIAS(PS3_MODULE_ALIAS_GELIC);
-
-- 
2.25.1


