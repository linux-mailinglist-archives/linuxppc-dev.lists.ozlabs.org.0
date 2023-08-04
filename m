Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E315877019F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHRTX6RXlz3dKT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:32:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHRRx52T6z3cLk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:30:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RHRRk3wyXz9tG0;
	Fri,  4 Aug 2023 15:30:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KHKm-eITv9W; Fri,  4 Aug 2023 15:30:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RHRRh3BHgz9tG2;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 688918B763;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id S7HStBC5zR65; Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 170858B775;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 374DUWex693295
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 4 Aug 2023 15:30:32 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 374DUWSQ693294;
	Fri, 4 Aug 2023 15:30:32 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, robh@kernel.org
Subject: [PATCH net-next v2 02/10] net: fs_enet: Fix address space and base types mismatches
Date: Fri,  4 Aug 2023 15:30:12 +0200
Message-ID: <25c7965e6aeeb6bbe1b6be5a3c2c7125182fcb02.1691155346.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691155346.git.christophe.leroy@csgroup.eu>
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691155809; l=2593; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ZgDtmZ1i65wM+0RHDGG/TwwCzh2fNr2ZIgPm+CzmuSU=; b=wTwzL4Z0w9mSlMlgKrBFj1EFGF3FRmXl2Jnn99Zg0L4w5sJx65sf5tH6ZwaYnJPNYnKpMFbzS HGHWfzFZiWrDqXrkYSEqitORZWlvrIq1JB62v5Eg0b2YR83C1aOaF/H
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

  CHECK   drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
drivers/net/ethernet/freescale/fs_enet/mac-fcc.c:550:9: warning: cast removes address space '__iomem' of expression
drivers/net/ethernet/freescale/fs_enet/mac-fcc.c:550:9: error: subtraction of different types can't work (different address spaces)
  CC      drivers/net/ethernet/freescale/fs_enet/mii-bitbang.o
  CHECK   drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:95:31: warning: incorrect type in argument 1 (different base types)
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:95:31:    expected unsigned int [noderef] [usertype] __iomem *p
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:95:31:    got restricted __be32 [noderef] [usertype] __iomem *dat
...
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:63:31: warning: incorrect type in argument 1 (different base types)
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:63:31:    expected unsigned int [noderef] [usertype] __iomem *p
drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c:63:31:    got restricted __be32 [noderef] [usertype] __iomem *dir
...

Fix those address space and base type mismatches reported by sparse.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c     | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index 925428f1b0c8..ce63fd56df89 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -547,7 +547,7 @@ static void tx_restart(struct net_device *dev)
 	}
 	/* Now update the TBPTR and dirty flag to the current buffer */
 	W32(ep, fen_genfcc.fcc_tbptr,
-		(uint) (((void *)recheck_bd - fep->ring_base) +
+		(uint)(((void __iomem *)recheck_bd - fep->ring_base) +
 		fep->ring_mem_addr));
 	fep->dirty_tx = recheck_bd;
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
index 91a69fc2f7c2..f965a2329055 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c
@@ -29,8 +29,8 @@
 
 struct bb_info {
 	struct mdiobb_ctrl ctrl;
-	__be32 __iomem *dir;
-	__be32 __iomem *dat;
+	u32 __iomem *dir;
+	u32 __iomem *dat;
 	u32 mdio_msk;
 	u32 mdc_msk;
 };
-- 
2.41.0

