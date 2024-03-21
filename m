Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FA88630D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:11:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e17x3FP9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QytQ8QyA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V106x6kfRz3vh4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:11:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e17x3FP9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QytQ8QyA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V102p505dz3cPR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwZ/C3Y+mq5srgVBOLaWiB530mwVuOVA1xifIUFcqIU=;
	b=e17x3FP9D4AjpkF8LFJ+st+8sb6zzeFymsTgfF4db2f4ry3muxxWuknm8+wrrmMpFWEjwc
	HSdUhHJaTeTr+cTELps/QGqfmuIll7HbwOdaGjwT+HSDIOoG8ngfht6+S9h83subskWafc
	cV5cIQbZlH0LSX8BbREmBn7uumvjWtI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwZ/C3Y+mq5srgVBOLaWiB530mwVuOVA1xifIUFcqIU=;
	b=QytQ8QyAc6bjUv5kyhoB17zhdGCeZVoaK2zeyFhUVwPstKNyinnW+m8IRENNNb2FwUcCZa
	jAM2EuCy2WN+/SyLA2HXlLcEptVNWbZgwQb+ptc4szLESi1vwWGaXN2nYxpP2nQnEhIteb
	5gWeYXZWZFFD5g7hVJaGjWzq/frlLzw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-CGthgKViNeG1eoZzulKs0w-1; Thu, 21 Mar 2024 18:08:13 -0400
X-MC-Unique: CGthgKViNeG1eoZzulKs0w-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-430b4572a97so4829251cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058893; x=1711663693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwZ/C3Y+mq5srgVBOLaWiB530mwVuOVA1xifIUFcqIU=;
        b=Y88V7kVRvac0OsRgQmuHGLDjbJMqltyqpHPR/+XYYLRErNpSkJKNRVZkQVcZCwOcZp
         pR4BbnY/9yBomK4lPE6gkzbYISvEGeYJNfFb/qnTjcVYCe//U9l7zG8wWy/KtwDSpQPK
         s62KJ5YPcsH28u+zTVivzu+d/XSE2u0h7J6NGmE4HxYcC9CzONJmdGKWNJZwHlhUllwT
         SxZCjP58j6zopFoorymK5Dw3CtJe01i5irpNQWxQBSYu88oRCRzvKKhjldV2AlgCrv0R
         dshYjhx3Vy+roWuN0LdLy6rjQUlGj23DB06SYuMYJcrq1NUn2MlvDiTuJ8mzr/MrTASd
         Zwxg==
X-Gm-Message-State: AOJu0YwI4NvR48UXI+Vs9GFLz2/bkzgomfSPtOvkPRc097iRUbcOi2Ua
	mhd/jkKDSApVDau07Yb0hYIFBwF4PsY46CEYNftEAOu8O6RzIqO+GbRyLAILFuw5xbKUBAi3ziM
	0T3JhqIEC72ol6xEguwSfCbwomnlI4HzL2ArMTq292et6xNng2PiUuYdij2aIbV8=
X-Received: by 2002:a05:6214:3f89:b0:690:c35c:7590 with SMTP id ow9-20020a0562143f8900b00690c35c7590mr218153qvb.2.1711058893177;
        Thu, 21 Mar 2024 15:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl1Qmf0wBzWRoAAACR5bZA/I9hFYAFMFu/sm/LF6+WMAng7TWyPkikdWZMgBZCHnmtXnvmwg==
X-Received: by 2002:a05:6214:3f89:b0:690:c35c:7590 with SMTP id ow9-20020a0562143f8900b00690c35c7590mr218110qvb.2.1711058892727;
        Thu, 21 Mar 2024 15:08:12 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:12 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/12] mm: Introduce vma_pgtable_walk_{begin|end}()
Date: Thu, 21 Mar 2024 18:07:54 -0400
Message-ID: <20240321220802.679544-5-peterx@redhat.com>
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
index 8147b1302413..d10eb89f4096 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4198,4 +4198,7 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
 
+void vma_pgtable_walk_begin(struct vm_area_struct *vma);
+void vma_pgtable_walk_end(struct vm_area_struct *vma);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/memory.c b/mm/memory.c
index 9bce1fa76dd7..4f2caf1c3c4d 100644
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

