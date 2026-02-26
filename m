Return-Path: <linuxppc-dev+bounces-17257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IzpHPwvoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876F1A5217
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8WK68h5z3bW7;
	Thu, 26 Feb 2026 22:34:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105677;
	cv=none; b=aEDdTZgPQ+HLSeAvTVgP8gmjEreL85HMBwMC8opkglw9QUw6Ja9dtZwrNt3z76xsL/WhZN2kc7yuewM7aSnzqxSvXDFXVebtMIT5FuHZhT3J6hk3dryCIG7sUDC7EK4UkrDsUDk2J2yOVJxGByKcgqo8tXtC8+P5O1ahXt2znysJXOKSqtjlSbm5aysFQCyzwYzi2K481s+FRxybuQlkhW4Yt8Z2bP2U5ATYT0vZ4gOB+tPc2Den7CmeuWQzdyg3Y8DHZHt2oF8V/S4HiJ6zL1yOvZdWcoTbJXsXrZ/9g0hRd8TzMP5Lkn4/Zt+PETLqqZxIHYrMLeF/o59neMUBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105677; c=relaxed/relaxed;
	bh=MihLOMtbyyr4A+PM5m4hcEecEOzbHG+q7FrZIHbFIos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiBVYwatRWsDA6LOI8WWHlhaLum3D6ofMpuvS3QfKE/BxWRkI4+ObZj6Lxzx+5g1wRawLROrIlzFexORZb9lC/pzRv2+iDuG0koyubfD+LhXa83qxQhe7fVkGptTHP3CkFvB3LgguHzKl8tIw732lxi13AAUN0vVFUif2FnRpbMrri8k6LJi65lZdE287GOaznwSZtaRkbmKtBMAIrVaI2APk9MXbV6wXt7WdwuU8v0Htu25Z9lsrgXzUoEhHypxJEJVMUYdDo5Z8dpIqttvRyAmlGLyeiM3ERAY6hAZSd0PiHgxUrfESj+BP07NXsj4s/OdP7WiqNFjghlHuaUZhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g0g5BQ0/; dkim-atps=neutral; spf=pass (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g0g5BQ0/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8WJ5RtBz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:34:36 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MihLOMtbyyr4A+PM5m4hcEecEOzbHG+q7FrZIHbFIos=;
	b=g0g5BQ0/uhmHZYSbIh/WEu69VqMbzRwuRTZ3CT3kImCZgYP2u4HejpWAi3Va5fSOOhaKZY
	qSsjoKdbxCk3a7rR44jCzEfksVIPfyw8aQRQcnp82r2SjjFG3tEFMnGssOa1BDrv2/H/fC
	6e9OiQKn7EpiCQDKaUxmwdkhCV+tQdE=
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
Subject: [RFC v2 14/21] mm: thp: allocate PTE page tables lazily at split time
Date: Thu, 26 Feb 2026 03:23:43 -0800
Message-ID: <20260226113233.3987674-15-usama.arif@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-17257-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:email]
X-Rspamd-Queue-Id: 7876F1A5217
X-Rspamd-Action: no action

When the kernel creates a PMD-level THP mapping for anonymous pages,
it pre-allocates a PTE page table and deposits it via
pgtable_trans_huge_deposit(). This deposited table is withdrawn during
PMD split or zap. The rationale was that split must not fail—if the
kernel decides to split a THP, it needs a PTE table to populate.

However, every anon THP wastes 4KB (one page table page) that sits
unused in the deposit list for the lifetime of the mapping. On systems
with many THPs, this adds up to significant memory waste. The original
rationale is also not an issue. It is ok for split to fail, and if the
kernel can't find an order 0 allocation for split, there are much bigger
problems. On large servers where you can easily have 100s of GBs of THPs,
the memory usage for these tables is 200M per 100G. This memory could be
used for any other usecase, which include allocating the pagetables
required during split.

This patch removes the pre-deposit for anonymous pages on architectures
where arch_needs_pgtable_deposit() returns false (every arch apart from
powerpc, and only when radix hash tables are not enabled) and allocates
the PTE table lazily—only when a split actually occurs. The split path
is modified to accept a caller-provided page table.

PowerPC exception:

