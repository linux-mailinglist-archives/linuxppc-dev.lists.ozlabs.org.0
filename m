Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFBA669F73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:14:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntp1p6mFRz3fJT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 04:14:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VZLTFMl5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VZLTFMl5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VZLTFMl5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VZLTFMl5;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntny61qrPz3fCY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:11:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZj4FS3+eH3k8U+2o1kgh0Nnr8qiKFynHsnxPGTLDn0=;
	b=VZLTFMl57Gda4NlBY7YK3pDnT4ev07A5u2Hy9z6B7lOkUqnthQ1TLSa7HBzWblD+l/lK6g
	+OQzE5udJfCKapINyfdkm42TSRpwLCIqJn5odWYyZZsHMbcuOpB3dIbMUIcwLSFPP0GYJ+
	ZfopjDPUtcigpaQIJ5pXP6ufORpgRIM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZj4FS3+eH3k8U+2o1kgh0Nnr8qiKFynHsnxPGTLDn0=;
	b=VZLTFMl57Gda4NlBY7YK3pDnT4ev07A5u2Hy9z6B7lOkUqnthQ1TLSa7HBzWblD+l/lK6g
	+OQzE5udJfCKapINyfdkm42TSRpwLCIqJn5odWYyZZsHMbcuOpB3dIbMUIcwLSFPP0GYJ+
	ZfopjDPUtcigpaQIJ5pXP6ufORpgRIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-hBWEIBOUMXubvNcoEzKBLg-1; Fri, 13 Jan 2023 12:11:15 -0500
X-MC-Unique: hBWEIBOUMXubvNcoEzKBLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8299E101A55E;
	Fri, 13 Jan 2023 17:11:14 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 121D440C2064;
	Fri, 13 Jan 2023 17:11:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 04/26] arm/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Fri, 13 Jan 2023 18:10:04 +0100
Message-Id: <20230113171026.582290-5-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists
 .ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit from the
offset. This reduces the maximum swap space per file to 64 GiB (was 128
GiB).

While at it drop the PTE_TYPE_FAULT from __swp_entry_to_pte() which is
defined to be 0 and is rather confusing because we should be dealing
with "Linux PTEs" not "hardware PTEs". Also, properly mask the type in
__swp_entry().

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm/include/asm/pgtable-2level.h |  3 +++
 arch/arm/include/asm/pgtable-3level.h |  3 +++
 arch/arm/include/asm/pgtable.h        | 35 +++++++++++++++++++++------
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 92abd4cd8ca2..ce543cd9380c 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -126,6 +126,9 @@
 #define L_PTE_SHARED		(_AT(pteval_t, 1) << 10)	/* shared(v6), coherent(xsc3) */
 #define L_PTE_NONE		(_AT(pteval_t, 1) << 11)
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define L_PTE_SWP_EXCLUSIVE	L_PTE_RDONLY
+
 /*
  * These are the memory types, defined to be compatible with
  * pre-ARMv6 CPUs cacheable and bufferable bits: n/a,n/a,C,B
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index eabe72ff7381..106049791500 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -76,6 +76,9 @@
 #define L_PTE_NONE		(_AT(pteval_t, 1) << 57)	/* PROT_NONE */
 #define L_PTE_RDONLY		(_AT(pteval_t, 1) << 58)	/* READ ONLY */
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define L_PTE_SWP_EXCLUSIVE	(_AT(pteval_t, 1) << 7)
+
 #define L_PMD_SECT_VALID	(_AT(pmdval_t, 1) << 0)
 #define L_PMD_SECT_DIRTY	(_AT(pmdval_t, 1) << 55)
 #define L_PMD_SECT_NONE		(_AT(pmdval_t, 1) << 57)
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index f049072b2e85..886c275995a2 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -271,27 +271,48 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 }
 
 /*
- * Encode and decode a swap entry.  Swap entries are stored in the Linux
- * page tables as follows:
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
  *
  *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
  *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *   <--------------- offset ------------------------> < type -> 0 0
+ *   <------------------- offset ------------------> E < type -> 0 0
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
  *
- * This gives us up to 31 swap files and 128GB per swap file.  Note that
+ * This gives us up to 31 swap files and 64GB per swap file.  Note that
  * the offset field is always non-zero.
  */
 #define __SWP_TYPE_SHIFT	2
 #define __SWP_TYPE_BITS		5
 #define __SWP_TYPE_MASK		((1 << __SWP_TYPE_BITS) - 1)
-#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT)
+#define __SWP_OFFSET_SHIFT	(__SWP_TYPE_BITS + __SWP_TYPE_SHIFT + 1)
 
 #define __swp_type(x)		(((x).val >> __SWP_TYPE_SHIFT) & __SWP_TYPE_MASK)
 #define __swp_offset(x)		((x).val >> __SWP_OFFSET_SHIFT)
-#define __swp_entry(type,offset) ((swp_entry_t) { ((type) << __SWP_TYPE_SHIFT) | ((offset) << __SWP_OFFSET_SHIFT) })
+#define __swp_entry(type, offset) ((swp_entry_t) { (((type) & __SWP_TYPE_BITS) << __SWP_TYPE_SHIFT) | \
+						   ((offset) << __SWP_OFFSET_SHIFT) })
 
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
-#define __swp_entry_to_pte(swp)	__pte((swp).val | PTE_TYPE_FAULT)
+#define __swp_entry_to_pte(swp)	__pte((swp).val)
+
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_isset(pte, L_PTE_SWP_EXCLUSIVE);
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return set_pte_bit(pte, __pgprot(L_PTE_SWP_EXCLUSIVE));
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return clear_pte_bit(pte, __pgprot(L_PTE_SWP_EXCLUSIVE));
+}
 
 /*
  * It is an error for the kernel to have more swap files than we can
-- 
2.39.0

