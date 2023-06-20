Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2873658E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 10:00:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=PTqSZx2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlfFn1Qbqz30hQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 18:00:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=PTqSZx2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlfDs25hqz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:59:57 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5701810884aso39722327b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247995; x=1689839995;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5HWe45UW6rQUJiJNVLC4MPu6AngULI5k321Sbm9Ew=;
        b=PTqSZx2nNI4PV4JwXAt99NVosmlLWlQ/KYn1Uf1f3Yd1Z3NVe7obF1sAci/vRU4j/I
         /dODEkNukKEVJX5QJOgx8A4SVofs7E+EBk4aUKnEe/gxIGiuFO4K0lGYei4SR6tcYKnK
         AduYU9eLhwRb6vByQAsUQ6tUe6SjjlibwcGiUn9EmoAEYZk/fTkwOJxts/LviFdlBYyU
         2HDG5towuNEQ5CvzS8P4/0FmCn98RyYyORjokeprTYbqe1PhIQYQex8ifvvnbwDxRbO6
         McJrcKmHoDDBglMt6fs5aQdKWv2A5unXxMstk7k6pfo7pQ4FA/PbwXapoPL1ZYXTeDU7
         ON7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247995; x=1689839995;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5HWe45UW6rQUJiJNVLC4MPu6AngULI5k321Sbm9Ew=;
        b=gw/m8I5n2+kiURPqQLuBvdbafZxLrdBcOLEoD17xhe8FFUgQAHeUg3aI+LBa3FJg6/
         WwYC3FpLVpkkWDPARBjBEp3JoUA4lWV7oUYz9swI0+qRBqZBMAzfMnT3M4fTbRyEhtLy
         Gh5l+Q5HxkCnWWSeWM1zxuveRLF7DSb1FAPKEbyMTE6IPXSR88HjAQXUtULJxmN+kUx5
         ISMteF0fRr/OtYVspxobn02qT8KhJHJmMwPtyZWuWyopfgwUO85tlTzd6bfFa1M4Ir9/
         IP4k5AQGnr+IrWtvv1mTZla9IdfvGlH+Dim1lYxru12v1Mf1hMEqaBzm6dcwh87j9ZP/
         O7AQ==
X-Gm-Message-State: AC+VfDyjXYM17yeI61l53d6+z6bqsM58U35yrx0VWsqtKe/GSlkXWBHn
	EMPrctD5u1szKNg+1/SpaCuwrg==
X-Google-Smtp-Source: ACHHUZ515t86hS4ZGbNoo4Ty1vmElBXGedGoznKelWut2eqFES40KQtwKfY1cJoUB4hv3Ba9PnrZlQ==
X-Received: by 2002:a5b:bc9:0:b0:bb4:14a2:fb4a with SMTP id c9-20020a5b0bc9000000b00bb414a2fb4amr2548922ybr.9.1687247993367;
        Tue, 20 Jun 2023 00:59:53 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v190-20020a257ac7000000b00ba88763e5b5sm268132ybc.2.2023.06.20.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:59:53 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:59:48 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 12/12] mm: delete mmap_write_trylock() and
 vma_try_start_write()
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <27505a8-e717-61ce-ab70-5f79d9bf646b@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmap_write_trylock() and vma_try_start_write() were added just for
khugepaged, but now it has no use for them: delete.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/mm.h        | 17 -----------------
 include/linux/mmap_lock.h | 10 ----------
 2 files changed, 27 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3c2e56980853..9b24f8fbf899 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -690,21 +690,6 @@ static inline void vma_start_write(struct vm_area_struct *vma)
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
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
 {
 	int mm_lock_seq;
@@ -730,8 +715,6 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 		{ return false; }
 static inline void vma_end_read(struct vm_area_struct *vma) {}
 static inline void vma_start_write(struct vm_area_struct *vma) {}
-static inline bool vma_try_start_write(struct vm_area_struct *vma)
-		{ return true; }
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma,
 				     bool detached) {}
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index aab8f1b28d26..d1191f02c7fa 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -112,16 +112,6 @@ static inline int mmap_write_lock_killable(struct mm_struct *mm)
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
-- 
2.35.3

