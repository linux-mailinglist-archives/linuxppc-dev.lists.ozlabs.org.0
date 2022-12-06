Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C057644740
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 15:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRNpv2cfSz3fMY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 01:59:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xh+dbIIl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQbUX5sk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xh+dbIIl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQbUX5sk;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRNbr5tQZz3brQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:49:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WzoZqZ/9WlcO6V298YVqkPqgyDG5UMzG+Jr2DTFd0D0=;
	b=Xh+dbIIlUN1H+1bEpP195EP8jhfgARoEPWa2qR7tjgrxX0jjIxtMIIQ+CqaxtOkYzmqa9i
	f/00KO5H91CxhISm+3A40VslNcGK/dcHjzE8gPxZBpuUyrZP340fB8C48L00HfQNZISelN
	zd7NuFZxD3FqzSPGVJ2mTOrQY4MLIWQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WzoZqZ/9WlcO6V298YVqkPqgyDG5UMzG+Jr2DTFd0D0=;
	b=FQbUX5skAEZZ6jeG9Wno6+LIOFz3SijWnIyAZWP0g7tCP8pLYatCo0r3LQmGRfD9C6RAyx
	xqtCHOEAfEF/+mDEbglxaMSwKT0N7JchxrqnvroOH9dYXsr/HlbL9SHxJpu3KfewjGLXAN
	2YRINUCKHS5J0hMOHTETrbnYoH5x1nw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-dlVVBPaEOQe7_S9LFwWrNw-1; Tue, 06 Dec 2022 09:49:23 -0500
X-MC-Unique: dlVVBPaEOQe7_S9LFwWrNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1A5438164D9;
	Tue,  6 Dec 2022 14:49:21 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2826F492B07;
	Tue,  6 Dec 2022 14:49:15 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable RFC 12/26] mips/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue,  6 Dec 2022 15:47:16 +0100
Message-Id: <20221206144730.163732-13-david@redhat.com>
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
References: <20221206144730.163732-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxpp
 c-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE.

On 64bit, steal one bit from the type. Generic MM currently only uses 5
bits for the type (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively
unused.

On 32bit we're able to locate unused bits. As the PTE layout for 32 bit
is very confusing, document it a bit better.

While at it, mask the type in __swp_entry()/mk_swap_pte().

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/mips/include/asm/pgtable-32.h | 86 ++++++++++++++++++++++++++----
 arch/mips/include/asm/pgtable-64.h | 23 ++++++--
 arch/mips/include/asm/pgtable.h    | 36 +++++++++++++
 3 files changed, 130 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index b40a0e69fccc..c2a3b899480c 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -191,42 +191,103 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ */
 #if defined(CONFIG_CPU_R3K_TLB)
 
-/* Swap entries must have VALID bit cleared. */
+/*
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <----------- offset ------------> < type -> V G E 0 0 0 0 0 0 P
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused.
+ */
 #define __swp_type(x)			(((x).val >> 10) & 0x1f)
 #define __swp_offset(x)			((x).val >> 15)
-#define __swp_entry(type,offset)	((swp_entry_t) { ((type) << 10) | ((offset) << 15) })
+#define __swp_entry(type,offset)	((swp_entry_t) { (((type) & 0x1f) << 10) | ((offset) << 15) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 7)
+
 #else
 
 #if defined(CONFIG_XPA)
 
-/* Swap entries must have VALID and GLOBAL bits cleared. */
+/*
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   0 0 0 0 0 0 E P <------------------ zeroes ------------------->
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <----------------- offset ------------------> < type -> V G 0 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused.
+ */
 #define __swp_type(x)			(((x).val >> 4) & 0x1f)
 #define __swp_offset(x)			 ((x).val >> 9)
-#define __swp_entry(type,offset)	((swp_entry_t)  { ((type) << 4) | ((offset) << 9) })
+#define __swp_entry(type,offset)	((swp_entry_t)  { (((type) & 0x1f) << 4) | ((offset) << 9) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t) { 0, (x).val })
 
+/*
+ * We borrow bit 57 (bit 25 in the low PTE) to store the exclusive marker in
+ * swap PTEs.
+ */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 25)
+
 #elif defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 
-/* Swap entries must have VALID and GLOBAL bits cleared. */
+/*
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   <------------------ zeroes -------------------> E P 0 0 0 0 0 0
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <------------------- offset --------------------> < type -> V G
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused.
+ */
 #define __swp_type(x)			(((x).val >> 2) & 0x1f)
 #define __swp_offset(x)			 ((x).val >> 7)
-#define __swp_entry(type, offset)	((swp_entry_t)  { ((type) << 2) | ((offset) << 7) })
+#define __swp_entry(type, offset)	((swp_entry_t)  { (((type) & 0x1f) << 2) | ((offset) << 7) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { (pte).pte_high })
 #define __swp_entry_to_pte(x)		((pte_t) { 0, (x).val })
 
+/*
+ * We borrow bit 39 (bit 7 in the low PTE) to store the exclusive marker in swap
+ * PTEs.
+ */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 7)
+
 #else
 /*
- * Constraints:
- *      _PAGE_PRESENT at bit 0
- *      _PAGE_MODIFIED at bit 4
- *      _PAGE_GLOBAL at bit 6
- *      _PAGE_VALID at bit 7
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <------------- offset --------------> < type -> 0 0 0 0 0 0 E P
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P), _PAGE_VALID (V) and_PAGE_GLOBAL (G) have to remain
+ *   unused. The location of V and G varies.
  */
 #define __swp_type(x)			(((x).val >> 8) & 0x1f)
 #define __swp_offset(x)			 ((x).val >> 13)
@@ -234,6 +295,9 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
+/* We borrow bit 1 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 1)
+
 #endif /* defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32) */
 
 #endif /* defined(CONFIG_CPU_R3K_TLB) */
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index c6310192b654..98e24e3e7f2b 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -320,16 +320,31 @@ extern void pud_init(void *addr);
 extern void pmd_init(void *addr);
 
 /*
- * Non-present pages:  high 40 bits are offset, next 8 bits type,
- * low 16 bits zero.
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   <--------------------------- offset ---------------------------
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   --------------> E <-- type ---> <---------- zeroes ----------->
+ *
+ *  E is the exclusive marker that is not stored in swap entries.
  */
 static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
-{ pte_t pte; pte_val(pte) = (type << 16) | (offset << 24); return pte; }
+{ pte_t pte; pte_val(pte) = ((type & 0x7f) << 16) | (offset << 24); return pte; }
 
-#define __swp_type(x)		(((x).val >> 16) & 0xff)
+#define __swp_type(x)		(((x).val >> 16) & 0x7f)
 #define __swp_offset(x)		((x).val >> 24)
 #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((type), (offset))) })
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
+/* We borrow bit 23 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 23)
+
 #endif /* _ASM_PGTABLE_64_H */
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index a68c0b01d8cd..711874cee8e4 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -528,6 +528,42 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 }
 #endif
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+#if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte.pte_low |= _PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte.pte_low &= ~_PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+#else
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte_val(pte) |= _PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte_val(pte) &= ~_PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+#endif
 
 extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
 	pte_t pte);
-- 
2.38.1

