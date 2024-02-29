Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92F86C416
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:48:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KhgP1b6s;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KhgP1b6s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TllHC1yZHz3vZN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:48:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KhgP1b6s;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KhgP1b6s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TllBM6jk4z3vZb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:43:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Og4a52RoUuRZscj3oOT0GdN/Kljq91RnUZKsUguMxu0=;
	b=KhgP1b6sxTLq5uMLgZaeKO2/QK5LBMAFGo21a3d+FZJNWsUbeYklLg0qdlXtF65CSRftN+
	1eT6JEhmm/F/g8NhlghDH2UTCt/zaQpokD06x1KLgGwoJll+35FKC0Od8m1bfKgALckr3n
	BqjZvIkoF/1LtvTGlOCFXN6NJzGqFDs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Og4a52RoUuRZscj3oOT0GdN/Kljq91RnUZKsUguMxu0=;
	b=KhgP1b6sxTLq5uMLgZaeKO2/QK5LBMAFGo21a3d+FZJNWsUbeYklLg0qdlXtF65CSRftN+
	1eT6JEhmm/F/g8NhlghDH2UTCt/zaQpokD06x1KLgGwoJll+35FKC0Od8m1bfKgALckr3n
	BqjZvIkoF/1LtvTGlOCFXN6NJzGqFDs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-_e7dMWj5P-G-mT5Cbgt_EQ-1; Thu,
 29 Feb 2024 03:43:49 -0500
X-MC-Unique: _e7dMWj5P-G-mT5Cbgt_EQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18FE03812017;
	Thu, 29 Feb 2024 08:43:49 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E80E928D;
	Thu, 29 Feb 2024 08:43:43 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] mm/treewide: Replace pud_large() with pud_leaf()
Date: Thu, 29 Feb 2024 16:42:57 +0800
Message-ID: <20240229084258.599774-7-peterx@redhat.com>
In-Reply-To: <20240229084258.599774-1-peterx@redhat.com>
References: <20240229084258.599774-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

pud_large() is always defined as pud_leaf().  Merge their usages.  Chose
pud_leaf() because pud_leaf() is a global API, while pud_large() is not.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/mm/book3s64/pgtable.c | 2 +-
 arch/s390/boot/vmem.c              | 2 +-
 arch/s390/include/asm/pgtable.h    | 4 ++--
 arch/s390/mm/gmap.c                | 2 +-
 arch/s390/mm/hugetlbpage.c         | 4 ++--
 arch/s390/mm/pageattr.c            | 2 +-
 arch/s390/mm/pgtable.c             | 2 +-
 arch/s390/mm/vmem.c                | 6 +++---
 arch/sparc/mm/init_64.c            | 2 +-
 arch/x86/kvm/mmu/mmu.c             | 2 +-
 arch/x86/mm/fault.c                | 4 ++--
 arch/x86/mm/ident_map.c            | 2 +-
 arch/x86/mm/init_64.c              | 4 ++--
 arch/x86/mm/kasan_init_64.c        | 2 +-
 arch/x86/mm/mem_encrypt_identity.c | 2 +-
 arch/x86/mm/pat/set_memory.c       | 6 +++---
 arch/x86/mm/pgtable.c              | 2 +-
 arch/x86/mm/pti.c                  | 2 +-
 arch/x86/power/hibernate.c         | 2 +-
 arch/x86/xen/mmu_pv.c              | 4 ++--
 20 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 45f526547b27..83823db3488b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -130,7 +130,7 @@ void set_pud_at(struct mm_struct *mm, unsigned long addr,
 
 	WARN_ON(pte_hw_valid(pud_pte(*pudp)));
 	assert_spin_locked(pud_lockptr(mm, pudp));
-	WARN_ON(!(pud_large(pud)));
+	WARN_ON(!(pud_leaf(pud)));
 #endif
 	trace_hugepage_set_pud(addr, pud_val(pud));
 	return set_pte_at(mm, addr, pudp_ptep(pudp), pud_pte(pud));
diff --git a/arch/s390/boot/vmem.c b/arch/s390/boot/vmem.c
index 348ab02b1028..09b10bb6e4d0 100644
--- a/arch/s390/boot/vmem.c
+++ b/arch/s390/boot/vmem.c
@@ -366,7 +366,7 @@ static void pgtable_pud_populate(p4d_t *p4d, unsigned long addr, unsigned long e
 			}
 			pmd = boot_crst_alloc(_SEGMENT_ENTRY_EMPTY);
 			pud_populate(&init_mm, pud, pmd);
-		} else if (pud_large(*pud)) {
+		} else if (pud_leaf(*pud)) {
 			continue;
 		}
 		pgtable_pmd_populate(pud, addr, next, mode);
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 431d03d5116b..a5f16a244a64 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -730,7 +730,7 @@ static inline int pud_bad(pud_t pud)
 {
 	unsigned long type = pud_val(pud) & _REGION_ENTRY_TYPE_MASK;
 
-	if (type > _REGION_ENTRY_TYPE_R3 || pud_large(pud))
+	if (type > _REGION_ENTRY_TYPE_R3 || pud_leaf(pud))
 		return 1;
 	if (type < _REGION_ENTRY_TYPE_R3)
 		return 0;
@@ -1400,7 +1400,7 @@ static inline unsigned long pud_deref(pud_t pud)
 	unsigned long origin_mask;
 
 	origin_mask = _REGION_ENTRY_ORIGIN;
-	if (pud_large(pud))
+	if (pud_leaf(pud))
 		origin_mask = _REGION3_ENTRY_ORIGIN_LARGE;
 	return (unsigned long)__va(pud_val(pud) & origin_mask);
 }
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index a4f34c1db3cf..dcb38e351fa6 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -596,7 +596,7 @@ int __gmap_link(struct gmap *gmap, unsigned long gaddr, unsigned long vmaddr)
 	pud = pud_offset(p4d, vmaddr);
 	VM_BUG_ON(pud_none(*pud));
 	/* large puds cannot yet be handled */
