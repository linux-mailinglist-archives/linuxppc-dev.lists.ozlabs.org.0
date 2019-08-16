Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C78FA78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:49:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468sp43ZdgzDr09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 15:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eqy61oM+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468sdQ6gdtzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 15:41:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468sdL5Y0Dz9tyNB;
 Fri, 16 Aug 2019 07:41:42 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eqy61oM+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ANlLqw9cc7wH; Fri, 16 Aug 2019 07:41:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468sdL4Tt8z9tyN5;
 Fri, 16 Aug 2019 07:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565934102; bh=IOzXR83/2yIUIuhphrk6qopaUrL0F7OKCI3JBwQ7+O4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=eqy61oM+shdErnJ6bB60zdpf5Rn0S1dn0c0Lb4Py5kMprQUt6YiqViT/WoOK6BuZs
 SavX+1DRgUriM3PXaRGgB5MAfiAcZuaue0sj0EMPgUNVq8ljx8Aw9XCvlqTS6vklVx
 KqNlI8hQEAYLY+2+Si+sMbahI1OMusz4vvVuWMew=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A52C8B776;
 Fri, 16 Aug 2019 07:41:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hk_ClkD6lWck; Fri, 16 Aug 2019 07:41:43 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66EC48B754;
 Fri, 16 Aug 2019 07:41:43 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 619696B6CC; Fri, 16 Aug 2019 05:41:43 +0000 (UTC)
Message-Id: <35f143c6fe29f9fd25c7f3cd4448ae401029ce3c.1565933217.git.christophe.leroy@c-s.fr>
In-Reply-To: <668aba4db6b9af6d8a151174e11a4289f1a6bbcd.1565933217.git.christophe.leroy@c-s.fr>
References: <668aba4db6b9af6d8a151174e11a4289f1a6bbcd.1565933217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/5] powerpc/mm: Simplify update_mmu_cache() on BOOK3S32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Aug 2019 05:41:43 +0000 (UTC)
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

On BOOK3S32, hash_preload() neither use is_exec nor trap,
so drop those parameters and simplify update_mmu_cached().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/book3s32/mmu.c | 29 +++++++----------------------
 arch/powerpc/mm/mmu_decl.h     |  3 +--
 arch/powerpc/mm/pgtable_32.c   |  2 +-
 3 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 3e3c4077cdb7..3a62bf99f93f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -297,8 +297,7 @@ void __init setbat(int index, unsigned long virt, phys_addr_t phys,
 /*
  * Preload a translation in the hash table
  */
-void hash_preload(struct mm_struct *mm, unsigned long ea,
-		  bool is_exec, unsigned long trap)
+void hash_preload(struct mm_struct *mm, unsigned long ea)
 {
 	pmd_t *pmd;
 
@@ -324,34 +323,20 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 	 * We don't need to worry about _PAGE_PRESENT here because we are
 	 * called with either mm->page_table_lock held or ptl lock held
 	 */
-	unsigned long trap;
-	bool is_exec;
 
 	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
 	if (!pte_young(*ptep) || address >= TASK_SIZE)
 		return;
 
-	/* We try to figure out if we are coming from an instruction
-	 * access fault and pass that down to __hash_page so we avoid
-	 * double-faulting on execution of fresh text. We have to test
-	 * for regs NULL since init will get here first thing at boot
-	 *
-	 * We also avoid filling the hash if not coming from a fault
-	 */
+	/* We have to test for regs NULL since init will get here first thing at boot */
+	if (!current->thread.regs)
+		return;
 
-	trap = current->thread.regs ? TRAP(current->thread.regs) : 0UL;
-	switch (trap) {
-	case 0x300:
-		is_exec = false;
-		break;
-	case 0x400:
-		is_exec = true;
-		break;
-	default:
+	/* We also avoid filling the hash if not coming from a fault */
+	if (TRAP(current->thread.regs) != 0x300 && TRAP(current->thread.regs) != 0x400)
 		return;
-	}
 
-	hash_preload(vma->vm_mm, address, is_exec, trap);
+	hash_preload(vma->vm_mm, address);
 }
 
 /*
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 9f325a7a09cb..adbaf2167214 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -91,8 +91,7 @@ void print_system_hash_info(void);
 
 #ifdef CONFIG_PPC32
 
-void hash_preload(struct mm_struct *mm, unsigned long ea,
-		  bool is_exec, unsigned long trap);
+void hash_preload(struct mm_struct *mm, unsigned long ea);
 
 extern void mapin_ram(void);
 extern void setbat(int index, unsigned long virt, phys_addr_t phys,
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 35cb96cfc258..97f401a06fcc 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -252,7 +252,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 		map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
 #ifdef CONFIG_PPC_BOOK3S_32
 		if (ktext)
-			hash_preload(&init_mm, v, false, 0x300);
+			hash_preload(&init_mm, v);
 #endif
 		v += PAGE_SIZE;
 		p += PAGE_SIZE;
-- 
2.13.3

