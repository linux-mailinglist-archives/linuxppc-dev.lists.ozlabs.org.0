Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D9774FE7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:49:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=m/isMuww;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14z96MJjz3cHv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=m/isMuww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14yK3JN8z2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:48:57 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-765942d497fso612634085a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689137334; x=1691729334;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0zmjk3m732t/eWPq5qXNEJLvruggBsecgrKanNe5l4=;
        b=m/isMuwwHCscXwVwjf5FGado4/9tpy0RVJn6Dmx5WLSJ5xRgosdxmCJxwiPFWiAUgB
         aDg+93flQ7NMyM7Ob0BhHijD3j9VUlV+wGsA8+lIFqohmEqvFNbAqrQJVoTH+NakZbfi
         v95OOg6esvouVDLtN6UUfJGUuwgdU5xNKi1Jbuw684xIT7LAHa0pkF4qQ3VLr3RBBpgQ
         WMQ398D7B7TZxSjDnWNUL6QIg9YQENcYddDXCtF/eP4Ub7TMj2kGD66Y3a+72i5I3Rkr
         ux5aoInLIYyejTCbPjnbhW+BnfTRptB28F88ToPfG11+CTmoDLEv5LUBQEcnAkEXDO6u
         0U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689137334; x=1691729334;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0zmjk3m732t/eWPq5qXNEJLvruggBsecgrKanNe5l4=;
        b=HxuBMJVnd7loY7xeMoEJ3MTYedQPxNPh8vuNWLibFN9Ux/l19f1NmqXQErrKcqkVtY
         CJvy2ZtAs6YQKN8mZxZNHfx+LDvawBHiw3/DDvxKCbIuOfLtD5zE1fDRXermoIQbT6P8
         HN9xXVOVIfCzGex+m3SRxLhy044I4wHvpRHXaVzWQnwDegPmxPJh+Fno+nVcMS/nT1aE
         y/e/sXMr2IWP428OB2VoouHQUqzy9fZ5TQKDP/RTI6QJ/hc/wtTcaijpKTDf7KcTcZnm
         JjWKAookPKpB5+shEjdhXHJCfhbm1QwtqEliAzJqafiSGVfPwo2YFLE1DHQ4kjmFKjC1
         abpQ==
X-Gm-Message-State: ABy/qLaJTYoZ3eFC4V8eSPt3dfomN51s312zyeO4ThgrkgVD+DhEhsfm
	e/OOBVP8r+LR+bkPcxb7+2hVjQ==
X-Google-Smtp-Source: APBJJlEFW7pAKJkrMMZ7so7H+6qQo4Zhl/O905ULRzoeoCUXWypLVpWBJRwEwG5/0JeTCh7gTt6reA==
X-Received: by 2002:a05:620a:404e:b0:767:3fa7:2ae9 with SMTP id i14-20020a05620a404e00b007673fa72ae9mr19722823qko.12.1689137333537;
        Tue, 11 Jul 2023 21:48:53 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id m124-20020a817182000000b0056d0709e0besm972906ywc.129.2023.07.11.21.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:48:53 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:48:48 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH mm 12/13] mm: delete mmap_write_trylock() and
 vma_try_start_write()
In-Reply-To: <728dae79-5110-e3c4-df27-ce3df525aaef@google.com>
Message-ID: <4e6db3d-e8e-73fb-1f2a-8de2dab2a87c@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <728dae79-5110-e3c4-df27-ce3df525aaef@google.com>
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

mmap_write_trylock() and vma_try_start_write() were added just for
khugepaged, but now it has no use for them: delete.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
This is the version which applies to mm-unstable or linux-next.

 include/linux/mm.h        | 17 -----------------
 include/linux/mmap_lock.h | 10 ----------
 2 files changed, 27 deletions(-)

--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -692,21 +692,6 @@ static inline void vma_start_write(struc
 	up_write(&vma->vm_lock->lock);
 }
 
-static inline bool vma_try_start_write(struct vm_area_struct *vma)
-{
-	int mm_lock_seq;
-
-	if (__is_vma_write_locked(vma, &mm_lock_seq))
-		return true;
-
-	if (!down_write_trylock(&vma->vm_lock->lock))
-		return false;
-
-	vma->vm_lock_seq = mm_lock_seq;
-	up_write(&vma->vm_lock->lock);
-	return true;
-}
-
 static inline void vma_assert_locked(struct vm_area_struct *vma)
 {
 	int mm_lock_seq;
@@ -758,8 +743,6 @@ static inline bool vma_start_read(struct
 		{ return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
-static inline bool vma_try_start_write(struct vm_area_struct *vma)
-		{ return true; }
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma,
 				     bool detached) {}
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -112,16 +112,6 @@ static inline int mmap_write_lock_killab
 	return ret;
 }
 
-static inline bool mmap_write_trylock(struct mm_struct *mm)
-{
-	bool ret;
-
-	__mmap_lock_trace_start_locking(mm, true);
-	ret = down_write_trylock(&mm->mmap_lock) != 0;
-	__mmap_lock_trace_acquire_returned(mm, true, ret);
-	return ret;
-}
-
 static inline void mmap_write_unlock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_released(mm, true);
