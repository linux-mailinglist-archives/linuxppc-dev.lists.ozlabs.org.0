Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B76840876
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 15:34:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CMKaI9S2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fBHzLsIM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNrRN2znYz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CMKaI9S2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fBHzLsIM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNrPB2s44z3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:32:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNlnKqTU8a/1Fu37QrFx8MEnv7tH60nNAECNkKLkAAs=;
	b=CMKaI9S2JZVGnzzHqxpKG0FJU21X44TNJZ3K/OpEsT3h0YDugIn2ui+Ykp09v3SbEBfH9x
	rxDM87LeQEG1bBP4umJ1yjCA3Vl93OcSmWoNwKJxsSzUW9SECm0KsIpiwxv5fjCCIjLoPS
	mbiwGEL6W1zpv9zRmP98e213WiWuU54=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNlnKqTU8a/1Fu37QrFx8MEnv7tH60nNAECNkKLkAAs=;
	b=fBHzLsIMgNu3mOQX5QdsSJ92GotfTRJnQnEEcJjoxGFmfcdXZPf31mmZP5J3/mW8gUtr/S
	kT1p9BfQHtHmn4GmEZWNxt6Fgi+8GquNRkjwCU/aoHVBGKSsR6n+OCCBWUMWzZf9s2E2RZ
	mxCmV1hIkGXuCq8ohM3dJAyEIO78C+M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-unK-9W-5NjSJSLj6qcQ8jg-1; Mon,
 29 Jan 2024 09:32:41 -0500
X-MC-Unique: unK-9W-5NjSJSLj6qcQ8jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 902141C05137;
	Mon, 29 Jan 2024 14:32:37 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20796AD1;
	Mon, 29 Jan 2024 14:32:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/9] mm/memory: handle !page case in zap_present_pte() separately
Date: Mon, 29 Jan 2024 15:32:14 +0100
Message-ID: <20240129143221.263763-3-david@redhat.com>
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

We don't need uptodate accessed/dirty bits, so in theory we could
replace ptep_get_and_clear_full() by an optimized ptep_clear_full()
function. Let's rely on the provided pte.

Further, there is no scenario where we would have to insert uffd-wp
markers when zapping something that is not a normal page (i.e., zeropage).
Add a sanity check to make sure this remains true.

should_zap_folio() no longer has to handle NULL pointers. This change
replaces 2/3 "!page/!folio" checks by a single "!page" one.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 50a6c79c78fc..69502cdc0a7d 100644
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
@@ -1543,19 +1539,23 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
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

