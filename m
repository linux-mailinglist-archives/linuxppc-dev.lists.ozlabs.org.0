Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078066A0D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:34:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtpTF2Nd1z3fN0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 04:34:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6RTbuuL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6RTbuuL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6RTbuuL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D6RTbuuL;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntp1C5cVcz3fCJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673630045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qm5QoVPm0Ej7LSZYB6DDk7xidLBDUjryz2WuGbnlcmU=;
	b=D6RTbuuLRmUG03ojUx+jH8KzW/dnsgo5Y9ced2I6ZtUQtV3zTeZt78vXvvRPZG18EIXTWN
	byexabqeNZioDFrSUAekbjD7P72L1kI7sGXUCJ92w3heT2UmseR4tYTa5taAjdWs+jFYXw
	8/mpOQJwLUgcGqXP1lBEOjGFHRV9i68=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673630045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qm5QoVPm0Ej7LSZYB6DDk7xidLBDUjryz2WuGbnlcmU=;
	b=D6RTbuuLRmUG03ojUx+jH8KzW/dnsgo5Y9ced2I6ZtUQtV3zTeZt78vXvvRPZG18EIXTWN
	byexabqeNZioDFrSUAekbjD7P72L1kI7sGXUCJ92w3heT2UmseR4tYTa5taAjdWs+jFYXw
	8/mpOQJwLUgcGqXP1lBEOjGFHRV9i68=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-JhtZawOWORO1KFpHjnyH1g-1; Fri, 13 Jan 2023 12:13:54 -0500
X-MC-Unique: JhtZawOWORO1KFpHjnyH1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A13BA857D0D;
	Fri, 13 Jan 2023 17:13:37 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43C4D40C2064;
	Fri, 13 Jan 2023 17:13:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 24/26] x86/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also on 32bit
Date: Fri, 13 Jan 2023 18:10:24 +0100
Message-Id: <20230113171026.582290-25-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-p
 arisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE just like we already do on
x86-64. After deciphering the PTE layout it becomes clear that there are
still unused bits for 2-level and 3-level page tables that we should be
able to use. Reusing a bit avoids stealing one bit from the swap offset.

While at it, mask the type in __swp_entry(); use some helper definitions
to make the macros easier to grasp.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/include/asm/pgtable-2level.h | 26 +++++++++++++++++++++-----
 arch/x86/include/asm/pgtable-3level.h | 26 +++++++++++++++++++++++---
 arch/x86/include/asm/pgtable.h        |  2 --
 3 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/pgtable-2level.h b/arch/x86/include/asm/pgtable-2level.h
index 60d0f9015317..e9482a11ac52 100644
--- a/arch/x86/include/asm/pgtable-2level.h
+++ b/arch/x86/include/asm/pgtable-2level.h
@@ -80,21 +80,37 @@ static inline unsigned long pte_bitop(unsigned long value, unsigned int rightshi
 	return ((value >> rightshift) & mask) << leftshift;
 }
 
-/* Encode and de-code a swap entry */
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <----------------- offset ------------------> 0 E <- type --> 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ */
 #define SWP_TYPE_BITS 5
+#define _SWP_TYPE_MASK ((1U << SWP_TYPE_BITS) - 1)
+#define _SWP_TYPE_SHIFT (_PAGE_BIT_PRESENT + 1)
 #define SWP_OFFSET_SHIFT (_PAGE_BIT_PROTNONE + 1)
 
-#define MAX_SWAPFILES_CHECK() BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > SWP_TYPE_BITS)
+#define MAX_SWAPFILES_CHECK() BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > 5)
 
-#define __swp_type(x)			(((x).val >> (_PAGE_BIT_PRESENT + 1)) \
-					 & ((1U << SWP_TYPE_BITS) - 1))
+#define __swp_type(x)			(((x).val >> _SWP_TYPE_SHIFT) \
+					 & _SWP_TYPE_MASK)
 #define __swp_offset(x)			((x).val >> SWP_OFFSET_SHIFT)
 #define __swp_entry(type, offset)	((swp_entry_t) { \
-					 ((type) << (_PAGE_BIT_PRESENT + 1)) \
+					 (((type) & _SWP_TYPE_MASK) << _SWP_TYPE_SHIFT) \
 					 | ((offset) << SWP_OFFSET_SHIFT) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_low })
 #define __swp_entry_to_pte(x)		((pte_t) { .pte = (x).val })
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_PSE
+
 /* No inverted PFNs on 2 level page tables */
 
 static inline u64 protnone_mask(u64 val)
diff --git a/arch/x86/include/asm/pgtable-3level.h b/arch/x86/include/asm/pgtable-3level.h
index 967b135fa2c0..9e7c0b719c3c 100644
--- a/arch/x86/include/asm/pgtable-3level.h
+++ b/arch/x86/include/asm/pgtable-3level.h
@@ -145,8 +145,24 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
-/* Encode and de-code a swap entry */
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   < type -> <---------------------- offset ----------------------
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   --------------------------------------------> 0 E 0 0 0 0 0 0 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ */
 #define SWP_TYPE_BITS		5
+#define _SWP_TYPE_MASK ((1U << SWP_TYPE_BITS) - 1)
 
 #define SWP_OFFSET_FIRST_BIT	(_PAGE_BIT_PROTNONE + 1)
 
@@ -154,9 +170,10 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 #define SWP_OFFSET_SHIFT	(SWP_OFFSET_FIRST_BIT + SWP_TYPE_BITS)
 
 #define MAX_SWAPFILES_CHECK() BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > SWP_TYPE_BITS)
-#define __swp_type(x)			(((x).val) & ((1UL << SWP_TYPE_BITS) - 1))
+#define __swp_type(x)			(((x).val) & _SWP_TYPE_MASK)
 #define __swp_offset(x)			((x).val >> SWP_TYPE_BITS)
-#define __swp_entry(type, offset)	((swp_entry_t){(type) | (offset) << SWP_TYPE_BITS})
+#define __swp_entry(type, offset)	((swp_entry_t){((type) & _SWP_TYPE_MASK) \
+					| (offset) << SWP_TYPE_BITS})
 
 /*
  * Normally, __swp_entry() converts from arch-independent swp_entry_t to
@@ -184,6 +201,9 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)	(__swp_entry(__pteval_swp_type(pte), \
 					     __pteval_swp_offset(pte)))
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_PSE
+
 #include <asm/pgtable-invert.h>
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_H */
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 1c843395a8b3..d25195726b78 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1299,7 +1299,6 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
 		unsigned long addr, pud_t *pud)
 {
 }
-#ifdef _PAGE_SWP_EXCLUSIVE
 #define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 static inline pte_t pte_swp_mkexclusive(pte_t pte)
 {
@@ -1315,7 +1314,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 {
 	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
 }
-#endif /* _PAGE_SWP_EXCLUSIVE */
 
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
-- 
2.39.0

