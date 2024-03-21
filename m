Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A61886316
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:13:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gq0YrZaZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gq0YrZaZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V108b6282z3vlh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:13:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gq0YrZaZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gq0YrZaZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102t4MK8z3dBn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dI3BkO2nCtQEnBDt3PLoa+NL/Gig0J3ZsiByK6YiGEU=;
	b=Gq0YrZaZJDba3/oiLHQ5k0QmoQm24cQ+2uRUbyM7sQ1AQDcS7Dy2L/3pkR7wVjlqpxGD3z
	mcAbI1PWYLUrjrMR4xJKymVdTk2i//qVxoi6PSNXD+zK4MGzMyJGLIS+lin8FeDhv0Hmcl
	3dxdDIBhC+tRORZawc/LBLVRrZXzBG8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dI3BkO2nCtQEnBDt3PLoa+NL/Gig0J3ZsiByK6YiGEU=;
	b=Gq0YrZaZJDba3/oiLHQ5k0QmoQm24cQ+2uRUbyM7sQ1AQDcS7Dy2L/3pkR7wVjlqpxGD3z
	mcAbI1PWYLUrjrMR4xJKymVdTk2i//qVxoi6PSNXD+zK4MGzMyJGLIS+lin8FeDhv0Hmcl
	3dxdDIBhC+tRORZawc/LBLVRrZXzBG8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-VVGXq9lNPFyIhDamVp6vTw-1; Thu, 21 Mar 2024 18:08:18 -0400
X-MC-Unique: VVGXq9lNPFyIhDamVp6vTw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78a0e8a60f8so22227285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058897; x=1711663697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI3BkO2nCtQEnBDt3PLoa+NL/Gig0J3ZsiByK6YiGEU=;
        b=mpFvQ8H+0jXUPvrIsQKRpbAbxpTe2/CjZxLTQbbPKt3NnnDdrf7wKzSt+yYt40cS9U
         8Z5/cjmrRLtF4Hf7IzmhZzdeOFlAXANpMmQlUruWqKLg7Vl+7/Ey04w6PAKAxHfowpOS
         sEmSN5JECuw7BLecc1C6/YsCK8I4/G9jCzAWKlh+zACuzchwaOzsZWQErIdImeWYLhAt
         NdOQHmCz6EuYjr/QmOA/VKe8bF+LdYJDjbqqbSxc/KRhe/B9xzrlYBdeiD5RADID5eja
         xUec2lGCWcVK227arohOmJ+3prZWi4l/v1ouvHoin3nZGEKuAV5mt3NleqvuAySdfTDv
         Elvg==
X-Gm-Message-State: AOJu0YzGdG2oapdSxu3AjEd/jIYOfENj8ac0pvUPsBOSRSF+6B5aIrOZ
	z0L4GcPv5QlCmndfikA2D/+p5K29/CxaXn4AJ5mRubHo2gI2llsz5NbK+qpeOTw2rqthVmnfNZp
	vTv9QC3T/bWjwVZX1I1I3jwAVk7O2gk7cn0avlWwH9QHhE23YCehgTnvasrsa0XE=
X-Received: by 2002:a05:6214:4489:b0:68f:e779:70f2 with SMTP id on9-20020a056214448900b0068fe77970f2mr443546qvb.3.1711058897153;
        Thu, 21 Mar 2024 15:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGuIUGmtGDilXkO+Txm1IkzpifWGQBAYBHvb3QP196cSPWL36y2snARbq2rVPrLWqoQw6FQA==
X-Received: by 2002:a05:6214:4489:b0:68f:e779:70f2 with SMTP id on9-20020a056214448900b0068fe77970f2mr443515qvb.3.1711058896774;
        Thu, 21 Mar 2024 15:08:16 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:16 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/12] mm/gup: Refactor record_subpages() to find 1st small page
Date: Thu, 21 Mar 2024 18:07:56 -0400
Message-ID: <20240321220802.679544-7-peterx@redhat.com>
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

All the fast-gup functions take a tail page to operate, always need to do
page mask calculations before feeding that into record_subpages().

Merge that logic into record_subpages(), so that it will do the nth_page()
calculation.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 9127ec5515ac..f3ae8f6ce8a4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2778,13 +2778,16 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
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
@@ -2819,8 +2822,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2893,8 +2896,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pmd_page(orig);
+	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2937,8 +2940,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pud_page(orig), (addr & ~PUD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pud_page(orig);
+	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2977,8 +2980,8 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 
 	BUILD_BUG_ON(pgd_devmap(orig));
 
-	page = nth_page(pgd_page(orig), (addr & ~PGDIR_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pgd_page(orig);
+	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
-- 
2.44.0

