Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75B3D419A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWgyP0hyLz3dVs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:33:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=y9pVA6qf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=y9pVA6qf; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgwK5n2Fz30Cr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:31:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BLe/b4/ttHeOWIbM7cl7gsQ9y7fK2VVZHmYu2jL2IlI=; b=y9pVA6qfSkNDeWDOeZ/MxI6kqo
 UhQhZ5M2rBIJ6mB4UfKS3GpYmkLtUBfY52w3neHHbkbw8oIKEjMpC6HXT6d0bzQgr3iM/ArEwnWe+
 oJTLu/e0C4BPzRx2sF7BO1muzwcJS0jveoB/SAn96tJGvuwr6ZRT/7nmQhWvxOAK1JogeOQR9Q+qD
 gYa06rAdYX6M1JusNj8v6Murnrt4W4bvcTeUffBaTGtfDgMd3PSrhS6zRp2+u40bZfHi3Xnex1DSF
 HboksqFiN1IXIvoxz7VyzMdpAv5SveJd2C4rOxfp74WByn14Nw9nZssY9PwwAQswYgP3kzYRSTbuU
 beFR/mcg==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m71pi-009Bih-PG; Fri, 23 Jul 2021 20:31:46 +0000
Message-Id: <c95aa8e57aca8b3af6893f13f2e03731f8198184.1627068552.git.geoff@infradead.org>
In-Reply-To: <cover.1627068552.git.geoff@infradead.org>
References: <cover.1627068552.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 24 Jul 2021 13:02:14 -0700
Subject: [PATCH v4 01/10] net/ps3_gelic: Add gelic_descr structures
To: David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 23 Jul 2021 20:31:46 +0000
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

In an effort to make the PS3 gelic driver easier to maintain, create two
new structures, struct gelic_hw_regs and struct gelic_chain_link, and
replace the corresponding members of struct gelic_descr with the new
structures.

struct gelic_hw_regs holds the register variables used by the gelic
hardware device.  struct gelic_chain_link holds variables used to manage
the driver's linked list of gelic descr structures.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 133 ++++++++++---------
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  24 ++--
 2 files changed, 82 insertions(+), 75 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 55e652624bd7..cb45571573d7 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -98,7 +98,7 @@ static void gelic_card_get_ether_port_status(struct gelic_card *card,
 static enum gelic_descr_dma_status
 gelic_descr_get_status(struct gelic_descr *descr)
 {
-	return be32_to_cpu(descr->dmac_cmd_status) & GELIC_DESCR_DMA_STAT_MASK;
+	return be32_to_cpu(descr->hw_regs.dmac_cmd_status) & GELIC_DESCR_DMA_STAT_MASK;
 }
 
 static int gelic_card_set_link_mode(struct gelic_card *card, int mode)
@@ -154,13 +154,13 @@ static void gelic_card_enable_rxdmac(struct gelic_card *card)
 		printk(KERN_ERR "%s: status=%x\n", __func__,
 		       be32_to_cpu(card->rx_chain.head->dmac_cmd_status));
 		printk(KERN_ERR "%s: nextphy=%x\n", __func__,
-		       be32_to_cpu(card->rx_chain.head->next_descr_addr));
+		       be32_to_cpu(card->rx_chain.head->hw_regs.next_descr_addr));
 		printk(KERN_ERR "%s: head=%p\n", __func__,
 		       card->rx_chain.head);
 	}
 #endif
 	status = lv1_net_start_rx_dma(bus_id(card), dev_id(card),
-				card->rx_chain.head->bus_addr, 0);
+				card->rx_chain.head->link.cpu_addr, 0);
 	if (status)
 		dev_info(ctodev(card),
 			 "lv1_net_start_rx_dma failed, status=%d\n", status);
