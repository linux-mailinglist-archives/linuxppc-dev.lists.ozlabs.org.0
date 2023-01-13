Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C466A0C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:34:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtpSC6j2Cz3fFs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 04:34:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AUTE6kJj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AUTE6kJj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AUTE6kJj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AUTE6kJj;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntp1274TXz3fKf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:13:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673630036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mP3IZE/KZDl9GAJezYjg0rs6pyEF4+VKT2OjTSckLY=;
	b=AUTE6kJjqUxNj8oEWbALMArhtUG7I8pxRgZ5UR1/CF9F0G2TH3dyt82x0fCULbEVIm8+7w
	gGp/EM/QZjvz11npBVJTv25xrxbm0b04+5hdGZnBEstBA0v1PJ3bV8Njjil6RSvQ0Zqryj
	9Ke/n0ch3cpiIaKMUnK3lyuWtrPShY4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673630036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mP3IZE/KZDl9GAJezYjg0rs6pyEF4+VKT2OjTSckLY=;
	b=AUTE6kJjqUxNj8oEWbALMArhtUG7I8pxRgZ5UR1/CF9F0G2TH3dyt82x0fCULbEVIm8+7w
	gGp/EM/QZjvz11npBVJTv25xrxbm0b04+5hdGZnBEstBA0v1PJ3bV8Njjil6RSvQ0Zqryj
	9Ke/n0ch3cpiIaKMUnK3lyuWtrPShY4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-yJ_xIwaqOwyPhpGEXK3vQQ-1; Fri, 13 Jan 2023 12:13:53 -0500
X-MC-Unique: yJ_xIwaqOwyPhpGEXK3vQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 169B0887400;
	Fri, 13 Jan 2023 17:13:52 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9979F40C2004;
	Fri, 13 Jan 2023 17:13:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 26/26] mm: remove __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Fri, 13 Jan 2023 18:10:26 +0100
