Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17084FFA2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 23:17:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8e7Yd5H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8e7Yd5H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWpBh3cJ8z3dKX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 09:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8e7Yd5H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h8e7Yd5H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWp8C0LYxz3cTZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 09:15:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707516936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqQsnr9EFuS72Lg9egurC5IFPM5MYMM8dNEJpcWm/gk=;
	b=h8e7Yd5H4LyqrqmdweSTfBCdsK+ciZ5BWd9jC4BKJAC2zmc/eUP7OPm/iLCNFn2G48EmLZ
	5iIqhAUAc5MjbwBW0sGFXOpfT3OgJSmNMMerFQgoC5Uni04OcxgjuHMDRUdidoNvGLcCya
	sonXlq1XzlwPmy0haWgs527PcFZGKRA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707516936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqQsnr9EFuS72Lg9egurC5IFPM5MYMM8dNEJpcWm/gk=;
	b=h8e7Yd5H4LyqrqmdweSTfBCdsK+ciZ5BWd9jC4BKJAC2zmc/eUP7OPm/iLCNFn2G48EmLZ
	5iIqhAUAc5MjbwBW0sGFXOpfT3OgJSmNMMerFQgoC5Uni04OcxgjuHMDRUdidoNvGLcCya
	sonXlq1XzlwPmy0haWgs527PcFZGKRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-vWqlBEopN_iaGbQkhty9OQ-1; Fri, 09 Feb 2024 17:15:28 -0500
X-MC-Unique: vWqlBEopN_iaGbQkhty9OQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6404811E81;
	Fri,  9 Feb 2024 22:15:26 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F06291C14B04;
	Fri,  9 Feb 2024 22:15:20 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] mm/memory: handle !page case in zap_present_pte() separately
Date: Fri,  9 Feb 2024 23:15:01 +0100
Message-ID: <20240209221509.585251-3-david@redhat.com>
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

We don't need uptodate accessed/dirty bits, so in theory we could
replace ptep_get_and_clear_full() by an optimized ptep_clear_full()
function. Let's rely on the provided pte.

Further, there is no scenario where we would have to insert uffd-wp
markers when zapping something that is not a normal page (i.e., zeropage).
Add a sanity check to make sure this remains true.

should_zap_folio() no longer has to handle NULL pointers. This change
replaces 2/3 "!page/!folio" checks by a single "!page" one.

Note that arch_check_zapped_pte() on x86-64 checks the HW-dirty bit to
detect shadow stack entries. But for shadow stack entries, the HW dirty
bit (in combination with non-writable PTEs) is set by software. So for the
arch_check_zapped_pte() check, we don't have to sync against HW setting
the HW dirty bit concurrently, it is always set.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 5b0dc33133a6..4da6923709b2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1497,10 +1497,6 @@ static inline bool should_zap_folio(struct zap_details *details,
 	if (should_zap_cows(details))
 		return true;
 
-	/* E.g. the caller passes NULL for the case of a zero folio */
-	if (!folio)
-		return true;
-
 	/* Otherwise we should only zap non-anon folios */
 	return !folio_test_anon(folio);
 }
@@ -1538,24 +1534,28 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
 		int *rss, bool *force_flush, bool *force_break)
 {
 	struct mm_struct *mm = tlb->mm;
-	struct folio *folio = NULL;
 	bool delay_rmap = false;
+	struct folio *folio;
 	struct page *page;
 
 	page = vm_normal_page(vma, addr, ptent);
-	if (page)
-		folio = page_folio(page);
+	if (!page) {
+		/* We don't need up-to-date accessed/dirty bits. */
+		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
+		arch_check_zapped_pte(vma, ptent);
+		tlb_remove_tlb_entry(tlb, pte, addr);
+		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
+		ksm_might_unmap_zero_page(mm, ptent);
+		return;
+	}
 
+	folio = page_folio(page);
 	if (unlikely(!should_zap_folio(details, folio)))
 		return;
 	ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
 	arch_check_zapped_pte(vma, ptent);
 	tlb_remove_tlb_entry(tlb, pte, addr);
 	zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
-	if (unlikely(!page)) {
-		ksm_might_unmap_zero_page(mm, ptent);
-		return;
-	}
 
 	if (!folio_test_anon(folio)) {
 		if (pte_dirty(ptent)) {
-- 
2.43.0