It would have been great if we can completely remove the pagetable
deposit code and this commit would mostly have been a code cleanup patch,
unfortunately PowerPC has hash MMU, it stores hash slot information in
the deposited page table and pre-deposit is necessary. All deposit/
withdraw paths are guarded by arch_needs_pgtable_deposit(), so PowerPC
behavior is unchanged with this patch. On a better note,
arch_needs_pgtable_deposit will always evaluate to false at compile time
on non PowerPC architectures and the pre-deposit code will not be
compiled in.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/huge_mm.h |   4 +-
 mm/huge_memory.c        | 144 ++++++++++++++++++++++++++++------------
 mm/khugepaged.c         |   7 +-
 mm/migrate_device.c     |  15 +++--
 mm/rmap.c               |  39 ++++++++++-
 5 files changed, 156 insertions(+), 53 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index b4c2fd4252097..ed4c97734b335 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -562,7 +562,7 @@ static inline bool thp_migration_supported(void)
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze);
+			   pmd_t *pmd, bool freeze, pgtable_t pgtable);
 bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 			   pmd_t *pmdp, struct folio *folio);
 void map_anon_folio_pmd_nopf(struct folio *folio, pmd_t *pmd,
@@ -662,7 +662,7 @@ static inline int split_huge_pmd_address(struct vm_area_struct *vma,
 		unsigned long address, bool freeze) { return 0; }
 static inline void split_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long address, pmd_t *pmd,
-					 bool freeze) {}
+					 bool freeze, pgtable_t pgtable) {}
 
 static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long addr, pmd_t *pmdp,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e82b8435a0b7f..a10cb136000d1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1325,17 +1325,19 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
 	struct vm_area_struct *vma = vmf->vma;
 	struct folio *folio;
-	pgtable_t pgtable;
+	pgtable_t pgtable = NULL;
 	vm_fault_t ret = 0;
 
 	folio = vma_alloc_anon_folio_pmd(vma, vmf->address);
 	if (unlikely(!folio))
 		return VM_FAULT_FALLBACK;
 
-	pgtable = pte_alloc_one(vma->vm_mm);
-	if (unlikely(!pgtable)) {
-		ret = VM_FAULT_OOM;
-		goto release;
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (unlikely(!pgtable)) {
+			ret = VM_FAULT_OOM;
+			goto release;
+		}
 	}
 
 	vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
@@ -1350,14 +1352,18 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 		if (userfaultfd_missing(vma)) {
 			spin_unlock(vmf->ptl);
 			folio_put(folio);
-			pte_free(vma->vm_mm, pgtable);
+			if (pgtable)
+				pte_free(vma->vm_mm, pgtable);
 			ret = handle_userfault(vmf, VM_UFFD_MISSING);
 			VM_BUG_ON(ret & VM_FAULT_FALLBACK);
 			return ret;
 		}
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
+		if (pgtable) {
+			pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd,
+						   pgtable);
+			mm_inc_nr_ptes(vma->vm_mm);
+		}
 		map_anon_folio_pmd_pf(folio, vmf->pmd, vma, haddr);
-		mm_inc_nr_ptes(vma->vm_mm);
 		spin_unlock(vmf->ptl);
 	}
 
@@ -1453,9 +1459,11 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 	pmd_t entry;
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
 	entry = pmd_mkspecial(entry);
-	pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	if (pgtable) {
+		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+		mm_inc_nr_ptes(mm);
+	}
 	set_pmd_at(mm, haddr, pmd, entry);
-	mm_inc_nr_ptes(mm);
 }
 
 vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
@@ -1474,16 +1482,19 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
 			!mm_forbids_zeropage(vma->vm_mm) &&
 			transparent_hugepage_use_zero_page()) {
-		pgtable_t pgtable;
+		pgtable_t pgtable = NULL;
 		struct folio *zero_folio;
 		vm_fault_t ret;
 
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (unlikely(!pgtable))
-			return VM_FAULT_OOM;
+		if (arch_needs_pgtable_deposit()) {
+			pgtable = pte_alloc_one(vma->vm_mm);
+			if (unlikely(!pgtable))
+				return VM_FAULT_OOM;
+		}
 		zero_folio = mm_get_huge_zero_folio(vma->vm_mm);
 		if (unlikely(!zero_folio)) {
-			pte_free(vma->vm_mm, pgtable);
+			if (pgtable)
+				pte_free(vma->vm_mm, pgtable);
 			count_vm_event(THP_FAULT_FALLBACK);
 			return VM_FAULT_FALLBACK;
 		}
@@ -1493,10 +1504,12 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			ret = check_stable_address_space(vma->vm_mm);
 			if (ret) {
 				spin_unlock(vmf->ptl);
-				pte_free(vma->vm_mm, pgtable);
+				if (pgtable)
+					pte_free(vma->vm_mm, pgtable);
 			} else if (userfaultfd_missing(vma)) {
 				spin_unlock(vmf->ptl);
-				pte_free(vma->vm_mm, pgtable);
+				if (pgtable)
+					pte_free(vma->vm_mm, pgtable);
 				ret = handle_userfault(vmf, VM_UFFD_MISSING);
 				VM_BUG_ON(ret & VM_FAULT_FALLBACK);
 			} else {
@@ -1507,7 +1520,8 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 			}
 		} else {
 			spin_unlock(vmf->ptl);
-			pte_free(vma->vm_mm, pgtable);
+			if (pgtable)
+				pte_free(vma->vm_mm, pgtable);
 		}
 		return ret;
 	}
