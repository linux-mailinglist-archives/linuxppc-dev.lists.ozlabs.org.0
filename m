Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F98714EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:43:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MDluKEDU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HBZX3dRp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpjcx442Vz3vrs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MDluKEDU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HBZX3dRp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpjWT6rjvz3vXS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 15:39:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxrKBDxVJXKXDbK5+qiV4OGShQY4ZnKcC70Ey9ItBb4=;
	b=MDluKEDUjWk9D8wOOtXgUWNo237epiOyzeYBvhSyxBVxubg+tY+abex4xMRn4W9pbpvVrz
	Zu7ZNBs5IjP5Qj0blyIrVdUU3r80HWWhG/kdN86rkAUsrYVtY0OvTMPDFnYmzOUUXo/2jL
	RzL10ZXpr2Q9FtSS2lTS51rAG5tPAFg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxrKBDxVJXKXDbK5+qiV4OGShQY4ZnKcC70Ey9ItBb4=;
	b=HBZX3dRpKnZ9ltMvxXnvmJ2zkcrhsuFdgSYRxauYhzRwekVWrJCm4O8fzw+/50eH6CudO2
	XuIEzY+aDU+JpnboHs1UdHpNUAlyDoseFvEvGTHxGsyUHrdYvcOpVaNh8HG4aoH543G/4q
	kg/bw8Gc+d8IU7CdCWBnVVKlefNU9Iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-OyWjx7VmO9eU-33qWyJ9Jg-1; Mon, 04 Mar 2024 23:38:54 -0500
X-MC-Unique: OyWjx7VmO9eU-33qWyJ9Jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86401185AD0B;
	Tue,  5 Mar 2024 04:38:53 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C952DC1F090;
	Tue,  5 Mar 2024 04:38:47 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] mm/treewide: Replace pmd_large() with pmd_leaf()
Date: Tue,  5 Mar 2024 12:37:47 +0800
Message-ID: <20240305043750.93762-8-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

pmd_large() is always defined as pmd_leaf().  Merge their usages.  Chose
pmd_leaf() because pmd_leaf() is a global API, while pmd_large() is not.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/mm/dump.c                       |  4 ++--
 arch/powerpc/mm/book3s64/pgtable.c       |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  2 +-
 arch/powerpc/mm/pgtable_64.c             |  2 +-
 arch/s390/boot/vmem.c                    |  2 +-
 arch/s390/include/asm/pgtable.h          |  8 ++++----
 arch/s390/mm/gmap.c                      | 12 ++++++------
 arch/s390/mm/hugetlbpage.c               |  2 +-
 arch/s390/mm/pageattr.c                  |  2 +-
 arch/s390/mm/pgtable.c                   |  6 +++---
 arch/s390/mm/vmem.c                      |  6 +++---
 arch/sparc/mm/init_64.c                  |  4 ++--
 arch/x86/boot/compressed/ident_map_64.c  |  2 +-
 arch/x86/kvm/mmu/mmu.c                   |  2 +-
 arch/x86/mm/fault.c                      |  8 ++++----
 arch/x86/mm/init_32.c                    |  2 +-
 arch/x86/mm/init_64.c                    |  8 ++++----
 arch/x86/mm/kasan_init_64.c              |  2 +-
 arch/x86/mm/mem_encrypt_identity.c       |  4 ++--
 arch/x86/mm/pat/set_memory.c             |  4 ++--
 arch/x86/mm/pgtable.c                    |  2 +-
 arch/x86/mm/pti.c                        |  4 ++--
 arch/x86/power/hibernate.c               |  2 +-
 arch/x86/xen/mmu_pv.c                    |  4 ++--
 drivers/misc/sgi-gru/grufault.c          |  2 +-
 25 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/arm/mm/dump.c b/arch/arm/mm/dump.c
index a9381095ab36..cd032522d902 100644
--- a/arch/arm/mm/dump.c
+++ b/arch/arm/mm/dump.c
@@ -349,12 +349,12 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
 		addr = start + i * PMD_SIZE;
 		domain = get_domain_name(pmd);
