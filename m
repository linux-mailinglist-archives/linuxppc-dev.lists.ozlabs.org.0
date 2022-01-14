Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFA48E2DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 04:13:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZmbW1g1Cz3bbM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 14:13:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qKGXyktI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZmZq2JGPz2yPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 14:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qKGXyktI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JZmZp5qZwz4xdl;
 Fri, 14 Jan 2022 14:13:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642129987;
 bh=8Yq203lrwI/6CvDNyeW7ts27B3EwTRZJwnsZ2XiI3gk=;
 h=From:To:Cc:Subject:Date:From;
 b=qKGXyktILyZqYtch3Xexg9d+PUKM+pboAc1dpANuBtj4JHjkpD7X8BJahneYzCbmB
 ohPiBFZ+oM2HXEmRUyv9ITHCTvbN+WLzqHDn07vR58GL4WrvMJDOiOFuJROp6RoCXl
 /rkLXhMe/nTiRPw1dRekN9Rk2hEL/iRCbOLnRqi+upZJLR+bIdqza3wd9K5ZkEyHSr
 ZJ0dP4w5g1eUw5VQ6GplpmjrIhuEcP47MJt8WR3Nw0Qm/3Ng8QMY9q1tYL3tZ/8vvw
 sG7zRJn4ynwFgcuxTcZoeZKwZ+rXYyBXRy8wsEWRxjLfeipqNUwGXW7WaeS88uAYzx
 Wi6xIABZAdoOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <netdev@vger.kernel.org>,
	<kuba@kernel.org>,
	<davem@davemloft.net>
Subject: [PATCH] net: apple: mace: Fix build since dev_addr constification
Date: Fri, 14 Jan 2022 14:12:52 +1100
Message-Id: <20220114031252.2419042-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit adeef3e32146 ("net: constify netdev->dev_addr") the mace
driver no longer builds with various errors (pmac32_defconfig):

  linux/drivers/net/ethernet/apple/mace.c: In function ‘mace_probe’:
  linux/drivers/net/ethernet/apple/mace.c:170:20: error: assignment of read-only location ‘*(dev->dev_addr + (sizetype)j)’
    170 |   dev->dev_addr[j] = rev ? bitrev8(addr[j]): addr[j];
        |                    ^
  linux/drivers/net/ethernet/apple/mace.c: In function ‘mace_reset’:
  linux/drivers/net/ethernet/apple/mace.c:349:32: warning: passing argument 2 of ‘__mace_set_address’ discards ‘const’ qualifier from pointer target type
    349 |     __mace_set_address(dev, dev->dev_addr);
        |                             ~~~^~~~~~~~~~
  linux/drivers/net/ethernet/apple/mace.c:93:62: note: expected ‘void *’ but argument is of type ‘const unsigned char *’
     93 | static void __mace_set_address(struct net_device *dev, void *addr);
        |                                                        ~~~~~~^~~~
  linux/drivers/net/ethernet/apple/mace.c: In function ‘__mace_set_address’:
  linux/drivers/net/ethernet/apple/mace.c:388:36: error: assignment of read-only location ‘*(dev->dev_addr + (sizetype)i)’
    388 |  out_8(&mb->padr, dev->dev_addr[i] = p[i]);
        |                                    ^

Fix it by making the modifications to a local macaddr variable and then
passing that to eth_hw_addr_set(), as well as adding some missing const
qualifiers.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/net/ethernet/apple/mace.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index 4b80e3a52a19..6f8c91eb1263 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -90,7 +90,7 @@ static void mace_set_timeout(struct net_device *dev);
 static void mace_tx_timeout(struct timer_list *t);
 static inline void dbdma_reset(volatile struct dbdma_regs __iomem *dma);
 static inline void mace_clean_rings(struct mace_data *mp);
-static void __mace_set_address(struct net_device *dev, void *addr);
+static void __mace_set_address(struct net_device *dev, const void *addr);
 
 /*
  * If we can't get a skbuff when we need it, we use this area for DMA.
@@ -112,6 +112,7 @@ static int mace_probe(struct macio_dev *mdev, const struct of_device_id *match)
 	struct net_device *dev;
 	struct mace_data *mp;
 	const unsigned char *addr;
+	u8 macaddr[ETH_ALEN];
 	int j, rev, rc = -EBUSY;
 
 	if (macio_resource_count(mdev) != 3 || macio_irq_count(mdev) != 3) {
@@ -167,8 +168,9 @@ static int mace_probe(struct macio_dev *mdev, const struct of_device_id *match)
 
 	rev = addr[0] == 0 && addr[1] == 0xA0;
 	for (j = 0; j < 6; ++j) {
-		dev->dev_addr[j] = rev ? bitrev8(addr[j]): addr[j];
+		macaddr[j] = rev ? bitrev8(addr[j]): addr[j];
 	}
+	eth_hw_addr_set(dev, macaddr);
 	mp->chipid = (in_8(&mp->mace->chipid_hi) << 8) |
 			in_8(&mp->mace->chipid_lo);
 
@@ -369,11 +371,12 @@ static void mace_reset(struct net_device *dev)
 	out_8(&mb->plscc, PORTSEL_GPSI + ENPLSIO);
 }
 
-static void __mace_set_address(struct net_device *dev, void *addr)
+static void __mace_set_address(struct net_device *dev, const void *addr)
 {
     struct mace_data *mp = netdev_priv(dev);
     volatile struct mace __iomem *mb = mp->mace;
-    unsigned char *p = addr;
+    const unsigned char *p = addr;
+    u8 macaddr[ETH_ALEN];
     int i;
 
     /* load up the hardware address */
@@ -385,7 +388,10 @@ static void __mace_set_address(struct net_device *dev, void *addr)
 	    ;
     }
     for (i = 0; i < 6; ++i)
-	out_8(&mb->padr, dev->dev_addr[i] = p[i]);
+        out_8(&mb->padr, macaddr[i] = p[i]);
+
+    eth_hw_addr_set(dev, macaddr);
+
     if (mp->chipid != BROKEN_ADDRCHG_REV)
         out_8(&mb->iac, 0);
 }
-- 
2.31.1

