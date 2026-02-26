Return-Path: <linuxppc-dev+bounces-17258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C9JGgQwoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 715531A522D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8WY0z0yz3bf2;
	Thu, 26 Feb 2026 22:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105689;
	cv=none; b=OjKYePg+QuH3e+9THLmZQO4fV5FBj623i2DKFNq+kDn2EijigbO8pvBnA6Xl43sne5HX0eQPJQdlg1Se7VD0QUa+OdbqUrxGHOxH5j0xFZFtQrcwabJP5/umtzg2qN1Bos4EAi3iGKgdAYak370CGGB1HK/kKtOFN7QIj2pY/3B2mShL4JZZtdv1r8oGVAhpuSAPcMWBFJAyRTMwUF4VMzJcevJUzFiQ3JWizQubY+yUwmugV4HZd52NFlRGUgEt/kJ3nspuuRyhgaEWThD9UXxXXYCVX/8HTWansF9ByjCfRebjm243iIIEDvpRU9/+O7A73D2MaQ3CLNJbHpopPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105689; c=relaxed/relaxed;
	bh=Kw0FkaDkBXRrAmCqa28gOWGbpSgQF5u4LIYi77o4M0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bS034uCf2rzULDtNGvt08whLhFsztOIXEoxYPvLI70ggjiNUKY5TmXGbQNCpL7jxYZLlOawaySqvsEj4mNm9Gs6SLs/Gr6mhNnXYdIbcvnpzFAgzlMU8emTLPQBjfRElAteSIpn2e8sf9Hz28l8Ml/rc9Bx7FsidZ6akeOJ5xHO4XNUkKXyczcTm0R0IhNsbwTiweQwyuwfzyUJav/KzimPba5RtcWEdtyiQoiOxpvACm03R055O959Mzq4+n0+y6T8i287WgegK7tIl+srejOJSqqAE5P4N9VAIbywVPvgwjeDfmnV6UFH9IpFpdezLhD0MEhTY/r050AgFymugNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=byTP5zi+; dkim-atps=neutral; spf=pass (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=byTP5zi+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8WX0jndz2yFc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:34:48 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kw0FkaDkBXRrAmCqa28gOWGbpSgQF5u4LIYi77o4M0Y=;
	b=byTP5zi+rMnf5ueyMseSsuV5urx405u6MEyAZD6f8qMe7qARBvVczkX0DBMgZ9FxywC1s1
	f/HgYnmcI8KTtJauFTRe0BMxIBsYo8FyjtV9IBpN4+OZnuXMaiRXsLlMAD07fvPVQMIjUw
	s1lyltqh8GtQlX8opeJts0i7uKhvr2s=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	willy@infradead.org,
	linux-mm@kvack.org
Cc: fvdl@google.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>
Subject: [RFC v2 15/21] mm: thp: remove pgtable_trans_huge_{deposit/withdraw} when not needed
Date: Thu, 26 Feb 2026 03:23:44 -0800
Message-ID: <20260226113233.3987674-16-usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-1-usama.arif@linux.dev>
References: <20260226113233.3987674-1-usama.arif@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17258-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:usama.arif@linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 715531A522D
X-Rspamd-Action: no action

Since the previous commit made deposit/withdraw only needed for
architectures where arch_needs_pgtable_deposit() returns true (currently
only powerpc hash MMU), the generic implementation in pgtable-generic.c
and the s390/sparc overrides are now dead code — all call sites are
guarded by arch_needs_pgtable_deposit() which is compile-time false on
those architectures. Remove them entirely and replace the extern
declarations with static inline no-op stubs for the default case.

pgtable_trans_huge_{deposit,withdraw}() are renamed to
arch_pgtable_trans_huge_{deposit,withdraw}().

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 12 +++---
 arch/s390/include/asm/pgtable.h              |  6 ---
 arch/s390/mm/pgtable.c                       | 41 --------------------
 arch/sparc/include/asm/pgtable_64.h          |  6 ---
 arch/sparc/mm/tlb.c                          | 36 -----------------
 include/linux/pgtable.h                      | 16 +++++---
 mm/debug_vm_pgtable.c                        |  4 +-
 mm/huge_memory.c                             | 26 ++++++-------
 mm/khugepaged.c                              |  2 +-
 mm/memory.c                                  |  2 +-
 mm/migrate_device.c                          |  2 +-
 mm/pgtable-generic.c                         | 32 ---------------
 12 files changed, 35 insertions(+), 150 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 1a91762b455d9..e0dd2a83b9e05 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1360,18 +1360,18 @@ pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 				   unsigned long addr,
 				   pud_t *pudp, int full);
 
