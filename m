Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673B74FE74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:45:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OjYXCSxc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14tn3ZCtz3cGc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:45:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OjYXCSxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14sv1MCfz308W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:45:05 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5703d12ab9aso76415967b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689137102; x=1691729102;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwWrXdLh4e+ZZMmHSG9GahXduxLzpg1IKzk9+Pois54=;
        b=OjYXCSxct3cmr1dvo1KPvNTfLh/JfMeIBRI22QJQitndrvHqxvgh7DnrbxMUXKkpDf
         67xt8rEGfK7VkWxmCUjB25v8FiFxrwfpbyxMvERP1nmcTLslqappcqo787/cQqBvAhRF
         3Z/wqzFvlHNVnNxHkipZkWRpq3QS75A3C3JbMfR4Tu8QWjFuYfVGH4Q9Dh+1hX1m2qtO
         wklgV1jBSqK0iXW69eqrFykyIzOfkqFFgpwQ035Mw3rh3+t3T6jqhjDB2ebPR33Cwj2l
         EKoqAA+7mvDwaUgimgUeARqXVWUcCGMKol5ymu9fSNNxl2y9ROEsIsE9/976nFBxA31A
         7Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689137103; x=1691729103;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwWrXdLh4e+ZZMmHSG9GahXduxLzpg1IKzk9+Pois54=;
        b=FCuwDJsq/yYSvc8uMvEZ+ApMQDU44RhZluqVy5nksdQ6TaN/riNZMT6ur9CDsaYas4
         T7LAjCxT+X63PANxezU4DJ5QFsFL8DWFZs/4ANRLs1/ZHuBNLbV7hKQTloYppeQmwMrV
         xqlox+unyTbire4QQru1x8F5k/WHUEXPyB+zLn9Fido2RbSp8jT3zvZnno1f56OOATx4
         MSkMgm0CW9ttaGMz5xZixEyn9t2fy5c60QNOnuFEh4BSyOUa6LLZh3RkS3eWbCVIDvGC
         B+G5xiBrW+GpBB0KKJXpx6DWsDFZfxk5Mhg5yMDNZnvjbrahHzL+AeSEAvfm58ApQ9U7
         AybQ==
X-Gm-Message-State: ABy/qLaQdGSEp7no+uQ1xCzUzojV+XmKL3JHfnxiWw/xRZURAAfBukeo
	2sSiGzlMIfVdktO1kuK0K4rBBQ==
X-Google-Smtp-Source: APBJJlHRrkvIp6Bta0OiFd96ROrSVoBT2nJnQYkUAOeyOnPlbKa4aui5kARvVpJZZxshvdKBo9N7Xg==
X-Received: by 2002:a81:ab51:0:b0:577:bc6:6f8c with SMTP id d17-20020a81ab51000000b005770bc66f8cmr17906536ywk.26.1689137102617;
        Tue, 11 Jul 2023 21:45:02 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id r11-20020a0de80b000000b00561949f713fsm993186ywe.39.2023.07.11.21.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:45:02 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:44:57 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 12/13] mm: delete mmap_write_trylock() and
 vma_try_start_write()
In-Reply-To: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
Message-ID: <728dae79-5110-e3c4-df27-ce3df525aaef@google.com>
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

mmap_write_trylock() and vma_try_start_write() were added just for
khugepaged, but now it has no use for them: delete.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 include/linux/mm.h        | 17 -----------------
 include/linux/mmap_lock.h | 10 ----------
 2 files changed, 27 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2dd73e4f3d8e..b7b45be616ad 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -692,21 +692,6 @@ static inline void vma_start_write(struct vm_area_struct *vma)
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
@@ -731,8 +716,6 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
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