-		if (pmd_none(*pmd) || pmd_large(*pmd) || !pmd_present(*pmd))
+		if (pmd_none(*pmd) || pmd_leaf(*pmd) || !pmd_present(*pmd))
 			note_page(st, addr, 4, pmd_val(*pmd), domain);
 		else
 			walk_pte(st, pmd, addr, domain);
 
-		if (SECTION_SIZE < PMD_SIZE && pmd_large(pmd[1])) {
+		if (SECTION_SIZE < PMD_SIZE && pmd_leaf(pmd[1])) {
 			addr += SECTION_SIZE;
 			pmd++;
 			domain = get_domain_name(pmd);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 3438ab72c346..45f526547b27 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -113,7 +113,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 
 	WARN_ON(pte_hw_valid(pmd_pte(*pmdp)) && !pte_protnone(pmd_pte(*pmdp)));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
-	WARN_ON(!(pmd_large(pmd)));
+	WARN_ON(!(pmd_leaf(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
 	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 1f8db10693e3..5cc4008329be 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -924,7 +924,7 @@ bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
-	int large = pmd_large(*pmdp);
+	int large = pmd_leaf(*pmdp);
 
 	if (large)
 		vmemmap_verify(pmdp_ptep(pmdp), node, addr, next);
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 386c6b06eab7..9b99113cb51a 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -132,7 +132,7 @@ struct page *pmd_page(pmd_t pmd)
 		 * enabled so these checks can't be used.
 		 */
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
-			VM_WARN_ON(!(pmd_large(pmd) || pmd_huge(pmd)));
+			VM_WARN_ON(!(pmd_leaf(pmd) || pmd_huge(pmd)));
 		return pte_page(pmd_pte(pmd));
 	}
 	return virt_to_page(pmd_page_vaddr(pmd));
diff --git a/arch/s390/boot/vmem.c b/arch/s390/boot/vmem.c
index e3a4500a5a75..348ab02b1028 100644
--- a/arch/s390/boot/vmem.c
+++ b/arch/s390/boot/vmem.c
@@ -333,7 +333,7 @@ static void pgtable_pmd_populate(pud_t *pud, unsigned long addr, unsigned long e
 			}
 			pte = boot_pte_alloc();
 			pmd_populate(&init_mm, pmd, pte);
-		} else if (pmd_large(*pmd)) {
+		} else if (pmd_leaf(*pmd)) {
 			continue;
 		}
 		pgtable_pte_populate(pmd, addr, next, mode);
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 4b91e65c85d9..431d03d5116b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -721,7 +721,7 @@ static inline int pmd_large(pmd_t pmd)
 
 static inline int pmd_bad(pmd_t pmd)
 {
-	if ((pmd_val(pmd) & _SEGMENT_ENTRY_TYPE_MASK) > 0 || pmd_large(pmd))
+	if ((pmd_val(pmd) & _SEGMENT_ENTRY_TYPE_MASK) > 0 || pmd_leaf(pmd))
 		return 1;
 	return (pmd_val(pmd) & ~_SEGMENT_ENTRY_BITS) != 0;
 }
@@ -820,8 +820,8 @@ static inline int pte_protnone(pte_t pte)
 
 static inline int pmd_protnone(pmd_t pmd)
 {
-	/* pmd_large(pmd) implies pmd_present(pmd) */
-	return pmd_large(pmd) && !(pmd_val(pmd) & _SEGMENT_ENTRY_READ);
+	/* pmd_leaf(pmd) implies pmd_present(pmd) */
+	return pmd_leaf(pmd) && !(pmd_val(pmd) & _SEGMENT_ENTRY_READ);
 }
 #endif
 
@@ -1385,7 +1385,7 @@ static inline unsigned long pmd_deref(pmd_t pmd)
 	unsigned long origin_mask;
 
 	origin_mask = _SEGMENT_ENTRY_ORIGIN;
-	if (pmd_large(pmd))
+	if (pmd_leaf(pmd))
 		origin_mask = _SEGMENT_ENTRY_ORIGIN_LARGE;
 	return (unsigned long)__va(pmd_val(pmd) & origin_mask);
 }
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 4d2674f89322..b78ded9d3bf7 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -603,7 +603,7 @@ int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)
 	pmd = pmd_offset(pud, vmaddr);
 	VM_BUG_ON(pmd_none(*pmd));
 	/* Are we allowed to use huge pages? */
-	if (pmd_large(*pmd) && !gmap->mm->context.allow_gmap_hpage_1m)
+	if (pmd_leaf(*pmd) && !gmap->mm->context.allow_gmap_hpage_1m)
 		return -EFAULT;
 	/* Link gmap segment table entry location to page table. */
 	rc = radix_tree_preload(GFP_KERNEL_ACCOUNT);
@@ -615,7 +615,7 @@ int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)
 		rc = radix_tree_insert(&gmap->host_to_guest,
 				       vmaddr >> PMD_SHIFT, table);
 		if (!rc) {
-			if (pmd_large(*pmd)) {
+			if (pmd_leaf(*pmd)) {
 				*table = (pmd_val(*pmd) &
 					  _SEGMENT_ENTRY_HARDWARE_BITS_LARGE)
 					| _SEGMENT_ENTRY_GMAP_UC;
@@ -945,7 +945,7 @@ static inline pmd_t *gmap_pmd_op_walk(struct gmap *gmap, unsigned long gaddr)
 	}
 
 	/* 4k page table entries are locked via the pte (pte_alloc_map_lock). */
-	if (!pmd_large(*pmdp))
+	if (!pmd_leaf(*pmdp))
 		spin_unlock(&gmap->guest_table_lock);
 	return pmdp;
 }
@@ -957,7 +957,7 @@ static inline pmd_t *gmap_pmd_op_walk(struct gmap *gmap, unsigned long gaddr)
  */
 static inline void gmap_pmd_op_end(struct gmap *gmap, pmd_t *pmdp)
 {
-	if (pmd_large(*pmdp))
+	if (pmd_leaf(*pmdp))
 		spin_unlock(&gmap->guest_table_lock);
 }
 
@@ -1068,7 +1068,7 @@ static int gmap_protect_range(struct gmap *gmap, unsigned long gaddr,
 		rc = -EAGAIN;
 		pmdp = gmap_pmd_op_walk(gmap, gaddr);
 		if (pmdp) {
-			if (!pmd_large(*pmdp)) {
+			if (!pmd_leaf(*pmdp)) {
 				rc = gmap_protect_pte(gmap, gaddr, pmdp, prot,
 						      bits);
 				if (!rc) {
@@ -2500,7 +2500,7 @@ void gmap_sync_dirty_log_pmd(struct gmap *gmap, unsigned long bitmap[4],
 	if (!pmdp)
 		return;
 
-	if (pmd_large(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		if (gmap_test_and_clear_dirty_pmd(gmap, pmdp, gaddr))
 			bitmap_fill(bitmap, _PAGE_ENTRIES);
 	} else {
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index 297a6d897d5a..1ccb5b40fe92 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -235,7 +235,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_large(pmd);
+	return pmd_leaf(pmd);
 }
 
 int pud_huge(pud_t pud)
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 631e3a4ee2de..9f55d5a3210c 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -185,7 +185,7 @@ static int walk_pmd_level(pud_t *pudp, unsigned long addr, unsigned long end,
 		if (pmd_none(*pmdp))
 			return -EINVAL;
 		next = pmd_addr_end(addr, end);
-		if (pmd_large(*pmdp)) {
+		if (pmd_leaf(*pmdp)) {
 			need_split  = !!(flags & SET_MEMORY_4K);
 			need_split |= !!(addr & ~PMD_MASK);
 			need_split |= !!(addr + PMD_SIZE > next);
diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index b71432b15d66..9ac66304d776 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -827,7 +827,7 @@ int set_guest_storage_key(struct mm_struct *mm, unsigned long addr,
 		return key ? -EFAULT : 0;
 	}
 
-	if (pmd_large(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		paddr = pmd_val(*pmdp) & HPAGE_MASK;
 		paddr |= addr & ~HPAGE_MASK;
 		/*
@@ -938,7 +938,7 @@ int reset_guest_reference_bit(struct mm_struct *mm, unsigned long addr)
 		return 0;
 	}
 
-	if (pmd_large(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		paddr = pmd_val(*pmdp) & HPAGE_MASK;
 		paddr |= addr & ~HPAGE_MASK;
 		cc = page_reset_referenced(paddr);
@@ -1002,7 +1002,7 @@ int get_guest_storage_key(struct mm_struct *mm, unsigned long addr,
 		return 0;
 	}
 
-	if (pmd_large(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		paddr = pmd_val(*pmdp) & HPAGE_MASK;
 		paddr |= addr & ~HPAGE_MASK;
 		*key = page_get_storage_key(paddr);
diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
index eb100479f7be..afe5edf2a604 100644
--- a/arch/s390/mm/vmem.c
+++ b/arch/s390/mm/vmem.c
@@ -236,7 +236,7 @@ static int __ref modify_pmd_table(pud_t *pud, unsigned long addr,
 		if (!add) {
 			if (pmd_none(*pmd))
 				continue;
-			if (pmd_large(*pmd)) {
+			if (pmd_leaf(*pmd)) {
 				if (IS_ALIGNED(addr, PMD_SIZE) &&
 				    IS_ALIGNED(next, PMD_SIZE)) {
 					if (!direct)
@@ -281,7 +281,7 @@ static int __ref modify_pmd_table(pud_t *pud, unsigned long addr,
 			if (!pte)
 				goto out;
 			pmd_populate(&init_mm, pmd, pte);
-		} else if (pmd_large(*pmd)) {
+		} else if (pmd_leaf(*pmd)) {
 			if (!direct)
 				vmemmap_use_sub_pmd(addr, next);
 			continue;
@@ -610,7 +610,7 @@ pte_t *vmem_get_alloc_pte(unsigned long addr, bool alloc)
 		if (!pte)
 			goto out;
 		pmd_populate(&init_mm, pmd, pte);
-	} else if (WARN_ON_ONCE(pmd_large(*pmd))) {
+	} else if (WARN_ON_ONCE(pmd_leaf(*pmd))) {
 		goto out;
 	}
 	ptep = pte_offset_kernel(pmd, addr);
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index f83017992eaa..5e067b6a4464 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1672,7 +1672,7 @@ bool kern_addr_valid(unsigned long addr)
 	if (pmd_none(*pmd))
 		return false;
 
-	if (pmd_large(*pmd))
+	if (pmd_leaf(*pmd))
 		return pfn_valid(pmd_pfn(*pmd));
 
 	pte = pte_offset_kernel(pmd, addr);
@@ -2968,7 +2968,7 @@ void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 	struct mm_struct *mm;
 	pmd_t entry = *pmd;
 
-	if (!pmd_large(entry) || !pmd_young(entry))
+	if (!pmd_leaf(entry) || !pmd_young(entry))
 		return;
 
 	pte = pmd_val(entry);
diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index d040080d7edb..71c6e2fdcec7 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -284,7 +284,7 @@ static int set_clr_page_flags(struct x86_mapping_info *info,
 	pudp = pud_offset(p4dp, address);
 	pmdp = pmd_offset(pudp, address);
 
-	if (pmd_large(*pmdp))
+	if (pmd_leaf(*pmdp))
 		ptep = split_large_pmd(info, pmdp, address);
 	else
 		ptep = pte_offset_kernel(pmdp, address);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2d6cdeab1f8a..c15123248c52 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3135,7 +3135,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	if (pmd_none(pmd) || !pmd_present(pmd))
 		goto out;
 
-	if (pmd_large(pmd))
+	if (pmd_leaf(pmd))
 		level = PG_LEVEL_2M;
 
 out:
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 8b69ce3f4115..09417f950343 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -250,7 +250,7 @@ static noinline int vmalloc_fault(unsigned long address)
 	if (!pmd_k)
 		return -1;
 
-	if (pmd_large(*pmd_k))
+	if (pmd_leaf(*pmd_k))
 		return 0;
 
 	pte_k = pte_offset_kernel(pmd_k, address);
@@ -319,7 +319,7 @@ static void dump_pagetable(unsigned long address)
 	 * And let's rather not kmap-atomic the pte, just in case
 	 * it's allocated already:
 	 */
-	if (!low_pfn(pmd_pfn(*pmd)) || !pmd_present(*pmd) || pmd_large(*pmd))
+	if (!low_pfn(pmd_pfn(*pmd)) || !pmd_present(*pmd) || pmd_leaf(*pmd))
 		goto out;
 
 	pte = pte_offset_kernel(pmd, address);
@@ -384,7 +384,7 @@ static void dump_pagetable(unsigned long address)
 		goto bad;
 
 	pr_cont("PMD %lx ", pmd_val(*pmd));
-	if (!pmd_present(*pmd) || pmd_large(*pmd))
+	if (!pmd_present(*pmd) || pmd_leaf(*pmd))
 		goto out;
 
 	pte = pte_offset_kernel(pmd, address);
@@ -1053,7 +1053,7 @@ spurious_kernel_fault(unsigned long error_code, unsigned long address)
 	if (!pmd_present(*pmd))
 		return 0;
 
-	if (pmd_large(*pmd))
+	if (pmd_leaf(*pmd))
 		return spurious_kernel_fault_check(error_code, (pte_t *) pmd);
 
 	pte = pte_offset_kernel(pmd, address);
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 5c736b707cae..ac41b1e0940d 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -463,7 +463,7 @@ void __init native_pagetable_init(void)
 			break;
 
 		/* should not be large page here */
-		if (pmd_large(*pmd)) {
+		if (pmd_leaf(*pmd)) {
 			pr_warn("try to clear pte for ram above max_low_pfn: pfn: %lx pmd: %p pmd phys: %lx, but pmd is big page and is not using pte !\n",
 				pfn, pmd, __pa(pmd));
 			BUG_ON(1);
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index d691e7992a9a..2c5490e58f41 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -530,7 +530,7 @@ phys_pmd_init(pmd_t *pmd_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		if (!pmd_none(*pmd)) {
-			if (!pmd_large(*pmd)) {
+			if (!pmd_leaf(*pmd)) {
 				spin_lock(&init_mm.page_table_lock);
 				pte = (pte_t *)pmd_page_vaddr(*pmd);
 				paddr_last = phys_pte_init(pte, paddr,
@@ -1114,7 +1114,7 @@ remove_pmd_table(pmd_t *pmd_start, unsigned long addr, unsigned long end,
 		if (!pmd_present(*pmd))
 			continue;
 
-		if (pmd_large(*pmd)) {
+		if (pmd_leaf(*pmd)) {
 			if (IS_ALIGNED(addr, PMD_SIZE) &&
 			    IS_ALIGNED(next, PMD_SIZE)) {
 				if (!direct)
@@ -1520,9 +1520,9 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 int __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
 				unsigned long addr, unsigned long next)
 {
-	int large = pmd_large(*pmd);
+	int large = pmd_leaf(*pmd);
 
-	if (pmd_large(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		vmemmap_verify((pte_t *)pmd, node, addr, next);
 		vmemmap_use_sub_pmd(addr, next);
 	}
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0302491d799d..f41d26bc9161 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -95,7 +95,7 @@ static void __init kasan_populate_pud(pud_t *pud, unsigned long addr,
 	pmd = pmd_offset(pud, addr);
 	do {
 		next = pmd_addr_end(addr, end);
-		if (!pmd_large(*pmd))
+		if (!pmd_leaf(*pmd))
 			kasan_populate_pmd(pmd, addr, next, nid);
 	} while (pmd++, addr = next, addr != end);
 }
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index d73aeb16417f..bca4fea80579 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -161,7 +161,7 @@ static void __init sme_populate_pgd_large(struct sme_populate_pgd_data *ppd)
 		return;
 
 	pmd = pmd_offset(pud, ppd->vaddr);
-	if (pmd_large(*pmd))
+	if (pmd_leaf(*pmd))
 		return;
 
 	set_pmd(pmd, __pmd(ppd->paddr | ppd->pmd_flags));
@@ -185,7 +185,7 @@ static void __init sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 		set_pmd(pmd, __pmd(PMD_FLAGS | __pa(pte)));
 	}
 
-	if (pmd_large(*pmd))
+	if (pmd_leaf(*pmd))
 		return;
 
 	pte = pte_offset_kernel(pmd, ppd->vaddr);
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 5359a9c88099..b4037fe08eed 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -692,7 +692,7 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 		return NULL;
 
 	*level = PG_LEVEL_2M;
-	if (pmd_large(*pmd) || !pmd_present(*pmd))
+	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
 		return (pte_t *)pmd;
 
 	*level = PG_LEVEL_4K;
@@ -1229,7 +1229,7 @@ static void unmap_pmd_range(pud_t *pud, unsigned long start, unsigned long end)
 	 * Try to unmap in 2M chunks.
 	 */
 	while (end - start >= PMD_SIZE) {
-		if (pmd_large(*pmd))
+		if (pmd_leaf(*pmd))
 			pmd_clear(pmd);
 		else
 			__unmap_pmd_range(pud, pmd, start, start + PMD_SIZE);
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 0cbc1b8e8e3d..d05dd86ceb41 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -792,7 +792,7 @@ int pud_clear_huge(pud_t *pud)
  */
 int pmd_clear_huge(pmd_t *pmd)
 {
-	if (pmd_large(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		pmd_clear(pmd);
 		return 1;
 	}
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index c17aab24c1b3..0442e8f479a6 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -252,7 +252,7 @@ static pte_t *pti_user_pagetable_walk_pte(unsigned long address)
 		return NULL;
 
 	/* We can't do anything sensible if we hit a large mapping. */
-	if (pmd_large(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		WARN_ON(1);
 		return NULL;
 	}
@@ -341,7 +341,7 @@ pti_clone_pgtable(unsigned long start, unsigned long end,
 			continue;
 		}
 
-		if (pmd_large(*pmd) || level == PTI_CLONE_PMD) {
+		if (pmd_leaf(*pmd) || level == PTI_CLONE_PMD) {
 			target_pmd = pti_user_pagetable_walk_pmd(addr);
 			if (WARN_ON(!target_pmd))
 				return;
diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
index 28153789f873..277eaf610e0e 100644
--- a/arch/x86/power/hibernate.c
+++ b/arch/x86/power/hibernate.c
@@ -175,7 +175,7 @@ int relocate_restore_code(void)
 		goto out;
 	}
 	pmd = pmd_offset(pud, relocated_restore_code);
-	if (pmd_large(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		set_pmd(pmd, __pmd(pmd_val(*pmd) & ~_PAGE_NX));
 		goto out;
 	}
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 12a43a4abebf..dde551bbd231 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1059,7 +1059,7 @@ static void __init xen_cleanmfnmap_pmd(pmd_t *pmd, bool unpin)
 	pte_t *pte_tbl;
 	int i;
 
-	if (pmd_large(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		pa = pmd_val(*pmd) & PHYSICAL_PAGE_MASK;
 		xen_free_ro_pages(pa, PMD_SIZE);
 		return;
@@ -1871,7 +1871,7 @@ static phys_addr_t __init xen_early_virt_to_phys(unsigned long vaddr)
 	if (!pmd_present(pmd))
 		return 0;
 	pa = pmd_val(pmd) & PTE_PFN_MASK;
-	if (pmd_large(pmd))
+	if (pmd_leaf(pmd))
 		return pa + (vaddr & ~PMD_MASK);
 
 	pte = native_make_pte(xen_read_phys_ulong(pa + pte_index(vaddr) *
diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
index 629edb6486de..3557d78ee47a 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -227,7 +227,7 @@ static int atomic_pte_lookup(struct vm_area_struct *vma, unsigned long vaddr,
 	if (unlikely(pmd_none(*pmdp)))
 		goto err;
 #ifdef CONFIG_X86_64
-	if (unlikely(pmd_large(*pmdp)))
+	if (unlikely(pmd_leaf(*pmdp)))
 		pte = ptep_get((pte_t *)pmdp);
 	else
 #endif
-- 
2.44.0

