Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA198862FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:10:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dx7bxEyx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dx7bxEyx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V105D1vQhz3vYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dx7bxEyx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dx7bxEyx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102m4dLTz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wdRUTOTGji9K1EOtUzCYNHXUg1STGKkafiwUdqA6oYA=;
	b=dx7bxEyxtYM0nwPIxFKNKaXxO6CCZFueLILHKRcUmHFkYzB1WvKNYDbYM32CGBaDx2t2O1
	N4z81KenfMrNGeOGMGQPhJH+ONMkPn6FJ2kVSNM7SkxH97riHY1599c0V7tHNCdzJGq4T5
	uGmTWlA3e6gjSOkJmorcAEkdnfC8wio=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wdRUTOTGji9K1EOtUzCYNHXUg1STGKkafiwUdqA6oYA=;
	b=dx7bxEyxtYM0nwPIxFKNKaXxO6CCZFueLILHKRcUmHFkYzB1WvKNYDbYM32CGBaDx2t2O1
	N4z81KenfMrNGeOGMGQPhJH+ONMkPn6FJ2kVSNM7SkxH97riHY1599c0V7tHNCdzJGq4T5
	uGmTWlA3e6gjSOkJmorcAEkdnfC8wio=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-ft9fZzh_MW6dbRgeNfukkg-1; Thu, 21 Mar 2024 18:08:12 -0400
X-MC-Unique: ft9fZzh_MW6dbRgeNfukkg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69152af7760so3924796d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058891; x=1711663691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdRUTOTGji9K1EOtUzCYNHXUg1STGKkafiwUdqA6oYA=;
        b=FohwB43CeTn917CPPKdJzyWjLCz9Dh33wPUd2rWCwF6s+wDO/aM7mvYfs7XRl2KKTd
         QMUQC+910teE9XAQjrjIeI9KgnvVDl4Vw/3MIJgOLoUqIBxK11xJLcsB3DjWsYRHW5cE
         ctzQTRNyt74V/UeVmsVA+TArkYyVEHut1M58IkVVYLidgL+paWLK1rLbxjpZ1TJ/CJia
         euorQxP5ut7jFioy4/KM1jamZpdiK1RDchGjvAYyElAsBZoQ9UpGuuBcy0RFSfZMBb12
         /+s4iWnb/Is3FT9n1U/sxtjYXPZcVVEMbbBg5RcG19fLR6/RRkXzBR5zxlOhN9NkVZJw
         0WUA==
X-Gm-Message-State: AOJu0Yx2qjQF6ccX5vD3pTT7Xgdku+qDb5XOuFQMOAT3gLBPDqqngwhx
	sxthdQUzMk4OGUlbi2crpcm00pNZywXG2AzTmP1jSdRq8Y/REptfNzeGaZpwy35F5eLPMOXkahT
	l2g9kI2gE4oxxs3mzrhVuiRGVlyzTIvRV4XGpOLSq2za/hCsVkmbtNJg58m2Ch84=
X-Received: by 2002:a05:6214:3a8a:b0:690:3c85:c5b with SMTP id nz10-20020a0562143a8a00b006903c850c5bmr195549qvb.3.1711058891329;
        Thu, 21 Mar 2024 15:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG16ns9jJ9MJ80ThL7hh1B1qvLdYLgSNyXX5iyvBQC6076/qVHetDei+F5v2+719IrZ5asQ9g==
X-Received: by 2002:a05:6214:3a8a:b0:690:3c85:c5b with SMTP id nz10-20020a0562143a8a00b006903c850c5bmr195527qvb.3.1711058890838;
        Thu, 21 Mar 2024 15:08:10 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:10 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/12] mm: Make HPAGE_PXD_* macros even if !THP
Date: Thu, 21 Mar 2024 18:07:53 -0400
Message-ID: <20240321220802.679544-4-peterx@redhat.com>
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

These macros can be helpful when we plan to merge hugetlb code into generic
code.  Move them out and define them even if !THP.

We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
Reorganize these macros.

Reviewed-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index de0c89105076..3bcdfc7e5d57 100644
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
@@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define HPAGE_PMD_SHIFT PMD_SHIFT
 #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
+#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 
 #define HPAGE_PUD_SHIFT PUD_SHIFT
 #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
 #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
+#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 extern unsigned long transparent_hugepage_flags;
 extern unsigned long huge_anon_orders_always;
@@ -378,13 +380,6 @@ static inline bool thp_migration_supported(void)
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

