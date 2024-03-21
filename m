Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AD88631D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:15:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ckOUdmzD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ckOUdmzD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V10CP0CRjz3vs7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:15:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ckOUdmzD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ckOUdmzD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1030180Bz3dBn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=;
	b=ckOUdmzDPoMlV6BrrHRXMzbwIZQpg350yNfe4fPr6sUofOytxXlRCgta8KmyAO6kIPWEyY
	emsuB/M7x3Iu412R86bpBHI5PR9HbMlk0gUAo1zn7+9mXIVyPy0YoP4H8rcu4VYriu7Dib
	2FLUXXUkr2FE7ZJNqz74q1YW4u28wl8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=;
	b=ckOUdmzDPoMlV6BrrHRXMzbwIZQpg350yNfe4fPr6sUofOytxXlRCgta8KmyAO6kIPWEyY
	emsuB/M7x3Iu412R86bpBHI5PR9HbMlk0gUAo1zn7+9mXIVyPy0YoP4H8rcu4VYriu7Dib
	2FLUXXUkr2FE7ZJNqz74q1YW4u28wl8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-Fep507ZnPuu3GnFTgtiRjA-1; Thu, 21 Mar 2024 18:08:21 -0400
X-MC-Unique: Fep507ZnPuu3GnFTgtiRjA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-690d3f5af86so3056876d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058901; x=1711663701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=;
        b=QL0Rzwry/Id3h3onHjg1Toygq4ufmdbl3V+crNLv5Csu7Pz7Y89aU+BcVvMfeauH3z
         8U/v9BwUM1DFthD6pEpcexFu3X+WLS8dJEIU8hDxHU4hv1Xopo1u19Pc6xTMGt681Fpa
         oGsXrXO1ryGNNX4AJZZmIopuouMsfycNk1r5LnTVnFg3J5FSjHdaylOr9qakuaIB15j1
         0QJgNM6Hna+o4RNtzqUkrtMUUXZSMZKJVixR/jOj9txv1poTlUbOejSuAnB3vQy1YM2h
         ASaVyjyQXuXl8BY/BbF21AAOJW/YFqnVFDHORC6Jb3EPllg0jKJkkKcesNg93yy3GduV
         32gg==
X-Gm-Message-State: AOJu0YxjS9y+EKdT0vnDIZYxMOEM1uXCojUvNXYV6h4gXAZUAgzqprmE
	SE9I/xEHzZL29AHtsLhhZiKLwU04VtWm7uLhk47Ahxu0tkekGpsybjhrZUNS5e9orJoEjJoBxQr
	8qPTJz64oy6xJwOXD4cb+tqArEYM/5YhsE62EIUfxhzizIa9kUn0V4MtYUwBtOhs=
X-Received: by 2002:a05:6214:3f89:b0:690:de72:316f with SMTP id ow9-20020a0562143f8900b00690de72316fmr214836qvb.1.1711058900926;
        Thu, 21 Mar 2024 15:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Op81dSYI2sDIbFIL6Ox+mlvTFr9echbLfQb+zyBeeZ6FRPjC6M2m9xSIjZkrEy5V/lebFg==
X-Received: by 2002:a05:6214:3f89:b0:690:de72:316f with SMTP id ow9-20020a0562143f8900b00690de72316fmr214791qvb.1.1711058900463;
        Thu, 21 Mar 2024 15:08:20 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:20 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/12] mm/gup: Cache *pudp in follow_pud_mask()
Date: Thu, 21 Mar 2024 18:07:58 -0400
Message-ID: <20240321220802.679544-9-peterx@redhat.com>
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

Introduce "pud_t pud" in the function, so the code won't dereference *pudp
multiple time.  Not only because that looks less straightforward, but also
because if the dereference really happened, it's not clear whether there
can be race to see different *pudp values if it's being modified at the
same time.

Acked-by: James Houghton <jthoughton@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 943671736080..a338944e4425 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -753,26 +753,27 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 				    unsigned int flags,
 				    struct follow_page_context *ctx)
 {
-	pud_t *pud;
+	pud_t *pudp, pud;
 	spinlock_t *ptl;
 	struct page *page;
 	struct mm_struct *mm = vma->vm_mm;
 
-	pud = pud_offset(p4dp, address);
-	if (pud_none(*pud))
+	pudp = pud_offset(p4dp, address);
+	pud = READ_ONCE(*pudp);
+	if (pud_none(pud))
 		return no_page_table(vma, flags, address);
-	if (pud_devmap(*pud)) {
-		ptl = pud_lock(mm, pud);
-		page = follow_devmap_pud(vma, address, pud, flags, &ctx->pgmap);
+	if (pud_devmap(pud)) {
+		ptl = pud_lock(mm, pudp);
+		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
 		spin_unlock(ptl);
 		if (page)
 			return page;
 		return no_page_table(vma, flags, address);
 	}
-	if (unlikely(pud_bad(*pud)))
+	if (unlikely(pud_bad(pud)))
 		return no_page_table(vma, flags, address);
 
-	return follow_pmd_mask(vma, address, pud, flags, ctx);
+	return follow_pmd_mask(vma, address, pudp, flags, ctx);
 }
 
 static struct page *follow_p4d_mask(struct vm_area_struct *vma,
-- 
2.44.0