@@ -1839,8 +1853,10 @@ static void copy_huge_non_present_pmd(
 	}
 
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
-	mm_inc_nr_ptes(dst_mm);
-	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	if (pgtable) {
+		mm_inc_nr_ptes(dst_mm);
+		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	}
 	if (!userfaultfd_wp(dst_vma))
 		pmd = pmd_swp_clear_uffd_wp(pmd);
 	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
@@ -1880,9 +1896,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (!vma_is_anonymous(dst_vma))
 		return 0;
 
-	pgtable = pte_alloc_one(dst_mm);
-	if (unlikely(!pgtable))
-		goto out;
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(dst_mm);
+		if (unlikely(!pgtable))
+			goto out;
+	}
 
 	dst_ptl = pmd_lock(dst_mm, dst_pmd);
 	src_ptl = pmd_lockptr(src_mm, src_pmd);
@@ -1900,7 +1918,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	}
 
 	if (unlikely(!pmd_trans_huge(pmd))) {
-		pte_free(dst_mm, pgtable);
+		if (pgtable)
+			pte_free(dst_mm, pgtable);
 		goto out_unlock;
 	}
 	/*
@@ -1926,7 +1945,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, dst_vma, src_vma))) {
 		/* Page maybe pinned: split and retry the fault on PTEs. */
 		folio_put(src_folio);
-		pte_free(dst_mm, pgtable);
+		if (pgtable)
+			pte_free(dst_mm, pgtable);
 		spin_unlock(src_ptl);
 		spin_unlock(dst_ptl);
 		/*
@@ -1940,8 +1960,10 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	}
 	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
 out_zero_page:
-	mm_inc_nr_ptes(dst_mm);
-	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	if (pgtable) {
+		mm_inc_nr_ptes(dst_mm);
+		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	}
 	pmdp_set_wrprotect(src_mm, addr, src_pmd);
 	if (!userfaultfd_wp(dst_vma))
 		pmd = pmd_clear_uffd_wp(pmd);
@@ -2379,7 +2401,7 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			zap_deposited_table(tlb->mm, pmd);
 		spin_unlock(ptl);
 	} else if (is_huge_zero_pmd(orig_pmd)) {
-		if (!vma_is_dax(vma) || arch_needs_pgtable_deposit())
+		if (arch_needs_pgtable_deposit())
 			zap_deposited_table(tlb->mm, pmd);
 		spin_unlock(ptl);
 	} else {
@@ -2404,7 +2426,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		}
 
 		if (folio_test_anon(folio)) {
-			zap_deposited_table(tlb->mm, pmd);
+			if (arch_needs_pgtable_deposit())
+				zap_deposited_table(tlb->mm, pmd);
 			add_mm_counter(tlb->mm, MM_ANONPAGES, -HPAGE_PMD_NR);
 		} else {
 			if (arch_needs_pgtable_deposit())
@@ -2505,7 +2528,8 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 			force_flush = true;
 		VM_BUG_ON(!pmd_none(*new_pmd));
 
-		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
+		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma) &&
+		    arch_needs_pgtable_deposit()) {
 			pgtable_t pgtable;
 			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
 			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
@@ -2813,8 +2837,10 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 	}
 	set_pmd_at(mm, dst_addr, dst_pmd, _dst_pmd);
 
-	src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
-	pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
+	if (arch_needs_pgtable_deposit()) {
+		src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
+		pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
+	}
 unlock_ptls:
 	double_pt_unlock(src_ptl, dst_ptl);
 	/* unblock rmap walks */
@@ -2956,10 +2982,9 @@ void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
-		unsigned long haddr, pmd_t *pmd)
+		unsigned long haddr, pmd_t *pmd, pgtable_t pgtable)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	pgtable_t pgtable;
 	pmd_t _pmd, old_pmd;
 	unsigned long addr;
 	pte_t *pte;
