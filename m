Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885D7701EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:36:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHRZD12rWz3dW0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHRSX0bqhz3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:31:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RHRRz2mBjz9tG7;
	Fri,  4 Aug 2023 15:30:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygnqWhLlc0eA; Fri,  4 Aug 2023 15:30:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RHRRr33BKz9tG9;
	Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 62D9F8B775;
	Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BfnYCR1sjsWd; Fri,  4 Aug 2023 15:30:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A94538B77A;
	Fri,  4 Aug 2023 15:30:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 374DUeDK693357
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 4 Aug 2023 15:30:41 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 374DUeYB693356;
	Fri, 4 Aug 2023 15:30:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, robh@kernel.org
Subject: [PATCH net-next v2 09/10] net: fs_enet: Remove linux/fs_enet_pd.h
Date: Fri,  4 Aug 2023 15:30:19 +0200
Message-ID: <5be102791c987792ad127b15543ee6715394cf67.1691155347.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691155346.git.christophe.leroy@csgroup.eu>
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691155810; l=3315; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ahI/5xn7Gm1hdcNAly2aG36Caa0YBSZ+1UeBWlU8m/k=; b=KPDE4U4W3ysFmp85V7vFALwjrzpOziYCsd2YJ0sy7nGSmsgAMp4BpAmVul3FWqQ28+ox3YfZh edu0CV8ObuACXLSdWQ2jMi2h+HnGMLZpQOlI3b7lbBvFJefP52JcAgI
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

linux/fs_enet_pd.h is not used anymore.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS                |   1 -
 include/linux/fs_enet_pd.h | 118 -------------------------------------
 2 files changed, 119 deletions(-)
 delete mode 100644 include/linux/fs_enet_pd.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e2bb1059ab6..5bf1be70e4a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8371,7 +8371,6 @@ L:	linuxppc-dev@lists.ozlabs.org
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/freescale/fs_enet/
-F:	include/linux/fs_enet_pd.h
 
 FREESCALE SOC SOUND DRIVERS
 M:	Shengjiu Wang <shengjiu.wang@gmail.com>
diff --git a/include/linux/fs_enet_pd.h b/include/linux/fs_enet_pd.h
deleted file mode 100644
index 7c9897dab558..000000000000
--- a/include/linux/fs_enet_pd.h
+++ /dev/null
@@ -1,118 +0,0 @@
-/*
- * Platform information definitions for the
- * universal Freescale Ethernet driver.
- *
- * Copyright (c) 2003 Intracom S.A. 
- *  by Pantelis Antoniou <panto@intracom.gr>
- *
- * 2005 (c) MontaVista Software, Inc. 
- * Vitaly Bordug <vbordug@ru.mvista.com>
- *
- * This file is licensed under the terms of the GNU General Public License 
- * version 2. This program is licensed "as is" without any warranty of any 
- * kind, whether express or implied.
- */
-
-#ifndef FS_ENET_PD_H
-#define FS_ENET_PD_H
-
-#include <linux/clk.h>
-#include <linux/string.h>
-#include <linux/of_mdio.h>
-#include <linux/if_ether.h>
-#include <asm/types.h>
-
-#define FS_ENET_NAME	"fs_enet"
-
-enum fs_id {
-	fsid_fec1,
-	fsid_fec2,
-	fsid_fcc1,
-	fsid_fcc2,
-	fsid_fcc3,
-	fsid_scc1,
-	fsid_scc2,
-	fsid_scc3,
-	fsid_scc4,
-};
-
-#define FS_MAX_INDEX	9
-
-static inline int fs_get_fec_index(enum fs_id id)
-{
-	if (id >= fsid_fec1 && id <= fsid_fec2)
-		return id - fsid_fec1;
-	return -1;
-}
-
-static inline int fs_get_fcc_index(enum fs_id id)
-{
-	if (id >= fsid_fcc1 && id <= fsid_fcc3)
-		return id - fsid_fcc1;
-	return -1;
-}
-
-static inline int fs_get_scc_index(enum fs_id id)
-{
-	if (id >= fsid_scc1 && id <= fsid_scc4)
-		return id - fsid_scc1;
-	return -1;
-}
-
-static inline int fs_fec_index2id(int index)
-{
-	int id = fsid_fec1 + index - 1;
-	if (id >= fsid_fec1 && id <= fsid_fec2)
-		return id;
-	return FS_MAX_INDEX;
-		}
-
-static inline int fs_fcc_index2id(int index)
-{
-	int id = fsid_fcc1 + index - 1;
-	if (id >= fsid_fcc1 && id <= fsid_fcc3)
-		return id;
-	return FS_MAX_INDEX;
-}
-
-static inline int fs_scc_index2id(int index)
-{
-	int id = fsid_scc1 + index - 1;
-	if (id >= fsid_scc1 && id <= fsid_scc4)
-		return id;
-	return FS_MAX_INDEX;
-}
-
-enum fs_mii_method {
-	fsmii_fixed,
-	fsmii_fec,
-	fsmii_bitbang,
-};
-
-enum fs_ioport {
-	fsiop_porta,
-	fsiop_portb,
-	fsiop_portc,
-	fsiop_portd,
-	fsiop_porte,
-};
-
-struct fs_mii_bit {
-	u32 offset;
-	u8 bit;
-	u8 polarity;
-};
-struct fs_mii_bb_platform_info {
-	struct fs_mii_bit 	mdio_dir;
-	struct fs_mii_bit 	mdio_dat;
-	struct fs_mii_bit	mdc_dat;
-	int delay;	/* delay in us         */
-	int irq[32]; 	/* irqs per phy's */
-};
-
-struct fs_mii_fec_platform_info {
-	u32 irq[32];
-	u32 mii_speed;
-};
-
-#endif
-- 
2.41.0

