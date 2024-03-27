Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607288E8E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:25:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XlUc7hCJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XlUc7hCJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VqW2fQ7z3vlt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XlUc7hCJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XlUc7hCJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnF5Rnzz3dwr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DKy2rskdC2Yvy4b+7pXCefd1yMSUUO/lg/gxYCRDGA=;
	b=XlUc7hCJlcVqjBmKtdtMMEJJKeTdwY7QKS4DuNNHANJzCg/A8NHvCcm5PLfbl8xwOjmthD
	OcGdI/91Qt0YEaRWlkIxuUdpJoThP4ExCF0L73NG/mltslt/KY0IiEnbU2Iuu2NaZWMehV
	PaY2JzPbCJBPSMPMpMtLQKrLEmE0awU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DKy2rskdC2Yvy4b+7pXCefd1yMSUUO/lg/gxYCRDGA=;
	b=XlUc7hCJlcVqjBmKtdtMMEJJKeTdwY7QKS4DuNNHANJzCg/A8NHvCcm5PLfbl8xwOjmthD
	OcGdI/91Qt0YEaRWlkIxuUdpJoThP4ExCF0L73NG/mltslt/KY0IiEnbU2Iuu2NaZWMehV
	PaY2JzPbCJBPSMPMpMtLQKrLEmE0awU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-XwyCkX8wMPyFAQR6lBxrzQ-1; Wed, 27 Mar 2024 11:23:41 -0400
X-MC-Unique: XwyCkX8wMPyFAQR6lBxrzQ-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c22fa01f9dso321883b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553020; x=1712157820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DKy2rskdC2Yvy4b+7pXCefd1yMSUUO/lg/gxYCRDGA=;
        b=RgPC17iwifeCY0it1KPRn0/2XbzJYsmjSwhkyt5I+ay7WowY8uF0YnX0zHGKmy0EbY
         U7WT4NXEMqBUPmjzf+tR5fptFYHF3yu29et/Y8oGpeGG7hdyakkOkn/4OLb6ibAWGg2D
         NCaZ9RzUxmx9cxHKK7vGWXEpxFoyHnxqbWEglx2/CWYgvPLdGuI1E89mfQ0jRqFzs7ae
         v9sBzuDLvv7mVh7h66+d8FBkgv4ieT59rQeCkyP6TfJ7vkbwgovc9qDLbgm4dGZur8MW
         5XZ7FmsUc6xdXmJAq5MkAobkfuThecgoarK9zZ9ujo/1WOZDhgMvZO7CWTwBQt3Qs1sR
         w0tw==
X-Forwarded-Encrypted: i=1; AJvYcCW6LZKQzNCI26dfILNniPbRUT6EIQsnpn1r7lD4oou5RQ/lN1BFtfSoOaaM1SAglDOtW5GeCVo9gCA9gnlCUqajT3iMz39l1rhzbca7hg==
X-Gm-Message-State: AOJu0YwHv8fyt0tQAMRl6B0TeXo6VdYHEx3mujJayLYk98dgMNXuLMfV
	bmq21YWDI3eqILu/rVr6Txhzc9LFJWHVg71qBQR4EJURKIWpHLZCFSuCUDlutwirg7u0C++vC9V
	s7pMl9pP6YZ/kbf2gOssczl6ckKJ4/YXNEDMRET8+gm8AYX7+8npgX69bT/ychJs=
X-Received: by 2002:a05:6808:1814:b0:3c3:d28a:b1a8 with SMTP id bh20-20020a056808181400b003c3d28ab1a8mr370345oib.0.1711553020012;
        Wed, 27 Mar 2024 08:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUSCRMAKzeIW51sHYtQ4kGfBJ1LCcy7xm5bPm4kr5W7dAQlFQDGhJMDaaF/OcaFnro9iqkpQ==
X-Received: by 2002:a05:6808:1814:b0:3c3:d28a:b1a8 with SMTP id bh20-20020a056808181400b003c3d28ab1a8mr370311oib.0.1711553019443;
        Wed, 27 Mar 2024 08:23:39 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:38 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/13] mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
Date: Wed, 27 Mar 2024 11:23:21 -0400
Message-ID: <20240327152332.950956-3-peterx@redhat.com>
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

It will be used outside hugetlb.c soon.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h | 9 +++++++++
 mm/hugetlb.c            | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index d748628efc5e..294c78b3549f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -174,6 +174,9 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx);
 
 pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, pud_t *pud);
+bool hugetlbfs_pagecache_present(struct hstate *h,
+				 struct vm_area_struct *vma,
+				 unsigned long address);
 
 struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage);
 
@@ -1228,6 +1231,12 @@ static inline void hugetlb_register_node(struct node *node)
 static inline void hugetlb_unregister_node(struct node *node)
 {
 }
+
+static inline bool hugetlbfs_pagecache_present(
+    struct hstate *h, struct vm_area_struct *vma, unsigned long address)
+{
+	return false;
+}
 #endif	/* CONFIG_HUGETLB_PAGE */
 
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f9640a81226e..65b9c9a48fd2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6110,8 +6110,8 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 /*
  * Return whether there is a pagecache page to back given address within VMA.
  */
-static bool hugetlbfs_pagecache_present(struct hstate *h,
-			struct vm_area_struct *vma, unsigned long address)
+bool hugetlbfs_pagecache_present(struct hstate *h,
+				 struct vm_area_struct *vma, unsigned long address)
 {
 	struct address_space *mapping = vma->vm_file->f_mapping;
 	pgoff_t idx = linear_page_index(vma, address);
-- 
2.44.0

