Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E38714EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:45:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G1FmSDdl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AW3vdEBw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpjfg73ZYz3vh3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G1FmSDdl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AW3vdEBw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpjWj57sHz3d2x
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 15:39:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOUtTav4hmt5Ys9NOLCCnBkIj5rHL075G12/OtEUkGI=;
	b=G1FmSDdlxOZ35CcEwKWdAUqIGVRucSLjsaBq5TshimdbHhRhCbCUkCIBTj6IwsS+gMr+wq
	o/aF8jdoZ0TwFhtTnZgjrzMxffias4//9JWbI1/8bmHHE7C33WaHpNK9d1+bqobkPVO84x
	8ddYnZAp8EAG8/D7znprP0PpzcHJ5mE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709613551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOUtTav4hmt5Ys9NOLCCnBkIj5rHL075G12/OtEUkGI=;
	b=AW3vdEBw48AkP011ywPnduFTcuFdk3W+EDKl5IAiry+lBoEaXekGMOD4L7kia4m1hKvUqG
	frssdZxYisZD8c+AtzPN3NUYKd8Z3jkDlvR6Fyja1W7CQ2lv1h4Hh1MNgSWNPqcjLnG0SE
	0EDgFA3kYYMTGOeZvXNMLHAU4y2AZvg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-j9LV1vv2M0S4rC32HpgzeQ-1; Mon,
 04 Mar 2024 23:39:06 -0500
X-MC-Unique: j9LV1vv2M0S4rC32HpgzeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 400623804A09;
	Tue,  5 Mar 2024 04:39:06 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F80BC1F090;
	Tue,  5 Mar 2024 04:39:00 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] mm/treewide: Drop pXd_large()
Date: Tue,  5 Mar 2024 12:37:49 +0800
Message-ID: <20240305043750.93762-10-peterx@redhat.com>
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

They're not used anymore, drop all of them.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/include/asm/pgtable-2level.h        |  1 -
 arch/arm/include/asm/pgtable-3level.h        |  1 -
 arch/loongarch/kvm/mmu.c                     |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |  4 +---
 arch/powerpc/include/asm/pgtable.h           |  4 ----
 arch/s390/include/asm/pgtable.h              |  8 ++++----
 arch/sparc/include/asm/pgtable_64.h          |  8 ++++----
 arch/x86/include/asm/pgtable.h               | 19 +++++++------------
 arch/x86/kvm/mmu/mmu.c                       |  2 +-
 9 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index ce543cd9380c..b0a262566eb9 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -213,7 +213,6 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
 
 #define pmd_pfn(pmd)		(__phys_to_pfn(pmd_val(pmd) & PHYS_MASK))
 
-#define pmd_large(pmd)		(pmd_val(pmd) & 2)
 #define pmd_leaf(pmd)		(pmd_val(pmd) & 2)
 #define pmd_bad(pmd)		(pmd_val(pmd) & 2)
 #define pmd_present(pmd)	(pmd_val(pmd))
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 71c3add6417f..4b1d9eb3908a 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -118,7 +118,6 @@
 						 PMD_TYPE_TABLE)
 #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
 						 PMD_TYPE_SECT)
-#define pmd_large(pmd)		pmd_sect(pmd)
 #define pmd_leaf(pmd)		pmd_sect(pmd)
 
 #define pud_clear(pudp)			\
diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 50a6acd7ffe4..a556cff35740 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -723,7 +723,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	/*
 	 * Read each entry once.  As above, a non-leaf entry can be promoted to
 	 * a huge page _during_ this walk.  Re-reading the entry could send the
-	 * walk into the weeks, e.g. p*d_large() returns false (sees the old
+	 * walk into the weeks, e.g. p*d_leaf() returns false (sees the old
 	 * value) and then p*d_offset() walks into the target huge page instead
 	 * of the old page table (sees the new value).
 	 */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 3e99e409774a..df66dce8306f 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1437,17 +1437,15 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 }
 
 /*
- * Like pmd_huge() and pmd_large(), but works regardless of config options
+ * Like pmd_huge(), but works regardless of config options
  */
 #define pmd_leaf pmd_leaf
-#define pmd_large pmd_leaf
 static inline bool pmd_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
 #define pud_leaf pud_leaf
-#define pud_large pud_leaf
 static inline bool pud_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index e6edf1cdbc5b..239709a2f68e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -101,10 +101,6 @@ void poking_init(void);
 extern unsigned long ioremap_bot;
 extern const pgprot_t protection_map[16];
 