@@ -2975,7 +3000,16 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 	 */
 	old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
 
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	} else {
+		VM_BUG_ON(!pgtable);
+		/*
+		 * Account for the freshly allocated (in __split_huge_pmd) pgtable
+		 * being used in mm.
+		 */
+		mm_inc_nr_ptes(mm);
+	}
 	pmd_populate(mm, &_pmd, pgtable);
 
 	pte = pte_offset_map(&_pmd, haddr);
@@ -2997,12 +3031,11 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 }
 
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long haddr, bool freeze)
+		unsigned long haddr, bool freeze, pgtable_t pgtable)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct folio *folio;
 	struct page *page;
-	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
 	bool soft_dirty, uffd_wp = false, young = false, write = false;
 	bool anon_exclusive = false, dirty = false;
@@ -3026,6 +3059,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 */
 		if (arch_needs_pgtable_deposit())
 			zap_deposited_table(mm, pmd);
+		if (pgtable)
+			pte_free(mm, pgtable);
 		if (!vma_is_dax(vma) && vma_is_special_huge(vma))
 			return;
 		if (unlikely(pmd_is_migration_entry(old_pmd))) {
@@ -3058,7 +3093,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * small page also write protected so it does not seems useful
 		 * to invalidate secondary mmu at this time.
 		 */
-		return __split_huge_zero_page_pmd(vma, haddr, pmd);
+		return __split_huge_zero_page_pmd(vma, haddr, pmd, pgtable);
 	}
 
 	if (pmd_is_migration_entry(*pmd)) {
@@ -3182,7 +3217,16 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Withdraw the table only after we mark the pmd entry invalid.
 	 * This's critical for some architectures (Power).
 	 */
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	} else {
+		VM_BUG_ON(!pgtable);
+		/*
+		 * Account for the freshly allocated (in __split_huge_pmd) pgtable
+		 * being used in mm.
+		 */
+		mm_inc_nr_ptes(mm);
+	}
 	pmd_populate(mm, &_pmd, pgtable);
 
 	pte = pte_offset_map(&_pmd, haddr);
@@ -3278,11 +3322,13 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 }
 
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze)
+			   pmd_t *pmd, bool freeze, pgtable_t pgtable)
 {
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
 	if (pmd_trans_huge(*pmd) || pmd_is_valid_softleaf(*pmd))
-		__split_huge_pmd_locked(vma, pmd, address, freeze);
+		__split_huge_pmd_locked(vma, pmd, address, freeze, pgtable);
+	else if (pgtable)
+		pte_free(vma->vm_mm, pgtable);
 }
 
 int __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
@@ -3290,13 +3336,24 @@ int __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 {
 	spinlock_t *ptl;
 	struct mmu_notifier_range range;
+	pgtable_t pgtable = NULL;
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				address & HPAGE_PMD_MASK,
 				(address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
+
+	/* allocate pagetable before acquiring pmd lock */
+	if (vma_is_anonymous(vma) && !arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable) {
+			mmu_notifier_invalidate_range_end(&range);
+			return -ENOMEM;
+		}
+	}
+
 	ptl = pmd_lock(vma->vm_mm, pmd);
-	split_huge_pmd_locked(vma, range.start, pmd, freeze);
+	split_huge_pmd_locked(vma, range.start, pmd, freeze, pgtable);
 	spin_unlock(ptl);
 	mmu_notifier_invalidate_range_end(&range);
 
@@ -3432,7 +3489,8 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	}
 
 	folio_remove_rmap_pmd(folio, pmd_page(orig_pmd), vma);
-	zap_deposited_table(mm, pmdp);
+	if (arch_needs_pgtable_deposit())
+		zap_deposited_table(mm, pmdp);
 	add_mm_counter(mm, MM_ANONPAGES, -HPAGE_PMD_NR);
 	if (vma->vm_flags & VM_LOCKED)
 		mlock_drain_local();
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index c85d7381adb5f..735d7ee5bbab2 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1224,7 +1224,12 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
 
 	spin_lock(pmd_ptl);
 	BUG_ON(!pmd_none(*pmd));
-	pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	if (arch_needs_pgtable_deposit()) {
+		pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	} else {
+		mm_dec_nr_ptes(mm);
+		pte_free(mm, pgtable);
+	}
 	map_anon_folio_pmd_nopf(folio, pmd, vma, address);
 	spin_unlock(pmd_ptl);
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index bc53e06fd9735..1adb5abccfb70 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -823,9 +823,13 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 
 	__folio_mark_uptodate(folio);
 
