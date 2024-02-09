Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D284FFB5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 23:20:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bmBBJUSR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bmBBJUSR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWpFV3kyCz3dSk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 09:20:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bmBBJUSR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bmBBJUSR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWp8N15Hcz3cWm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 09:15:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707516945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Q1ph86PH1Crd3Eqr5OMYEFX/2u3faALVbtCzM66/MM=;
	b=bmBBJUSR42eo6IRGd1YNaXuTaMenNxiDpILc/41eecvVOkarLm9SJetPhorGDueZbkCc5m
	Cm0DfdKAEpJ78i2ty2nz1CJUpzXkQVLiiIRA5CgDVOCVbwRGlqv69kJ6BcIV7cBLxJB2Ig
	zCiKIv00rW0c2uHTxNO91/U4KJYLM8I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707516945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Q1ph86PH1Crd3Eqr5OMYEFX/2u3faALVbtCzM66/MM=;
	b=bmBBJUSR42eo6IRGd1YNaXuTaMenNxiDpILc/41eecvVOkarLm9SJetPhorGDueZbkCc5m
	Cm0DfdKAEpJ78i2ty2nz1CJUpzXkQVLiiIRA5CgDVOCVbwRGlqv69kJ6BcIV7cBLxJB2Ig
	zCiKIv00rW0c2uHTxNO91/U4KJYLM8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-Q3fpNq9gN4WqYc2YHXjPew-1; Fri, 09 Feb 2024 17:15:42 -0500
X-MC-Unique: Q3fpNq9gN4WqYc2YHXjPew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D4AE1025623;
	Fri,  9 Feb 2024 22:15:41 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59E001C14B04;
	Fri,  9 Feb 2024 22:15:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] mm/mmu_gather: pass "delay_rmap" instead of encoded page to __tlb_remove_page_size()
Date: Fri,  9 Feb 2024 23:15:04 +0100
Message-ID: <20240209221509.585251-6-david@redhat.com>
In-Reply-To: <20240209221509.585251-1-david@redhat.com>
References: <20240209221509.585251-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have two bits available in the encoded page pointer to store
additional information. Currently, we use one bit to request delay of the
rmap removal until after a TLB flush.

We want to make use of the remaining bit internally for batching of
multiple pages of the same folio, specifying that the next encoded page
pointer in an array is actually "nr_pages". So pass page + delay_rmap flag
instead of an encoded page, to handle the encoding internally.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/include/asm/tlb.h | 13 ++++++-------
 include/asm-generic/tlb.h   | 12 ++++++------
 mm/mmu_gather.c             |  7 ++++---
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index d1455a601adc..48df896d5b79 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -25,8 +25,7 @@
 void __tlb_remove_table(void *_table);
 static inline void tlb_flush(struct mmu_gather *tlb);
 static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
-					  struct encoded_page *page,
-					  int page_size);
+		struct page *page, bool delay_rmap, int page_size);
 
 #define tlb_flush tlb_flush
 #define pte_free_tlb pte_free_tlb
@@ -42,14 +41,14 @@ static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
  * tlb_ptep_clear_flush. In both flush modes the tlb for a page cache page
  * has already been freed, so just do free_page_and_swap_cache.
  *
- * s390 doesn't delay rmap removal, so there is nothing encoded in
- * the page pointer.
+ * s390 doesn't delay rmap removal.
  */
 static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
-					  struct encoded_page *page,
-					  int page_size)
+		struct page *page, bool delay_rmap, int page_size)
 {
-	free_page_and_swap_cache(encoded_page_ptr(page));
+	VM_WARN_ON_ONCE(delay_rmap);
+
+	free_page_and_swap_cache(page);
 	return false;
 }
 
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 129a3a759976..2eb7b0d4f5d2 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -260,9 +260,8 @@ struct mmu_gather_batch {
  */
 #define MAX_GATHER_BATCH_COUNT	(10000UL/MAX_GATHER_BATCH)
 
-extern bool __tlb_remove_page_size(struct mmu_gather *tlb,
-				   struct encoded_page *page,
-				   int page_size);
+extern bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
+		bool delay_rmap, int page_size);
 
 #ifdef CONFIG_SMP
 /*
@@ -462,13 +461,14 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 static inline void tlb_remove_page_size(struct mmu_gather *tlb,
 					struct page *page, int page_size)
 {
-	if (__tlb_remove_page_size(tlb, encode_page(page, 0), page_size))
+	if (__tlb_remove_page_size(tlb, page, false, page_size))
 		tlb_flush_mmu(tlb);
 }
 
-static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb, struct page *page, unsigned int flags)
+static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb,
+		struct page *page, bool delay_rmap)
 {
-	return __tlb_remove_page_size(tlb, encode_page(page, flags), PAGE_SIZE);
+	return __tlb_remove_page_size(tlb, page, delay_rmap, PAGE_SIZE);
 }
 
 /* tlb_remove_page
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 604ddf08affe..ac733d81b112 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -116,7 +116,8 @@ static void tlb_batch_list_free(struct mmu_gather *tlb)
 	tlb->local.next = NULL;
 }
 
-bool __tlb_remove_page_size(struct mmu_gather *tlb, struct encoded_page *page, int page_size)
+bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
+		bool delay_rmap, int page_size)
 {
 	struct mmu_gather_batch *batch;
 
@@ -131,13 +132,13 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct encoded_page *page, i
 	 * Add the page and check if we are full. If so
 	 * force a flush.
 	 */
-	batch->encoded_pages[batch->nr++] = page;
+	batch->encoded_pages[batch->nr++] = encode_page(page, delay_rmap);
 	if (batch->nr == batch->max) {
 		if (!tlb_next_batch(tlb))
 			return true;
 		batch = tlb->active;
 	}
-	VM_BUG_ON_PAGE(batch->nr > batch->max, encoded_page_ptr(page));
+	VM_BUG_ON_PAGE(batch->nr > batch->max, page);
 
 	return false;
 }
-- 
2.43.0

