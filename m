Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8106446A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 15:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRNhT6bcVz3bgG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 01:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I/WKdzPG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I/WKdzPG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I/WKdzPG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I/WKdzPG;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRNb83Hh3z3bbc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:48:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnIUuYlJfmQGfvnVf88NtIdpwTWNZSx4XqVJGuJ/Bn4=;
	b=I/WKdzPGGs0e6Gh7G1CKI9AORVVsbZW/YGQePogS5A1bCPYui5GRIYGTeQSdmKD++qAAyb
	lBj7FknZRVwQAewFfFgen1QoT03dQHWKKLjdPc1xYrVYDaH/nAuuC/uAAGc94AYldY8JwR
	JuSiwolYYdIc7RxdQoti7fn0YQkugCc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnIUuYlJfmQGfvnVf88NtIdpwTWNZSx4XqVJGuJ/Bn4=;
	b=I/WKdzPGGs0e6Gh7G1CKI9AORVVsbZW/YGQePogS5A1bCPYui5GRIYGTeQSdmKD++qAAyb
	lBj7FknZRVwQAewFfFgen1QoT03dQHWKKLjdPc1xYrVYDaH/nAuuC/uAAGc94AYldY8JwR
	JuSiwolYYdIc7RxdQoti7fn0YQkugCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-D8ymNhOSP32dlbMNd3stBw-1; Tue, 06 Dec 2022 09:48:45 -0500
X-MC-Unique: D8ymNhOSP32dlbMNd3stBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95A03101A54E;
	Tue,  6 Dec 2022 14:48:43 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87CC2492B04;
	Tue,  6 Dec 2022 14:48:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable RFC 06/26] hexagon/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue,  6 Dec 2022 15:47:10 +0100
Message-Id: <20221206144730.163732-7-david@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlab
 s.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit from the
offset. This reduces the maximum swap space per file to 16 GiB (was 32
GiB).

While at it, mask the type in __swp_entry().

Cc: Brian Cain <bcain@quicinc.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/hexagon/include/asm/pgtable.h | 37 +++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index f7048c18b6f9..7eb008e477c8 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -61,6 +61,9 @@ extern unsigned long empty_zero_page;
  * So we'll put up with a bit of inefficiency for now...
  */
 
+/* We borrow bit 6 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(1<<6)
+
 /*
  * Top "FOURTH" level (pgd), which for the Hexagon VM is really
  * only the second from the bottom, pgd and pud both being collapsed.
@@ -359,9 +362,12 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define ZERO_PAGE(vaddr) (virt_to_page(&empty_zero_page))
 
 /*
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
  * Swap/file PTE definitions.  If _PAGE_PRESENT is zero, the rest of the PTE is
  * interpreted as swap information.  The remaining free bits are interpreted as
- * swap type/offset tuple.  Rather than have the TLB fill handler test
+ * listed below.  Rather than have the TLB fill handler test
  * _PAGE_PRESENT, we're going to reserve the permissions bits and set them to
  * all zeros for swap entries, which speeds up the miss handler at the cost of
  * 3 bits of offset.  That trade-off can be revisited if necessary, but Hexagon
@@ -371,9 +377,10 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
  * Format of swap PTE:
  *	bit	0:	Present (zero)
  *	bits	1-5:	swap type (arch independent layer uses 5 bits max)
- *	bits	6-9:	bits 3:0 of offset
+ *	bit	6:	exclusive marker
+ *	bits	7-9:	bits 2:0 of offset
  *	bits	10-12:	effectively _PAGE_PROTNONE (all zero)
- *	bits	13-31:  bits 22:4 of swap offset
+ *	bits	13-31:  bits 21:3 of swap offset
  *
  * The split offset makes some of the following macros a little gnarly,
  * but there's plenty of precedent for this sort of thing.
@@ -383,11 +390,29 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define __swp_type(swp_pte)		(((swp_pte).val >> 1) & 0x1f)
 
 #define __swp_offset(swp_pte) \
-	((((swp_pte).val >> 6) & 0xf) | (((swp_pte).val >> 9) & 0x7ffff0))
+	((((swp_pte).val >> 7) & 0x7) | (((swp_pte).val >> 10) & 0x3ffff8))
 
 #define __swp_entry(type, offset) \
 	((swp_entry_t)	{ \
-		((type << 1) | \
-		 ((offset & 0x7ffff0) << 9) | ((offset & 0xf) << 6)) })
+		(((type & 0x1f) << 1) | \
+		 ((offset & 0x3ffff8) << 10) | ((offset & 0x7) << 7)) })
+
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
 
 #endif
-- 
2.38.1

