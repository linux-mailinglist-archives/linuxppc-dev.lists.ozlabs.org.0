Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B98714E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:40:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TCG3SxUm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TCG3SxUm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpjXp4JdZz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TCG3SxUm;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TCG3SxUm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpjVj4Xdnz3dS8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 15:38:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QbuW0TP7ygRzpUgEE/ySP4xE54ZTcBrdqA8JLCTBNJE=;
	b=TCG3SxUmhzCleWZcFONwp1Ybm+waG1tiuf2K76e7nOk91jmcTwwRaEAhR/tXqDWfXeZt8T
	m11kTucqGZRUnPo23RyOxA8f1o5zTKNQXBkJZ0YYGFG7/Gm+CQmBdB98ScfHVkFsP3QMz6
	U5Di2dT+7PFTbjdVULf4sH+a5tw/eDM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QbuW0TP7ygRzpUgEE/ySP4xE54ZTcBrdqA8JLCTBNJE=;
	b=TCG3SxUmhzCleWZcFONwp1Ybm+waG1tiuf2K76e7nOk91jmcTwwRaEAhR/tXqDWfXeZt8T
	m11kTucqGZRUnPo23RyOxA8f1o5zTKNQXBkJZ0YYGFG7/Gm+CQmBdB98ScfHVkFsP3QMz6
	U5Di2dT+7PFTbjdVULf4sH+a5tw/eDM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-G-aIZmK0PrWZev79I9mo_A-1; Mon, 04 Mar 2024 23:38:15 -0500
X-MC-Unique: G-aIZmK0PrWZev79I9mo_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D02E3101A552;
	Tue,  5 Mar 2024 04:38:14 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA43AC1F086;
	Tue,  5 Mar 2024 04:38:07 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] mm/ppc: Replace pXd_is_leaf() with pXd_leaf()
Date: Tue,  5 Mar 2024 12:37:42 +0800
Message-ID: <20240305043750.93762-3-peterx@redhat.com>
In-Reply-To: <20240305043750.93762-1-peterx@redhat.com>
References: <20240305043750.93762-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, Nicholas Piggin <npiggin@gmail.com>, peterx@redhat.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

They're the same macros underneath.  Drop pXd_is_leaf(), instead always use
pXd_leaf().

At the meantime, instead of renames, drop the pXd_is_leaf() fallback
definitions directly in arch/powerpc/include/asm/pgtable.h. because similar
fallback macros for pXd_leaf() are already defined in
include/linux/pgtable.h.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++----
 arch/powerpc/include/asm/pgtable.h           | 24 --------------------
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +++++-----
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 14 ++++++------
 arch/powerpc/mm/pgtable.c                    |  6 ++---
 arch/powerpc/mm/pgtable_64.c                 |  6 ++---
 arch/powerpc/xmon/xmon.c                     |  6 ++---
 7 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index d1318e8582ac..3e99e409774a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1439,18 +1439,16 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 /*
  * Like pmd_huge() and pmd_large(), but works regardless of config options
  */
-#define pmd_is_leaf pmd_is_leaf
-#define pmd_leaf pmd_is_leaf
+#define pmd_leaf pmd_leaf
 #define pmd_large pmd_leaf
-static inline bool pmd_is_leaf(pmd_t pmd)
+static inline bool pmd_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
-#define pud_is_leaf pud_is_leaf
-#define pud_leaf pud_is_leaf
+#define pud_leaf pud_leaf
 #define pud_large pud_leaf
-static inline bool pud_is_leaf(pud_t pud)
+static inline bool pud_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 5928b3c1458d..e6edf1cdbc5b 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -182,30 +182,6 @@ static inline void pte_frag_set(mm_context_t *ctx, void *p)
 }
 #endif
 
