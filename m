Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CECD77F877
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRRpJ6srTz3cQT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 00:14:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRRnq3st4z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 00:14:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRRnl1bY4zB0Wt;
	Thu, 17 Aug 2023 16:14:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krFBy4CYFv1f; Thu, 17 Aug 2023 16:14:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRRnk5QcXzB0Wr;
	Thu, 17 Aug 2023 16:14:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B6CCA8B76C;
	Thu, 17 Aug 2023 16:14:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yzgK5_x5-n_m; Thu, 17 Aug 2023 16:14:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 783B18B763;
	Thu, 17 Aug 2023 16:14:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37HEDpZg444184
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 16:13:52 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37HEDmYc444180;
	Thu, 17 Aug 2023 16:13:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/47x: Remove early_init_mmu_47x() to fix no previous prototype
Date: Thu, 17 Aug 2023 16:13:40 +0200
Message-ID: <17e245625f44be5cef3e7a358ae6b1e09ca05bc6.1692281067.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692281619; l=2264; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=DkkHOuMkgJ4ThoX2EWwXEWeo60SmP8clLH8vy9/I+bY=; b=jm7XoCuI/CpoXSlX5549kYosZf44K/8O4VlHLtSh0LlrO5eOSJwffT0YZC0VOI8HiRiCKlewp XT/qjpDgUdcCw0s3ie3tM/D0OGFLxE7nWOOQpHCtJpy7OvhgY2drKBL
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

4xx/iss476-smp_defconfig leads to:

  CC      arch/powerpc/mm/nohash/tlb.o
arch/powerpc/mm/nohash/tlb.c:322:13: error: no previous prototype for 'early_init_mmu_47x' [-Werror=missing-prototypes]
  322 | void __init early_init_mmu_47x(void)
      |             ^~~~~~~~~~~~~~~~~~

early_init_mmu_47x() is used only at one place and only locally.

Fold it into its only caller and remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/mmu_decl.h   |  1 +
 arch/powerpc/mm/nohash/tlb.c | 19 +++++--------------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index c6dccb4f06dc..7f9ff0640124 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -110,6 +110,7 @@ extern void MMU_init_hw(void);
 void MMU_init_hw_patch(void);
 unsigned long mmu_mapin_ram(unsigned long base, unsigned long top);
 #endif
+void mmu_init_secondary(int cpu);
 
 #ifdef CONFIG_PPC_E500
 extern unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx,
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index a903b308acc5..5ffa0af4328a 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -318,17 +318,6 @@ EXPORT_SYMBOL(flush_tlb_page);
 
 #endif /* CONFIG_SMP */
 
-#ifdef CONFIG_PPC_47x
-void __init early_init_mmu_47x(void)
-{
-#ifdef CONFIG_SMP
-	unsigned long root = of_get_flat_dt_root();
-	if (of_get_flat_dt_prop(root, "cooperative-partition", NULL))
-		mmu_clear_feature(MMU_FTR_USE_TLBIVAX_BCAST);
-#endif /* CONFIG_SMP */
-}
-#endif /* CONFIG_PPC_47x */
-
 /*
  * Flush kernel TLB entries in the given range
  */
@@ -746,8 +735,10 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 #else /* ! CONFIG_PPC64 */
 void __init early_init_mmu(void)
 {
-#ifdef CONFIG_PPC_47x
-	early_init_mmu_47x();
-#endif
+	unsigned long root = of_get_flat_dt_root();
+
+	if (IS_ENABLED(CONFIG_PPC_47x) && IS_ENABLED(CONFIG_SMP) &&
+	    of_get_flat_dt_prop(root, "cooperative-partition", NULL))
+		mmu_clear_feature(MMU_FTR_USE_TLBIVAX_BCAST);
 }
 #endif /* CONFIG_PPC64 */
-- 
2.41.0

