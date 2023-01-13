Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4410A66A0A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:25:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtpGY0TN5z3ffZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 04:25:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gWd/Jf1n;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gWd/Jf1n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gWd/Jf1n;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gWd/Jf1n;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntnzf5qbzz3fCQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:12:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb3/Kg+q8w8ft77T7rabV7x4+F6BGLijJ0EWAhVZvAg=;
	b=gWd/Jf1nq8sgMNezDx9+pNIlVFe7Z1MXTzdO9oU5opRRk2EH7xqmU1jcgW2rJ6zgrhCfvV
	v7LPA2zP45Z6CCncRBI4H7FbOHBDi3XYYdyOzllV/SlB7ShOuoyqFgtPgZhzDDwdsOx78F
	b1KyVoIs1OhBs3+4ZpQ/OogoEZErNNY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb3/Kg+q8w8ft77T7rabV7x4+F6BGLijJ0EWAhVZvAg=;
	b=gWd/Jf1nq8sgMNezDx9+pNIlVFe7Z1MXTzdO9oU5opRRk2EH7xqmU1jcgW2rJ6zgrhCfvV
	v7LPA2zP45Z6CCncRBI4H7FbOHBDi3XYYdyOzllV/SlB7ShOuoyqFgtPgZhzDDwdsOx78F
	b1KyVoIs1OhBs3+4ZpQ/OogoEZErNNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-JtK01FPYOwaf9TktFHEmLQ-1; Fri, 13 Jan 2023 12:12:40 -0500
X-MC-Unique: JtK01FPYOwaf9TktFHEmLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A68780D0EB;
	Fri, 13 Jan 2023 17:12:38 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDF5F40C2064;
	Fri, 13 Jan 2023 17:12:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 16/26] parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Fri, 13 Jan 2023 18:10:16 +0100
Message-Id: <20230113171026.582290-17-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andre
 w Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by using the yet-unused
_PAGE_ACCESSED location in the swap PTE. Looking at pte_present()
and pte_none() checks, there seems to be no actual reason why we cannot
use it: we only have to make sure we're not using _PAGE_PRESENT.

Reusing this bit avoids having to steal one bit from the swap offset.

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/parisc/include/asm/pgtable.h | 41 ++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index ea357430aafe..3033bb88df34 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -218,6 +218,9 @@ extern void __update_cache(pte_t pte);
 #define _PAGE_KERNEL_RWX	(_PAGE_KERNEL_EXEC | _PAGE_WRITE)
 #define _PAGE_KERNEL		(_PAGE_KERNEL_RO | _PAGE_WRITE)
 
+/* We borrow bit 23 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_ACCESSED
+
 /* The pgd/pmd contains a ptr (in phys addr space); since all pgds/pmds
  * are page-aligned, we don't care about the PAGE_OFFSET bits, except
  * for a few meta-information bits, so we shift the address to be
@@ -394,17 +397,49 @@ extern void paging_init (void);
 
 #define update_mmu_cache(vms,addr,ptep) __update_cache(*ptep)
 
-/* Encode and de-code a swap entry */
-
+/*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs (32bit):
+ *
+ *                         1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
+ *   0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+ *   <---------------- offset -----------------> P E <ofs> < type ->
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   _PAGE_PRESENT (P) must be 0.
+ *
+ *   For the 64bit version, the offset is extended by 32bit.
+ */
 #define __swp_type(x)                     ((x).val & 0x1f)
 #define __swp_offset(x)                   ( (((x).val >> 6) &  0x7) | \
 					  (((x).val >> 8) & ~0x7) )
-#define __swp_entry(type, offset)         ((swp_entry_t) { (type) | \
+#define __swp_entry(type, offset)         ((swp_entry_t) { \
+					    ((type) & 0x1f) | \
 					    ((offset &  0x7) << 6) | \
 					    ((offset & ~0x7) << 8) })
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
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
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
 	pte_t pte;
-- 
2.39.0

