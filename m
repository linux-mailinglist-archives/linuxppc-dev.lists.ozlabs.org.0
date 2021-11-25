Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FD45E00A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 18:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0QVM0qPdz30R8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:54:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0QTt48PWz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 04:53:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0QTn01Pzz9sT4;
 Thu, 25 Nov 2021 18:53:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_8JmRREWLzB; Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0QTm68XDz9sSL;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C37A08B78C;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ahK6QcsKIGF4; Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DBBA8B77D;
 Thu, 25 Nov 2021 18:53:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1APHrKPK385519
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 18:53:20 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1APHrK5g385518;
 Thu, 25 Nov 2021 18:53:20 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v2 rebased 2/9] powerpc/mm: Move vma_mmu_pagesize() and
 hugetlb_get_unmapped_area() to slice.c
Date: Thu, 25 Nov 2021 18:52:51 +0100
Message-Id: <aa992a8fd2e1198d209afceb457b77f6b4d8755c.1637862579.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637862579.git.christophe.leroy@csgroup.eu>
References: <cover.1637862579.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637862776; l=7532; s=20211009;
 h=from:subject:message-id; bh=rf8c2Va0a+oPrjsrDKbsVVqJCso4PiLiMZDeQ0MksqU=;
 b=tEQbesuyaRUEWYPvN3cZebsDN9qU6BJEvltIRIpQ18s46CA6wRj0s/OdH45nFklcKEK9mcHYd1DL
 6mksDnskCe7Rx/W9l1/7jMC6nE2h5WP+gvX49AXkzF84DJI9EyjC
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vma_mmu_pagesize() is only required for slices,
otherwise there is a generic weak version.

hugetlb_get_unmapped_area() is dedicated to slices.
radix__hugetlb_get_unmapped_area() as well.

Move them to slice.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hugetlb.h |  4 --
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 55 --------------
 arch/powerpc/mm/book3s64/slice.c             | 76 ++++++++++++++++++++
 arch/powerpc/mm/hugetlbpage.c                | 28 --------
 4 files changed, 76 insertions(+), 87 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/include/asm/book3s/64/hugetlb.h
index 12e150e615b7..b37a28f62cf6 100644
--- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
+++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
@@ -8,10 +8,6 @@
  */
 void radix__flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
-extern unsigned long
-radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-				unsigned long len, unsigned long pgoff,
-				unsigned long flags);
 
 extern void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 						unsigned long addr, pte_t *ptep,
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index 23d3e08911d3..d2fb776febb4 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -41,61 +41,6 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long st
 		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
 }
 
-/*
- * A vairant of hugetlb_get_unmapped_area doing topdown search
- * FIXME!! should we do as x86 does or non hugetlb area does ?
- * ie, use topdown or not based on mmap_is_legacy check ?
- */
-unsigned long
-radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-				unsigned long len, unsigned long pgoff,
-				unsigned long flags)
-{
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	struct hstate *h = hstate_file(file);
-	int fixed = (flags & MAP_FIXED);
-	unsigned long high_limit;
-	struct vm_unmapped_area_info info;
-
-	high_limit = DEFAULT_MAP_WINDOW;
-	if (addr >= high_limit || (fixed && (addr + len > high_limit)))
-		high_limit = TASK_SIZE;
-
-	if (len & ~huge_page_mask(h))
-		return -EINVAL;
-	if (len > high_limit)
-		return -ENOMEM;
-
-	if (fixed) {
-		if (addr > high_limit - len)
-			return -ENOMEM;
-		if (prepare_hugepage_range(file, addr, len))
-			return -EINVAL;
-		return addr;
-	}
-
-	if (addr) {
-		addr = ALIGN(addr, huge_page_size(h));
-		vma = find_vma(mm, addr);
-		if (high_limit - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
-	/*
-	 * We are always doing an topdown search here. Slice code
-	 * does that too.
-	 */
-	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
-	info.length = len;
-	info.low_limit = max(PAGE_SIZE, mmap_min_addr);
-	info.high_limit = mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
-	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
-
-	return vm_unmapped_area(&info);
-}
-
 void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t pte)
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index c83be371c6e7..4c3e9601fdf6 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -777,4 +777,80 @@ int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
 
 	return !slice_check_range_fits(mm, maskp, addr, len);
 }