-	if (pud_large(*pud))
+	if (pud_leaf(*pud))
 		return -EFAULT;
 	pmd = pmd_offset(pud, vmaddr);
 	VM_BUG_ON(pmd_none(*pmd));
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index 1ccb5b40fe92..c2e8242bd15d 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -224,7 +224,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		if (p4d_present(*p4dp)) {
 			pudp = pud_offset(p4dp, addr);
 			if (pud_present(*pudp)) {
-				if (pud_large(*pudp))
+				if (pud_leaf(*pudp))
 					return (pte_t *) pudp;
 				pmdp = pmd_offset(pudp, addr);
 			}
@@ -240,7 +240,7 @@ int pmd_huge(pmd_t pmd)
 
 int pud_huge(pud_t pud)
 {
-	return pud_large(pud);
+	return pud_leaf(pud);
 }
 
 bool __init arch_hugetlb_valid_size(unsigned long size)
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 9f55d5a3210c..01bc8fad64d6 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -274,7 +274,7 @@ static int walk_pud_level(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (pud_none(*pudp))
 			return -EINVAL;
 		next = pud_addr_end(addr, end);
-		if (pud_large(*pudp)) {
+		if (pud_leaf(*pudp)) {
 			need_split  = !!(flags & SET_MEMORY_4K);
 			need_split |= !!(addr & ~PUD_MASK);
 			need_split |= !!(addr + PUD_SIZE > next);
diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 9ac66304d776..2c944bafb030 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -470,7 +470,7 @@ static int pmd_lookup(struct mm_struct *mm, unsigned long addr, pmd_t **pmdp)
 		return -ENOENT;
 
 	/* Large PUDs are not supported yet. */
-	if (pud_large(*pud))
+	if (pud_leaf(*pud))
 		return -EFAULT;
 
 	*pmdp = pmd_offset(pud, addr);
diff --git a/arch/s390/mm/vmem.c b/arch/s390/mm/vmem.c
index afe5edf2a604..85cddf904cb2 100644
--- a/arch/s390/mm/vmem.c
+++ b/arch/s390/mm/vmem.c
@@ -329,7 +329,7 @@ static int modify_pud_table(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (!add) {
 			if (pud_none(*pud))
 				continue;
-			if (pud_large(*pud)) {
+			if (pud_leaf(*pud)) {
 				if (IS_ALIGNED(addr, PUD_SIZE) &&
 				    IS_ALIGNED(next, PUD_SIZE)) {
 					pud_clear(pud);
@@ -350,7 +350,7 @@ static int modify_pud_table(p4d_t *p4d, unsigned long addr, unsigned long end,
 			if (!pmd)
 				goto out;
 			pud_populate(&init_mm, pud, pmd);
-		} else if (pud_large(*pud)) {
+		} else if (pud_leaf(*pud)) {
 			continue;
 		}
 		ret = modify_pmd_table(pud, addr, next, add, direct, altmap);
@@ -599,7 +599,7 @@ pte_t *vmem_get_alloc_pte(unsigned long addr, bool alloc)
 		if (!pmd)
 			goto out;
 		pud_populate(&init_mm, pud, pmd);
-	} else if (WARN_ON_ONCE(pud_large(*pud))) {
+	} else if (WARN_ON_ONCE(pud_leaf(*pud))) {
 		goto out;
 	}
 	pmd = pmd_offset(pud, addr);
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 5e067b6a4464..1ca9054d9b97 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -1665,7 +1665,7 @@ bool kern_addr_valid(unsigned long addr)
 	if (pud_none(*pud))
 		return false;
 
-	if (pud_large(*pud))
+	if (pud_leaf(*pud))
 		return pfn_valid(pud_pfn(*pud));
 
 	pmd = pmd_offset(pud, addr);
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c15123248c52..5cb5bc4a72c4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3126,7 +3126,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	if (pud_none(pud) || !pud_present(pud))
 		goto out;
 
-	if (pud_large(pud)) {
+	if (pud_leaf(pud)) {
 		level = PG_LEVEL_1G;
 		goto out;
 	}
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 09417f950343..2cc6fa5dc561 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -376,7 +376,7 @@ static void dump_pagetable(unsigned long address)
 		goto bad;
 
 	pr_cont("PUD %lx ", pud_val(*pud));
-	if (!pud_present(*pud) || pud_large(*pud))
+	if (!pud_present(*pud) || pud_leaf(*pud))
 		goto out;
 
 	pmd = pmd_offset(pud, address);
@@ -1046,7 +1046,7 @@ spurious_kernel_fault(unsigned long error_code, unsigned long address)
 	if (!pud_present(*pud))
 		return 0;
 
-	if (pud_large(*pud))
+	if (pud_leaf(*pud))
 		return spurious_kernel_fault_check(error_code, (pte_t *) pud);
 
 	pmd = pmd_offset(pud, address);
diff --git a/arch/x86/mm/ident_map.c b/arch/x86/mm/ident_map.c
index f50cc210a981..a204a332c71f 100644
--- a/arch/x86/mm/ident_map.c
+++ b/arch/x86/mm/ident_map.c
@@ -33,7 +33,7 @@ static int ident_pud_init(struct x86_mapping_info *info, pud_t *pud_page,
 			next = end;
 
 		/* if this is already a gbpage, this portion is already mapped */
-		if (pud_large(*pud))
+		if (pud_leaf(*pud))
 			continue;
 
 		/* Is using a gbpage allowed? */
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 2c5490e58f41..7e177856ee4f 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -617,7 +617,7 @@ phys_pud_init(pud_t *pud_page, unsigned long paddr, unsigned long paddr_end,
 		}
 
 		if (!pud_none(*pud)) {
-			if (!pud_large(*pud)) {
+			if (!pud_leaf(*pud)) {
 				pmd = pmd_offset(pud, 0);
 				paddr_last = phys_pmd_init(pmd, paddr,
 							   paddr_end,
@@ -1163,7 +1163,7 @@ remove_pud_table(pud_t *pud_start, unsigned long addr, unsigned long end,
 		if (!pud_present(*pud))
 			continue;
 
-		if (pud_large(*pud) &&
+		if (pud_leaf(*pud) &&
 		    IS_ALIGNED(addr, PUD_SIZE) &&
 		    IS_ALIGNED(next, PUD_SIZE)) {
 			spin_lock(&init_mm.page_table_lock);
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index f41d26bc9161..9dddf19a5571 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -115,7 +115,7 @@ static void __init kasan_populate_p4d(p4d_t *p4d, unsigned long addr,
 	pud = pud_offset(p4d, addr);
 	do {
 		next = pud_addr_end(addr, end);
-		if (!pud_large(*pud))
+		if (!pud_leaf(*pud))
 			kasan_populate_pud(pud, addr, next, nid);
 	} while (pud++, addr = next, addr != end);
 }
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index bca4fea80579..7dd30e16294d 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -145,7 +145,7 @@ static pud_t __init *sme_prepare_pgd(struct sme_populate_pgd_data *ppd)
 		set_pud(pud, __pud(PUD_FLAGS | __pa(pmd)));
 	}
 
-	if (pud_large(*pud))
+	if (pud_leaf(*pud))
 		return NULL;
 
 	return pud;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index b4037fe08eed..e3a26f2c7781 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -684,7 +684,7 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 		return NULL;
 
 	*level = PG_LEVEL_1G;
-	if (pud_large(*pud) || !pud_present(*pud))
+	if (pud_leaf(*pud) || !pud_present(*pud))
 		return (pte_t *)pud;
 
 	pmd = pmd_offset(pud, address);
@@ -743,7 +743,7 @@ pmd_t *lookup_pmd_address(unsigned long address)
 		return NULL;
 
 	pud = pud_offset(p4d, address);
-	if (pud_none(*pud) || pud_large(*pud) || !pud_present(*pud))
+	if (pud_none(*pud) || pud_leaf(*pud) || !pud_present(*pud))
 		return NULL;
 
 	return pmd_offset(pud, address);
@@ -1274,7 +1274,7 @@ static void unmap_pud_range(p4d_t *p4d, unsigned long start, unsigned long end)
 	 */
 	while (end - start >= PUD_SIZE) {
 
-		if (pud_large(*pud))
+		if (pud_leaf(*pud))
 			pud_clear(pud);
 		else
 			unmap_pmd_range(pud, start, start + PUD_SIZE);
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index d05dd86ceb41..ff690ddc2334 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -777,7 +777,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
  */
 int pud_clear_huge(pud_t *pud)
 {
-	if (pud_large(*pud)) {
+	if (pud_leaf(*pud)) {
 		pud_clear(pud);
 		return 1;
 	}
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 1ab39e3b0b47..729cb9a2ff91 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -217,7 +217,7 @@ static pmd_t *pti_user_pagetable_walk_pmd(unsigned long address)
 
 	pud = pud_offset(p4d, address);
 	/* The user page tables do not use large mappings: */
-	if (pud_large(*pud)) {
+	if (pud_leaf(*pud)) {
 		WARN_ON(1);
 		return NULL;
 	}
diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
index 277eaf610e0e..5b81d19cd114 100644
--- a/arch/x86/power/hibernate.c
+++ b/arch/x86/power/hibernate.c
@@ -170,7 +170,7 @@ int relocate_restore_code(void)
 		goto out;
 	}
 	pud = pud_offset(p4d, relocated_restore_code);
-	if (pud_large(*pud)) {
+	if (pud_leaf(*pud)) {
 		set_pud(pud, __pud(pud_val(*pud) & ~_PAGE_NX));
 		goto out;
 	}
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index dde551bbd231..54e0d311dcc9 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1082,7 +1082,7 @@ static void __init xen_cleanmfnmap_pud(pud_t *pud, bool unpin)
 	pmd_t *pmd_tbl;
 	int i;
 
-	if (pud_large(*pud)) {
+	if (pud_leaf(*pud)) {
 		pa = pud_val(*pud) & PHYSICAL_PAGE_MASK;
 		xen_free_ro_pages(pa, PUD_SIZE);
 		return;
@@ -1863,7 +1863,7 @@ static phys_addr_t __init xen_early_virt_to_phys(unsigned long vaddr)
 	if (!pud_present(pud))
 		return 0;
 	pa = pud_val(pud) & PTE_PFN_MASK;
-	if (pud_large(pud))
+	if (pud_leaf(pud))
 		return pa + (vaddr & ~PUD_MASK);
 
 	pmd = native_make_pmd(xen_read_phys_ulong(pa + pmd_index(vaddr) *
-- 
2.43.0

