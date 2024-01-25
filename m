Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91F83CCB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 20:42:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxTh6f0U;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MPLDO23S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLWRq5DTSz3vs5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 06:41:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxTh6f0U;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MPLDO23S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLWGQ4hchz3cW2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 06:33:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706211227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3s1Jv/6P5yjhblLF2udczJAUFVvnCKFeQLjRuwj24+c=;
	b=AxTh6f0UfNB2GDR73XtOK9YaQBvbLF2+r5XJSW1GBRxFgpT2k/iZuc+7ILsG7DpGolt2su
	nk5/nH25Ow8cZ8xu6wFVS8l6w3QrRzRQDmt3ATFSW10MF6A+lMmYNwp53O7LKf48fkl7sS
	XzwFYCMFhPwZd2ByFuxotujb0Xedtvo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706211228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3s1Jv/6P5yjhblLF2udczJAUFVvnCKFeQLjRuwj24+c=;
	b=MPLDO23S0AyUXRMdv84kEpS24WYYdNOqLHzLnxVU4INfvpTKPrvbflTlzVaHQQRbPKigm1
	R6/kny3p4HSjbUY4UBJm3xbzu6i4AoMR+35AQezXtKpYysFv4pfxl0yw1eKnr/Lguc4MlW
	dE/kFwZghq+zgpqQw+fTyaMarCx6eIY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-493L1nvTPrqpYIPc57u-fA-1; Thu, 25 Jan 2024 14:33:42 -0500
X-MC-Unique: 493L1nvTPrqpYIPc57u-fA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34A868432A1;
	Thu, 25 Jan 2024 19:33:41 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 074EA492BC9;
	Thu, 25 Jan 2024 19:33:34 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/15] mm/memory: factor out copying the actual PTE in copy_present_pte()
Date: Thu, 25 Jan 2024 20:32:23 +0100
Message-ID: <20240125193227.444072-12-david@redhat.com>
In-Reply-To: <20240125193227.444072-1-david@redhat.com>
References: <20240125193227.444072-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Let's prepare for further changes.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 63 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 7e1f4849463aa..10fc14ff8e49b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -930,6 +930,29 @@ copy_present_page(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
 	return 0;
 }
 
+static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
+		struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
+		pte_t pte, unsigned long addr)
+{
+	struct mm_struct *src_mm = src_vma->vm_mm;
+
+	/* If it's a COW mapping, write protect it both processes. */
+	if (is_cow_mapping(src_vma->vm_flags) && pte_write(pte)) {
+		ptep_set_wrprotect(src_mm, addr, src_pte);
+		pte = pte_wrprotect(pte);
+	}
+
+	/* If it's a shared mapping, mark it clean in the child. */
+	if (src_vma->vm_flags & VM_SHARED)
+		pte = pte_mkclean(pte);
+	pte = pte_mkold(pte);
+
+	if (!userfaultfd_wp(dst_vma))
+		pte = pte_clear_uffd_wp(pte);
+
+	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
+}
+
 /*
  * Copy one pte.  Returns 0 if succeeded, or -EAGAIN if one preallocated page
  * is required to copy this pte.
@@ -939,23 +962,23 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
 		 struct folio **prealloc)
 {
-	struct mm_struct *src_mm = src_vma->vm_mm;
-	unsigned long vm_flags = src_vma->vm_flags;
 	pte_t pte = ptep_get(src_pte);
 	struct page *page;
 	struct folio *folio;
 
 	page = vm_normal_page(src_vma, addr, pte);
-	if (page)
-		folio = page_folio(page);
-	if (page && folio_test_anon(folio)) {
+	if (unlikely(!page))
+		goto copy_pte;
+
+	folio = page_folio(page);
+	folio_get(folio);
+	if (folio_test_anon(folio)) {
 		/*
 		 * If this page may have been pinned by the parent process,
 		 * copy the page immediately for the child so that we'll always
 		 * guarantee the pinned page won't be randomly replaced in the
 		 * future.
 		 */
-		folio_get(folio);
 		if (unlikely(folio_try_dup_anon_rmap_pte(folio, page, src_vma))) {
 			/* Page may be pinned, we have to copy. */
 			folio_put(folio);
@@ -963,34 +986,14 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 						 addr, rss, prealloc, page);
 		}
 		rss[MM_ANONPAGES]++;
-	} else if (page) {
-		folio_get(folio);
+		VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
+	} else {
 		folio_dup_file_rmap_pte(folio, page);
 		rss[mm_counter_file(page)]++;
 	}
 
-	/*
-	 * If it's a COW mapping, write protect it both
-	 * in the parent and the child
-	 */
-	if (is_cow_mapping(vm_flags) && pte_write(pte)) {
-		ptep_set_wrprotect(src_mm, addr, src_pte);
-		pte = pte_wrprotect(pte);
-	}
-	VM_BUG_ON(page && folio_test_anon(folio) && PageAnonExclusive(page));
-
-	/*
-	 * If it's a shared mapping, mark it clean in
-	 * the child
-	 */
-	if (vm_flags & VM_SHARED)
-		pte = pte_mkclean(pte);
-	pte = pte_mkold(pte);
-
-	if (!userfaultfd_wp(dst_vma))
-		pte = pte_clear_uffd_wp(pte);
-
-	set_pte_at(dst_vma->vm_mm, addr, dst_pte, pte);
+copy_pte:
+	__copy_present_pte(dst_vma, src_vma, dst_pte, src_pte, pte, addr);
 	return 0;
 }
 
-- 
2.43.0