+
+unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
+{
+	/* With radix we don't use slice, so derive it from vma*/
+	if (radix_enabled())
+		return vma_kernel_pagesize(vma);
+
+	return 1UL << mmu_psize_to_shift(get_slice_psize(vma->vm_mm, vma->vm_start));
+}
+
+/*
+ * A variant of hugetlb_get_unmapped_area() doing topdown search
+ * FIXME!! should we do as x86 does or non hugetlb area does ?
+ * ie, use topdown or not based on mmap_is_legacy check ?
+ */
+static unsigned long
+radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
+				 unsigned long pgoff, unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
+	struct hstate *h = hstate_file(file);
+	int fixed = (flags & MAP_FIXED);
+	unsigned long high_limit;
+	struct vm_unmapped_area_info info;
+
+	high_limit = DEFAULT_MAP_WINDOW;
+	if (addr >= high_limit || (fixed && (addr + len > high_limit)))
+		high_limit = TASK_SIZE;
+
+	if (len & ~huge_page_mask(h))
+		return -EINVAL;
+	if (len > high_limit)
+		return -ENOMEM;
+
+	if (fixed) {
+		if (addr > high_limit - len)
+			return -ENOMEM;
+		if (prepare_hugepage_range(file, addr, len))
+			return -EINVAL;
+		return addr;
+	}
+
+	if (addr) {
+		addr = ALIGN(addr, huge_page_size(h));
+		vma = find_vma(mm, addr);
+		if (high_limit - len >= addr && addr >= mmap_min_addr &&
+		    (!vma || addr + len <= vm_start_gap(vma)))
+			return addr;
+	}
+	/*
+	 * We are always doing an topdown search here. Slice code
+	 * does that too.
+	 */
+	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
+	info.length = len;
+	info.low_limit = max(PAGE_SIZE, mmap_min_addr);
+	info.high_limit = mm->mmap_base + (high_limit - DEFAULT_MAP_WINDOW);
+	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
+	info.align_offset = 0;
+
+	return vm_unmapped_area(&info);
+}
+
+unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
+					unsigned long len, unsigned long pgoff,
+					unsigned long flags)
+{
+	struct hstate *hstate = hstate_file(file);
+	int mmu_psize = shift_to_mmu_psize(huge_page_shift(hstate));
+
+	if (radix_enabled())
+		return radix__hugetlb_get_unmapped_area(file, addr, len, pgoff, flags);
+
+	return slice_get_unmapped_area(addr, len, flags, mmu_psize, 1);
+}
 #endif
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 82d8b368ca6d..eb9de09e49a3 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -542,34 +542,6 @@ struct page *follow_huge_pd(struct vm_area_struct *vma,
 	return page;
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
-unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-					unsigned long len, unsigned long pgoff,
-					unsigned long flags)
-{
-	struct hstate *hstate = hstate_file(file);
-	int mmu_psize = shift_to_mmu_psize(huge_page_shift(hstate));
-
-#ifdef CONFIG_PPC_RADIX_MMU
-	if (radix_enabled())
-		return radix__hugetlb_get_unmapped_area(file, addr, len,
-						       pgoff, flags);
-#endif
-	return slice_get_unmapped_area(addr, len, flags, mmu_psize, 1);
-}
-#endif
-
-unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	/* With radix we don't use slice, so derive it from vma*/
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
-		unsigned int psize = get_slice_psize(vma->vm_mm, vma->vm_start);
-
-		return 1UL << mmu_psize_to_shift(psize);
-	}
-	return vma_kernel_pagesize(vma);
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift = __ffs(size);
-- 
2.33.1

