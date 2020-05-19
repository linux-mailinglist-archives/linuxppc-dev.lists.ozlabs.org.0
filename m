Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C69ED1D8FB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:03:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R50B4GpgzDqJ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 16:03:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4gl53pvzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:48:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4gg21qKz9txm3;
 Tue, 19 May 2020 07:48:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xQw_Mfzms_sx; Tue, 19 May 2020 07:48:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4gg0vC5z9txm2;
 Tue, 19 May 2020 07:48:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7604C8B7A8;
 Tue, 19 May 2020 07:48:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hJeqO4t67j6d; Tue, 19 May 2020 07:48:47 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F10D8B7A7;
 Tue, 19 May 2020 07:48:46 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 80E3C65A4A; Tue, 19 May 2020 05:48:46 +0000 (UTC)
Message-Id: <81a4d3aee8b82bc1355595935c8f4ad9d3b22a83.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 04/45] powerpc/kasan: Remove unnecessary page table locking
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:48:46 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 45ff3c559585 ("powerpc/kasan: Fix parallel loading of
modules.") added spinlocks to manage parallele module loading.

Since then commit 47febbeeec44 ("powerpc/32: Force KASAN_VMALLOC for
modules") converted the module loading to KASAN_VMALLOC.

The spinlocking has then become unneeded and can be removed to
simplify kasan_init_shadow_page_tables()

Also remove inclusion of linux/moduleloader.h and linux/vmalloc.h
which are not needed anymore since the removal of modules management.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index b7c287adfd59..91e2ade75192 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -5,9 +5,7 @@
 #include <linux/kasan.h>
 #include <linux/printk.h>
 #include <linux/memblock.h>
-#include <linux/moduleloader.h>
 #include <linux/sched/task.h>
-#include <linux/vmalloc.h>
 #include <asm/pgalloc.h>
 #include <asm/code-patching.h>
 #include <mm/mmu_decl.h>
@@ -34,31 +32,22 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
-	pte_t *new = NULL;
 
 	pmd = pmd_ptr_k(k_start);
 
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
+		pte_t *new;
+
 		k_next = pgd_addr_end(k_cur, k_end);
 		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
 			continue;
 
-		if (!new)
-			new = memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
+		new = memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
 
 		if (!new)
 			return -ENOMEM;
 		kasan_populate_pte(new, PAGE_KERNEL);
-
-		smp_wmb(); /* See comment in __pte_alloc */
-
-		spin_lock(&init_mm.page_table_lock);
-			/* Has another populated it ? */
-		if (likely((void *)pmd_page_vaddr(*pmd) == kasan_early_shadow_pte)) {
-			pmd_populate_kernel(&init_mm, pmd, new);
-			new = NULL;
-		}
-		spin_unlock(&init_mm.page_table_lock);
+		pmd_populate_kernel(&init_mm, pmd, new);
 	}
 	return 0;
 }
-- 
2.25.0