-#define __HAVE_ARCH_PGTABLE_DEPOSIT
-static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
-					      pmd_t *pmdp, pgtable_t pgtable)
+#define arch_pgtable_trans_huge_deposit arch_pgtable_trans_huge_deposit
+static inline void arch_pgtable_trans_huge_deposit(struct mm_struct *mm,
+						   pmd_t *pmdp, pgtable_t pgtable)
 {
 	if (radix_enabled())
 		return radix__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
 	return hash__pgtable_trans_huge_deposit(mm, pmdp, pgtable);
 }
 
-#define __HAVE_ARCH_PGTABLE_WITHDRAW
-static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
-						    pmd_t *pmdp)
+#define arch_pgtable_trans_huge_withdraw arch_pgtable_trans_huge_withdraw
+static inline pgtable_t arch_pgtable_trans_huge_withdraw(struct mm_struct *mm,
+							 pmd_t *pmdp)
 {
 	if (radix_enabled())
 		return radix__pgtable_trans_huge_withdraw(mm, pmdp);
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 1c3c3be93be9c..6bffe88b297b8 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1659,12 +1659,6 @@ pud_t pudp_xchg_direct(struct mm_struct *, unsigned long, pud_t *, pud_t);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
-#define __HAVE_ARCH_PGTABLE_DEPOSIT
-void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable);
-
-#define __HAVE_ARCH_PGTABLE_WITHDRAW
-pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 
 #define  __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
 static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 4acd8b140c4bd..c9a9ab2c7d937 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -312,44 +312,3 @@ pud_t pudp_xchg_direct(struct mm_struct *mm, unsigned long addr,
 	return old;
 }
 EXPORT_SYMBOL(pudp_xchg_direct);
-
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
-{
-	struct list_head *lh = (struct list_head *) pgtable;
-
-	assert_spin_locked(pmd_lockptr(mm, pmdp));
-
-	/* FIFO */
-	if (!pmd_huge_pte(mm, pmdp))
-		INIT_LIST_HEAD(lh);
-	else
-		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
-}
-
-pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
-{
-	struct list_head *lh;
-	pgtable_t pgtable;
-	pte_t *ptep;
-
-	assert_spin_locked(pmd_lockptr(mm, pmdp));
-
-	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
-	lh = (struct list_head *) pgtable;
-	if (list_empty(lh))
-		pmd_huge_pte(mm, pmdp) = NULL;
-	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
-		list_del(lh);
-	}
-	ptep = (pte_t *) pgtable;
-	set_pte(ptep, __pte(_PAGE_INVALID));
-	ptep++;
-	set_pte(ptep, __pte(_PAGE_INVALID));
-	return pgtable;
-}
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 74ede706fb325..60861560f8c40 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -987,12 +987,6 @@ void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			    pmd_t *pmdp);
 
-#define __HAVE_ARCH_PGTABLE_DEPOSIT
-void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable);
-
-#define __HAVE_ARCH_PGTABLE_WITHDRAW
-pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 #endif
 
 /*
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index 6d9dd5eb13287..9049d54e6e2cb 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -275,40 +275,4 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return old;
 }
 
-void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
-{
-	struct list_head *lh = (struct list_head *) pgtable;
-
-	assert_spin_locked(&mm->page_table_lock);
-
-	/* FIFO */
-	if (!pmd_huge_pte(mm, pmdp))
-		INIT_LIST_HEAD(lh);
-	else
-		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
-	pmd_huge_pte(mm, pmdp) = pgtable;
-}
-
-pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
-{
-	struct list_head *lh;
-	pgtable_t pgtable;
-
-	assert_spin_locked(&mm->page_table_lock);
-
-	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
-	lh = (struct list_head *) pgtable;
-	if (list_empty(lh))
-		pmd_huge_pte(mm, pmdp) = NULL;
-	else {
-		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
-		list_del(lh);
-	}
-	pte_val(pgtable[0]) = 0;
-	pte_val(pgtable[1]) = 0;
-
-	return pgtable;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 776993d4567b4..6e3b66d17ccf0 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1171,13 +1171,19 @@ static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
 
-#ifndef __HAVE_ARCH_PGTABLE_DEPOSIT
-extern void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				       pgtable_t pgtable);
+#ifndef arch_pgtable_trans_huge_deposit
+static inline void arch_pgtable_trans_huge_deposit(struct mm_struct *mm,
+						   pmd_t *pmdp, pgtable_t pgtable)
+{
+}
 #endif
 
