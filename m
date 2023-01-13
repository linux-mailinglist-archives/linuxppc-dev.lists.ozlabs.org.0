Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9B66A0AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:26:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtpHZ1tQSz3fDG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 04:26:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKawl9rE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKawl9rE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKawl9rE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKawl9rE;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntnzp5R9Gz3fHG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:12:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/pOewF7neptUo6af+r5FxFOsv+W3FPHbMBwYM5K1LM=;
	b=KKawl9rEjuhfHLi3p8OAWIyck0M2qEQl71q9wU7vT30spBrvvF814tDt5+ipm6Am/oJdXH
	P8r+ib/F25xVDzuFG44DI5HmcPl3oDTMepScCgPmRWqjcdyxyyrrc4lHHe40rhIUJEOvI3
	nvsy0/+og0jIrOdsULmMQblQ+h486CQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/pOewF7neptUo6af+r5FxFOsv+W3FPHbMBwYM5K1LM=;
	b=KKawl9rEjuhfHLi3p8OAWIyck0M2qEQl71q9wU7vT30spBrvvF814tDt5+ipm6Am/oJdXH
	P8r+ib/F25xVDzuFG44DI5HmcPl3oDTMepScCgPmRWqjcdyxyyrrc4lHHe40rhIUJEOvI3
	nvsy0/+og0jIrOdsULmMQblQ+h486CQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-EGasiiu4MBSUSDxxLJu0-g-1; Fri, 13 Jan 2023 12:12:47 -0500
X-MC-Unique: EGasiiu4MBSUSDxxLJu0-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF64E3C0254D;
	Fri, 13 Jan 2023 17:12:46 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 068BC40C2064;
	Fri, 13 Jan 2023 17:12:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 17/26] powerpc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
Date: Fri, 13 Jan 2023 18:10:17 +0100
Message-Id: <20230113171026.582290-18-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.
 ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We already implemented support for 64bit book3s in commit bff9beaa2e80
("powerpc/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE for book3s")

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also in 32bit by reusing yet
unused LSB 2 / MSB 29. There seems to be no real reason why that bit cannot
be used, and reusing it avoids having to steal one bit from the swap
offset.

While at it, mask the type in __swp_entry().

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 38 +++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 75823f39e042..0ecb3a58f23f 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -42,6 +42,9 @@
 #define _PMD_PRESENT_MASK (PAGE_MASK)
 #define _PMD_BAD	(~PAGE_MASK)
 
+/* We borrow the _PAGE_USER bit to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
+
 /* And here we include common definitions */
 
 #define _PAGE_KERNEL_RO		0
@@ -363,17 +366,42 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define pmd_page(pmd)		pfn_to_page(pmd_pfn(pmd))
 
 /*
- * Encode and decode a swap entry.
- * Note that the bits we use in a PTE for representing a swap entry
- * must not include the _PAGE_PRESENT bit or the _PAGE_HASHPTE bit (if used).
- *   -- paulus
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs (32bit PTEs):
+ *
+ *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
+ *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+ *   <----------------- offset --------------------> < type -> E H P
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P) and __PAGE_HASHPTE (H) must be 0.
+ *
+ * For 64bit PTEs, the offset is extended by 32bit.
  */
 #define __swp_type(entry)		((entry).val & 0x1f)
 #define __swp_offset(entry)		((entry).val >> 5)
-#define __swp_entry(type, offset)	((swp_entry_t) { (type) | ((offset) << 5) })
+#define __swp_entry(type, offset)	((swp_entry_t) { ((type) & 0x1f) | ((offset) << 5) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
 
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
 /* Generic accessors to PTE bits */
 static inline int pte_write(pte_t pte)		{ return !!(pte_val(pte) & _PAGE_RW);}
 static inline int pte_read(pte_t pte)		{ return 1; }
-- 
2.39.0

