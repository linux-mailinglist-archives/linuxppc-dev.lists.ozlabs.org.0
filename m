Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7977138B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 06:00:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=fPoU/fRu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJQhn07dhz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 14:00:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=fPoU/fRu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJQgr566zz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Aug 2023 13:59:36 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5844bb9923eso39993247b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Aug 2023 20:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691294373; x=1691899173;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lrjEl367R/y3HI+4JKvQ0DDl1pq1Lit9a0Zn8ubupwU=;
        b=fPoU/fRuHX5caeTxQNTi6xCx7rooozWVX8OCkvcRFbiVcZeihuuZZlQmHVtAw45YAU
         kFT79lh292tEMsPH0yFic9OWUawFTESm7xFiS7iMD5hNLVpkpBLE1WwEzPp8KYPc9FvH
         766vba+m+Ozk/SUm7hZshVAuKp3hxt+fVNapmNcBwnLA8Tu4o53ObK+EGCiIS1gfH4rG
         uel9HuMTx0Oe+VPeKFnHbRMjn+5QkVxnK6oa0BwRKKK/2LR8eKx9092x6l95LvzWPB4R
         /SFh7mg0lNI5CkVsjDsRo/ouKCF7FXkkPaU6nGGyY8dfVtlmJW+KmCWlykivefXbbzzJ
         QLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691294373; x=1691899173;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrjEl367R/y3HI+4JKvQ0DDl1pq1Lit9a0Zn8ubupwU=;
        b=kmu2MavWkzpFY9UJu/YAMbftxAmKwq63S36xvAcbmB3nctKa2WGVqh/hN+7xNvzG2u
         iP7xx9hL8CMlKZ56L35N2qTgcsWpAgCni4kPjrAuCZiOgZR6Vu8nWfMAKRqo9qBIN4sz
         mYBVb1l9EsdVYnEB5c1VOKH5O2ioLW2VnJf7suBMUhezqDBuBuM9fjCkyhYhkMwwLpGz
         AUmbdkWQ8E35xV9xo5xzmUyHsV3e33nXAu+2PLsAOqZ6N7zkecdoXYIgy2RZIZzoXm/G
         y07ytvcu2kv8GB1P67Wx3cc/yRHB36FlaMSsamMR1nB0mQb7Ml+ffRGYUj0b67Uy8Ysc
         y/1g==
X-Gm-Message-State: AOJu0YyK8fqORisVc6/bUyvw+NRcp2ZHPw2uNvz68+dY+FU1h9NDeHxj
	Dge0W0MLt8mexLmjUBQFmFZoOQ==
X-Google-Smtp-Source: AGHT+IEL/z5m+be82hvNIbgvVlYv0KrLIPiuRdrdQbyoEcvhg0nO6N3eCW4FBoXQZBwSKC83ZFZFiw==
X-Received: by 2002:a0d:e253:0:b0:584:189c:13ec with SMTP id l80-20020a0de253000000b00584189c13ecmr5953081ywe.21.1691294373186;
        Sat, 05 Aug 2023 20:59:33 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id p6-20020a815b06000000b00584554be59dsm1887384ywb.85.2023.08.05.20.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 20:59:32 -0700 (PDT)
Date: Sat, 5 Aug 2023 20:59:27 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/13 fix2] mm/khugepaged: collapse_pte_mapped_thp() with
 mmap_read_lock(): fix2
In-Reply-To: <0df84f9f-e9b0-80b1-4c9e-95abc1a73a96@bytedance.com>
Message-ID: <e0197433-8a47-6a65-534d-eda26eeb78b0@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com> <0df84f9f-e9b0-80b1-4c9e-95abc1a73a96@bytedance.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hel
 lstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use ptep_clear() instead of pte_clear(): when CONFIG_PAGE_TABLE_CHECK=y,
ptep_clear() adds some accounting, missing which would cause a BUG later.

Signed-off-by: Hugh Dickins <hughd@google.com>
Reported-by: Qi Zheng <zhengqi.arch@bytedance.com>
Closes: https://lore.kernel.org/linux-mm/0df84f9f-e9b0-80b1-4c9e-95abc1a73a96@bytedance.com/
---
 mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index bb76a5d454de..78fc1a24a1cc 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1603,7 +1603,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		 * TLB flush can be left until pmdp_collapse_flush() does it.
 		 * PTE dirty? Shmem page is already dirty; file is read-only.
 		 */
-		pte_clear(mm, addr, pte);
+		ptep_clear(mm, addr, pte);
 		page_remove_rmap(page, vma, false);
 		nr_ptes++;
 	}
-- 
2.35.3

