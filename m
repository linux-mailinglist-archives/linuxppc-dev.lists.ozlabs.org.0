Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B7C5EAB0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbmsT2Grlz3f9t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 01:30:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeTFu9i8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeTFu9i8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeTFu9i8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeTFu9i8;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbmnq3N9rz3c5B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 01:26:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664206013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i83BLh5R0qHXO6jj+0dLjGQBOSA19qS6oRXTpzECh4E=;
	b=KeTFu9i8CWdwZvhhc+uu2tEPyUUgtM7bjwPTk0IN/7zgCMMLipXOyeend4DWRYLMMlYm1d
	vigl32fOzewzLK091B9Igbe6Y2Q94iR30E8i9vnhWEMuDoTFWigPJ7DHG76sZnXnKY12+Y
	zI4l8Zv8GYHlwl/h3tzR+nidhNJ/Ch8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664206013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i83BLh5R0qHXO6jj+0dLjGQBOSA19qS6oRXTpzECh4E=;
	b=KeTFu9i8CWdwZvhhc+uu2tEPyUUgtM7bjwPTk0IN/7zgCMMLipXOyeend4DWRYLMMlYm1d
	vigl32fOzewzLK091B9Igbe6Y2Q94iR30E8i9vnhWEMuDoTFWigPJ7DHG76sZnXnKY12+Y
	zI4l8Zv8GYHlwl/h3tzR+nidhNJ/Ch8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-yhS5X37dPeGP6YEsoamlow-1; Mon, 26 Sep 2022 11:26:42 -0400
X-MC-Unique: yhS5X37dPeGP6YEsoamlow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F45E85A5A6;
	Mon, 26 Sep 2022 15:26:41 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6E8EC15BA5;
	Mon, 26 Sep 2022 15:26:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 5/5] mm: remove unused savedwrite infrastructure
Date: Mon, 26 Sep 2022 17:26:18 +0200
Message-Id: <20220926152618.194810-6-david@redhat.com>
In-Reply-To: <20220926152618.194810-1-david@redhat.com>
References: <20220926152618.194810-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <anshuman.khandual@arm.com>, Dave Chinner <david@fromorbit.com>, Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NUMA hinting no longer uses savedwrite, let's rip it out.

... and while at it, drop __pte_write() and __pmd_write() on ppc64.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 80 +-------------------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  2 +-
 include/linux/pgtable.h                      | 24 ------
 mm/debug_vm_pgtable.c                        | 32 --------
 4 files changed, 5 insertions(+), 133 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 392ff48f77df..b3ddc34d71c1 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -418,35 +418,9 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 #define __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
 #define pmdp_clear_flush_young pmdp_test_and_clear_young
 
-static inline int __pte_write(pte_t pte)
-{
-	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_WRITE));
-}
-
-#ifdef CONFIG_NUMA_BALANCING
-#define pte_savedwrite pte_savedwrite
-static inline bool pte_savedwrite(pte_t pte)
-{
-	/*
-	 * Saved write ptes are prot none ptes that doesn't have
-	 * privileged bit sit. We mark prot none as one which has
-	 * present and pviliged bit set and RWX cleared. To mark
-	 * protnone which used to have _PAGE_WRITE set we clear
-	 * the privileged bit.
-	 */
-	return !(pte_raw(pte) & cpu_to_be64(_PAGE_RWX | _PAGE_PRIVILEGED));
-}
-#else
-#define pte_savedwrite pte_savedwrite
-static inline bool pte_savedwrite(pte_t pte)
-{
-	return false;
-}
-#endif
-
 static inline int pte_write(pte_t pte)
 {
-	return __pte_write(pte) || pte_savedwrite(pte);
+	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_WRITE));
 }
 
 static inline int pte_read(pte_t pte)
