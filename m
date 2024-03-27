Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB288E905
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:29:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+xeDYUt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+xeDYUt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vvl6h70z3vbH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:29:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+xeDYUt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+xeDYUt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnT1zNMz3vYH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=;
	b=U+xeDYUt/+mkEycM1MQvrfmJJ9xlOsWgRF1X/AIzweQoTno3IjyOz/47sXSGpcGoPzNp7U
	D5+9HpAwT+LUp9/aNWkyFMjV8L+I50khcPNN6MvceCv8FeBnVci+gQrtAbPenDzJe1Uyyi
	a00HWWeCo8m3nqe6pyxN/lMJgu+0dWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=;
	b=U+xeDYUt/+mkEycM1MQvrfmJJ9xlOsWgRF1X/AIzweQoTno3IjyOz/47sXSGpcGoPzNp7U
	D5+9HpAwT+LUp9/aNWkyFMjV8L+I50khcPNN6MvceCv8FeBnVci+gQrtAbPenDzJe1Uyyi
	a00HWWeCo8m3nqe6pyxN/lMJgu+0dWc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-16PqMUwmOVa8_9-0_4kwgg-1; Wed, 27 Mar 2024 11:23:52 -0400
X-MC-Unique: 16PqMUwmOVa8_9-0_4kwgg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-696a5972507so4146186d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553031; x=1712157831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDTtuz/iBLnx3uLIw0aNQbjjBf12gK6PRqFn//yUSp8=;
        b=tzbj+BOot6XTJnbkoB3pYCtxYsqnXYLVmYauRXBXAo97z7mCUAwYBm3rUauWiaglEf
         fAk/EOBpeqAcAMcAbmuH3tMyJdib1k1b+2C/A0HwoPtE5YwNOQiMe7ioBAnpuCtuf7en
         p1MigmKkLW3lICjj3MqbVSwmtm6ojXY6WOegeqGgwngKubPWFfZreguOZGlIt98TmMSp
         YffTTK+xWMOqCWQRDF2lvKdOl36D9gj33BrHOE2ahf4KNNJuo6etx14PjrBZL+WWjrPt
         /6aHgvd4YuZ2KvLKH/nf2jGmAZdts1FiJ0x15Z5qIOYOK3uTgnY5KUfTdChlZOEdXi3B
         Pp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPeDWcDUHBNkd6alDZYEBfaZGN9Ih6hqJk6PyL1JdCLvINTaMjl81QLZsNoU0FlqOjgYC/V7qt+jI4fLsw/2cP4yR8hVqD9kGu5gobrg==
X-Gm-Message-State: AOJu0YxF44hkAg2VKSbDwT1nZdC7vnz+JOqM1RkmMXm0D6YbIx9BArEy
	XnqUieESWdcYbNSHz0A25WkHGRugky34tucDol0snwkCqVbVjz1Iulxx28Q/mZqrtKvamOPuE8l
	qgIECsGs9GdR3U4y29V1ZQjqzdbGbZx55pjGFATR0hKJim8F05jnQ1oNq0H1n1OQ=
X-Received: by 2002:a05:6214:2b86:b0:690:de72:316f with SMTP id kr6-20020a0562142b8600b00690de72316fmr14582147qvb.1.1711553030739;
        Wed, 27 Mar 2024 08:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWXp2F9loH7HSDfuOw6HflxlC5J0wiBYnMNwM1iqpFTIhT0c0cqQhWkIb89hM3i5euenCqpA==
X-Received: by 2002:a05:6214:2b86:b0:690:de72:316f with SMTP id kr6-20020a0562142b8600b00690de72316fmr14582105qvb.1.1711553030174;
        Wed, 27 Mar 2024 08:23:50 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:49 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/13] mm/gup: Refactor record_subpages() to find 1st small page
Date: Wed, 27 Mar 2024 11:23:26 -0400
Message-ID: <20240327152332.950956-8-peterx@redhat.com>
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
index db35b056fc9a..c2881772216b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2779,13 +2779,16 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
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
@@ -2820,8 +2823,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	/* hugepages are never "special" */
 	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2894,8 +2897,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pmd_page(orig);
+	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2938,8 +2941,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 					     pages, nr);
 	}
 
-	page = nth_page(pud_page(orig), (addr & ~PUD_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pud_page(orig);
+	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
@@ -2978,8 +2981,8 @@ static int gup_huge_pgd(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 
 	BUILD_BUG_ON(pgd_devmap(orig));
 
-	page = nth_page(pgd_page(orig), (addr & ~PGDIR_MASK) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
+	page = pgd_page(orig);
+	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
 	folio = try_grab_folio(page, refs, flags);
 	if (!folio)
-- 
2.44.0

