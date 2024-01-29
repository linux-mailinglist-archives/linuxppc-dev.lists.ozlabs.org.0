Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D6840888
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 15:36:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BijjfzFh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BijjfzFh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNrT93F5Hz3dL7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:36:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BijjfzFh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BijjfzFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNrPL0hjFz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:32:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2zNeb5SO5KkYO9vfWjJtlZWbswbqsHyyrv464V13y4=;
	b=BijjfzFhUYZfL3AD1Drz6S7zjtGB/O9vzHL/8CjArzW8QsC/XViU1CGgMhG98d2uKMifOr
	6q+1TtcXsuOd0KzHvPjoAphf1YO1AOHpsvfEgSI4D8aRSl2lDdvKg+NbnHtjR4W+HnI7Xe
	oEetVVftcZfMi8IWZjMvTf6v6bRSbrE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2zNeb5SO5KkYO9vfWjJtlZWbswbqsHyyrv464V13y4=;
	b=BijjfzFhUYZfL3AD1Drz6S7zjtGB/O9vzHL/8CjArzW8QsC/XViU1CGgMhG98d2uKMifOr
	6q+1TtcXsuOd0KzHvPjoAphf1YO1AOHpsvfEgSI4D8aRSl2lDdvKg+NbnHtjR4W+HnI7Xe
	oEetVVftcZfMi8IWZjMvTf6v6bRSbrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-VwTjaewtMEGP-PpguyfRyw-1; Mon, 29 Jan 2024 09:32:48 -0500
X-MC-Unique: VwTjaewtMEGP-PpguyfRyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 796401013767;
	Mon, 29 Jan 2024 14:32:47 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D15AFAD1;
	Mon, 29 Jan 2024 14:32:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/9] mm/memory: factor out zapping folio pte into zap_present_folio_pte()
Date: Mon, 29 Jan 2024 15:32:16 +0100
Message-ID: <20240129143221.263763-5-david@redhat.com>
In-Reply-To: <20240129143221.263763-1-david@redhat.com>
References: <20240129143221.263763-1-david@redhat.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's prepare for further changes by factoring it out into a separate
function.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 53 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 20bc13ab8db2..a2190d7cfa74 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1528,30 +1528,14 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
 	pte_install_uffd_wp_if_needed(vma, addr, pte, pteval);
 }
 
-static inline void zap_present_pte(struct mmu_gather *tlb,
-		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
-		unsigned long addr, struct zap_details *details,
-		int *rss, bool *force_flush, bool *force_break)
+static inline void zap_present_folio_pte(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, struct folio *folio,
+		struct page *page, pte_t *pte, pte_t ptent, unsigned long addr,
+		struct zap_details *details, int *rss, bool *force_flush,
+		bool *force_break)
 {
 	struct mm_struct *mm = tlb->mm;
 	bool delay_rmap = false;
-	struct folio *folio;
-	struct page *page;
-
-	page = vm_normal_page(vma, addr, ptent);
-	if (!page) {
-		/* We don't need up-to-date accessed/dirty bits. */
-		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
-		arch_check_zapped_pte(vma, ptent);
-		tlb_remove_tlb_entry(tlb, pte, addr);
-		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
-		ksm_might_unmap_zero_page(mm, ptent);
-		return;
-	}
-
-	folio = page_folio(page);
-	if (unlikely(!should_zap_folio(details, folio)))
-		return;
 
 	if (!folio_test_anon(folio)) {
 		ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
@@ -1586,6 +1570,33 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
 	}
 }
 
+static inline void zap_present_pte(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
+		unsigned long addr, struct zap_details *details,
+		int *rss, bool *force_flush, bool *force_break)
+{
+	struct mm_struct *mm = tlb->mm;
+	struct folio *folio;
+	struct page *page;
+
+	page = vm_normal_page(vma, addr, ptent);
+	if (!page) {
+		/* We don't need up-to-date accessed/dirty bits. */
+		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
+		arch_check_zapped_pte(vma, ptent);
+		tlb_remove_tlb_entry(tlb, pte, addr);
+		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
+		ksm_might_unmap_zero_page(mm, ptent);
+		return;
+	}
+
+	folio = page_folio(page);
+	if (unlikely(!should_zap_folio(details, folio)))
+		return;
+	zap_present_folio_pte(tlb, vma, folio, page, pte, ptent, addr, details,
+			      rss, force_flush, force_break);
+}
+
 static unsigned long zap_pte_range(struct mmu_gather *tlb,
 				struct vm_area_struct *vma, pmd_t *pmd,
 				unsigned long addr, unsigned long end,
-- 
2.43.0

