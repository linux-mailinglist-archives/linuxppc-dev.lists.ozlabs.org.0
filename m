Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96888E8F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:27:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YoUFMiqF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YoUFMiqF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VsF6ywhz3vhf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:27:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YoUFMiqF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YoUFMiqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnL16frz3vYX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=;
	b=YoUFMiqFRQwhob84m5cE7rl4ymoqHhlX4EDmjLX6XYrePEOIIbfmCh/MAOwdaYeQHBYR+R
	zahoAgoWPVh3bqDzBgpodsIDqI1r7v4l2TP9JFH8fqbyuDel/wgMjx+Yz4rmFKVIbWqbHw
	hXtPSMsy4uouiL7XlpLU7jvFHIs5uZE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=;
	b=YoUFMiqFRQwhob84m5cE7rl4ymoqHhlX4EDmjLX6XYrePEOIIbfmCh/MAOwdaYeQHBYR+R
	zahoAgoWPVh3bqDzBgpodsIDqI1r7v4l2TP9JFH8fqbyuDel/wgMjx+Yz4rmFKVIbWqbHw
	hXtPSMsy4uouiL7XlpLU7jvFHIs5uZE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-XbcEmYQHOVie1qLx1N32LQ-1; Wed, 27 Mar 2024 11:23:45 -0400
X-MC-Unique: XbcEmYQHOVie1qLx1N32LQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-696a9c482a4so3595806d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553025; x=1712157825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=;
        b=ZJiJSk6VIjW25maVIDy1qoaIOrNdbuMmESRKvUMJwb8laO4UewEPnzRu0Fg/x4We8X
         iQx0vSKCtWq/dkdzWL+zfEYeqPuPCPnKypqSd5xpGyK/nMe9dUS4MWFxxIGAlvDhgrBB
         jjJH83kfq8UXxlEXZ5dW18h7ueFx7gueYj2lcXTON2tI5CVQ3JmjfPFs318pRbXZ1zIc
         lekNCwqOg7bb4lRGQeMXRrP3fmtVg8ds8Y5eB+GqskGq3AMluMm4lKTBIHwfl1ZGTmfm
         vdknfkDuh9chRlEK79sRacI3XsvMT2aL8UEOV6PQrrVKnhEYU2bSSdugLhdxZYzMnlHq
         fV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUE+qhUgLIS7uT2nkVj3K96QBik4013+IMh/ZBcoWBheFqfNjukfmU6Ff3RqgPwFRxCGN6MJSViXnebTCwOoD4CwGEJcOuALYjivoUPIA==
X-Gm-Message-State: AOJu0Yxc8vdseyoGkHTSZRZGqzcsuz4pLYOPW2Y9/ba5eBgzXn1m262x
	tCRvwDO5Wdlz7gVHYdTV5Zt3yQqH7cBZR+UepGaGJTk+j1RzAcPC8jFYumUIJ7ee5/8SsnB3HHL
	a+J9sfVJifiTNESOzIsiAU0KZnmf0nWPFr7Cv7Wvpk2On4TqQfpGDVYUPUXlo/Tk=
X-Received: by 2002:a05:6214:4598:b0:696:7b32:cceb with SMTP id op24-20020a056214459800b006967b32ccebmr13869546qvb.6.1711553024672;
        Wed, 27 Mar 2024 08:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS0Dr3UNRPnI4el/D5x8gcrtCXLMsQwIvd4dOzHJoXuoNg03xhCSCfsu9VpmJMAiYn3G+95A==
X-Received: by 2002:a05:6214:4598:b0:696:7b32:cceb with SMTP id op24-20020a056214459800b006967b32ccebmr13869513qvb.6.1711553024070;
        Wed, 27 Mar 2024 08:23:44 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:43 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/13] mm: Introduce vma_pgtable_walk_{begin|end}()
Date: Wed, 27 Mar 2024 11:23:23 -0400
Message-ID: <20240327152332.950956-5-peterx@redhat.com>
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

Introduce per-vma begin()/end() helpers for pgtable walks.  This is a
preparation work to merge hugetlb pgtable walkers with generic mm.

The helpers need to be called before and after a pgtable walk, will start
to be needed if the pgtable walker code supports hugetlb pages.  It's a
hook point for any type of VMA, but for now only hugetlb uses it to
stablize the pgtable pages from getting away (due to possible pmd
unsharing).

Reviewed-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/mm.h |  3 +++
 mm/memory.c        | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index afe27ff3fa94..d8f78017d271 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4233,4 +4233,7 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
 
+void vma_pgtable_walk_begin(struct vm_area_struct *vma);
+void vma_pgtable_walk_end(struct vm_area_struct *vma);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/memory.c b/mm/memory.c
index 3d0c0cc33c57..27d173f9a521 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6438,3 +6438,15 @@ void ptlock_free(struct ptdesc *ptdesc)
 	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
+
+void vma_pgtable_walk_begin(struct vm_area_struct *vma)
+{
+	if (is_vm_hugetlb_page(vma))
+		hugetlb_vma_lock_read(vma);
+}
+
+void vma_pgtable_walk_end(struct vm_area_struct *vma)
+{
+	if (is_vm_hugetlb_page(vma))
+		hugetlb_vma_unlock_read(vma);
+}
-- 
2.44.0

