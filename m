Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C18A74FE37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:31:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RBETceKT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14ZS1cPBz3c6c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=RBETceKT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14YY4GbDz30F5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:30:57 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c4dd264359cso6099654276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689136254; x=1691728254;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lih86tpYDD3J7zG12H/yvKEagSCLBGtcWN3xnGIcrQ8=;
        b=RBETceKTxUIdE5Wthq5VyXl1iuewXFCZtvj7DAV2aR3XnxKua3oR4hmOqLeBfiK+Bo
         QX5kHPh+nmkLT9qkicOsu2l1qxImFf+42zqUi71fI6EVfsz6Wd8j8qUrewGd84C27fQF
         z08YkGvSrNifDm+H1bjPb9jqoZlNdzHFdJ/PGyx79rM0dM13MzFCo6oGzmwGF3H2DHxK
         jhmvYEXUAQ46tN3PfeVxdIIezDCwRgqWW3fiTQ5gpTM5B8KutupuJmp6cYEM5cSz9f5W
         fLAc5DNp+0Wj3x5T2KO5EPXVkVyBxsI6lOPcm2rzPIqTF2kKG/dKpgqnKRkoKETZyp95
         sIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689136254; x=1691728254;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lih86tpYDD3J7zG12H/yvKEagSCLBGtcWN3xnGIcrQ8=;
        b=IUavTbdGhLyOLv7hi3l1PvzKv+Lt0Rwz190KEUJ92Pj5kYOkPhTtizYwt/GslZ2vWn
         +PYkAQRgS/4d/fLaQA5TgCOH0QhPgd9CZUYLmRcSqg/mYULKyOiELGTLOMoiqxAZtqfu
         X21djSuw4Gop/uTsBgzqNBUVlVHZxzqOrFVKMoHhd+9mdZ2J9aGOvcI7+ExKrjoxn/2R
         WF6ByRBHOtJvbwDSm+WYu/gQGdOyG63vVpUy/mgK6ZYd76YhfxtLJNFpAMvI0XZl5jcv
         CzibX3y8/Zy02L7T9i9bLGRwEx9H+8fHBpWQjZm6MNaIumk79depC3YRI+Gpm51Kzs5J
         55Bg==
X-Gm-Message-State: ABy/qLbmR5aaoXmSuasFYm8nMDVtDhR5yahf8ixd4Cq9zzPf7cbomHQA
	6zoTghl3nMHwbt1JGxGz/sKA/g==
X-Google-Smtp-Source: APBJJlG+aqkZgSinL0H+vGhJ8SPTaMZTSfjnzUjRq5ezvCFkxr+RV56UV3ToUF/QNi8B1m8dggx9Pw==
X-Received: by 2002:a25:8a06:0:b0:c3d:25af:45ec with SMTP id g6-20020a258a06000000b00c3d25af45ecmr14975706ybl.41.1689136254058;
        Tue, 11 Jul 2023 21:30:54 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b8-20020a252e48000000b00c61af359b15sm750774ybn.43.2023.07.11.21.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:30:53 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:30:40 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 01/13] mm/pgtable: add rcu_read_lock() and
 rcu_read_unlock()s
In-Reply-To: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
Message-ID: <d3b01da5-2a6-833c-6681-67a3e024a16f@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
  Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before putting them to use (several commits later), add rcu_read_lock()
to pte_offset_map(), and rcu_read_unlock() to pte_unmap().  Make this a
separate commit, since it risks exposing imbalances: prior commits have
fixed all the known imbalances, but we may find some have been missed.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/pgtable.h | 4 ++--
 mm/pgtable-generic.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5063b482e34f..5134edcec668 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -99,7 +99,7 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 	((pte_t *)kmap_local_page(pmd_page(*(pmd))) + pte_index((address)))
 #define pte_unmap(pte)	do {	\
 	kunmap_local((pte));	\
-	/* rcu_read_unlock() to be added later */	\
+	rcu_read_unlock();	\
 } while (0)
 #else
 static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
@@ -108,7 +108,7 @@ static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
 }
 static inline void pte_unmap(pte_t *pte)
 {
-	/* rcu_read_unlock() to be added later */
+	rcu_read_unlock();
 }
 #endif
 
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 4d454953046f..400e5a045848 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -236,7 +236,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 {
 	pmd_t pmdval;
 
-	/* rcu_read_lock() to be added later */
+	rcu_read_lock();
 	pmdval = pmdp_get_lockless(pmd);
 	if (pmdvalp)
 		*pmdvalp = pmdval;
@@ -250,7 +250,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 	}
 	return __pte_map(&pmdval, addr);
 nomap:
-	/* rcu_read_unlock() to be added later */
+	rcu_read_unlock();
 	return NULL;
 }
 
-- 
2.35.3

