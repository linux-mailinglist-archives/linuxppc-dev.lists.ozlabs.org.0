Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0E62B89A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBzsB5Xmcz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:33:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8chgi84;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8chgi84;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8chgi84;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8chgi84;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzlh6Nh0z3cJv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:28:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xieaaG4AIgXK7pR548ohi1s1MYoDoPLtryAR7VPuVQ=;
	b=L8chgi84Y8ngiVbqWU0K6xugit0tOvoQjZHIre3I5/eSuSCTrcibCMLKyirUWEKKhcKhFa
	TrZ/5wb4T6MjsdIHthmrA6xk4arxwlBKRmZqcD9bd8E26K/x7MQzymNRRbacRR2R6SOTC2
	duL+C+HnhWooFQPCNd3Rmf7G3YQilY8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xieaaG4AIgXK7pR548ohi1s1MYoDoPLtryAR7VPuVQ=;
	b=L8chgi84Y8ngiVbqWU0K6xugit0tOvoQjZHIre3I5/eSuSCTrcibCMLKyirUWEKKhcKhFa
	TrZ/5wb4T6MjsdIHthmrA6xk4arxwlBKRmZqcD9bd8E26K/x7MQzymNRRbacRR2R6SOTC2
	duL+C+HnhWooFQPCNd3Rmf7G3YQilY8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-9BEEcW7rOKydj62ElCAQ0Q-1; Wed, 16 Nov 2022 05:28:10 -0500
X-MC-Unique: 9BEEcW7rOKydj62ElCAQ0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C77003817A7A;
	Wed, 16 Nov 2022 10:28:08 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 183A12028E8F;
	Wed, 16 Nov 2022 10:28:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 06/20] mm: rework handling in do_wp_page() based on private vs. shared mappings
Date: Wed, 16 Nov 2022 11:26:45 +0100
Message-Id: <20221116102659.70287-7-david@redhat.com>
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>
 , linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We want to extent FAULT_FLAG_UNSHARE support to anything mapped into a
COW mapping (pagecache page, zeropage, PFN, ...), not just anonymous pages.
Let's prepare for that by handling shared mappings first such that we can
handle private mappings last.

While at it, use folio-based functions instead of page-based functions
where we touch the code either way.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index c4fa378ec2a0..c35e6cd32b6a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3342,7 +3342,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 {
 	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
 	struct vm_area_struct *vma = vmf->vma;
-	struct folio *folio;
+	struct folio *folio = NULL;
 
 	if (likely(!unshare)) {
 		if (userfaultfd_pte_wp(vma, *vmf->pte)) {
@@ -3360,13 +3360,12 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 	}
 
 	vmf->page = vm_normal_page(vma, vmf->address, vmf->orig_pte);
-	if (!vmf->page) {
-		if (unlikely(unshare)) {
-			/* No anonymous page -> nothing to do. */
-			pte_unmap_unlock(vmf->pte, vmf->ptl);
-			return 0;
-		}
 
+	/*
+	 * Shared mapping: we are guaranteed to have VM_WRITE and
+	 * FAULT_FLAG_WRITE set at this point.
+	 */
+	if (vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
 		/*
 		 * VM_MIXEDMAP !pfn_valid() case, or VM_SOFTDIRTY clear on a
 		 * VM_PFNMAP VMA.
@@ -3374,20 +3373,19 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 		 * We should not cow pages in a shared writeable mapping.
 		 * Just mark the pages writable and/or call ops->pfn_mkwrite.
 		 */
-		if ((vma->vm_flags & (VM_WRITE|VM_SHARED)) ==
-				     (VM_WRITE|VM_SHARED))
+		if (!vmf->page)
 			return wp_pfn_shared(vmf);
-
-		pte_unmap_unlock(vmf->pte, vmf->ptl);
-		return wp_page_copy(vmf);
+		return wp_page_shared(vmf);
 	}
 
+	if (vmf->page)
+		folio = page_folio(vmf->page);
+
 	/*
-	 * Take out anonymous pages first, anonymous shared vmas are
-	 * not dirty accountable.
+	 * Private mapping: create an exclusive anonymous page copy if reuse
+	 * is impossible. We might miss VM_WRITE for FOLL_FORCE handling.
 	 */
-	folio = page_folio(vmf->page);
-	if (folio_test_anon(folio)) {
+	if (folio && folio_test_anon(folio)) {
 		/*
 		 * If the page is exclusive to this process we must reuse the
 		 * page without further checks.
@@ -3438,19 +3436,17 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 		/* No anonymous page -> nothing to do. */
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
 		return 0;
-	} else if (unlikely((vma->vm_flags & (VM_WRITE|VM_SHARED)) ==
-					(VM_WRITE|VM_SHARED))) {
-		return wp_page_shared(vmf);
 	}
 copy:
 	/*
 	 * Ok, we need to copy. Oh, well..
 	 */
-	get_page(vmf->page);
+	if (folio)
+		folio_get(folio);
 
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
 #ifdef CONFIG_KSM
-	if (PageKsm(vmf->page))
+	if (folio && folio_test_ksm(folio))
 		count_vm_event(COW_KSM);
 #endif
 	return wp_page_copy(vmf);
-- 
2.38.1

