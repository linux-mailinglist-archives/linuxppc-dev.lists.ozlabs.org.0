Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF56446C5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 15:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRNjf41l5z3c5x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 01:54:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LR38vAFv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LvhqHQPI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LR38vAFv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LvhqHQPI;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRNbC2mskz3bhN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:48:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m3HgZoiBdRe2+qxYMQ72TFwa7GczY3f363Bjai/2ODc=;
	b=LR38vAFvS8uCHsqJTwzqtQEY03r8ccwEpNEk5VDZkeQu9h8FCm0DRkX8JXaPPF7pJueLXT
	eCV9r9bcxSS4XngyU5OP5/ZjL9xTUoW/9m7KJt8kqblIHdOVmKMjh2ga8u6u4Wpr0C6hNY
	5vWPms6F8269XJnCFSxjnyRb5MZHnWQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m3HgZoiBdRe2+qxYMQ72TFwa7GczY3f363Bjai/2ODc=;
	b=LvhqHQPIRePtVNqFjM3Vndgxjlpe45QOQXdCOggTrBfOXYrPRoFdJjNwSt4LFMjZcoVCgR
	rtrRZWEozFfx4spm2CgFpKyctBiyehIurFO2H/7WSpAP7u9NTai9LgVWXCf4YxNgh8Ro7p
	/OA5kViL7C2xZ1Gcn1izR0i5zZ0JdMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-1x9UA2_6OruWRg3WBRCK0w-1; Tue, 06 Dec 2022 09:48:50 -0500
X-MC-Unique: 1x9UA2_6OruWRg3WBRCK0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A10185A588;
	Tue,  6 Dec 2022 14:48:49 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D692C492B04;
	Tue,  6 Dec 2022 14:48:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable RFC 07/26] ia64/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue,  6 Dec 2022 15:47:11 +0100
Message-Id: <20221206144730.163732-8-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
from the type. Generic MM currently only uses 5 bits for the type
(MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.

While at it, also mask the type in __swp_entry().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/ia64/include/asm/pgtable.h | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index 01517a5e6778..d666eb229d4b 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -58,6 +58,9 @@
 #define _PAGE_ED		(__IA64_UL(1) << 52)	/* exception deferral */
 #define _PAGE_PROTNONE		(__IA64_UL(1) << 63)
 
+/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1 << 7)
+
 #define _PFN_MASK		_PAGE_PPN_MASK
 /* Mask of bits which may be changed by pte_modify(); the odd bits are there for _PAGE_PROTNONE */
 #define _PAGE_CHG_MASK	(_PAGE_P | _PAGE_PROTNONE | _PAGE_PL_MASK | _PAGE_AR_MASK | _PAGE_ED)
@@ -399,6 +402,9 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 extern void paging_init (void);
 
 /*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
  * Note: The macros below rely on the fact that MAX_SWAPFILES_SHIFT <= number of
  *	 bits in the swap-type field of the swap pte.  It would be nice to
  *	 enforce that, but we can't easily include <linux/swap.h> here.
@@ -406,16 +412,36 @@ extern void paging_init (void);
  *
  * Format of swap pte:
  *	bit   0   : present bit (must be zero)
- *	bits  1- 7: swap-type
+ *	bits  1- 6: swap type
+ *	bit   7   : exclusive marker
  *	bits  8-62: swap offset
  *	bit  63   : _PAGE_PROTNONE bit
  */
-#define __swp_type(entry)		(((entry).val >> 1) & 0x7f)
+#define __swp_type(entry)		(((entry).val >> 1) & 0x3f)
 #define __swp_offset(entry)		(((entry).val << 1) >> 9)
-#define __swp_entry(type,offset)	((swp_entry_t) { ((type) << 1) | ((long) (offset) << 8) })
+#define __swp_entry(type,offset)	((swp_entry_t) { ((type & 0x3f) << 1) | \
+							 ((long) (offset) << 8) })
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
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
-- 
2.38.1