@@ -458,24 +432,16 @@ static inline int pte_read(pte_t pte)
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pte_t *ptep)
 {
-	if (__pte_write(*ptep))
+	if (pte_write(*ptep))
 		pte_update(mm, addr, ptep, _PAGE_WRITE, 0, 0);
-	else if (unlikely(pte_savedwrite(*ptep)))
-		pte_update(mm, addr, ptep, 0, _PAGE_PRIVILEGED, 0);
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
 static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 					   unsigned long addr, pte_t *ptep)
 {
-	/*
-	 * We should not find protnone for hugetlb, but this complete the
-	 * interface.
-	 */
-	if (__pte_write(*ptep))
+	if (pte_write(*ptep))
 		pte_update(mm, addr, ptep, _PAGE_WRITE, 0, 1);
-	else if (unlikely(pte_savedwrite(*ptep)))
-		pte_update(mm, addr, ptep, 0, _PAGE_PRIVILEGED, 1);
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
@@ -552,36 +518,6 @@ static inline int pte_protnone(pte_t pte)
 	return (pte_raw(pte) & cpu_to_be64(_PAGE_PRESENT | _PAGE_PTE | _PAGE_RWX)) ==
 		cpu_to_be64(_PAGE_PRESENT | _PAGE_PTE);
 }
-
-#define pte_mk_savedwrite pte_mk_savedwrite
-static inline pte_t pte_mk_savedwrite(pte_t pte)
-{
-	/*
-	 * Used by Autonuma subsystem to preserve the write bit
-	 * while marking the pte PROT_NONE. Only allow this
-	 * on PROT_NONE pte
-	 */
-	VM_BUG_ON((pte_raw(pte) & cpu_to_be64(_PAGE_PRESENT | _PAGE_RWX | _PAGE_PRIVILEGED)) !=
-		  cpu_to_be64(_PAGE_PRESENT | _PAGE_PRIVILEGED));
-	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_PRIVILEGED));
-}
-
-#define pte_clear_savedwrite pte_clear_savedwrite
-static inline pte_t pte_clear_savedwrite(pte_t pte)
-{
-	/*
-	 * Used by KSM subsystem to make a protnone pte readonly.
-	 */
-	VM_BUG_ON(!pte_protnone(pte));
-	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PRIVILEGED));
-}
-#else
-#define pte_clear_savedwrite pte_clear_savedwrite
-static inline pte_t pte_clear_savedwrite(pte_t pte)
-{
-	VM_WARN_ON(1);
-	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_WRITE));
-}
 #endif /* CONFIG_NUMA_BALANCING */
 
 static inline bool pte_hw_valid(pte_t pte)
@@ -658,8 +594,6 @@ static inline unsigned long pte_pfn(pte_t pte)
 /* Generic modifiers for PTE bits */
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	if (unlikely(pte_savedwrite(pte)))
-		return pte_clear_savedwrite(pte);
 	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_WRITE));
 }
 
@@ -1156,8 +1090,6 @@ static inline pte_t *pmdp_ptep(pmd_t *pmd)
 #define pmd_mkclean(pmd)	pte_pmd(pte_mkclean(pmd_pte(pmd)))
 #define pmd_mkyoung(pmd)	pte_pmd(pte_mkyoung(pmd_pte(pmd)))
 #define pmd_mkwrite(pmd)	pte_pmd(pte_mkwrite(pmd_pte(pmd)))
-#define pmd_mk_savedwrite(pmd)	pte_pmd(pte_mk_savedwrite(pmd_pte(pmd)))
-#define pmd_clear_savedwrite(pmd)	pte_pmd(pte_clear_savedwrite(pmd_pte(pmd)))
 
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 #define pmd_soft_dirty(pmd)    pte_soft_dirty(pmd_pte(pmd))
@@ -1179,8 +1111,6 @@ static inline int pmd_protnone(pmd_t pmd)
 #endif /* CONFIG_NUMA_BALANCING */
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
-#define __pmd_write(pmd)	__pte_write(pmd_pte(pmd))
-#define pmd_savedwrite(pmd)	pte_savedwrite(pmd_pte(pmd))
 
 #define pmd_access_permitted pmd_access_permitted
 static inline bool pmd_access_permitted(pmd_t pmd, bool write)