@@ -195,8 +195,8 @@ static void gelic_card_disable_rxdmac(struct gelic_card *card)
 static void gelic_descr_set_status(struct gelic_descr *descr,
 				   enum gelic_descr_dma_status status)
 {
-	descr->dmac_cmd_status = cpu_to_be32(status |
-			(be32_to_cpu(descr->dmac_cmd_status) &
+	descr->hw_regs.dmac_cmd_status = cpu_to_be32(status |
+			(be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
 			 ~GELIC_DESCR_DMA_STAT_MASK));
 	/*
 	 * dma_cmd_status field is used to indicate whether the descriptor
@@ -224,13 +224,13 @@ static void gelic_card_reset_chain(struct gelic_card *card,
 
 	for (descr = start_descr; start_descr != descr->next; descr++) {
 		gelic_descr_set_status(descr, GELIC_DESCR_DMA_CARDOWNED);
-		descr->next_descr_addr = cpu_to_be32(descr->next->bus_addr);
+		descr->hw_regs.next_descr_addr = cpu_to_be32(descr->next->link.cpu_addr);
 	}
 
 	chain->head = start_descr;
 	chain->tail = (descr - 1);
 
-	(descr - 1)->next_descr_addr = 0;
+	(descr - 1)->hw_regs.next_descr_addr = 0;
 }
 
 void gelic_card_up(struct gelic_card *card)
@@ -286,10 +286,10 @@ static void gelic_card_free_chain(struct gelic_card *card,
 {
 	struct gelic_descr *descr;
 
-	for (descr = descr_in; descr && descr->bus_addr; descr = descr->next) {
-		dma_unmap_single(ctodev(card), descr->bus_addr,
-				 GELIC_DESCR_SIZE, DMA_BIDIRECTIONAL);
-		descr->bus_addr = 0;
+	for (descr = descr_in; descr && descr->link.cpu_addr; descr = descr->next) {
+		dma_unmap_single(ctodev(card), descr->link.cpu_addr,
+				 descr->link.size, DMA_BIDIRECTIONAL);
+		descr->link.cpu_addr = 0;
 	}
 }
 
@@ -317,13 +317,14 @@ static int gelic_card_init_chain(struct gelic_card *card,
 
 	/* set up the hardware pointers in each descriptor */
 	for (i = 0; i < no; i++, descr++) {
+		descr->link.size = sizeof(struct gelic_hw_regs);
 		gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
-		descr->bus_addr =
+		descr->link.cpu_addr =
 			dma_map_single(ctodev(card), descr,
-				       GELIC_DESCR_SIZE,
+				       descr->link.size,
 				       DMA_BIDIRECTIONAL);
 
-		if (!descr->bus_addr)
+		if (!descr->link.cpu_addr)
 			goto iommu_error;
 
 		descr->next = descr + 1;
@@ -336,22 +337,22 @@ static int gelic_card_init_chain(struct gelic_card *card,
 	/* chain bus addr of hw descriptor */
 	descr = start_descr;
 	for (i = 0; i < no; i++, descr++) {
-		descr->next_descr_addr = cpu_to_be32(descr->next->bus_addr);
+		descr->hw_regs.next_descr_addr = cpu_to_be32(descr->next->link.cpu_addr);
 	}
 
 	chain->head = start_descr;
 	chain->tail = start_descr;
 
 	/* do not chain last hw descriptor */
-	(descr - 1)->next_descr_addr = 0;
+	(descr - 1)->hw_regs.next_descr_addr = 0;
 
 	return 0;
 
 iommu_error:
 	for (i--, descr--; 0 <= i; i--, descr--)
-		if (descr->bus_addr)
-			dma_unmap_single(ctodev(card), descr->bus_addr,
-					 GELIC_DESCR_SIZE,
+		if (descr->link.cpu_addr)
+			dma_unmap_single(ctodev(card), descr->link.cpu_addr,
+					 descr->link.size,
 					 DMA_BIDIRECTIONAL);
 	return -ENOMEM;
 }
@@ -381,25 +382,25 @@ static int gelic_descr_prepare_rx(struct gelic_card *card,
 	 * bit more */
 	descr->skb = dev_alloc_skb(bufsize + GELIC_NET_RXBUF_ALIGN - 1);
 	if (!descr->skb) {
-		descr->buf_addr = 0; /* tell DMAC don't touch memory */
+		descr->hw_regs.payload.dev_addr = 0; /* tell DMAC don't touch memory */
 		return -ENOMEM;
 	}
-	descr->buf_size = cpu_to_be32(bufsize);
-	descr->dmac_cmd_status = 0;
-	descr->result_size = 0;
-	descr->valid_size = 0;
-	descr->data_error = 0;
+	descr->hw_regs.payload.size = cpu_to_be32(bufsize);
+	descr->hw_regs.dmac_cmd_status = 0;
+	descr->hw_regs.result_size = 0;
+	descr->hw_regs.valid_size = 0;
+	descr->hw_regs.data_error = 0;
 
 	offset = ((unsigned long)descr->skb->data) &
 		(GELIC_NET_RXBUF_ALIGN - 1);
 	if (offset)
 		skb_reserve(descr->skb, GELIC_NET_RXBUF_ALIGN - offset);
 	/* io-mmu-map the skb */
-	descr->buf_addr = cpu_to_be32(dma_map_single(ctodev(card),
+	descr->hw_regs.payload.dev_addr = cpu_to_be32(dma_map_single(ctodev(card),
 						     descr->skb->data,
 						     GELIC_NET_MAX_MTU,
 						     DMA_FROM_DEVICE));
-	if (!descr->buf_addr) {
+	if (!descr->hw_regs.payload.dev_addr) {
 		dev_kfree_skb_any(descr->skb);
 		descr->skb = NULL;
 		dev_info(ctodev(card),
@@ -424,10 +425,10 @@ static void gelic_card_release_rx_chain(struct gelic_card *card)
 	do {
 		if (descr->skb) {
 			dma_unmap_single(ctodev(card),
-					 be32_to_cpu(descr->buf_addr),
+					 be32_to_cpu(descr->hw_regs.payload.dev_addr),
 					 descr->skb->len,
 					 DMA_FROM_DEVICE);
-			descr->buf_addr = 0;
+			descr->hw_regs.payload.dev_addr = 0;
 			dev_kfree_skb_any(descr->skb);
 			descr->skb = NULL;
 			gelic_descr_set_status(descr,
@@ -493,19 +494,19 @@ static void gelic_descr_release_tx(struct gelic_card *card,
 {
 	struct sk_buff *skb = descr->skb;
 
-	BUG_ON(!(be32_to_cpu(descr->data_status) & GELIC_DESCR_TX_TAIL));
+	BUG_ON(!(be32_to_cpu(descr->hw_regs.data_status) & GELIC_DESCR_TX_TAIL));
 
-	dma_unmap_single(ctodev(card), be32_to_cpu(descr->buf_addr), skb->len,
+	dma_unmap_single(ctodev(card), be32_to_cpu(descr->hw_regs.payload.dev_addr), skb->len,
 			 DMA_TO_DEVICE);
 	dev_kfree_skb_any(skb);
 
-	descr->buf_addr = 0;
-	descr->buf_size = 0;
-	descr->next_descr_addr = 0;
-	descr->result_size = 0;
-	descr->valid_size = 0;
-	descr->data_status = 0;
-	descr->data_error = 0;
+	descr->hw_regs.payload.dev_addr = 0;
+	descr->hw_regs.payload.size = 0;
+	descr->hw_regs.next_descr_addr = 0;
+	descr->hw_regs.result_size = 0;
+	descr->hw_regs.valid_size = 0;
+	descr->hw_regs.data_status = 0;
+	descr->hw_regs.data_error = 0;
 	descr->skb = NULL;
 
 	/* set descr status */
@@ -698,7 +699,7 @@ static void gelic_descr_set_tx_cmdstat(struct gelic_descr *descr,
 				       struct sk_buff *skb)
 {
 	if (skb->ip_summed != CHECKSUM_PARTIAL)
-		descr->dmac_cmd_status =
+		descr->hw_regs.dmac_cmd_status =
 			cpu_to_be32(GELIC_DESCR_DMA_CMD_NO_CHKSUM |
 				    GELIC_DESCR_TX_DMA_FRAME_TAIL);
 	else {
@@ -706,19 +707,19 @@ static void gelic_descr_set_tx_cmdstat(struct gelic_descr *descr,
 		 * if yes: tcp? udp? */
 		if (skb->protocol == htons(ETH_P_IP)) {
 			if (ip_hdr(skb)->protocol == IPPROTO_TCP)
-				descr->dmac_cmd_status =
+				descr->hw_regs.dmac_cmd_status =
 				cpu_to_be32(GELIC_DESCR_DMA_CMD_TCP_CHKSUM |
 					    GELIC_DESCR_TX_DMA_FRAME_TAIL);
 
 			else if (ip_hdr(skb)->protocol == IPPROTO_UDP)
-				descr->dmac_cmd_status =
+				descr->hw_regs.dmac_cmd_status =
 				cpu_to_be32(GELIC_DESCR_DMA_CMD_UDP_CHKSUM |
 					    GELIC_DESCR_TX_DMA_FRAME_TAIL);
 			else	/*
 				 * the stack should checksum non-tcp and non-udp
 				 * packets on his own: NETIF_F_IP_CSUM
 				 */
-				descr->dmac_cmd_status =
+				descr->hw_regs.dmac_cmd_status =
 				cpu_to_be32(GELIC_DESCR_DMA_CMD_NO_CHKSUM |
 					    GELIC_DESCR_TX_DMA_FRAME_TAIL);
 		}
@@ -763,7 +764,7 @@ static int gelic_descr_prepare_tx(struct gelic_card *card,
 				  struct gelic_descr *descr,
 				  struct sk_buff *skb)
 {
-	dma_addr_t buf;
+	dma_addr_t cpu_addr;
 
 	if (card->vlan_required) {
 		struct sk_buff *skb_tmp;
@@ -777,20 +778,20 @@ static int gelic_descr_prepare_tx(struct gelic_card *card,
 		skb = skb_tmp;
 	}
 
-	buf = dma_map_single(ctodev(card), skb->data, skb->len, DMA_TO_DEVICE);
+	cpu_addr = dma_map_single(ctodev(card), skb->data, skb->len, DMA_TO_DEVICE);
 
-	if (!buf) {
+	if (!cpu_addr) {
 		dev_err(ctodev(card),
 			"dma map 2 failed (%p, %i). Dropping packet\n",
 			skb->data, skb->len);
 		return -ENOMEM;
 	}
 
-	descr->buf_addr = cpu_to_be32(buf);
-	descr->buf_size = cpu_to_be32(skb->len);
+	descr->hw_regs.payload.dev_addr = cpu_to_be32(cpu_addr);
+	descr->hw_regs.payload.size = cpu_to_be32(skb->len);
 	descr->skb = skb;
-	descr->data_status = 0;
-	descr->next_descr_addr = 0; /* terminate hw descr */
+	descr->hw_regs.data_status = 0;
+	descr->hw_regs.next_descr_addr = 0; /* terminate hw descr */
 	gelic_descr_set_tx_cmdstat(descr, skb);
 
 	/* bump free descriptor pointer */
@@ -815,7 +816,7 @@ static int gelic_card_kick_txdma(struct gelic_card *card,
 	if (gelic_descr_get_status(descr) == GELIC_DESCR_DMA_CARDOWNED) {
 		card->tx_dma_progress = 1;
 		status = lv1_net_start_tx_dma(bus_id(card), dev_id(card),
-					      descr->bus_addr, 0);
+					      descr->link.cpu_addr, 0);
 		if (status) {
 			card->tx_dma_progress = 0;
 			dev_info(ctodev(card), "lv1_net_start_txdma failed," \
@@ -868,7 +869,7 @@ netdev_tx_t gelic_net_xmit(struct sk_buff *skb, struct net_device *netdev)
 	 * link this prepared descriptor to previous one
 	 * to achieve high performance
 	 */
-	descr->prev->next_descr_addr = cpu_to_be32(descr->bus_addr);
+	descr->prev->hw_regs.next_descr_addr = cpu_to_be32(descr->link.cpu_addr);
 	/*
 	 * as hardware descriptor is modified in the above lines,
 	 * ensure that the hardware sees it
@@ -881,12 +882,12 @@ netdev_tx_t gelic_net_xmit(struct sk_buff *skb, struct net_device *netdev)
 		 */
 		netdev->stats.tx_dropped++;
 		/* don't trigger BUG_ON() in gelic_descr_release_tx */
-		descr->data_status = cpu_to_be32(GELIC_DESCR_TX_TAIL);
+		descr->hw_regs.data_status = cpu_to_be32(GELIC_DESCR_TX_TAIL);
 		gelic_descr_release_tx(card, descr);
 		/* reset head */
 		card->tx_chain.head = descr;
 		/* reset hw termination */
-		descr->prev->next_descr_addr = 0;
+		descr->prev->hw_regs.next_descr_addr = 0;
 		dev_info(ctodev(card), "%s: kick failure\n", __func__);
 	}
 
@@ -911,21 +912,21 @@ static void gelic_net_pass_skb_up(struct gelic_descr *descr,
 	struct sk_buff *skb = descr->skb;
 	u32 data_status, data_error;
 
-	data_status = be32_to_cpu(descr->data_status);
-	data_error = be32_to_cpu(descr->data_error);
+	data_status = be32_to_cpu(descr->hw_regs.data_status);
+	data_error = be32_to_cpu(descr->hw_regs.data_error);
 	/* unmap skb buffer */
-	dma_unmap_single(ctodev(card), be32_to_cpu(descr->buf_addr),
+	dma_unmap_single(ctodev(card), be32_to_cpu(descr->hw_regs.payload.dev_addr),
 			 GELIC_NET_MAX_MTU,
 			 DMA_FROM_DEVICE);
 
-	skb_put(skb, be32_to_cpu(descr->valid_size)?
-		be32_to_cpu(descr->valid_size) :
-		be32_to_cpu(descr->result_size));
-	if (!descr->valid_size)
+	skb_put(skb, be32_to_cpu(descr->hw_regs.valid_size)?
+		be32_to_cpu(descr->hw_regs.valid_size) :
+		be32_to_cpu(descr->hw_regs.result_size));
+	if (!descr->hw_regs.valid_size)
 		dev_info(ctodev(card), "buffer full %x %x %x\n",
-			 be32_to_cpu(descr->result_size),
-			 be32_to_cpu(descr->buf_size),
-			 be32_to_cpu(descr->dmac_cmd_status));
+			 be32_to_cpu(descr->hw_regs.result_size),
+			 be32_to_cpu(descr->hw_regs.payload.size),
+			 be32_to_cpu(descr->hw_regs.dmac_cmd_status));
 
 	descr->skb = NULL;
 	/*
@@ -1036,14 +1037,14 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 
 	/* is the current descriptor terminated with next_descr == NULL? */
 	dmac_chain_ended =
-		be32_to_cpu(descr->dmac_cmd_status) &
+		be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
 		GELIC_DESCR_RX_DMA_CHAIN_END;
 	/*
 	 * So that always DMAC can see the end
 	 * of the descriptor chain to avoid
 	 * from unwanted DMAC overrun.
 	 */
-	descr->next_descr_addr = 0;
+	descr->hw_regs.next_descr_addr = 0;
 
 	/* change the descriptor state: */
 	gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
@@ -1060,7 +1061,7 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	/*
 	 * Set this descriptor the end of the chain.
 	 */
-	descr->prev->next_descr_addr = cpu_to_be32(descr->bus_addr);
+	descr->prev->hw_regs.next_descr_addr = cpu_to_be32(descr->link.cpu_addr);
 
 	/*
 	 * If dmac chain was met, DMAC stopped.
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index 68f324ed4eaf..569f691021d9 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -220,29 +220,35 @@ enum gelic_lv1_phy {
 	GELIC_LV1_PHY_ETHERNET_0	= 0x0000000000000002L,
 };
 
-/* size of hardware part of gelic descriptor */
-#define GELIC_DESCR_SIZE	(32)
-
 enum gelic_port_type {
 	GELIC_PORT_ETHERNET_0	= 0,
 	GELIC_PORT_WIRELESS	= 1,
 	GELIC_PORT_MAX
 };
 
-struct gelic_descr {
-	/* as defined by the hardware */
-	__be32 buf_addr;
-	__be32 buf_size;
+/* as defined by the hardware */
+struct gelic_hw_regs {
+	struct  {
+		__be32 dev_addr;
+		__be32 size;
+	} __packed payload;
 	__be32 next_descr_addr;
 	__be32 dmac_cmd_status;
 	__be32 result_size;
 	__be32 valid_size;	/* all zeroes for tx */
 	__be32 data_status;
 	__be32 data_error;	/* all zeroes for tx */
+} __packed;
 
-	/* used in the driver */
+struct gelic_chain_link {
+	dma_addr_t cpu_addr;
+	unsigned int size;
+};
+
+struct gelic_descr {
+	struct gelic_hw_regs hw_regs;
+	struct gelic_chain_link link;
 	struct sk_buff *skb;
-	dma_addr_t bus_addr;
 	struct gelic_descr *next;
 	struct gelic_descr *prev;
 } __attribute__((aligned(32)));
-- 
2.25.1


