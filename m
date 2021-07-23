Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459273D419D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWgzj0sD2z3dpJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=mwhrWpOv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=mwhrWpOv; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgwM3Xckz30FR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:31:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XbpG4yRwv+07i+xABTybYolFL9Qkc606LLCrFqm6z5A=; b=mwhrWpOvQ3e+CbDiYfPsKCKS56
 7wWMj/OEGslB5yRfSf+p8EcA2QJq+nmXv/jafEGBpkgW/ei41i+FOYxUN7MrRmGG1cyNWvzfogiGt
 hrBZbjX0gTaYfU+q1eiTXsx8RyY3Ns0GM6XToHAcj4FXSS6QFM2W1B38+FhK7CUzY/iCusTZbxQjI
 SlYUJ23X+SZGSgdaHF7SxTeiBXOaiRyvSQr2cLTPAqUgyIEN9LLqE1j7Pvl+ssiBAj7wc9HsiIEtu
 WqhzJgYbEpEgKOhwHxah+wSflEtloiZ5/k+LTeXsrkBItkA5jtZlHgx7YH2L0S6SHHEn+ZZ9SBvqJ
 uP+nuyzg==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1m71pj-009Bit-Pf; Fri, 23 Jul 2021 20:31:47 +0000
Message-Id: <024b88e07095f00bc2eabfae2f526851600ee272.1627068552.git.geoff@infradead.org>
In-Reply-To: <cover.1627068552.git.geoff@infradead.org>
References: <cover.1627068552.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 24 Jul 2021 13:02:14 -0700
Subject: [PATCH v4 07/10] net/ps3_gelic: Add new routine gelic_unmap_link
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

Put the common code for unmaping a link into its own routine,
gelic_unmap_link, and add some debugging checks.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 23 +++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 85fc1915c8be..e55aa9fecfeb 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -288,6 +288,21 @@ void gelic_card_down(struct gelic_card *card)
 	mutex_unlock(&card->updown_lock);
 }
 
+static void gelic_unmap_link(struct device *dev, struct gelic_descr *descr)
+{
+	BUG_ON_DEBUG(descr->hw_regs.payload.dev_addr);
+	BUG_ON_DEBUG(descr->hw_regs.payload.size);
+
+	BUG_ON_DEBUG(!descr->link.cpu_addr);
+	BUG_ON_DEBUG(!descr->link.size);
+
+	dma_unmap_single(dev, descr->link.cpu_addr, descr->link.size,
+		DMA_BIDIRECTIONAL);
+
+	descr->link.cpu_addr = 0;
+	descr->link.size = 0;
+}
+
 /**
  * gelic_card_free_chain - free descriptor chain
  * @card: card structure
@@ -301,9 +316,7 @@ static void gelic_card_free_chain(struct gelic_card *card,
 
 	for (descr = descr_in; descr && descr->link.cpu_addr;
 		descr = descr->next) {
-		dma_unmap_single(dev, descr->link.cpu_addr, descr->link.size,
-			DMA_BIDIRECTIONAL);
-		descr->link.cpu_addr = 0;
+		gelic_unmap_link(dev, descr);
 	}
 }
 
@@ -364,9 +377,7 @@ static int gelic_card_init_chain(struct gelic_card *card,
 iommu_error:
 	for (i--, descr--; 0 <= i; i--, descr--)
 		if (descr->link.cpu_addr)
-			dma_unmap_single(dev, descr->link.cpu_addr,
-					 descr->link.size,
-					 DMA_BIDIRECTIONAL);
+			gelic_unmap_link(dev, descr);
 	return -ENOMEM;
 }
 
-- 
2.25.1


