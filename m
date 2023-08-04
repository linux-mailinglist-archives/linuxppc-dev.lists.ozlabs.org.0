Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A77701E2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHRYV63Cgz3fbf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:35:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHRSS2y8wz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:31:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RHRRy1GGbz9tG5;
	Fri,  4 Aug 2023 15:30:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VImivCgygkXB; Fri,  4 Aug 2023 15:30:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RHRRr33gxz9tGB;
	Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 641CB8B776;
	Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UdjxQeK1Vpcn; Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AC4C68B77C;
	Fri,  4 Aug 2023 15:30:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 374DUf0v693361
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 4 Aug 2023 15:30:41 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 374DUfNK693360;
	Fri, 4 Aug 2023 15:30:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, robh@kernel.org
Subject: [PATCH net-next v2 10/10] net: fs_enet: Use cpm_muram_xxx() functions instead of cpm_dpxxx() macros
Date: Fri,  4 Aug 2023 15:30:20 +0200
Message-ID: <2400b3156891adb653dc387fff6393de10cf2b24.1691155347.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691155346.git.christophe.leroy@csgroup.eu>
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691155810; l=2234; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=h5ydkcduy6lioiqJjfCSwkFEzxsJekIZbyhS9VYCwaM=; b=rEkA1UmOUQoKpStLkJMOJeVAurg3D56c1hmAACywr+Epgc1FCWW/eh4FLVR5EX3iBJQqZcFFT sg4QqZDgBf5DxknwEAPur/IqSkozATbtjAO2awOclmTqq8Ell3Y+sGG
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpm_dpxxx() macros are now always referring to cpm_muram_xxx() fonctions
directly since commit 3dd82a1ea724 ("[POWERPC] CPM: Always use new
binding.")

Use cpm_muram_xxx() functions directly so that the cpm_dpxxx() macros
can be removed in the near future.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index ce63fd56df89..d903a9012db0 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -105,7 +105,7 @@ static int do_pd_setup(struct fs_enet_private *fep)
 		goto out_ep;
 
 	fep->fcc.mem = (void __iomem *)cpm2_immr;
-	fpi->dpram_offset = cpm_dpalloc(128, 32);
+	fpi->dpram_offset = cpm_muram_alloc(128, 32);
 	if (IS_ERR_VALUE(fpi->dpram_offset)) {
 		ret = fpi->dpram_offset;
 		goto out_fcccp;
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 66d40da5cde0..a64cb6270515 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -133,13 +133,13 @@ static int allocate_bd(struct net_device *dev)
 	struct fs_enet_private *fep = netdev_priv(dev);
 	const struct fs_platform_info *fpi = fep->fpi;
 
-	fep->ring_mem_addr = cpm_dpalloc((fpi->tx_ring + fpi->rx_ring) *
-					 sizeof(cbd_t), 8);
+	fep->ring_mem_addr = cpm_muram_alloc((fpi->tx_ring + fpi->rx_ring) *
+					     sizeof(cbd_t), 8);
 	if (IS_ERR_VALUE(fep->ring_mem_addr))
 		return -ENOMEM;
 
 	fep->ring_base = (void __iomem __force*)
-		cpm_dpram_addr(fep->ring_mem_addr);
+		cpm_muram_addr(fep->ring_mem_addr);
 
 	return 0;
 }
@@ -149,7 +149,7 @@ static void free_bd(struct net_device *dev)
 	struct fs_enet_private *fep = netdev_priv(dev);
 
 	if (fep->ring_base)
-		cpm_dpfree(fep->ring_mem_addr);
+		cpm_muram_free(fep->ring_mem_addr);
 }
 
 static void cleanup_data(struct net_device *dev)
-- 
2.41.0