-#ifndef __HAVE_ARCH_PGTABLE_WITHDRAW
-extern pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
+#ifndef arch_pgtable_trans_huge_withdraw
+static inline pgtable_t arch_pgtable_trans_huge_withdraw(struct mm_struct *mm,
+							 pmd_t *pmdp)
+{
+	return NULL;
+}
 #endif
 
 #ifndef arch_needs_pgtable_deposit
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 83cf07269f134..2f811c5a083ce 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -240,7 +240,7 @@ static void __init pmd_advanced_tests(struct pgtable_debug_args *args)
 	/* Align the address wrt HPAGE_PMD_SIZE */
 	vaddr &= HPAGE_PMD_MASK;
 
-	pgtable_trans_huge_deposit(args->mm, args->pmdp, args->start_ptep);
+	arch_pgtable_trans_huge_deposit(args->mm, args->pmdp, args->start_ptep);
 
 	pmd = pfn_pmd(args->pmd_pfn, args->page_prot);
 	set_pmd_at(args->mm, vaddr, args->pmdp, pmd);
@@ -276,7 +276,7 @@ static void __init pmd_advanced_tests(struct pgtable_debug_args *args)
 
 	/*  Clear the pte entries  */
 	pmdp_huge_get_and_clear(args->mm, vaddr, args->pmdp);
-	pgtable_trans_huge_withdraw(args->mm, args->pmdp);
+	arch_pgtable_trans_huge_withdraw(args->mm, args->pmdp);
 }
 
 static void __init pmd_leaf_tests(struct pgtable_debug_args *args)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a10cb136000d1..55b14ba244b1b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1359,7 +1359,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			return ret;
 		}
 		if (pgtable) {
-			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd,
+			arch_pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd,
 						   pgtable);
 			mm_inc_nr_ptes(vma->vm_mm);
 		}
@@ -1460,7 +1460,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
 	entry = pmd_mkspecial(entry);
 	if (pgtable) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+		arch_pgtable_trans_huge_deposit(mm, pmd, pgtable);
 		mm_inc_nr_ptes(mm);
 	}
 	set_pmd_at(mm, haddr, pmd, entry);
@@ -1593,7 +1593,7 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	}
 
 	if (pgtable) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+		arch_pgtable_trans_huge_deposit(mm, pmd, pgtable);
 		mm_inc_nr_ptes(mm);
 		pgtable = NULL;
 	}
@@ -1855,7 +1855,7 @@ static void copy_huge_non_present_pmd(
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 	if (pgtable) {
 		mm_inc_nr_ptes(dst_mm);
-		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+		arch_pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
 	}
 	if (!userfaultfd_wp(dst_vma))
 		pmd = pmd_swp_clear_uffd_wp(pmd);
@@ -1962,7 +1962,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 out_zero_page:
 	if (pgtable) {
 		mm_inc_nr_ptes(dst_mm);
-		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+		arch_pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
 	}
 	pmdp_set_wrprotect(src_mm, addr, src_pmd);
 	if (!userfaultfd_wp(dst_vma))
@@ -2370,7 +2370,7 @@ static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
 {
 	pgtable_t pgtable;
 
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	pgtable = arch_pgtable_trans_huge_withdraw(mm, pmd);
 	pte_free(mm, pgtable);
 	mm_dec_nr_ptes(mm);
 }
@@ -2389,7 +2389,7 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	/*
 	 * For architectures like ppc64 we look at deposited pgtable
 	 * when calling pmdp_huge_get_and_clear. So do the
-	 * pgtable_trans_huge_withdraw after finishing pmdp related
+	 * arch_pgtable_trans_huge_withdraw after finishing pmdp related
 	 * operations.
 	 */
 	orig_pmd = pmdp_huge_get_and_clear_full(vma, addr, pmd,
@@ -2531,8 +2531,8 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma) &&
 		    arch_needs_pgtable_deposit()) {
 			pgtable_t pgtable;
-			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
-			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
+			pgtable = arch_pgtable_trans_huge_withdraw(mm, old_pmd);
+			arch_pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
 		}
 		pmd = move_soft_dirty_pmd(pmd);
 		if (vma_has_uffd_without_event_remap(vma))