-#ifndef pmd_large
-#define pmd_large(pmd)		0
-#endif
-
 /* can we use this in kvm */
 unsigned long vmalloc_to_phys(void *vmalloc_addr);
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index a5f16a244a64..9e08af5b9247 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -705,16 +705,16 @@ static inline int pud_none(pud_t pud)
 	return pud_val(pud) == _REGION3_ENTRY_EMPTY;
 }
 
-#define pud_leaf	pud_large
-static inline int pud_large(pud_t pud)
+#define pud_leaf pud_leaf
+static inline int pud_leaf(pud_t pud)
 {
 	if ((pud_val(pud) & _REGION_ENTRY_TYPE_MASK) != _REGION_ENTRY_TYPE_R3)
 		return 0;
 	return !!(pud_val(pud) & _REGION3_ENTRY_LARGE);
 }
 
-#define pmd_leaf	pmd_large
-static inline int pmd_large(pmd_t pmd)
+#define pmd_leaf pmd_leaf
+static inline int pmd_leaf(pmd_t pmd)
 {
 	return (pmd_val(pmd) & _SEGMENT_ENTRY_LARGE) != 0;
 }
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 652af9d63fa2..6ff0a28d5fd1 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -680,8 +680,8 @@ static inline unsigned long pte_special(pte_t pte)
 	return pte_val(pte) & _PAGE_SPECIAL;
 }
 
-#define pmd_leaf	pmd_large
-static inline unsigned long pmd_large(pmd_t pmd)
+#define pmd_leaf pmd_leaf
+static inline unsigned long pmd_leaf(pmd_t pmd)
 {
 	pte_t pte = __pte(pmd_val(pmd));
 
@@ -867,8 +867,8 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 /* only used by the stubbed out hugetlb gup code, should never be called */
 #define p4d_page(p4d)			NULL
 
-#define pud_leaf	pud_large
-static inline unsigned long pud_large(pud_t pud)
+#define pud_leaf pud_leaf
+static inline unsigned long pud_leaf(pud_t pud)
 {
 	pte_t pte = __pte(pud_val(pud));
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 9db7a38a0e9f..cfc84c55d0e6 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -251,8 +251,8 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
 	return (pgd_val(pgd) & PTE_PFN_MASK) >> PAGE_SHIFT;
 }
 
-#define p4d_leaf	p4d_large
-static inline int p4d_large(p4d_t p4d)
+#define p4d_leaf p4d_leaf
+static inline int p4d_leaf(p4d_t p4d)
 {
 	/* No 512 GiB pages yet */
 	return 0;
@@ -260,14 +260,14 @@ static inline int p4d_large(p4d_t p4d)
 
 #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
 
-#define pmd_leaf	pmd_large
-static inline int pmd_large(pmd_t pte)
+#define pmd_leaf pmd_leaf
+static inline int pmd_leaf(pmd_t pte)
 {
 	return pmd_flags(pte) & _PAGE_PSE;
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-/* NOTE: when predicate huge page, consider also pmd_devmap, or use pmd_large */
+/* NOTE: when predicate huge page, consider also pmd_devmap, or use pmd_leaf */
 static inline int pmd_trans_huge(pmd_t pmd)
 {
 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
@@ -1085,8 +1085,8 @@ static inline pmd_t *pud_pgtable(pud_t pud)
  */
 #define pud_page(pud)	pfn_to_page(pud_pfn(pud))
 
-#define pud_leaf	pud_large
-static inline int pud_large(pud_t pud)
+#define pud_leaf pud_leaf
+static inline int pud_leaf(pud_t pud)
 {
 	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
 		(_PAGE_PSE | _PAGE_PRESENT);
@@ -1096,11 +1096,6 @@ static inline int pud_bad(pud_t pud)
 {
 	return (pud_flags(pud) & ~(_KERNPG_TABLE | _PAGE_USER)) != 0;
 }
-#else
-static inline int pud_large(pud_t pud)
-{
-	return 0;
-}
 #endif	/* CONFIG_PGTABLE_LEVELS > 2 */
 
 #if CONFIG_PGTABLE_LEVELS > 3
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 5cb5bc4a72c4..58f5e6b637b4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3110,7 +3110,7 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	/*
 	 * Read each entry once.  As above, a non-leaf entry can be promoted to
 	 * a huge page _during_ this walk.  Re-reading the entry could send the
-	 * walk into the weeks, e.g. p*d_large() returns false (sees the old
+	 * walk into the weeks, e.g. p*d_leaf() returns false (sees the old
 	 * value) and then p*d_offset() walks into the target huge page instead
 	 * of the old page table (sees the new value).
 	 */
-- 
2.44.0

