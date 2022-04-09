Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6CF4FA9E4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:21:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMNr3Stqz3f09
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMKL6TCrz3bd6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:18:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KbMJs203xz9sTX;
 Sat,  9 Apr 2022 19:18:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUWjMthUBbeM; Sat,  9 Apr 2022 19:18:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KbMJl5RrWz9sTY;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A26278B76E;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pQjopICVn_7e; Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AA80B8B7AA;
 Sat,  9 Apr 2022 19:18:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 239HI84R833230
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 9 Apr 2022 19:18:08 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 239HI88l833229;
 Sat, 9 Apr 2022 19:18:08 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
Subject: [PATCH v10 09/13] powerpc/mm: Use generic_hugetlb_get_unmapped_area()
Date: Sat,  9 Apr 2022 19:17:33 +0200
Message-Id: <05f77014c619061638ecc52a0a4136eb04cc2799.1649523076.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649523076.git.christophe.leroy@csgroup.eu>
References: <cover.1649523076.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649524639; l=4049; s=20211009;
 h=from:subject:message-id; bh=koj4XG3IQ1J0I1gOO/UTrhx5DgiQqHDLrh3ic8nyM08=;
 b=t+ArvbuNay7Z6D8+Xk+9TTLbve3kcD+v9o24U41L/74yLSXNsF2xUFl1JDlniejT33HrNRSmYLW+
 c9+kPyVlD/2KFdFYE2J0Mpvb1+fYCWXAbMmkUNFQs7esCnw4g7+I
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

Use the generic version of arch_hugetlb_get_unmapped_area()
which is now available at all time.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hugetlb.h |  4 --
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 55 --------------------
 arch/powerpc/mm/hugetlbpage.c                |  4 +-
 3 files changed, 1 insertion(+), 62 deletions(-)

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
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index f71ac14018e2..a87c886042e9 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -553,11 +553,9 @@ unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
 					unsigned long flags)
 {
-#ifdef CONFIG_PPC_RADIX_MMU
 	if (radix_enabled())
-		return radix__hugetlb_get_unmapped_area(file, addr, len,
+		return generic_hugetlb_get_unmapped_area(file, addr, len,
 						       pgoff, flags);
-#endif
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
 #endif
-- 
2.35.1

