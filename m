Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AD88E903
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:28:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQkwKCQv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LHgqFz9z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vtr08QMz3vyD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:28:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQkwKCQv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LHgqFz9z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnR5CMBz3vYh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=;
	b=jQkwKCQvi91fO366DTyZfdzF2LV0SfMReMM0Oy0gNYmzg9TA/clT56daIRjuPcjS9Afq0o
	e/7jrMdR7U0qcRw5O5K3fv3GOzWnSkXUyfu7Hjxb8hFTMkyr6NYSCUbMKSEAOYmYRDUein
	DgwzyFvN5RAdxz6DHom9YERm3h5gdrM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=;
	b=LHgqFz9zEVBu/6+I8hCLlFgB8uhy/ZDU3RzWRSwtgdObl52frDgtNOCXWEpa+Vu7B78mCI
	/UmRh/MF1pNtHAZ/MY7zOP/7PtQPIynlG9mnLokyhoqzTTWS14uHR8uhle15thJjwVtHK9
	XfST/JJg3ef6FgAHfJNzd3SSZ/kEyr4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-0jyF2qHrOtyAG06hQNqcZg-1; Wed, 27 Mar 2024 11:23:49 -0400
X-MC-Unique: 0jyF2qHrOtyAG06hQNqcZg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-690c19ee50bso2422046d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553029; x=1712157829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=;
        b=DAAOxJUGbhsAPPfJVRNPSvv3h/dVEgfGgykAJoayMTvOaqpywVwf5OgTHXtyKof9PK
         RKb1RKKIB5SMY3ltl9JwYu7A6HjmqzBnt6XH/BlFT7S8xyt4qKmVgTrgOWHrFM2hTT3A
         JrpB1OWFeFJ7eTOs3CJZsI+hjNIAfs/wIhdZYqFq8UOXOeyYH/I5YTTTzLHit4o4HRhA
         QYkYpTcfg4+63M08Q6kiK2S4GAE7Zm9+31h9rVnnk4Z6AepK2k8fmzOqQQGt44Y8jNQB
         LwJIeuO/YN0nDRE9vXzHOga2F5fSWGtEHKRzlmOOgcxb+MjSebLZ2pomN0IrflCQW36D
         Rm+w==
X-Forwarded-Encrypted: i=1; AJvYcCVJa9x+G0Tg0RGpWugsK2BYu4bgN74xv3desQ8+XWsKPmTpDj9Oc6UDA8LVXDngkqpKfh8nup5mL2M65bvnNFDAth6f1fMLfh2XKl+pAw==
X-Gm-Message-State: AOJu0Yw1etkCHaAubn26N5sJjmnKV86fOMByyZy8zsLTYatlLUSVca8A
	O0d2WnQDSAqQv7gIF2UHSCn7IKxEn90MU44Z3szwTD1dS9yzmBi39UraB1xOdLbz4+HfK8eJ8Zg
	EUykGNwDmkrnhhVBpbkbOQgRmodTgZMl+hxbsItnQllAbC8sgCVmIZKUdXMEy+N8=
X-Received: by 2002:a05:6214:3a01:b0:696:81b8:a462 with SMTP id nw1-20020a0562143a0100b0069681b8a462mr13234455qvb.0.1711553028771;
        Wed, 27 Mar 2024 08:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaIIFSwEPr6utJECaPIJXCgmHTkHVcLUQEzRJpciko/79sjH/yOlRx7KIof08fJkHOKzrhqQ==
X-Received: by 2002:a05:6214:3a01:b0:696:81b8:a462 with SMTP id nw1-20020a0562143a0100b0069681b8a462mr13234423qvb.0.1711553028305;
        Wed, 27 Mar 2024 08:23:48 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:47 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
Date: Wed, 27 Mar 2024 11:23:25 -0400
Message-ID: <20240327152332.950956-7-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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
index e7510b6ce765..db35b056fc9a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2832,11 +2832,6 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
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
@@ -2847,6 +2842,14 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
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
2.44.0

