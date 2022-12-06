Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99704644765
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 16:04:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRNxG5MP0z3f3h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 02:04:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DcKRmqpA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DcKRmqpA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DcKRmqpA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DcKRmqpA;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRNcZ6Y52z3cLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:50:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L+U7jLGyObm3TTCk7UueSDx5AY+dCGvYHXaB/HQsmM=;
	b=DcKRmqpA6RFe1EL7CpNhSBbGNkeeVMI9LfXj92tVfglq+nPRjorGuGBadBuONe0u8ak8Q+
	3B5MoycNCVeyC8LvmrHehDpPpNKf/ObBVQzf7XqWyzCOnzzprDWg4s3Xgwrssun6J6Bx59
	damptsYnT+X2JRGeEyqj3FEewZJKIfY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L+U7jLGyObm3TTCk7UueSDx5AY+dCGvYHXaB/HQsmM=;
	b=DcKRmqpA6RFe1EL7CpNhSBbGNkeeVMI9LfXj92tVfglq+nPRjorGuGBadBuONe0u8ak8Q+
	3B5MoycNCVeyC8LvmrHehDpPpNKf/ObBVQzf7XqWyzCOnzzprDWg4s3Xgwrssun6J6Bx59
	damptsYnT+X2JRGeEyqj3FEewZJKIfY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-ig3My35pOvqlI-h4lhdRoQ-1; Tue, 06 Dec 2022 09:50:02 -0500
X-MC-Unique: ig3My35pOvqlI-h4lhdRoQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 392A838164C0;
	Tue,  6 Dec 2022 14:50:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E77A1492B04;
	Tue,  6 Dec 2022 14:49:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable RFC 18/26] powerpc/nohash/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue,  6 Dec 2022 15:47:22 +0100
Message-Id: <20221206144730.163732-19-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.
 ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit and 64bit.

On 64bit, let's use MSB 56 (LSB 7), located right next to the page type.
On 32bit, let's use LSB 2 to avoid stealing one bit from the swap offset.

There seems to be no real reason why these bits cannot be used for swap
PTEs. The important part is that _PAGE_PRESENT and _PAGE_HASHPTE remain
0.

While at it, mask the type in __swp_entry() and remove
_PAGE_BIT_SWAP_TYPE from pte-e500.h: while it was used in 64bit code it was
ignored in 32bit code.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h  | 22 +++++++++++++----
 arch/powerpc/include/asm/nohash/32/pte-40x.h  |  6 ++---
 arch/powerpc/include/asm/nohash/32/pte-44x.h  | 18 ++++----------
 arch/powerpc/include/asm/nohash/32/pte-85xx.h |  4 ++--
 arch/powerpc/include/asm/nohash/64/pgtable.h  | 24 ++++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h     | 16 +++++++++++++
 arch/powerpc/include/asm/nohash/pte-e500.h    |  1 -
 7 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 0d40b33184eb..1bb3698e6628 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -354,18 +354,30 @@ static inline int pte_young(pte_t pte)
 #endif
 
 #define pmd_page(pmd)		pfn_to_page(pmd_pfn(pmd))
+
 /*
- * Encode and decode a swap entry.
- * Note that the bits we use in a PTE for representing a swap entry
- * must not include the _PAGE_PRESENT bit.
- *   -- paulus
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs (32bit PTEs):
+ *
+ *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
+ *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+ *   <------------------ offset -------------------> < type -> E 0 0
+ *
+ * E is the exclusive marker that is not stored in swap entries.
+ *
+ * For 64bit PTEs, the offset is extended by 32bit.
  */
 #define __swp_type(entry)		((entry).val & 0x1f)
 #define __swp_offset(entry)		((entry).val >> 5)
-#define __swp_entry(type, offset)	((swp_entry_t) { (type) | ((offset) << 5) })
+#define __swp_entry(type, offset)	((swp_entry_t) { ((type) & 0x1f) | ((offset) << 5) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
 
+/* We borrow LSB 2 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x000004
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_POWERPC_NOHASH_32_PGTABLE_H */
diff --git a/arch/powerpc/include/asm/nohash/32/pte-40x.h b/arch/powerpc/include/asm/nohash/32/pte-40x.h
index 2d3153cfc0d7..6fe46e754556 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-40x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-40x.h
@@ -27,9 +27,9 @@
  *   of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
  *   miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
  *   zone.
- * - PRESENT *must* be in the bottom two bits because swap cache
- *   entries use the top 30 bits.  Because 40x doesn't support SMP
- *   anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
+ * - PRESENT *must* be in the bottom two bits because swap PTEs
+ *   use the top 30 bits.  Because 40x doesn't support SMP anyway, M is
+ *   irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
  *   is cleared in the TLB miss handler before the TLB entry is loaded.
  * - All other bits of the PTE are loaded into TLBLO without
  *   modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
