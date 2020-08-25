Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0A0251A8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 16:14:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWFY5zHNzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 00:14:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbVpb1txVzDqDp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 23:54:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BbVpR39r8z9txlp;
 Tue, 25 Aug 2020 15:54:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id y3Ex4h2-vb7H; Tue, 25 Aug 2020 15:54:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BbVpR1hHJz9txlk;
 Tue, 25 Aug 2020 15:54:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ADA178B822;
 Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id D-iRctOA12bX; Tue, 25 Aug 2020 15:54:08 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 148A28B820;
 Tue, 25 Aug 2020 15:54:05 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 616B165D41; Tue, 25 Aug 2020 13:54:05 +0000 (UTC)
Message-Id: <4c0893ca6848386eb764a016b2783f368b7d6740.1598363608.git.christophe.leroy@csgroup.eu>
In-Reply-To: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 7/9] powerpc/vdso: Move vdso datapage up front
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 25 Aug 2020 13:54:05 +0000 (UTC)
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

Move the vdso datapage in front of the VDSO area,
before vdso test.

This will allow to remove the __kernel_datapage_offset symbol
and simplify __get_datapage() in the following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/mmu_context.h |  4 +++-
 arch/powerpc/kernel/vdso.c             | 22 ++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 7f3658a97384..be18ad12bb54 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -262,7 +262,9 @@ extern void arch_exit_mmap(struct mm_struct *mm);
 static inline void arch_unmap(struct mm_struct *mm,
 			      unsigned long start, unsigned long end)
 {
-	if (start <= mm->context.vdso_base && mm->context.vdso_base < end)
+	unsigned long vdso_base = mm->context.vdso_base - PAGE_SIZE;
+
+	if (start <= vdso_base && vdso_base < end)
 		mm->context.vdso_base = 0;
 }
 
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index b9270923452e..1d72c4b7672f 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -124,7 +124,7 @@ static int vdso_mremap(unsigned long vdso_pages,
 	if (new_size != vdso_size)
 		return -EINVAL;
 
-	current->mm->context.vdso_base = (unsigned long)new_vma->vm_start;
+	current->mm->context.vdso_base = (unsigned long)new_vma->vm_start + PAGE_SIZE;
 
 	return 0;
 }
@@ -217,7 +217,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
 	 */
-	current->mm->context.vdso_base = vdso_base;
+	current->mm->context.vdso_base = vdso_base + PAGE_SIZE;
 
 	/*
 	 * our vma flags don't have VM_WRITE so by default, the process isn't
@@ -516,8 +516,7 @@ static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
 		return -1;
 	}
 	*((int *)(vdso64_kbase + sym64->st_value - VDSO64_LBASE)) =
-		(vdso64_pages << PAGE_SHIFT) -
-		(sym64->st_value - VDSO64_LBASE);
+		(sym64->st_value - VDSO64_LBASE) - PAGE_SIZE;
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_VDSO32
@@ -528,8 +527,7 @@ static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
 		return -1;
 	}
 	*((int *)(vdso32_kbase + (sym32->st_value - VDSO32_LBASE))) =
-		(vdso32_pages << PAGE_SHIFT) -
-		(sym32->st_value - VDSO32_LBASE);
+		(sym32->st_value - VDSO32_LBASE) - PAGE_SIZE;
 #endif
 
 	return 0;
@@ -771,10 +769,10 @@ static int __init vdso_init(void)
 		if (!pagelist)
 			goto alloc_failed;
 
-		for (i = 0; i < vdso32_pages; i++)
-			pagelist[i] = virt_to_page(vdso32_kbase + i * PAGE_SIZE);
+		pagelist[0] = virt_to_page(vdso_data);
 
-		pagelist[i++] = virt_to_page(vdso_data);
+		for (i = 0; i < vdso32_pages; i++)
+			pagelist[i + 1] = virt_to_page(vdso32_kbase + i * PAGE_SIZE);
 
 		vdso32_spec.pages = pagelist;
 	}
@@ -784,10 +782,10 @@ static int __init vdso_init(void)
 		if (!pagelist)
 			goto alloc_failed;
 
-		for (i = 0; i < vdso64_pages; i++)
-			pagelist[i] = virt_to_page(vdso64_kbase + i * PAGE_SIZE);
+		pagelist[0] = virt_to_page(vdso_data);
 
-		pagelist[i++] = virt_to_page(vdso_data);
+		for (i = 0; i < vdso64_pages; i++)
+			pagelist[i + 1] = virt_to_page(vdso64_kbase + i * PAGE_SIZE);
 
 		vdso64_spec.pages = pagelist;
 	}
-- 
2.25.0

