Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B86BB88E8EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:26:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bkvBedbz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bkvBedbz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VrR3cQXz3vpd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:26:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bkvBedbz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bkvBedbz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnG73W1z3vY9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/g69WjpU0rXeMHNQq0wHJ20ikWbVhFRACidICzEeTCE=;
	b=bkvBedbze8RVNVsEW+6xD5cM6TwuRhHYlCAAPcieiEM5mVWDPZ/MUSSoZ8et5+FudChwbr
	ll8o6EhgzahcYrgnrDilfqGB8eYJn6ogSYlPOLu6QF06a32wzXjE5AWzt5YD7LGKMXIRWl
	rFOHvUuSH01eEIpR8piDboLY6uhQGGs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/g69WjpU0rXeMHNQq0wHJ20ikWbVhFRACidICzEeTCE=;
	b=bkvBedbze8RVNVsEW+6xD5cM6TwuRhHYlCAAPcieiEM5mVWDPZ/MUSSoZ8et5+FudChwbr
	ll8o6EhgzahcYrgnrDilfqGB8eYJn6ogSYlPOLu6QF06a32wzXjE5AWzt5YD7LGKMXIRWl
	rFOHvUuSH01eEIpR8piDboLY6uhQGGs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-LdS0BP3CPlKnOyCRTFZY1A-1; Wed, 27 Mar 2024 11:23:42 -0400
X-MC-Unique: LdS0BP3CPlKnOyCRTFZY1A-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-696a5972507so4145666d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553022; x=1712157822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g69WjpU0rXeMHNQq0wHJ20ikWbVhFRACidICzEeTCE=;
        b=q4CqMsRUObdXVh0aOHFBYF7g0MP71Lt5Oofw9WVrgl4JrYm+kSuD8D8d74byL2WUSp
         P7pz1qQWLbtnf8TD31bix/MsW3ZjE1T/E6JXe19qG427oG6aXfT61BcsEBdw4dYWcs7R
         S/Xj1LWOzZnKGVbGTUfASHFUD97VcBWGCwjFiHMa0Rka92zX/ub5VTo0sho4HBX3L7E/
         k8bwByWVXA3rUxJBWqNa18cZOZsL+jYw6C7nm7n3byu63MNyotdV8XOAIjw5ZfCK8DR5
         Loz3idwzMX364Lk0J4/scST1IL71cIeFgUTjUTB8/VBPBEKvHzjRlkcK99gGPs0ZU6N2
         Jpww==
X-Forwarded-Encrypted: i=1; AJvYcCWOt8Peyhx2VJrGau4YTi5ZlIdM8U93CnDTNMERyQPo2iuZzNqDq7Lgemw+pUUqQU3SwKs7+6SdLibwaOsopptCFgPGmzoofY8gfFcqSQ==
X-Gm-Message-State: AOJu0YxxMl+l6bONOr/g7EENxc2KyyCRvsw+ogUSQGznlRwlSpox/kTd
	4ZIUgY77uAEElL0p5euXlxfOLWVsmPVX4zCtH5/QoRy8hnKbBZpQjo6ru1xIvm+EdGr7rdQKDAE
	Qo/LnM7uuZBa29/B81VI61f9Ew7EtJ7RUnAp3Dmnxf2xsLpXynu1rjfPP2a1L5xE=
X-Received: by 2002:a05:6214:3187:b0:691:456f:415a with SMTP id lb7-20020a056214318700b00691456f415amr14772453qvb.4.1711553022242;
        Wed, 27 Mar 2024 08:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwFABTpt0oYC5XP41rgqaavJwjTuxekGLogedD16Vy17R/DxfwS2XqF10qrZ+lSq8ZmFvRzQ==
X-Received: by 2002:a05:6214:3187:b0:691:456f:415a with SMTP id lb7-20020a056214318700b00691456f415amr14772425qvb.4.1711553021719;
        Wed, 27 Mar 2024 08:23:41 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:40 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/13] mm: Make HPAGE_PXD_* macros even if !THP
Date: Wed, 27 Mar 2024 11:23:22 -0400
Message-ID: <20240327152332.950956-4-peterx@redhat.com>
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

These macros can be helpful when we plan to merge hugetlb code into generic
code.  Move them out and define them as long as PGTABLE_HAS_HUGE_LEAVES is
selected, because there are systems that only define HUGETLB_PAGE not THP.

One note here is HPAGE_PMD_SHIFT must be defined even if PMD_SHIFT is not
defined (e.g. !CONFIG_MMU case); it (or in other forms, like HPAGE_PMD_NR)
is already used in lots of common codes without ifdef guards.  Use the old
trick to let complations work.

Here we only need to differenciate HPAGE_PXD_SHIFT definitions. All the
rest macros will be defined based on it.  When at it, move HPAGE_PMD_NR /
HPAGE_PMD_ORDER over together.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 7576025db55d..d3bb25c39482 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
 				  enum transparent_hugepage_flag flag);
 extern struct kobj_attribute shmem_enabled_attr;
 
-#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
-#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
-
 /*
  * Mask of all large folio orders supported for anonymous THP; all orders up to
  * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
@@ -87,14 +84,25 @@ extern struct kobj_attribute shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 #define HPAGE_PMD_SHIFT PMD_SHIFT
-#define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
+#define HPAGE_PUD_SHIFT PUD_SHIFT
+#else
+#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
+#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
+#endif
+
+#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
+#define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
 
-#define HPAGE_PUD_SHIFT PUD_SHIFT
-#define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
+#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
 #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
+#define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 extern unsigned long transparent_hugepage_flags;
 extern unsigned long huge_anon_orders_always;
@@ -377,13 +385,6 @@ static inline bool thp_migration_supported(void)
 }
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
-#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
-#define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
-#define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
-
-#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
-#define HPAGE_PUD_MASK ({ BUILD_BUG(); 0; })
-#define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
 
 static inline bool folio_test_pmd_mappable(struct folio *folio)
 {
-- 
2.44.0

