Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5D822A35
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 10:21:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c21Pn/6/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=As1BNbly;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4kjd17Vdz3dSL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 20:21:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c21Pn/6/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=As1BNbly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4kbx5lMnz3cVr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 20:16:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w96HtEkzdknb+h0JjsHCRRCM9jOy1Kg+MIEx5UNvA1Y=;
	b=c21Pn/6/nCBSDLyAT3izS9wWdvVfGGVOM5wGNqk95M0KZWcjtTVKbYWRSwmsvWj/j064v4
	msXf4b4nv/rn8+z4GJbitHGjz8vYdKnELCNVBbUiuTn4RvUc8BXb2uz6k10LN1vdNZdKWO
	xFSEnTu2zlVET6OnmQsugQB7+sAqCFA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w96HtEkzdknb+h0JjsHCRRCM9jOy1Kg+MIEx5UNvA1Y=;
	b=As1BNblyWzhs7eq8N01vQIMjf1/pG5HujuJKBRaxnApjSM2JLQxS1vkPm4gDYa3IJcygoM
	A/ImeL8P2lIx4wxF1r0aLahS1a+MtNG6KDHcMc17QEP6qqBQqa3BbZXAzqUr+mdySh+dLN
	PCCmPZT2Vh8zlr8N5MM8Z8/QyGvT9zA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277--A0wl26XO_yPNePIDNUfuA-1; Wed,
 03 Jan 2024 04:16:06 -0500
X-MC-Unique: -A0wl26XO_yPNePIDNUfuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A993806714;
	Wed,  3 Jan 2024 09:16:04 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29D1F492BE6;
	Wed,  3 Jan 2024 09:15:52 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] mm/gup: Refactor record_subpages() to find 1st small page
Date: Wed,  3 Jan 2024 17:14:17 +0800
Message-ID: <20240103091423.400294-8-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
References: <20240103091423.400294-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

All the fast-gup functions take a tail page to operate, always need to do
page mask calculations before feeding that into record_subpages().

Merge that logic into record_subpages(), so that it will do the nth_page()
calculation.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index fa93e14b7fca..3813aad79c4a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2767,13 +2767,16 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
 }
 #endif
 
-static int record_subpages(struct page *page, unsigned long addr,
-			   unsigned long end, struct page **pages)
+static int record_subpages(struct page *page, unsigned long sz,
+			   unsigned long addr, unsigned long end,
+			   struct page **pages)
 {
+	struct page *start_page;
 	int nr;
 
+	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
 	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(page, nr);
+		pages[nr] = nth_page(start_page, nr);
 
 	return nr;
 }
@@ -2808,8 +2811,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2882,8 +2885,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pmd_page(orig);
+	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2926,8 +2929,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pud_page(orig), (addr & ~PUD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pud_page(orig);
+	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2966,8 +2969,8 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 
 	BUILD_BUG_ON(pgd_devmap(orig));
 
-	page = nth_page(pgd_page(orig), (addr & ~PGDIR_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pgd_page(orig);
+	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
-- 
2.41.0

