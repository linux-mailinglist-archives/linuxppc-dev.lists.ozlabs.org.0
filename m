Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73052DDDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 21:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L40PS3KWCz3bkV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 05:32:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=mansr.com (client-ip=2001:8b0:ca0d:1::2;
 helo=unicorn.mansr.com; envelope-from=mru@mansr.com; receiver=<UNKNOWN>)
X-Greylist: delayed 409 seconds by postgrey-1.36 at boromir;
 Fri, 20 May 2022 05:32:21 AEST
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L40P11c26z2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 05:32:20 +1000 (AEST)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id F11FF15360;
 Thu, 19 May 2022 20:25:18 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id E297C21A3D6; Thu, 19 May 2022 20:25:18 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vitaly Bordug <vbordug@ru.mvista.com>,
 Dan Malek <dan@embeddededge.com>,
 Joakim Tjernlund <joakim.tjernlund@lumentis.se>,
 Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: fs_enet: sync rx dma buffer before reading
Date: Thu, 19 May 2022 20:24:43 +0100
Message-Id: <20220519192443.28681-1-mans@mansr.com>
X-Mailer: git-send-email 2.35.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The dma_sync_single_for_cpu() call must precede reading the received
data. Fix this.

Fixes: 070e1f01827c ("net: fs_enet: don't unmap DMA when packet len is below copybreak")
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index b3dae17e067e..432ce10cbfd0 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -240,14 +240,14 @@ static int fs_enet_napi(struct napi_struct *napi, int budget)
 				/* +2 to make IP header L1 cache aligned */
 				skbn = netdev_alloc_skb(dev, pkt_len + 2);
 				if (skbn != NULL) {
+					dma_sync_single_for_cpu(fep->dev,
+						CBDR_BUFADDR(bdp),
+						L1_CACHE_ALIGN(pkt_len),
+						DMA_FROM_DEVICE);
 					skb_reserve(skbn, 2);	/* align IP header */
 					skb_copy_from_linear_data(skb,
 						      skbn->data, pkt_len);
 					swap(skb, skbn);
-					dma_sync_single_for_cpu(fep->dev,
-						CBDR_BUFADDR(bdp),
-						L1_CACHE_ALIGN(pkt_len),
-						DMA_FROM_DEVICE);
 				}
 			} else {
 				skbn = netdev_alloc_skb(dev, ENET_RX_FRSIZE);
-- 
2.35.1

