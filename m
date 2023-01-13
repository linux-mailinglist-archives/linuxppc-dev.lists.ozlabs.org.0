Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9866A004
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntp861BXtz3fGF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 04:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/esKd5A;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUgahDWD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/esKd5A;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUgahDWD;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntnyr3lN9z3fD6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:12:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71H0EiI9XZaUsVwjuHgiK9LM9EkskPiPxouUqNauT5k=;
	b=b/esKd5AmvVHKpJYLbZ44BQh5CejRgwebjbAUz0zqo2Ur+Zu2f0YUvr+TzWE/8vx1zntk8
	lZHQzmas/mO1qjpoeI6yDCZ0JKwsdSn05eWIZsSvl5d6pAuo/ku0S8f2tOTdbEtusQCFT3
	mr9R+yKNOmqIzk4CmY3haYwzDbRoMSI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71H0EiI9XZaUsVwjuHgiK9LM9EkskPiPxouUqNauT5k=;
	b=MUgahDWD/bv3X/0bV6epd4KLoT0AHsU4r0b0Bmjel886k6KKUvrk48xNA+XVTAc78UgPga
	VxiHp7+taMqpKvE+NGtjOKBw4dNZ/BqnGV30g14jNbzz/KRcCHUv3+yOsPnS1w5RbGetEx
	NnjvDkVQi6Hq7Wi1f5iO9cpYxM//ybI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-3ii295eDPOiphYm8W5OixA-1; Fri, 13 Jan 2023 12:11:58 -0500
X-MC-Unique: 3ii295eDPOiphYm8W5OixA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0BF8811E6E;
	Fri, 13 Jan 2023 17:11:56 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C84D040C2064;
	Fri, 13 Jan 2023 17:11:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 10/26] m68k/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Fri, 13 Jan 2023 18:10:10 +0100
Message-Id: <20230113171026.582290-11-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@
 linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
from the type. Generic MM currently only uses 5 bits for the type
(MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.

While at it, make sure for sun3 that the valid bit never gets set by
properly masking it off and mask the type in __swp_entry().

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/m68k/include/asm/mcf_pgtable.h      | 36 ++++++++++++++++++++--
 arch/m68k/include/asm/motorola_pgtable.h | 38 +++++++++++++++++++++--
 arch/m68k/include/asm/sun3_pgtable.h     | 39 ++++++++++++++++++++++--
 3 files changed, 104 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index b619b22823f8..3f8f4d0e66dd 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -46,6 +46,9 @@
 #define _CACHEMASK040		(~0x060)
 #define _PAGE_GLOBAL040		0x400   /* 68040 global bit, used for kva descs */
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x080
+
 /*
  * Externally used page protection values.
  */
@@ -254,15 +257,42 @@ static inline pte_t pte_mkcache(pte_t pte)
 extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 
 /*
- * Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e))
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <------------------ offset -------------> 0 0 0 E <-- type --->
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
  */
-#define __swp_type(x)		((x).val & 0xFF)
+#define __swp_type(x)		((x).val & 0x7f)
 #define __swp_offset(x)		((x).val >> 11)
-#define __swp_entry(typ, off)	((swp_entry_t) { (typ) | \
+#define __swp_entry(typ, off)	((swp_entry_t) { ((typ) & 0x7f) | \
 					(off << 11) })
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	(__pte((x).val))
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
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
+
 #define pmd_pfn(pmd)		(pmd_val(pmd) >> PAGE_SHIFT)
 #define pmd_page(pmd)		(pfn_to_page(pmd_val(pmd) >> PAGE_SHIFT))
 
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 562b54e09850..c1782563e793 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -41,6 +41,9 @@
 
 #define _PAGE_PROTNONE	0x004
 
+/* We borrow bit 11 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x800
+
 #ifndef __ASSEMBLY__
 
 /* This is the cache mode to be used for pages containing page descriptors for
@@ -169,12 +172,41 @@ static inline pte_t pte_mkcache(pte_t pte)
 #define swapper_pg_dir kernel_pg_dir
 extern pgd_t kernel_pg_dir[128];
 
-/* Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e)) */
-#define __swp_type(x)		(((x).val >> 4) & 0xff)
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   <----------------- offset ------------> E <-- type ---> 0 0 0 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ */
+#define __swp_type(x)		(((x).val >> 4) & 0x7f)
 #define __swp_offset(x)		((x).val >> 12)
-#define __swp_entry(type, offset) ((swp_entry_t) { ((type) << 4) | ((offset) << 12) })
+#define __swp_entry(type, offset) ((swp_entry_t) { (((type) & 0x7f) << 4) | ((offset) << 12) })
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
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
+
 #endif	/* !__ASSEMBLY__ */
 #endif /* _MOTOROLA_PGTABLE_H */
diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index 90d57e537eb1..dbfc9703b15d 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -71,6 +71,9 @@
 #define SUN3_PMD_MASK	(0x0000003F)
 #define SUN3_PMD_MAGIC	(0x0000002B)
 
+/* We borrow bit 6 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	0x040
+
 #ifndef __ASSEMBLY__
 
 /*
@@ -152,12 +155,42 @@ static inline pte_t pte_mkcache(pte_t pte)	{ return pte; }
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 
-/* Macros to (de)construct the fake PTEs representing swap pages. */
-#define __swp_type(x)		((x).val & 0x7F)
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   0 <--------------------- offset ----------------> E <- type -->
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ */
+#define __swp_type(x)		((x).val & 0x3f)
 #define __swp_offset(x)		(((x).val) >> 7)
-#define __swp_entry(type,offset) ((swp_entry_t) { ((type) | ((offset) << 7)) })
+#define __swp_entry(type, offset) ((swp_entry_t) { (((type) & 0x3f) | \
+						   (((offset) << 7) & ~SUN3_PAGE_VALID)) })
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
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
+
 #endif	/* !__ASSEMBLY__ */
 #endif	/* !_SUN3_PGTABLE_H */
-- 
2.39.0