diff --git a/arch/powerpc/include/asm/nohash/32/pte-44x.h b/arch/powerpc/include/asm/nohash/32/pte-44x.h
index 78bc304f750e..b7ed13cee137 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-44x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-44x.h
@@ -56,20 +56,10 @@
  * above bits.  Note that the bit values are CPU specific, not architecture
  * specific.
  *
- * The kernel PTE entry holds an arch-dependent swp_entry structure under
- * certain situations. In other words, in such situations some portion of
- * the PTE bits are used as a swp_entry. In the PPC implementation, the
- * 3-24th LSB are shared with swp_entry, however the 0-2nd three LSB still
- * hold protection values. That means the three protection bits are
- * reserved for both PTE and SWAP entry at the most significant three
- * LSBs.
- *
- * There are three protection bits available for SWAP entry:
- *	_PAGE_PRESENT
- *	_PAGE_HASHPTE (if HW has)
- *
- * So those three bits have to be inside of 0-2nd LSB of PTE.
- *
+ * The kernel PTE entry can be an ordinary PTE mapping a page or a special swap
+ * PTE. In case of a swap PTE, LSB 2-24 are used to store information regarding
+ * the swap entry. However LSB 0-1 still hold protection values, for example,
+ * to distinguish swap PTEs from ordinary PTEs, and must be used with care.
  */
 
 #define _PAGE_PRESENT	0x00000001		/* S: PTE valid */
diff --git a/arch/powerpc/include/asm/nohash/32/pte-85xx.h b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
index 93fb8e11a3f1..16451df5ddb0 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-85xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
@@ -11,8 +11,8 @@
    32 33 34 35 36  ... 50 51 52 53 54 55 56 57 58 59 60 61 62 63
    RPN......................  0  0 U0 U1 U2 U3 UX SX UW SW UR SR
 
-   - PRESENT *must* be in the bottom three bits because swap cache
-     entries use the top 29 bits.
+   - PRESENT *must* be in the bottom two bits because swap PTEs use
+     the top 30 bits.
 
 */
 
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 879e9a6e5a87..287e25864ffa 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -276,22 +276,40 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define pgd_ERROR(e) \
 	pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
-/* Encode and de-code a swap entry */
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
+ *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+ *   <-------------------------- offset ----------------------------
+ *
+ *   3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 6 6 6 6
+ *   2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3
+ *   --------------> <----------- zero ------------> E < type -> 0 0
+ *
+ * E is the exclusive marker that is not stored in swap entries.
+ */
 #define MAX_SWAPFILES_CHECK() do { \
 	BUILD_BUG_ON(MAX_SWAPFILES_SHIFT > SWP_TYPE_BITS); \
 	} while (0)
 
 #define SWP_TYPE_BITS 5
-#define __swp_type(x)		(((x).val >> _PAGE_BIT_SWAP_TYPE) \
+#define __swp_type(x)		(((x).val >> 2) \
 				& ((1UL << SWP_TYPE_BITS) - 1))
 #define __swp_offset(x)		((x).val >> PTE_RPN_SHIFT)
 #define __swp_entry(type, offset)	((swp_entry_t) { \
-					((type) << _PAGE_BIT_SWAP_TYPE) \
+					(((type) & 0x1f) << 2) \
 					| ((offset) << PTE_RPN_SHIFT) })
 
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val((pte)) })
 #define __swp_entry_to_pte(x)		__pte((x).val)
 
+/* We borrow MSB 56 (LSB 7) to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x80
+
 int map_kernel_page(unsigned long ea, unsigned long pa, pgprot_t prot);
 void unmap_kernel_page(unsigned long va);
 extern int __meminit vmemmap_create_mapping(unsigned long start,
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index d9067dfc531c..c6df317ab6c3 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -151,6 +151,22 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_SWP_EXCLUSIVE);
+}
+
 /* Insert a PTE, top-level function is out of line. It uses an inline
  * low level function in the respective pgtable-* files
  */
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 0934e8965e4e..d8924cbd61e4 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -12,7 +12,6 @@
 /* Architected bits */
 #define _PAGE_PRESENT	0x000001 /* software: pte contains a translation */
 #define _PAGE_SW1	0x000002
-#define _PAGE_BIT_SWAP_TYPE	2
 #define _PAGE_BAP_SR	0x000004
 #define _PAGE_BAP_UR	0x000008
 #define _PAGE_BAP_SW	0x000010
-- 
2.38.1