@@ -2838,8 +2838,8 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 	set_pmd_at(mm, dst_addr, dst_pmd, _dst_pmd);
 
 	if (arch_needs_pgtable_deposit()) {
-		src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
-		pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
+		src_pgtable = arch_pgtable_trans_huge_withdraw(mm, src_pmd);
+		arch_pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
 	}
 unlock_ptls:
 	double_pt_unlock(src_ptl, dst_ptl);
@@ -3001,7 +3001,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 	old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
 
 	if (arch_needs_pgtable_deposit()) {
-		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+		pgtable = arch_pgtable_trans_huge_withdraw(mm, pmd);
 	} else {
 		VM_BUG_ON(!pgtable);
 		/*
@@ -3218,7 +3218,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * This's critical for some architectures (Power).
 	 */
 	if (arch_needs_pgtable_deposit()) {
-		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+		pgtable = arch_pgtable_trans_huge_withdraw(mm, pmd);
 	} else {
 		VM_BUG_ON(!pgtable);
 		/*
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 735d7ee5bbab2..2b426bcd16977 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1225,7 +1225,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
 	spin_lock(pmd_ptl);
 	BUG_ON(!pmd_none(*pmd));
 	if (arch_needs_pgtable_deposit()) {
-		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+		arch_pgtable_trans_huge_deposit(mm, pmd, pgtable);
 	} else {
 		mm_dec_nr_ptes(mm);
 		pte_free(mm, pgtable);
diff --git a/mm/memory.c b/mm/memory.c
index 51d2717e3f1b4..4ec1ae909baf4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5384,7 +5384,7 @@ static void deposit_prealloc_pte(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 
-	pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
+	arch_pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
 	/*
 	 * We are going to consume the prealloc table,
 	 * count that as nr_ptes.
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1adb5abccfb70..be84ace37b88f 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -882,7 +882,7 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
 		pmdp_invalidate(vma, addr, pmdp);
 	} else if (pgtable) {
-		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		arch_pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
 		mm_inc_nr_ptes(vma->vm_mm);
 	}
 	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index af7966169d695..d8d5875d66fed 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -162,38 +162,6 @@ pud_t pudp_huge_clear_flush(struct vm_area_struct *vma, unsigned long address,
 #endif
 #endif
 
-#ifndef __HAVE_ARCH_PGTABLE_DEPOSIT
-void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
-				pgtable_t pgtable)
-{
-	assert_spin_locked(pmd_lockptr(mm, pmdp));
-
-	/* FIFO */
-	if (!pmd_huge_pte(mm, pmdp))
-		INIT_LIST_HEAD(&pgtable->lru);
-	else
-		list_add(&pgtable->lru, &pmd_huge_pte(mm, pmdp)->lru);
-	pmd_huge_pte(mm, pmdp) = pgtable;
-}
-#endif
-
-#ifndef __HAVE_ARCH_PGTABLE_WITHDRAW
-/* no "address" argument so destroys page coloring of some arch */
-pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
-{
-	pgtable_t pgtable;
-
-	assert_spin_locked(pmd_lockptr(mm, pmdp));
-
-	/* FIFO */
-	pgtable = pmd_huge_pte(mm, pmdp);
-	pmd_huge_pte(mm, pmdp) = list_first_entry_or_null(&pgtable->lru,
-							  struct page, lru);
-	if (pmd_huge_pte(mm, pmdp))
-		list_del(&pgtable->lru);
-	return pgtable;
-}
-#endif
 
 #ifndef __HAVE_ARCH_PMDP_INVALIDATE
 pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
-- 
2.47.3


