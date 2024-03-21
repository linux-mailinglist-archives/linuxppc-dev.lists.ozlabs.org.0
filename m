Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E57886302
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:11:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N1z2wVvf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i69J84Ab;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V106574xjz3vZJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N1z2wVvf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i69J84Ab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102p1WfSz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jz9rMLZ3uXx9gi3+G5qYwalRYpIGEA6fjYlj3iYlq7A=;
	b=N1z2wVvfQddY0OVIAUeq7kmkCR/bGG5YOT3b39SZ4jNiQiIf07HSp7bGvEhmdSDaLASmXm
	cc0Nr5xaJPgxN4gy7LAHtGYpQUb+IXK5UHvbe+q45X3da33/msUhn6tgtIduuuqaK+L4d0
	ynqMB1RgWHIc+8P+LjXjPDonRp13Vog=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jz9rMLZ3uXx9gi3+G5qYwalRYpIGEA6fjYlj3iYlq7A=;
	b=i69J84AbjjK578o7ej0RdRB2ick36+8jY504yIGufJagWD/yyVedeevxB/2u7Z/bPVIUI9
	QHLTb02xyt7PIPiM2gpRmst/JKh/VsKcXcEaGCCs9VWOZ6ddPFuACft+DfjxnRkMmmwnfM
	LUSG/YhndLPHlOnqsWlDRXb/x2IiKus=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-8VhPRsuUOHWp4XKJBAF1YA-1; Thu, 21 Mar 2024 18:08:10 -0400
X-MC-Unique: 8VhPRsuUOHWp4XKJBAF1YA-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4769277a5fbso157081137.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058889; x=1711663689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jz9rMLZ3uXx9gi3+G5qYwalRYpIGEA6fjYlj3iYlq7A=;
        b=n9NvYYAyrTylWnn69Y0FVeoqkMrsx3f296UkO1mn5Owp5ctk8TTUYTFarN8g2I1Kck
         EQLG6yUOSzPnes0PC2qA+uMjkhACRegFQRZxr4MFrMxJgvhU4XeeiIQwqcrOoFNogH7t
         JIh/CRf/qqkw+n4Ug8UVPrH1J73h6f29WhSypcFny4O44KcEoqLOgrKMMbqlo2bBPzeo
         V8dD1T9r3mrTwM5YxIEo8RbdsIoB7qlXYotM+ZmWJWOmA2miIwvKdSPCh2aNBPdWGe+q
         604bLZ2UdS0KN+O1jf6hmBoQ0znVqoWt4dFSJ9ZjL0k/UEApAiBFFMzzVP1JkN90qBAZ
         QS0Q==
X-Gm-Message-State: AOJu0Yz8/n+iuReG0OJ8+xtpGiDiArHnicaddEb74lovJYSZcatQJYAt
	9BAv+twIpa41CzKXEr8iNipzHMh4KvDmJl9jsalXNgW88nRgdDQ/jhEUbko9yNzsRZASGu5NYjj
	M5xZJEFY5llE/Bwbk8LCiWNUhyC72PwGzs9uNLK4Jx+lPszIXtGXQBXYYUheWshM=
X-Received: by 2002:a05:6122:6b2:b0:4d3:3a78:60e2 with SMTP id r18-20020a05612206b200b004d33a7860e2mr108427vkq.1.1711058889444;
        Thu, 21 Mar 2024 15:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYDbaW1J9E1O0bYtn9bzXmgf1WJ4RRo+0b7nGhM7jp1NUFRItVBXPR4HtJOs8C30IHezp50w==
X-Received: by 2002:a05:6122:6b2:b0:4d3:3a78:60e2 with SMTP id r18-20020a05612206b200b004d33a7860e2mr108396vkq.1.1711058889030;
        Thu, 21 Mar 2024 15:08:09 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:08 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/12] mm/hugetlb: Declare hugetlbfs_pagecache_present() non-static
Date: Thu, 21 Mar 2024 18:07:52 -0400
Message-ID: <20240321220802.679544-3-peterx@redhat.com>
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

It will be used outside hugetlb.c soon.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h | 9 +++++++++
 mm/hugetlb.c            | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 300de33c6fde..52d9efcf1edf 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -174,6 +174,9 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx);
 
 pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, pud_t *pud);
+bool hugetlbfs_pagecache_present(struct hstate *h,
+				 struct vm_area_struct *vma,
+				 unsigned long address);
 
 struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage);
 
@@ -1197,6 +1200,12 @@ static inline void hugetlb_register_node(struct node *node)
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
index 23ef240ba48a..abec04575c89 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6129,8 +6129,8 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
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