Message-Id: <20230113171026.582290-27-david@redhat.com>
In-Reply-To: <20230113171026.582290-1-david@redhat.com>
References: <20230113171026.582290-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__HAVE_ARCH_PTE_SWP_EXCLUSIVE is now supported by all architectures that
support swp PTEs, so let's drop it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/alpha/include/asm/pgtable.h             |  1 -
 arch/arc/include/asm/pgtable-bits-arcv2.h    |  1 -
 arch/arm/include/asm/pgtable.h               |  1 -
 arch/arm64/include/asm/pgtable.h             |  1 -
 arch/csky/include/asm/pgtable.h              |  1 -
 arch/hexagon/include/asm/pgtable.h           |  1 -
 arch/ia64/include/asm/pgtable.h              |  1 -
 arch/loongarch/include/asm/pgtable.h         |  1 -
 arch/m68k/include/asm/mcf_pgtable.h          |  1 -
 arch/m68k/include/asm/motorola_pgtable.h     |  1 -
 arch/m68k/include/asm/sun3_pgtable.h         |  1 -
 arch/microblaze/include/asm/pgtable.h        |  1 -
 arch/mips/include/asm/pgtable.h              |  1 -
 arch/nios2/include/asm/pgtable.h             |  1 -
 arch/openrisc/include/asm/pgtable.h          |  1 -
 arch/parisc/include/asm/pgtable.h            |  1 -
 arch/powerpc/include/asm/book3s/32/pgtable.h |  1 -
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 -
 arch/powerpc/include/asm/nohash/pgtable.h    |  1 -
 arch/riscv/include/asm/pgtable.h             |  1 -
 arch/s390/include/asm/pgtable.h              |  1 -
 arch/sh/include/asm/pgtable_32.h             |  1 -
 arch/sparc/include/asm/pgtable_32.h          |  1 -
 arch/sparc/include/asm/pgtable_64.h          |  1 -
 arch/um/include/asm/pgtable.h                |  1 -
 arch/x86/include/asm/pgtable.h               |  1 -
 arch/xtensa/include/asm/pgtable.h            |  1 -
 include/linux/pgtable.h                      | 29 --------------------
 mm/debug_vm_pgtable.c                        |  2 --
 mm/memory.c                                  |  4 ---
 mm/rmap.c                                    | 11 --------
 31 files changed, 73 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 970abf511b13..ba43cb841d19 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -328,7 +328,6 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 611f412713b9..6e9f8ca6d6a1 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -132,7 +132,6 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 886c275995a2..2e626e6da9a3 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -298,7 +298,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(swp)	__pte((swp).val)
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_isset(pte, L_PTE_SWP_EXCLUSIVE);
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b4bbeed80fb6..e0c19f5e3413 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -417,7 +417,6 @@ static inline pgprot_t mk_pmd_sect_prot(pgprot_t prot)
 	return __pgprot((pgprot_val(prot) & ~PMD_TABLE_BIT) | PMD_TYPE_SECT);
 }
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline pte_t pte_swp_mkexclusive(pte_t pte)
 {
 	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index 574c97b9ecca..d4042495febc 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -200,7 +200,6 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index 7eb008e477c8..59393613d086 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -397,7 +397,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 		(((type & 0x1f) << 1) | \
 		 ((offset & 0x3ffff8) << 10) | ((offset & 0x7) << 7)) })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index e4b8ab931399..21c97e31a28a 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -424,7 +424,6 @@ extern void paging_init (void);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c6b8fe7ac43c..d28fb9dbec59 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -276,7 +276,6 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index e573d7b649f7..13741c1245e1 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -275,7 +275,6 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	(__pte((x).val))
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index c1782563e793..ec0dc19ab834 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -190,7 +190,6 @@ extern pgd_t kernel_pg_dir[128];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index dbfc9703b15d..e582b0484a55 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -174,7 +174,6 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index 7e3de54bf426..d1b8272abcd9 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -412,7 +412,6 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) >> 2 })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val << 2 })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 711874cee8e4..791389bf3c12 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -528,7 +528,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 }
 #endif
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 static inline int pte_swp_exclusive(pte_t pte)
 {
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index 05999da01731..0f5c2564e9f5 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -253,7 +253,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define __swp_entry_to_pte(swp)	((pte_t) { (swp).val })
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 903b32d662ab..3eb9b9555d0d 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -408,7 +408,6 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 3033bb88df34..e2950f5db7c9 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -422,7 +422,6 @@ extern void paging_init (void);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 0ecb3a58f23f..7bf1fe7297c6 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -386,7 +386,6 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb4c67bf45d7..4acc9690f599 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -717,7 +717,6 @@ static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
 }
 #endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline pte_t pte_swp_mkexclusive(pte_t pte)
 {
 	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 5f4620940c2c..a6caaaab6f92 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -151,7 +151,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 03a4728db039..5b9f409a940d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -752,7 +752,6 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index b26cbf1c533c..2b5db99e31dd 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -812,7 +812,6 @@ static inline int pmd_protnone(pmd_t pmd)
 }
 #endif
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index c34aa795a9d2..21952b094650 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -479,7 +479,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 /* In both cases, we borrow bit 6 to store the exclusive marker in swap PTEs. */
 #define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index abf7a2601209..d4330e3c57a6 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -353,7 +353,6 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & SRMMU_SWP_EXCLUSIVE;
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index a1658eebd036..2dc8d4641734 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -989,7 +989,6 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index cedc5fd451ce..a70d1618eb35 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -313,7 +313,6 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
 	((swp_entry_t) { pte_val(pte_mkuptodate(pte)) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_get_bits(pte, _PAGE_SWP_EXCLUSIVE);
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d25195726b78..7425f32e5293 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1299,7 +1299,6 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
 		unsigned long addr, pud_t *pud)
 {
 }
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline pte_t pte_swp_mkexclusive(pte_t pte)
 {
 	return pte_set_flags(pte, _PAGE_SWP_EXCLUSIVE);
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1025e2dc292b..fc7a14884c6c 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -360,7 +360,6 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline int pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1159b25b0542..5fd45454c073 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1064,35 +1064,6 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
 #define arch_start_context_switch(prev)	do {} while (0)
 #endif
 
-/*
- * When replacing an anonymous page by a real (!non) swap entry, we clear
- * PG_anon_exclusive from the page and instead remember whether the flag was
- * set in the swp pte. During fork(), we have to mark the entry as !exclusive
- * (possibly shared). On swapin, we use that information to restore
- * PG_anon_exclusive, which is very helpful in cases where we might have
- * additional (e.g., FOLL_GET) references on a page and wouldn't be able to
- * detect exclusivity.
- *
- * These functions don't apply to non-swap entries (e.g., migration, hwpoison,
- * ...).
- */
-#ifndef __HAVE_ARCH_PTE_SWP_EXCLUSIVE
-static inline pte_t pte_swp_mkexclusive(pte_t pte)
-{
-	return pte;
-}
-
-static inline int pte_swp_exclusive(pte_t pte)
-{
-	return false;
-}
-
-static inline pte_t pte_swp_clear_exclusive(pte_t pte)
-{
-	return pte;
-}
-#endif
-
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
 static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index a0730beffd78..3da0cc380c35 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -810,7 +810,6 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
 
 static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
 {
-#ifdef __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 	unsigned long max_swapfile_size = generic_max_swapfile_size();
 	swp_entry_t entry, entry2;
 	pte_t pte;
@@ -839,7 +838,6 @@ static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
 	WARN_ON(!is_swap_pte(pte));
 	entry2 = pte_to_swp_entry(pte);
 	WARN_ON(memcmp(&entry, &entry2, sizeof(entry)));
-#endif /* __HAVE_ARCH_PTE_SWP_EXCLUSIVE */
 }
 
 static void __init pte_swap_tests(struct pgtable_debug_args *args)
diff --git a/mm/memory.c b/mm/memory.c
index abc4e606d8bc..ed853ba74366 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3870,10 +3870,6 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	 * the swap entry concurrently) for certainly exclusive pages.
 	 */
 	if (!folio_test_ksm(folio)) {
-		/*
-		 * Note that pte_swp_exclusive() == false for architectures
-		 * without __HAVE_ARCH_PTE_SWP_EXCLUSIVE.
-		 */
 		exclusive = pte_swp_exclusive(vmf->orig_pte);
 		if (folio != swapcache) {
 			/*
diff --git a/mm/rmap.c b/mm/rmap.c
index 0e450e6bb963..b26fbbcc9257 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1710,17 +1710,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
-			/*
-			 * Note: We *don't* remember if the page was mapped
-			 * exclusively in the swap pte if the architecture
-			 * doesn't support __HAVE_ARCH_PTE_SWP_EXCLUSIVE. In
-			 * that case, swapin code has to re-determine that
-			 * manually and might detect the page as possibly
-			 * shared, for example, if there are other references on
-			 * the page or if the page is under writeback. We made
-			 * sure that there are no GUP pins on the page that
-			 * would rely on it, so for GUP pins this is fine.
-			 */
 			if (list_empty(&mm->mmlist)) {
 				spin_lock(&mmlist_lock);
 				if (list_empty(&mm->mmlist))
-- 
2.39.0