@@ -1258,10 +1188,8 @@ static inline int __pmdp_test_and_clear_young(struct mm_struct *mm,
 static inline void pmdp_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pmd_t *pmdp)
 {
-	if (__pmd_write((*pmdp)))
+	if (pmd_write(*pmdp))
 		pmd_hugepage_update(mm, addr, pmdp, _PAGE_WRITE, 0);
-	else if (unlikely(pmd_savedwrite(*pmdp)))
-		pmd_hugepage_update(mm, addr, pmdp, 0, _PAGE_PRIVILEGED);
 }
 
 /*
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 5a05953ae13f..9182324dbef9 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -265,7 +265,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 		}
 		pte = kvmppc_read_update_linux_pte(ptep, writing);
 		if (pte_present(pte) && !pte_protnone(pte)) {
-			if (writing && !__pte_write(pte))
+			if (writing && !pte_write(pte))
 				/* make the actual HPTE be read-only */
 				ptel = hpte_make_readonly(ptel);
 			is_ci = pte_ci(pte);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index d13b4f7cc5be..02d88fdb44af 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -472,30 +472,6 @@ static inline pte_t pte_sw_mkyoung(pte_t pte)
 #define pte_sw_mkyoung	pte_sw_mkyoung
 #endif
 
-#ifndef pte_savedwrite
-#define pte_savedwrite pte_write
-#endif
-
-#ifndef pte_mk_savedwrite
-#define pte_mk_savedwrite pte_mkwrite
-#endif
-
-#ifndef pte_clear_savedwrite
-#define pte_clear_savedwrite pte_wrprotect
-#endif
-
-#ifndef pmd_savedwrite
-#define pmd_savedwrite pmd_write
-#endif
-
-#ifndef pmd_mk_savedwrite
-#define pmd_mk_savedwrite pmd_mkwrite
-#endif
-
-#ifndef pmd_clear_savedwrite
-#define pmd_clear_savedwrite pmd_wrprotect
-#endif
-
 #ifndef __HAVE_ARCH_PMDP_SET_WRPROTECT
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline void pmdp_set_wrprotect(struct mm_struct *mm,
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index dc7df1254f0a..5dae04c05d79 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -175,18 +175,6 @@ static void __init pte_advanced_tests(struct pgtable_debug_args *args)
 	ptep_get_and_clear_full(args->mm, args->vaddr, args->ptep, 1);
 }
 
-static void __init pte_savedwrite_tests(struct pgtable_debug_args *args)
-{
-	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot_none);
-
-	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
-		return;
-
-	pr_debug("Validating PTE saved write\n");
-	WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
-	WARN_ON(pte_savedwrite(pte_clear_savedwrite(pte_mk_savedwrite(pte))));
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_basic_tests(struct pgtable_debug_args *args, int idx)
 {
@@ -306,22 +294,6 @@ static void __init pmd_leaf_tests(struct pgtable_debug_args *args)
 	WARN_ON(!pmd_leaf(pmd));
 }
 
-static void __init pmd_savedwrite_tests(struct pgtable_debug_args *args)
-{
-	pmd_t pmd;
-
-	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
-		return;
-
-	if (!has_transparent_hugepage())
-		return;
-
-	pr_debug("Validating PMD saved write\n");
-	pmd = pfn_pmd(args->fixed_pmd_pfn, args->page_prot_none);
-	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
-	WARN_ON(pmd_savedwrite(pmd_clear_savedwrite(pmd_mk_savedwrite(pmd))));
-}
-
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static void __init pud_basic_tests(struct pgtable_debug_args *args, int idx)
 {
@@ -455,7 +427,6 @@ static void __init pmd_advanced_tests(struct pgtable_debug_args *args) { }
 static void __init pud_advanced_tests(struct pgtable_debug_args *args) { }
 static void __init pmd_leaf_tests(struct pgtable_debug_args *args) { }
 static void __init pud_leaf_tests(struct pgtable_debug_args *args) { }
-static void __init pmd_savedwrite_tests(struct pgtable_debug_args *args) { }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
@@ -1292,9 +1263,6 @@ static int __init debug_vm_pgtable(void)
 	pmd_leaf_tests(&args);
 	pud_leaf_tests(&args);
 
-	pte_savedwrite_tests(&args);
-	pmd_savedwrite_tests(&args);
-
 	pte_special_tests(&args);
 	pte_protnone_tests(&args);
 	pmd_protnone_tests(&args);
-- 
2.37.3

