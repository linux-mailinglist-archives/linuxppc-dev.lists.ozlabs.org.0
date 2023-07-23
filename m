Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92975E595
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 00:36:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=3D27d8ya;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8J6W1PR6z3cPl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 08:36:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=3D27d8ya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8J5c4PTsz2yTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 08:35:16 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-583d63ca1e9so10920287b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jul 2023 15:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690151713; x=1690756513;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUSbSB2mCMfMFHAYxwRiQA3gIugwk2fGEbZY8GkEjTo=;
        b=3D27d8ya3vH0G/T1jCu15x5AB5T1ggT7k5ACBc7anAc8xRgePijSQXSDiSm43Rtdh1
         kx0UzJnzgxBuY1qbYtXNkgP13NjfozHbR3s5RL7gEp/LqfrpbQMKGmbsjPIaxORFr1cn
         g3q7oTpKvwP6F6pOMrUCrCmobjOeS4eLDXeFPDDj+Tq3VFAXi+uglQvkX5ElcZp2o06/
         D9us/8JBSWfFkbtl/MPsnAA2aeXKMk3gFJ1Tdu2RXf584E+VT51mNdtOUO1BMd3X4iwk
         Hec7/X8hj5u47rEw4cY/omhxJZJMKe3jU3Jpzpr11vI7NFWmcQMEo/DbeQo01HQvoy1p
         B6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690151713; x=1690756513;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUSbSB2mCMfMFHAYxwRiQA3gIugwk2fGEbZY8GkEjTo=;
        b=LJJfbLismi2OhJ2bd7ymY68n2X+3IegHCId6Ss7IMb0MPIdgDYrYjwEEfRZd28v+R1
         dzRLqgeAhIfcGEgv0OtuZUc63SO3/u1Xrc3kI5sCnNpag9a90flezf2fa/+IjROK4iBY
         t6zXzHXLVr9O5wHllR2GxEnLUXs/Img8FPRzepWKbVYK83xqKZy1ne7Bl9TKmH1vLi/f
         SfjLikqDELVvZcIngfDgl+H+NOsGoQEEWLd+uQyyWx/tZFXL0U2ae2NMoha2gB35nhbH
         Qp4YwI24RMoNz40Rgi9zI1WylI6sU/y8ckquDnaPjp41+XsXH7mDT1VsKR74ZlfGslsf
         NIWg==
X-Gm-Message-State: ABy/qLYDF++zyt0lUG/IWXGtmMC3tcKM0J45ZbWg2ZZ95Y6BW7nD5l04
	Uydi3duOuz+wtAtqjXtYprsGjw==
X-Google-Smtp-Source: APBJJlHu4gcYD0JKCreqQkRpf7N8PwoJpBQrx7bHnSSrbqs6cYtIiCQ7XOr0psELtSbwDmhcixB5CQ==
X-Received: by 2002:a81:88c6:0:b0:579:ed5f:5cd3 with SMTP id y189-20020a8188c6000000b00579ed5f5cd3mr5903716ywf.23.1690151712917;
        Sun, 23 Jul 2023 15:35:12 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id q2-20020a0de702000000b00565271801b6sm2442804ywe.59.2023.07.23.15.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 15:35:12 -0700 (PDT)
Date: Sun, 23 Jul 2023 15:35:07 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 11/13 fix] mm/khugepaged: delete khugepaged_collapse_pte_mapped_thps():
 fix
In-Reply-To: <a5dce57-6dfa-5559-4698-e817eb2f993@google.com>
Message-ID: <bfc6cab2-497f-32bf-dd5-98dc1987e4a9@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <a5dce57-6dfa-5559-4698-e817eb2f993@google.com>
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

Though not yet detected by syzbot, this commit was making the same
mistake with mmap_locked as the previous commit: fix that.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/khugepaged.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1c773db26e88..41913730db4c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2380,19 +2380,17 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 				mmap_locked = false;
 				*result = hpage_collapse_scan_file(mm,
 					khugepaged_scan.address, file, pgoff, cc);
+				fput(file);
 				if (*result == SCAN_PTE_MAPPED_HUGEPAGE) {
 					mmap_read_lock(mm);
-					mmap_locked = true;
-					if (hpage_collapse_test_exit(mm)) {
-						fput(file);
+					if (hpage_collapse_test_exit(mm))
 						goto breakouterloop;
-					}
 					*result = collapse_pte_mapped_thp(mm,
 						khugepaged_scan.address, false);
 					if (*result == SCAN_PMD_MAPPED)
 						*result = SCAN_SUCCEED;
+					mmap_read_unlock(mm);
 				}
-				fput(file);
 			} else {
 				*result = hpage_collapse_scan_pmd(mm, vma,
 					khugepaged_scan.address, &mmap_locked, cc);
-- 
2.35.3

