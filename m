Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BE773813
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 08:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKjQ60TcJz30YY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 16:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKjNH2Jyrz2ytS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 16:05:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RKjN22drgz9t2k;
	Tue,  8 Aug 2023 08:05:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYam-9TBz450; Tue,  8 Aug 2023 08:05:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RKjN05jC2z9t2Y;
	Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0AC08B763;
	Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id J4xdYFtQXx4C; Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.230])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7523A8B76D;
	Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37865HjP1246299
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 8 Aug 2023 08:05:17 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37865HNT1246298;
	Tue, 8 Aug 2023 08:05:17 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 3/6] powerpc/include: Remove mpc8260.h and m82xx_pci.h
Date: Tue,  8 Aug 2023 08:04:40 +0200
Message-ID: <afe23bf3624c389ff17e9789884c78c124b7b202.1691474658.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
References: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691474677; l=5334; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/VE99HPai2dTet8PHuKpVyyTj1PTs8uNjJWqxDY3Sqg=; b=gglA7Cs6f8tG+V9LfTGzXXVbKnzlgA9WpImEgS56uKlLEL1+GHAT3mzMKUgV2kD0Z18mWOM9p g0r6uBHa4skATGyqJuzBo4yzdLTVGdqAx5S8JJoJOJb/xh3pwketPSZ
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SIU_INT_IRQ1 is not used anywhere and __IO_BASE is defined in
asm/io.h

Remove m82xx_pci.h

Then the only thing remaining in mpc8260.h is MPC82XX_BCR_PLDP

Move MPC82XX_BCR_PLDP into asm/cpm2.h then remove mpc8260.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/cpm2.h               |  3 +++
 arch/powerpc/include/asm/fs_pd.h              |  4 ----
 arch/powerpc/include/asm/mpc8260.h            | 22 -------------------
 arch/powerpc/platforms/82xx/ep8248e.c         |  1 -
 arch/powerpc/platforms/82xx/km82xx.c          |  1 -
 arch/powerpc/platforms/82xx/m82xx_pci.h       | 14 ------------
 arch/powerpc/sysdev/cpm2.c                    |  1 -
 arch/powerpc/sysdev/cpm2_pic.c                |  1 -
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |  1 -
 9 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/mpc8260.h
 delete mode 100644 arch/powerpc/platforms/82xx/m82xx_pci.h

diff --git a/arch/powerpc/include/asm/cpm2.h b/arch/powerpc/include/asm/cpm2.h
index 9ee192a6c5d7..249d43cc6427 100644
--- a/arch/powerpc/include/asm/cpm2.h
+++ b/arch/powerpc/include/asm/cpm2.h
@@ -1080,6 +1080,9 @@ typedef struct im_idma {
 #define FCC2_MEM_OFFSET FCC_MEM_OFFSET(1)
 #define FCC3_MEM_OFFSET FCC_MEM_OFFSET(2)
 
+/* Pipeline Maximum Depth */
+#define MPC82XX_BCR_PLDP 0x00800000
+
 /* Clocks and GRG's */
 
 enum cpm_clk_dir {
diff --git a/arch/powerpc/include/asm/fs_pd.h b/arch/powerpc/include/asm/fs_pd.h
index 2b2b52b7451d..d251a55de8b0 100644
--- a/arch/powerpc/include/asm/fs_pd.h
+++ b/arch/powerpc/include/asm/fs_pd.h
@@ -17,10 +17,6 @@
 #ifdef CONFIG_CPM2
 #include <asm/cpm2.h>
 
-#if defined(CONFIG_8260)
-#include <asm/mpc8260.h>
-#endif
-
 #define cpm2_map(member) (&cpm2_immr->member)
 #define cpm2_map_size(member, size) (&cpm2_immr->member)
 #define cpm2_unmap(addr) do {} while(0)
diff --git a/arch/powerpc/include/asm/mpc8260.h b/arch/powerpc/include/asm/mpc8260.h
deleted file mode 100644
index 155114bbd1a2..000000000000
--- a/arch/powerpc/include/asm/mpc8260.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Since there are many different boards and no standard configuration,
- * we have a unique include file for each.  Rather than change every
- * file that has to include MPC8260 configuration, they all include
- * this one and the configuration switching is done here.
- */
-#ifdef __KERNEL__
-#ifndef __ASM_POWERPC_MPC8260_H__
-#define __ASM_POWERPC_MPC8260_H__
-
-#define MPC82XX_BCR_PLDP 0x00800000 /* Pipeline Maximum Depth */
-
-#ifdef CONFIG_8260
-
-#ifdef CONFIG_PCI_8260
-#include <platforms/82xx/m82xx_pci.h>
-#endif
-
-#endif /* CONFIG_8260 */
-#endif /* !__ASM_POWERPC_MPC8260_H__ */
-#endif /* __KERNEL__ */
diff --git a/arch/powerpc/platforms/82xx/ep8248e.c b/arch/powerpc/platforms/82xx/ep8248e.c
index 4bfa1a95e155..3dc65ce1f175 100644
--- a/arch/powerpc/platforms/82xx/ep8248e.c
+++ b/arch/powerpc/platforms/82xx/ep8248e.c
@@ -20,7 +20,6 @@
 #include <asm/udbg.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
-#include <asm/mpc8260.h>
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/cpm2_pic.h>
diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 51c9bfd97592..c86da3f2b74b 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -19,7 +19,6 @@
 #include <asm/udbg.h>
 #include <asm/machdep.h>
 #include <linux/time.h>
-#include <asm/mpc8260.h>
 
 #include <sysdev/fsl_soc.h>
 #include <sysdev/cpm2_pic.h>
diff --git a/arch/powerpc/platforms/82xx/m82xx_pci.h b/arch/powerpc/platforms/82xx/m82xx_pci.h
deleted file mode 100644
index d07c4d7606f6..000000000000
--- a/arch/powerpc/platforms/82xx/m82xx_pci.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _PPC_KERNEL_M82XX_PCI_H
-#define _PPC_KERNEL_M82XX_PCI_H
-
-/*
- */
-
-#define SIU_INT_IRQ1   ((uint)0x13 + CPM_IRQ_OFFSET)
-
-#ifndef _IO_BASE
-#define _IO_BASE isa_io_base
-#endif
-
-#endif				/* _PPC_KERNEL_M8260_PCI_H */
diff --git a/arch/powerpc/sysdev/cpm2.c b/arch/powerpc/sysdev/cpm2.c
index 915f4d3991c3..a92691193314 100644
--- a/arch/powerpc/sysdev/cpm2.c
+++ b/arch/powerpc/sysdev/cpm2.c
@@ -37,7 +37,6 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/mpc8260.h>
 #include <asm/page.h>
 #include <asm/cpm2.h>
 #include <asm/rheap.h>
diff --git a/arch/powerpc/sysdev/cpm2_pic.c b/arch/powerpc/sysdev/cpm2_pic.c
index cb9ba4ef557a..d6c1359ae89d 100644
--- a/arch/powerpc/sysdev/cpm2_pic.c
+++ b/arch/powerpc/sysdev/cpm2_pic.c
@@ -33,7 +33,6 @@
 #include <linux/irqdomain.h>
 
 #include <asm/immap_cpm2.h>
-#include <asm/mpc8260.h>
 #include <asm/io.h>
 #include <asm/fs_pd.h>
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index b47490be872c..c9491b6e8708 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -38,7 +38,6 @@
 #include <linux/pgtable.h>
 
 #include <asm/immap_cpm2.h>
-#include <asm/mpc8260.h>
 #include <asm/cpm2.h>
 
 #include <asm/irq.h>
-- 
2.41.0