-#ifndef pmd_is_leaf
-#define pmd_is_leaf pmd_is_leaf
-static inline bool pmd_is_leaf(pmd_t pmd)
-{
-	return false;
-}
-#endif
-
-#ifndef pud_is_leaf
-#define pud_is_leaf pud_is_leaf
-static inline bool pud_is_leaf(pud_t pud)
-{
-	return false;
-}
-#endif
-
-#ifndef p4d_is_leaf
-#define p4d_is_leaf p4d_is_leaf
-static inline bool p4d_is_leaf(p4d_t p4d)
-{
-	return false;
-}
-#endif
-
 #define pmd_pgtable pmd_pgtable
 static inline pgtable_t pmd_pgtable(pmd_t pmd)
 {
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 4a1abb9f7c05..408d98f8a514 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -503,7 +503,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 	for (im = 0; im < PTRS_PER_PMD; ++im, ++p) {
 		if (!pmd_present(*p))
 			continue;
-		if (pmd_is_leaf(*p)) {
+		if (pmd_leaf(*p)) {
 			if (full) {
 				pmd_clear(p);
 			} else {
@@ -532,7 +532,7 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
 	for (iu = 0; iu < PTRS_PER_PUD; ++iu, ++p) {
 		if (!pud_present(*p))
 			continue;
-		if (pud_is_leaf(*p)) {
+		if (pud_leaf(*p)) {
 			pud_clear(p);
 		} else {
 			pmd_t *pmd;
@@ -635,12 +635,12 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = pud_alloc_one(kvm->mm, gpa);
 
 	pmd = NULL;
-	if (pud && pud_present(*pud) && !pud_is_leaf(*pud))
+	if (pud && pud_present(*pud) && !pud_leaf(*pud))
 		pmd = pmd_offset(pud, gpa);
 	else if (level <= 1)
 		new_pmd = kvmppc_pmd_alloc();
 
-	if (level == 0 && !(pmd && pmd_present(*pmd) && !pmd_is_leaf(*pmd)))
+	if (level == 0 && !(pmd && pmd_present(*pmd) && !pmd_leaf(*pmd)))
 		new_ptep = kvmppc_pte_alloc();
 
 	/* Check if we might have been invalidated; let the guest retry if so */
@@ -658,7 +658,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = NULL;
 	}
 	pud = pud_offset(p4d, gpa);
-	if (pud_is_leaf(*pud)) {
+	if (pud_leaf(*pud)) {
 		unsigned long hgpa = gpa & PUD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
@@ -709,7 +709,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pmd = NULL;
 	}
 	pmd = pmd_offset(pud, gpa);
-	if (pmd_is_leaf(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		unsigned long lgpa = gpa & PMD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c6a4ac766b2b..1f8db10693e3 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -204,14 +204,14 @@ static void radix__change_memory_range(unsigned long start, unsigned long end,
 		pudp = pud_alloc(&init_mm, p4dp, idx);
 		if (!pudp)
 			continue;
-		if (pud_is_leaf(*pudp)) {
+		if (pud_leaf(*pudp)) {
 			ptep = (pte_t *)pudp;
 			goto update_the_pte;
 		}
 		pmdp = pmd_alloc(&init_mm, pudp, idx);
 		if (!pmdp)
 			continue;
-		if (pmd_is_leaf(*pmdp)) {
+		if (pmd_leaf(*pmdp)) {
 			ptep = pmdp_ptep(pmdp);
 			goto update_the_pte;
 		}
@@ -767,7 +767,7 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 		if (!pmd_present(*pmd))
 			continue;
 
-		if (pmd_is_leaf(*pmd)) {
+		if (pmd_leaf(*pmd)) {
 			if (IS_ALIGNED(addr, PMD_SIZE) &&
 			    IS_ALIGNED(next, PMD_SIZE)) {
 				if (!direct)
@@ -807,7 +807,7 @@ static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
 		if (!pud_present(*pud))
 			continue;
 
-		if (pud_is_leaf(*pud)) {
+		if (pud_leaf(*pud)) {
 			if (!IS_ALIGNED(addr, PUD_SIZE) ||
 			    !IS_ALIGNED(next, PUD_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -845,7 +845,7 @@ remove_pagetable(unsigned long start, unsigned long end, bool direct,
 		if (!p4d_present(*p4d))
 			continue;
 
-		if (p4d_is_leaf(*p4d)) {
+		if (p4d_leaf(*p4d)) {
 			if (!IS_ALIGNED(addr, P4D_SIZE) ||
 			    !IS_ALIGNED(next, P4D_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -1554,7 +1554,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 
 int pud_clear_huge(pud_t *pud)
 {
-	if (pud_is_leaf(*pud)) {
+	if (pud_leaf(*pud)) {
 		pud_clear(pud);
 		return 1;
 	}
@@ -1601,7 +1601,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 
 int pmd_clear_huge(pmd_t *pmd)
 {
-	if (pmd_is_leaf(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		pmd_clear(pmd);
 		return 1;
 	}
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 549a440ed7f6..9e7ba9c3851f 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -410,7 +410,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (p4d_none(p4d))
 		return NULL;
 
-	if (p4d_is_leaf(p4d)) {
+	if (p4d_leaf(p4d)) {
 		ret_pte = (pte_t *)p4dp;
 		goto out;
 	}
@@ -432,7 +432,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (pud_none(pud))
 		return NULL;
 
-	if (pud_is_leaf(pud)) {
+	if (pud_leaf(pud)) {
 		ret_pte = (pte_t *)pudp;
 		goto out;
 	}
@@ -471,7 +471,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out;
 	}
 
-	if (pmd_is_leaf(pmd)) {
+	if (pmd_leaf(pmd)) {
 		ret_pte = (pte_t *)pmdp;
 		goto out;
 	}
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 1b366526f4f2..386c6b06eab7 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(__pte_frag_size_shift);
 /* 4 level page table */
 struct page *p4d_page(p4d_t p4d)
 {
-	if (p4d_is_leaf(p4d)) {
+	if (p4d_leaf(p4d)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
 			VM_WARN_ON(!p4d_huge(p4d));
 		return pte_page(p4d_pte(p4d));
@@ -111,7 +111,7 @@ struct page *p4d_page(p4d_t p4d)
 
 struct page *pud_page(pud_t pud)
 {
-	if (pud_is_leaf(pud)) {
+	if (pud_leaf(pud)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
 			VM_WARN_ON(!pud_huge(pud));
 		return pte_page(pud_pte(pud));
@@ -125,7 +125,7 @@ struct page *pud_page(pud_t pud)
  */
 struct page *pmd_page(pmd_t pmd)
 {
-	if (pmd_is_leaf(pmd)) {
+	if (pmd_leaf(pmd)) {
 		/*
 		 * vmalloc_to_page may be called on any vmap address (not only
 		 * vmalloc), and it uses pmd_page() etc., when huge vmap is
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index b3b94cd37713..9669c9925225 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3342,7 +3342,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (p4d_is_leaf(*p4dp)) {
+	if (p4d_leaf(*p4dp)) {
 		format_pte(p4dp, p4d_val(*p4dp));
 		return;
 	}
@@ -3356,7 +3356,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pud_is_leaf(*pudp)) {
+	if (pud_leaf(*pudp)) {
 		format_pte(pudp, pud_val(*pudp));
 		return;
 	}
@@ -3370,7 +3370,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pmd_is_leaf(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		format_pte(pmdp, pmd_val(*pmdp));
 		return;
 	}
-- 
2.44.0

