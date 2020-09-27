Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4827A04F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:40:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzgd40WhGzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:40:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4y0TlMzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4p2R3Lz9vCy2;
 Sun, 27 Sep 2020 11:16:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vuzUUH5A7mU9; Sun, 27 Sep 2020 11:16:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4p1jZmz9vCxw;
 Sun, 27 Sep 2020 11:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBFE98B771;
 Sun, 27 Sep 2020 11:16:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q4hOwA-r0z1L; Sun, 27 Sep 2020 11:16:30 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 99C4D8B75B;
 Sun, 27 Sep 2020 11:16:30 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7F4F865DE8; Sun, 27 Sep 2020 09:16:30 +0000 (UTC)
Message-Id: <b68c99b6e8ee0b1d99bfa4c7e34c359fc1bc1000.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 13/30] powerpc/vdso: Move vdso datapage up front
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:30 +0000 (UTC)
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
and simplify __get_datapage() in following patches.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/mmu_context.h |  2 +-
 arch/powerpc/kernel/vdso.c             | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index d54358cb5be1..e5a5e3cb7724 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -262,7 +262,7 @@ extern void arch_exit_mmap(struct mm_struct *mm);
 static inline void arch_unmap(struct mm_struct *mm,
 			      unsigned long start, unsigned long end)
 {
-	unsigned long vdso_base = (unsigned long)mm->context.vdso;
+	unsigned long vdso_base = (unsigned long)mm->context.vdso - PAGE_SIZE;
 
 	if (start <= vdso_base && vdso_base < end)
 		mm->context.vdso = NULL;
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 87b77b793029..7042e9edfb96 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -123,7 +123,7 @@ static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struc
 	if (new_size != text_size + PAGE_SIZE)
 		return -EINVAL;
 
-	current->mm->context.vdso = (void __user *)new_vma->vm_start;
+	current->mm->context.vdso = (void __user *)new_vma->vm_start + PAGE_SIZE;
 
 	return 0;
 }
@@ -198,7 +198,7 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO.
 	 */
-	mm->context.vdso = (void __user *)vdso_base;
+	mm->context.vdso = (void __user *)vdso_base + PAGE_SIZE;
 
 	/*
 	 * our vma flags don't have VM_WRITE so by default, the process isn't
@@ -510,7 +510,7 @@ static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
 		return -1;
 	}
 	*((int *)(vdso64_kbase + sym64->st_value - VDSO64_LBASE)) =
-		(vdso64_pages << PAGE_SHIFT) -
+		-PAGE_SIZE -
 		(sym64->st_value - VDSO64_LBASE);
 #endif /* CONFIG_PPC64 */
 
@@ -522,7 +522,7 @@ static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
 		return -1;
 	}
 	*((int *)(vdso32_kbase + (sym32->st_value - VDSO32_LBASE))) =
-		(vdso32_pages << PAGE_SHIFT) -
+		-PAGE_SIZE -
 		(sym32->st_value - VDSO32_LBASE);
 #endif
 
@@ -696,10 +696,10 @@ static struct page ** __init vdso_setup_pages(void *start, void *end)
 	if (!pagelist)
 		panic("%s: Cannot allocate page list for VDSO", __func__);
 
-	for (i = 0; i < pages; i++)
-		pagelist[i] = virt_to_page(start + i * PAGE_SIZE);
+	pagelist[0] = virt_to_page(vdso_data);
 
-	pagelist[i] = virt_to_page(vdso_data);
+	for (i = 0; i < pages; i++)
+		pagelist[i + 1] = virt_to_page(start + i * PAGE_SIZE);
 
 	return pagelist;
 }
-- 
2.25.0

