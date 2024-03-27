Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B63C88E90D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:30:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YpJbgc7e;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YpJbgc7e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VxL6NhLz3vyp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:30:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YpJbgc7e;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YpJbgc7e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnY4GfVz3vXJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:24:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=;
	b=YpJbgc7e92OxMacUGZUo4N2rGr4wPPxYAmdK2pSoAvZelfN/7882qHOoygeJ3If31YdNb3
	RzkpZ3ymPmuTOnXPv1VXuTg4BhQHGIGpBwdqS+CtxQ6J9vlWr7TNFJx2UZGAetcuPspVmA
	UHNTJ3IJVE+A0RKg0DgJ89Pbqd3lXXs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=;
	b=YpJbgc7e92OxMacUGZUo4N2rGr4wPPxYAmdK2pSoAvZelfN/7882qHOoygeJ3If31YdNb3
	RzkpZ3ymPmuTOnXPv1VXuTg4BhQHGIGpBwdqS+CtxQ6J9vlWr7TNFJx2UZGAetcuPspVmA
	UHNTJ3IJVE+A0RKg0DgJ89Pbqd3lXXs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-Ty-M6qppM0G8uCuxngaFjw-1; Wed, 27 Mar 2024 11:23:55 -0400
X-MC-Unique: Ty-M6qppM0G8uCuxngaFjw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-696a5972507so4146636d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553035; x=1712157835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=;
        b=Y7W0FBizypS8T2e0TR24tq1ce1NPvu8B1ClmHbNDSch4UhxfuRVlpvZ9v5ukylOezB
         E9O96gowDzSgm6aVnVmHYNToBR3wWA9KoKPDCg3XkLw48hLwTemzwrbfL01qT5FrxFwT
         xUXGZuK3zT1fHapUFwvnwCDZuuuinmqClc3eU/ut6nn3X8tbYt3X8DOLu3/fPadqzl5Y
         kIVmfi4E1ppOS8jrsSEOJfndjPTX6BVSDHI6HrtJD+8YOCehs1R0n3uX1971OgCBtfZN
         BiDdQMriJOBZVeaDc4WWZ+V0aSxxeXJX7WwhJZJsDvhETTTh2Slv/Qq0Z8zxCeCbfNLY
         zmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0RLyV+dh2yqco0pWgROqDMSJtqNv6+HcRwajzK8dbF+nlPs+oekQypBwqQ9IDq0+jL+NUi0vavknOYe1O+ArFzfCuUErwnLHHFbkCcQ==
X-Gm-Message-State: AOJu0Yw+dkRh2H0izuzhlJrrB7RHmmP/zbIULwvkuMBQnFmnzd/0l3GH
	PRjBNKHQdu/na0iYU1RR9Z6BdkGGKZkdMGGHQz6qagIjefyhqTM0/c+/f6e7R7mogD7W7WVmab5
	J7ocyVT33s1qZR18N93u1bH9UiEQZeOZ5Rh3rvqWBYcki8GkEaisVjE8YrmsjfsA=
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr15035542qvb.3.1711553035014;
        Wed, 27 Mar 2024 08:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT3GjlhPAIM0f0tWP3PNax9bFYBunh5winrPqMP8FazkZOSJ/P00xdKeX4lX2Up3S+10Z8OQ==
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr15035509qvb.3.1711553034516;
        Wed, 27 Mar 2024 08:23:54 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:54 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/13] mm/gup: Cache *pudp in follow_pud_mask()
Date: Wed, 27 Mar 2024 11:23:28 -0400
Message-ID: <20240327152332.950956-10-peterx@redhat.com>
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
index ef46a7053e16..26b8cca24077 100644
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

