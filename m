Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC1886313
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:12:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1RrXhhR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gSNH0nNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V107n21V9z3vjY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1RrXhhR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gSNH0nNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102r3wWRz3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUPAT0rXQJh3Nc2mzYzsdwstyixoWF7iCZ8XsZkm6u0=;
	b=M1RrXhhRspIvZd+9r5uYKzQTvq6cv6BXIuBBSvlblcR2Wju6znfH3x1j97oO3y9Cp2snab
	gSA8mzWZ74gbVx4BfU3AIhB6G0RBrgp1OcP3Og1uvCqcVf+eV+/i6ZP4TKg7e4EBUetifi
	jOSQ3PpRQ4xYQ5guZZgeypFcZjPdguk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUPAT0rXQJh3Nc2mzYzsdwstyixoWF7iCZ8XsZkm6u0=;
	b=gSNH0nNQghFhUrjsNx5KLceutC2E4e+B3lPDqaguSsPvf6qOfY/7eplYWqNQg/IS4iqUMk
	+F2Q+HCleQywBrOWQisjKrAk3ZaXjCHdTsh86IUScym9DWdxNfNQxDS4kjGI1JxFrZWgN3
	4ANmCaHRpVimtZCXoK8HbHFQGWD6KFg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-fwJwZydTM8quGjT1mQZ-Pw-1; Thu, 21 Mar 2024 18:08:15 -0400
X-MC-Unique: fwJwZydTM8quGjT1mQZ-Pw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78a364064b7so14873385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058895; x=1711663695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUPAT0rXQJh3Nc2mzYzsdwstyixoWF7iCZ8XsZkm6u0=;
        b=ApWJ/9h+umoAtTwjnCF/etrsiv8cCaSQMfESXNefaWfq63m7opTG9lOhlqS49h4OmM
         pGemTLwS8A1ncDpYzildxvZih7EULqIPuPcwdDYACW7K5FpmJNGr5IOBRkwzdlDIXT0v
         DWSerccgcgq3EVRy6vURZbd9fqA+AbrRcKQDcpzN7qmYN3w96Xa9UrsM80gNUUK65IlF
         JZJoOMepPBya7faiSxaUEyOTDHxq5I/caPQqoADp/8yFrvk6rQPvT6FBAL+awHHKJkTP
         r+m2KAsN5JvYADA6dt3qZh6A4H2H7vBXJRWBYZV2/2A4t6FNlypsphHjTTuKOU9D6+DL
         mJAw==
X-Gm-Message-State: AOJu0Ywcntr1IgZpYHZ+20gWK80yq2PXNi8MQ2uzM12UKVw6ePk19s1E
	88/dbDqw8NcfC8mI784Kq8ZBa5LTBE6uarFJ0rV2Ec+B1TnqtBEzld+zVrldB0dn7QM9GHfSi9+
	aTNQShJXrlgiUpgkCKxFpfhIIMUgibydJ18BeSnXR+ISuVWrFT98MWBbne/TkUTs=
X-Received: by 2002:a05:6214:3f89:b0:691:2524:2d87 with SMTP id ow9-20020a0562143f8900b0069125242d87mr214737qvb.2.1711058895196;
        Thu, 21 Mar 2024 15:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuIdayMB3K1ezoBSvCD0gJVl53LosR8J8AUw6cJS5L0fxLggs0ufmC9b8hoGFmk2jAJqKnIA==
X-Received: by 2002:a05:6214:3f89:b0:691:2524:2d87 with SMTP id ow9-20020a0562143f8900b0069125242d87mr214690qvb.2.1711058894780;
        Thu, 21 Mar 2024 15:08:14 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:14 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
Date: Thu, 21 Mar 2024 18:07:55 -0400
Message-ID: <20240321220802.679544-6-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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
index 484a7c70d121..9127ec5515ac 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2831,11 +2831,6 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
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
@@ -2846,6 +2841,14 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
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

