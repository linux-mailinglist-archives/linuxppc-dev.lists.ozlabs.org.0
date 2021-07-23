Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50683D4199
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWgxy5KX5z3dJB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=xO4RrmRz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=xO4RrmRz; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgwK1Wj8z30Cf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:31:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yhPAXvfG+7vC7C9o+tNECcUv58Jp5mZWG2mO8irlXIQ=; b=xO4RrmRzVCTGOfqvCOS9sr3hgi
 cRwaDRX1dC5na5kRbUUFw7j1m/T7+3ei+VuqbPjMW8ET/vZw362Jal1EXbVcPDbu/FfoHgRzebnTU
 N4ZB6SMHTKTZh2/QBa3lZ04YgvD+FS/DLAW6E+/DVWT5lIwpo1xN0jHMw6IvlQGCJlFNc9XquA8aO
 nqbgJKtrI/zs/N/zaZa8C/nHhUxiV31KQ6HioPuG8w7G/uWxweff6DqycoaEATPEIabEJ3L45XFSE
 jtJebNcky+XDnshEjRcg4NYchGdehz9DWRvc3DT3+vY7jTYDFLeHFLShB0OsGxgRJOef7O0WnMI2C
 KvzhTVeA==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m71pj-009Bin-9g; Fri, 23 Jul 2021 20:31:47 +0000
Message-Id: <bc659850d4eec3b2358c1ccb0e00952ceaa6012f.1627068552.git.geoff@infradead.org>
In-Reply-To: <cover.1627068552.git.geoff@infradead.org>
References: <cover.1627068552.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 24 Jul 2021 13:02:14 -0700
Subject: [PATCH v4 04/10] net/ps3_gelic: Add new macro BUG_ON_DEBUG
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

Add a new preprocessor macro BUG_ON_DEBUG, that expands to BUG_ON when
the preprocessor macro DEBUG is defined, or to WARN_ON when DEBUG is not
defined.  Also, replace all occurrences of BUG_ON with BUG_ON_DEBUG.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index ded467d81f36..946e9bfa071b 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -44,6 +44,13 @@ MODULE_AUTHOR("SCE Inc.");
 MODULE_DESCRIPTION("Gelic Network driver");
 MODULE_LICENSE("GPL");
 
+#define BUG_ON_DEBUG(_cond) do { \
+	if (__is_defined(DEBUG)) \
+		BUG_ON(_cond); \
+	else \
+		WARN_ON(_cond); \
+} while (0)
+
 int gelic_card_set_irq_mask(struct gelic_card *card, u64 mask)
 {
 	struct device *dev = ctodev(card);
@@ -505,7 +512,7 @@ static void gelic_descr_release_tx(struct gelic_card *card,
 	struct sk_buff *skb = descr->skb;
 	struct device *dev = ctodev(card);
 
-	BUG_ON(!(be32_to_cpu(descr->hw_regs.data_status) &
+	BUG_ON_DEBUG(!(be32_to_cpu(descr->hw_regs.data_status) &
 		GELIC_DESCR_TX_TAIL));
 
 	dma_unmap_single(dev, be32_to_cpu(descr->hw_regs.payload.dev_addr),
@@ -1667,7 +1674,7 @@ static void gelic_card_get_vlan_info(struct gelic_card *card)
 	}
 
 	if (card->vlan[GELIC_PORT_ETHERNET_0].tx) {
-		BUG_ON(!card->vlan[GELIC_PORT_WIRELESS].tx);
+		BUG_ON_DEBUG(!card->vlan[GELIC_PORT_WIRELESS].tx);
 		card->vlan_required = 1;
 	} else
 		card->vlan_required = 0;
@@ -1709,7 +1716,7 @@ static int ps3_gelic_driver_probe(struct ps3_system_bus_device *sb_dev)
 	if (result) {
 		dev_err(dev, "%s:%d: ps3_dma_region_create failed: %d\n",
 			__func__, __LINE__, result);
-		BUG_ON("check region type");
+		BUG_ON_DEBUG("check region type");
 		goto fail_dma_region;
 	}
 
-- 
2.25.1


