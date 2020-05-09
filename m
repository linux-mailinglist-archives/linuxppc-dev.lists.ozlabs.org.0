Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B061CC3DD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 21:02:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KGlr6RqWzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 05:02:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KGgz0yCmzDr5J
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 04:58:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JhRhlw09BNU6PQ2F+UuqKcowbFGDrncxOpLjdG90IRI=; b=uZf8xX0Q07p7V6juWBV19tc12L
 80CX66nb6PEEdL2NZtyZWrxASrgOKRzPf1mrFsD/yqSPs4J8896BEVDac+NqAzL5+phi/2zU8pIiR
 quy4wZWdAAl39D21grmrtzij8fx+UTDtXUDzuGgwcSZTOpaFiUGrmvqmOz+bPUT5PB/hLUeN2Ssby
 50/P7r/9DRewREHqU9bbcHT32uyf+4XQZKY4Y3x5EDc9IpCUzJGEiXmcWuJFhA1q+4/DzP/d7AztC
 MXAhM9Ex8S+GoBuRstICzpLFef7NW3EMXIyVUXv9RHXhDyzSW2t/PcMwzUROd2An2F0HevCTlDp1R
 QsuaZSBQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jXUgC-0003Du-27; Sat, 09 May 2020 18:58:32 +0000
Message-Id: <ba4bea4da97308c804fd3a0fae3773dde27b20ce.1589049250.git.geoff@infradead.org>
In-Reply-To: <cover.1589049250.git.geoff@infradead.org>
References: <cover.1589049250.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Wed, 3 Jan 2018 14:50:59 +0100
Subject: [PATCH v2 5/9] net/ps3_gelic_net: Remove duplicate error message
To: Michael Ellerman <mpe@ellerman.id.au>,
 David S. Miller <davem@davemloft.net>
Date: Sat, 09 May 2020 18:58:32 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>

Remove an extra message for a memory allocation failure in
function gelic_descr_prepare_rx().

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 070dd6fa9401..8522f3898e0d 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -382,8 +382,6 @@ static int gelic_descr_prepare_rx(struct gelic_card *card,
 	descr->skb = dev_alloc_skb(bufsize + GELIC_NET_RXBUF_ALIGN - 1);
 	if (!descr->skb) {
 		descr->buf_addr = 0; /* tell DMAC don't touch memory */
-		dev_info(ctodev(card),
-			 "%s:allocate skb failed !!\n", __func__);
 		return -ENOMEM;
 	}
 	descr->buf_size = cpu_to_be32(bufsize);
-- 
2.20.1


