Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E1F77F8DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRS5H3V18z3cQM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 00:27:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRS4q45rwz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 00:27:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRS4m202nz9x2j;
	Thu, 17 Aug 2023 16:27:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGLm9rqMI7IC; Thu, 17 Aug 2023 16:27:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRS4k27h4z9x2C;
	Thu, 17 Aug 2023 16:27:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 460EF8B763;
	Thu, 17 Aug 2023 16:27:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bZjoilOtA2t5; Thu, 17 Aug 2023 16:27:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 082F48B76D;
	Thu, 17 Aug 2023 16:27:01 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37HEQpcJ446062
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 16:26:51 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37HEQo0F446058;
	Thu, 17 Aug 2023 16:26:50 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2] powerpc/47x: Remove early_init_mmu_47x() to fix no previous prototype
Date: Thu, 17 Aug 2023 16:26:44 +0200
Message-ID: <0a667b7c2e05d3cf41ecd38f33cc334083a61c8d.1692282396.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692282403; l=1819; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=j6gF+SkDc2UpZHvarxvy1x2Leci+QuFy5s+kcxHEDOE=; b=85RyFp7uL0lRGDYqpIveZOyKSY3xrGOwwY7NDy69Vx4DVS+8f24u0ERxCzfaEsIdd+LDcF00i Aq4soID/PEPAxM72waktcrkolQ5EgPsKzQuCxZmw54eDECRlwCHl9W6
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
v2: Remove prototype mmu_init_secondary() belonging to another patch
---
 arch/powerpc/mm/nohash/tlb.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

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

