Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F02837330
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 20:51:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=epISbfNM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=epISbfNM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJgpC44kWz3cfy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 06:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=epISbfNM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=epISbfNM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJgct3X2xz3cTQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 06:43:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705952604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPsvEkVgYnC21FVdKrk6yuEGSmSqLr856lIR4lg3IVs=;
	b=epISbfNMsFymD8bEd6Gm/XAxGGp/qvluvDYWJZKLuaRZlKTUbkJc9plqovX5P5OAsFL5bP
	VNAdgmM9xuyQRlzHWEhXmStfBWVItleAfwUyeUgIPZRTTKG5SoFrVJ0BYCdxeOiFfCIdmR
	F8bHg61fXVmOLKZxn7f1KTHPJio/pfI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705952604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPsvEkVgYnC21FVdKrk6yuEGSmSqLr856lIR4lg3IVs=;
	b=epISbfNMsFymD8bEd6Gm/XAxGGp/qvluvDYWJZKLuaRZlKTUbkJc9plqovX5P5OAsFL5bP
	VNAdgmM9xuyQRlzHWEhXmStfBWVItleAfwUyeUgIPZRTTKG5SoFrVJ0BYCdxeOiFfCIdmR
	F8bHg61fXVmOLKZxn7f1KTHPJio/pfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-YpW0JN5UPxiQRu3cMsFdBw-1; Mon, 22 Jan 2024 14:43:18 -0500
X-MC-Unique: YpW0JN5UPxiQRu3cMsFdBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2508C87A38D;
	Mon, 22 Jan 2024 19:43:15 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.195.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 192C124ED;
	Mon, 22 Jan 2024 19:43:08 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/11] mm/memory: ignore writable bit in folio_pte_batch()
Date: Mon, 22 Jan 2024 20:42:00 +0100
Message-ID: <20240122194200.381241-12-david@redhat.com>
In-Reply-To: <20240122194200.381241-1-david@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" 
 <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

... and conditionally return to the caller if any pte except the first one
is writable. fork() has to make sure to properly write-protect in case any
PTE is writable. Other users (e.g., page unmaping) won't care.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 341b2be845b6e..a26fd0669016b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -955,7 +955,7 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
 
 static inline pte_t __pte_batch_clear_ignored(pte_t pte)
 {
-	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
+	return pte_wrprotect(pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte))));
 }
 
 /*
@@ -963,20 +963,29 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte)
  * pages of the same folio.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
- * the accessed bit, dirty bit and soft-dirty bit.
+ * the accessed bit, dirty bit, soft-dirty bit and writable bit.
+ . If "any_writable" is set, it will indicate if any other PTE besides the
+ * first (given) PTE is writable.
  */
 static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *start_ptep, pte_t pte, int max_nr)
+		pte_t *start_ptep, pte_t pte, int max_nr, bool *any_writable)
 {
 	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
 	const pte_t *end_ptep = start_ptep + max_nr;
 	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
 	pte_t *ptep = start_ptep + 1;
+	bool writable;
+
+	if (any_writable)
+		*any_writable = false;
 
 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
 
 	while (ptep != end_ptep) {
-		pte = __pte_batch_clear_ignored(ptep_get(ptep));
+		pte = ptep_get(ptep);
+		if (any_writable)
+			writable = !!pte_write(pte);
+		pte = __pte_batch_clear_ignored(pte);
 
 		if (!pte_same(pte, expected_pte))
 			break;
@@ -989,6 +998,9 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		if (pte_pfn(pte) == folio_end_pfn)
 			break;
 
+		if (any_writable)
+			*any_writable |= writable;
+
 		expected_pte = pte_next_pfn(expected_pte);
 		ptep++;
 	}
@@ -1010,6 +1022,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 {
 	struct page *page;
 	struct folio *folio;
+	bool any_writable;
 	int err, nr;
 
 	page = vm_normal_page(src_vma, addr, pte);
@@ -1024,7 +1037,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	 * by keeping the batching logic separate.
 	 */
 	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
-		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
+		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr,
+				     &any_writable);
 		if (folio_test_anon(folio)) {
 			folio_ref_add(folio, nr);
 			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
@@ -1039,6 +1053,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 			folio_dup_file_rmap_ptes(folio, page, nr);
 			rss[mm_counter_file(page)] += nr;
 		}
+		if (any_writable)
+			pte = pte_mkwrite(pte, src_vma);
 		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
 				    addr, nr);
 		return nr;
-- 
2.43.0