-	pgtable = pte_alloc_one(vma->vm_mm);
-	if (unlikely(!pgtable))
-		goto abort;
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (unlikely(!pgtable))
+			goto abort;
+	} else {
+		pgtable = NULL;
+	}
 
 	if (folio_is_device_private(folio)) {
 		swp_entry_t swp_entry;
@@ -873,10 +877,11 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 	folio_get(folio);
 
 	if (flush) {
-		pte_free(vma->vm_mm, pgtable);
+		if (pgtable)
+			pte_free(vma->vm_mm, pgtable);
 		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
 		pmdp_invalidate(vma, addr, pmdp);
-	} else {
+	} else if (pgtable) {
 		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
 		mm_inc_nr_ptes(vma->vm_mm);
 	}
diff --git a/mm/rmap.c b/mm/rmap.c
index bff8f222004e4..2519d579bc1d8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -76,6 +76,7 @@
 #include <linux/mm_inline.h>
 #include <linux/oom.h>
 
+#include <asm/pgalloc.h>
 #include <asm/tlb.h>
 
 #define CREATE_TRACE_POINTS
@@ -1975,6 +1976,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	unsigned long pfn;
 	unsigned long hsz = 0;
 	int ptes = 0;
+	pgtable_t prealloc_pte = NULL;
 
 	/*
 	 * When racing against e.g. zap_pte_range() on another cpu,
@@ -2009,6 +2011,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	}
 	mmu_notifier_invalidate_range_start(&range);
 
+	if ((flags & TTU_SPLIT_HUGE_PMD) && vma_is_anonymous(vma) &&
+	    !arch_needs_pgtable_deposit())
+		prealloc_pte = pte_alloc_one(mm);
+
 	while (page_vma_mapped_walk(&pvmw)) {
 		/*
 		 * If the folio is in an mlock()d vma, we must not swap it out.
@@ -2058,12 +2064,21 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			}
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
+				pgtable_t pgtable = prealloc_pte;
+
+				prealloc_pte = NULL;
+				if (!arch_needs_pgtable_deposit() && !pgtable &&
+				    vma_is_anonymous(vma)) {
+					page_vma_mapped_walk_done(&pvmw);
+					ret = false;
+					break;
+				}
 				/*
 				 * We temporarily have to drop the PTL and
 				 * restart so we can process the PTE-mapped THP.
 				 */
 				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, false);
+						      pvmw.pmd, false, pgtable);
 				flags &= ~TTU_SPLIT_HUGE_PMD;
 				page_vma_mapped_walk_restart(&pvmw);
 				continue;
@@ -2343,6 +2358,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		break;
 	}
 
+	if (prealloc_pte)
+		pte_free(mm, prealloc_pte);
+
 	mmu_notifier_invalidate_range_end(&range);
 
 	return ret;
@@ -2402,6 +2420,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	unsigned long pfn;
 	unsigned long hsz = 0;
+	pgtable_t prealloc_pte = NULL;
 
 	/*
 	 * When racing against e.g. zap_pte_range() on another cpu,
@@ -2436,6 +2455,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	}
 	mmu_notifier_invalidate_range_start(&range);
 
+	if ((flags & TTU_SPLIT_HUGE_PMD) && vma_is_anonymous(vma) &&
+	    !arch_needs_pgtable_deposit())
+		prealloc_pte = pte_alloc_one(mm);
+
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
@@ -2443,8 +2466,17 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			__maybe_unused pmd_t pmdval;
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
+				pgtable_t pgtable = prealloc_pte;
+
+				prealloc_pte = NULL;
+				if (!arch_needs_pgtable_deposit() && !pgtable &&
+				    vma_is_anonymous(vma)) {
+					page_vma_mapped_walk_done(&pvmw);
+					ret = false;
+					break;
+				}
 				split_huge_pmd_locked(vma, pvmw.address,
-						      pvmw.pmd, true);
+						      pvmw.pmd, true, pgtable);
 				ret = false;
 				page_vma_mapped_walk_done(&pvmw);
 				break;
@@ -2695,6 +2727,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		folio_put(folio);
 	}
 
+	if (prealloc_pte)
+		pte_free(mm, prealloc_pte);
+
 	mmu_notifier_invalidate_range_end(&range);
 
 	return ret;
-- 
2.47.3


