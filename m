Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 045348182DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 09:01:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OmeSxnUw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OmeSxnUw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvTfh4y9wz3vmG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 19:01:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OmeSxnUw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OmeSxnUw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvTYh37Pxz3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 18:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyBT0nqGKaQsvTTr5mCIJmcBkZIho6YT9IXUJI5Nmzw=;
	b=OmeSxnUwWoa6tJ92TEOtR66UT11ctZnKhQExLfg5A/gxJiEJyQXNN9esZEndlyUOV1QssQ
	FDfhQRtavalAv+kVai8dgU++/wN8+fOhJURpiHAgFywr7UWQnM4bvY0nn8Q+2EzpcOXrZV
	09ouaY5IqGNgSE3ZIuDkV8X89tVNuoA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyBT0nqGKaQsvTTr5mCIJmcBkZIho6YT9IXUJI5Nmzw=;
	b=OmeSxnUwWoa6tJ92TEOtR66UT11ctZnKhQExLfg5A/gxJiEJyQXNN9esZEndlyUOV1QssQ
	FDfhQRtavalAv+kVai8dgU++/wN8+fOhJURpiHAgFywr7UWQnM4bvY0nn8Q+2EzpcOXrZV
	09ouaY5IqGNgSE3ZIuDkV8X89tVNuoA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-L9GGlqWjOR6XdFWT616TOg-1; Tue,
 19 Dec 2023 02:57:06 -0500
X-MC-Unique: L9GGlqWjOR6XdFWT616TOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4B5F3813F20;
	Tue, 19 Dec 2023 07:57:04 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAA8A2026D66;
	Tue, 19 Dec 2023 07:56:53 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
Date: Tue, 19 Dec 2023 15:55:31 +0800
Message-ID: <20231219075538.414708-7-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Hugepd format for GUP is only used in PowerPC with hugetlbfs.  There are
some kernel usage of hugepd (can refer to hugepd_populate_kernel() for
PPC_8XX), however those pages are not candidates for GUP.

Commit a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
file-backed mappings") added a check to fail gup-fast if there's potential
risk of violating GUP over writeback file systems.  That should never apply
to hugepd.  Considering that hugepd is an old format (and even
software-only), there's no plan to extend hugepd into other file typed
memories that is prone to the same issue.

Drop that check, not only because it'll never be true for hugepd per any
known plan, but also it paves way for reusing the function outside
fast-gup.

To make sure we'll still remember this issue just in case hugepd will be
extended to support non-hugetlbfs memories, add a rich comment above
gup_huge_pd(), explaining the issue with proper references.

Cc: Christoph Hellwig <hch@infradead.org>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index efc9847e58fb..bb5b7134f10b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2820,11 +2820,6 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
-	if (!folio_fast_pin_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
 	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
@@ -2835,6 +2830,14 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	return 1;
 }
 
+/*
+ * NOTE: currently GUP for a hugepd is only possible on hugetlbfs file
+ * systems on Power, which does not have issue with folio writeback against
+ * GUP updates.  When hugepd will be extended to support non-hugetlbfs or
+ * even anonymous memory, we need to do extra check as what we do with most
+ * of the other folios. See writable_file_mapping_allowed() and
+ * folio_fast_pin_allowed() for more information.
+ */
 static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 		unsigned int pdshift, unsigned long end, unsigned int flags,
 		struct page **pages, int *nr)
-- 
2.41.0

