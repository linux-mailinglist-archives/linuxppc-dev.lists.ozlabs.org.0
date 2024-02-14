Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B241855435
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 21:46:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYbXoIGO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYbXoIGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZqwn2hmFz3dSv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 07:46:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYbXoIGO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYbXoIGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZqvD17SGz3bcP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 07:44:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707943493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEQuQbE8PusGeIN6wyahI5tWOdzdv7mIipcs9sgG+zs=;
	b=UYbXoIGOHu4/NtyGgwPBpQ+TNLgkCfMqa7V99WYoJkBBakyM9JIayJe8ZsdbGuVXVspL8D
	S+ucoKQiJfAR4R+eUb6k5ypniVKyewStTItPItrp0DgaQa2iEYu9yt7JxXhNexkR2uUWm0
	eg2Qp3lCmlad4Jz6YAaWnv2aFqo39Zw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707943493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEQuQbE8PusGeIN6wyahI5tWOdzdv7mIipcs9sgG+zs=;
	b=UYbXoIGOHu4/NtyGgwPBpQ+TNLgkCfMqa7V99WYoJkBBakyM9JIayJe8ZsdbGuVXVspL8D
	S+ucoKQiJfAR4R+eUb6k5ypniVKyewStTItPItrp0DgaQa2iEYu9yt7JxXhNexkR2uUWm0
	eg2Qp3lCmlad4Jz6YAaWnv2aFqo39Zw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373--0kZEuV3Pfig40WvEuXQ9Q-1; Wed,
 14 Feb 2024 15:44:46 -0500
X-MC-Unique: -0kZEuV3Pfig40WvEuXQ9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05DB528B6A1E;
	Wed, 14 Feb 2024 20:44:45 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.174])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C51A1C066A9;
	Wed, 14 Feb 2024 20:44:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] mm/memory: factor out zapping of present pte into zap_present_pte()
Date: Wed, 14 Feb 2024 21:44:26 +0100
Message-ID: <20240214204435.167852-2-david@redhat.com>
In-Reply-To: <20240214204435.167852-1-david@redhat.com>
References: <20240214204435.167852-1-david@redhat.com>
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

Let's prepare for further changes by factoring out processing of present
PTEs.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 94 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 7c3ca41a7610..5b0dc33133a6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1532,13 +1532,61 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
 	pte_install_uffd_wp_if_needed(vma, addr, pte, pteval);
 }
 
+static inline void zap_present_pte(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
+		unsigned long addr, struct zap_details *details,
+		int *rss, bool *force_flush, bool *force_break)
+{
+	struct mm_struct *mm = tlb->mm;
+	struct folio *folio = NULL;
+	bool delay_rmap = false;
+	struct page *page;
+
+	page = vm_normal_page(vma, addr, ptent);
+	if (page)
+		folio = page_folio(page);
+
+	if (unlikely(!should_zap_folio(details, folio)))
+		return;
+	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
+	arch_check_zapped_pte(vma, ptent);
+	tlb_remove_tlb_entry(tlb, pte, addr);
+	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
+	if (unlikely(!page)) {
+		ksm_might_unmap_zero_page(mm, ptent);
+		return;
+	}
+
+	if (!folio_test_anon(folio)) {
+		if (pte_dirty(ptent)) {
+			folio_mark_dirty(folio);
+			if (tlb_delay_rmap(tlb)) {
+				delay_rmap = true;
+				*force_flush = true;
+			}
+		}
+		if (pte_young(ptent) && likely(vma_has_recency(vma)))
+			folio_mark_accessed(folio);
+	}
+	rss[mm_counter(folio)]--;
+	if (!delay_rmap) {
+		folio_remove_rmap_pte(folio, page, vma);
+		if (unlikely(page_mapcount(page) < 0))
+			print_bad_pte(vma, addr, ptent, page);
+	}
+	if (unlikely(__tlb_remove_page(tlb, page, delay_rmap))) {
+		*force_flush = true;
+		*force_break = true;
+	}
+}
+
 static unsigned long zap_pte_range(struct mmu_gather *tlb,
 				struct vm_area_struct *vma, pmd_t *pmd,
 				unsigned long addr, unsigned long end,
 				struct zap_details *details)
 {
+	bool force_flush = false, force_break = false;
 	struct mm_struct *mm = tlb->mm;
-	int force_flush = 0;
 	int rss[NR_MM_COUNTERS];
 	spinlock_t *ptl;
 	pte_t *start_pte;
@@ -1555,7 +1603,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 	arch_enter_lazy_mmu_mode();
 	do {
 		pte_t ptent = ptep_get(pte);
-		struct folio *folio = NULL;
+		struct folio *folio;
 		struct page *page;
 
 		if (pte_none(ptent))
@@ -1565,45 +1613,9 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 			break;
 
 		if (pte_present(ptent)) {
-			unsigned int delay_rmap;
-
-			page = vm_normal_page(vma, addr, ptent);
-			if (page)
-				folio = page_folio(page);
-
-			if (unlikely(!should_zap_folio(details, folio)))
-				continue;
-			ptent = ptep_get_and_clear_full(mm, addr, pte,
-							tlb->fullmm);
-			arch_check_zapped_pte(vma, ptent);
-			tlb_remove_tlb_entry(tlb, pte, addr);
-			zap_install_uffd_wp_if_needed(vma, addr, pte, details,
-						      ptent);
-			if (unlikely(!page)) {
-				ksm_might_unmap_zero_page(mm, ptent);
-				continue;
-			}
-
-			delay_rmap = 0;
-			if (!folio_test_anon(folio)) {
-				if (pte_dirty(ptent)) {
-					folio_mark_dirty(folio);
-					if (tlb_delay_rmap(tlb)) {
-						delay_rmap = 1;
-						force_flush = 1;
-					}
-				}
-				if (pte_young(ptent) && likely(vma_has_recency(vma)))
-					folio_mark_accessed(folio);
-			}
-			rss[mm_counter(folio)]--;
-			if (!delay_rmap) {
-				folio_remove_rmap_pte(folio, page, vma);
-				if (unlikely(page_mapcount(page) < 0))
-					print_bad_pte(vma, addr, ptent, page);
-			}
-			if (unlikely(__tlb_remove_page(tlb, page, delay_rmap))) {
-				force_flush = 1;
+			zap_present_pte(tlb, vma, pte, ptent, addr, details,
+					rss, &force_flush, &force_break);
+			if (unlikely(force_break)) {
 				addr += PAGE_SIZE;
 				break;
 			}
-- 
2.43.0

