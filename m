Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF646251134
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 07:01:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbH020yKxzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 15:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.72; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0072.hostedemail.com
 [216.40.44.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbGv34QGCzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 14:57:19 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 57804837F24D;
 Tue, 25 Aug 2020 04:57:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:541:800:960:966:973:988:989:1260:1311:1314:1345:1359:1515:1534:1541:1711:1714:1730:1747:1777:1792:2196:2199:2393:2559:2562:3138:3139:3140:3141:3142:3351:3868:4321:4385:5007:6119:6261:10004:10848:11026:11473:11657:11658:11914:12043:12296:12297:12555:12895:12986:13069:13311:13357:13894:14096:14181:14384:14394:14721:21080:21627:30054,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: rings03_320fcc527059
X-Filterd-Recvd-Size: 1890
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Aug 2020 04:57:13 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>
Subject: [PATCH 17/29] fs_enet: Avoid comma separated statements
Date: Mon, 24 Aug 2020 21:56:14 -0700
Message-Id: <418850ae2026b293ea6ba3b8b19b8a7f8dfcaf3d.1598331149.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index bf846b42bc74..78e008b81374 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -562,10 +562,13 @@ fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 			BD_ENET_TX_TC);
 		CBDS_SC(bdp, BD_ENET_TX_READY);
 
-		if ((CBDR_SC(bdp) & BD_ENET_TX_WRAP) == 0)
-			bdp++, curidx++;
-		else
-			bdp = fep->tx_bd_base, curidx = 0;
+		if ((CBDR_SC(bdp) & BD_ENET_TX_WRAP) == 0) {
+			bdp++;
+			curidx++;
+		} else {
+			bdp = fep->tx_bd_base;
+			curidx = 0;
+		}
 
 		len = skb_frag_size(frag);
 		CBDW_BUFADDR(bdp, skb_frag_dma_map(fep->dev, frag, 0, len,
-- 
2.26.0

