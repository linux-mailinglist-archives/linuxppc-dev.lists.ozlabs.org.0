Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3384087E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 15:35:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJh2Shmx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJh2Shmx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNrSC02jwz3cZq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:35:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJh2Shmx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJh2Shmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNrPF4qs4z3bsr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:32:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkSqLVnz5/2y8MLWUf6UFgTHMoYCjTvN5uvEMNfOCyQ=;
	b=OJh2Shmx2U8Ejx2Oqr5Eihdzs/VG8dln4YzNP7+gzND90vUObDov0FJzfZ9A2AhE+l3UJ7
	WHG+g4xow3Zmw3txXhCXrvkH5KamXCyjjjbnQhdY9p4WXM5CtI4HSzMaIqGE4boYu7pl9b
	HfSQ/DahZCiPklyWTH9v9vtMi9h5qZM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkSqLVnz5/2y8MLWUf6UFgTHMoYCjTvN5uvEMNfOCyQ=;
	b=OJh2Shmx2U8Ejx2Oqr5Eihdzs/VG8dln4YzNP7+gzND90vUObDov0FJzfZ9A2AhE+l3UJ7
	WHG+g4xow3Zmw3txXhCXrvkH5KamXCyjjjbnQhdY9p4WXM5CtI4HSzMaIqGE4boYu7pl9b
	HfSQ/DahZCiPklyWTH9v9vtMi9h5qZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-tQCqrTzqPz-8PYoPDfxKqg-1; Mon, 29 Jan 2024 09:32:44 -0500
X-MC-Unique: tQCqrTzqPz-8PYoPDfxKqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BAC885A599;
	Mon, 29 Jan 2024 14:32:42 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCEB7AD1;
	Mon, 29 Jan 2024 14:32:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/9] mm/memory: further separate anon and pagecache folio handling in zap_present_pte()
Date: Mon, 29 Jan 2024 15:32:15 +0100
Message-ID: <20240129143221.263763-4-david@redhat.com>
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

We don't need up-to-date accessed-dirty information for anon folios and can
simply work with the ptent we already have. Also, we know the RSS counter
we want to update.

We can safely move arch_check_zapped_pte() + tlb_remove_tlb_entry() +
zap_install_uffd_wp_if_needed() after updating the folio and RSS.

While at it, only call zap_install_uffd_wp_if_needed() if there is even
any chance that pte_install_uffd_wp_if_needed() would do *something*.
That is, just don't bother if uffd-wp does not apply.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 69502cdc0a7d..20bc13ab8db2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1552,12 +1552,9 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
 	folio = page_folio(page);
 	if (unlikely(!should_zap_folio(details, folio)))
 		return;
-	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
-	arch_check_zapped_pte(vma, ptent);
-	tlb_remove_tlb_entry(tlb, pte, addr);
-	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
 
 	if (!folio_test_anon(folio)) {
+		ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
 		if (pte_dirty(ptent)) {
 			folio_mark_dirty(folio);
 			if (tlb_delay_rmap(tlb)) {
@@ -1567,8 +1564,17 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
 		}
 		if (pte_young(ptent) && likely(vma_has_recency(vma)))
 			folio_mark_accessed(folio);
+		rss[mm_counter(folio)]--;
+	} else {
+		/* We don't need up-to-date accessed/dirty bits. */
+		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
+		rss[MM_ANONPAGES]--;
 	}
-	rss[mm_counter(folio)]--;
+	arch_check_zapped_pte(vma, ptent);
+	tlb_remove_tlb_entry(tlb, pte, addr);
+	if (unlikely(userfaultfd_pte_wp(vma, ptent)))
+		zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
+
 	if (!delay_rmap) {
 		folio_remove_rmap_pte(folio, page, vma);
 		if (unlikely(page_mapcount(page) < 0))
-- 
2.43.0

