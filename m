Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFE675E58F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 00:33:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6TW6tzdC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8J3V3KjFz3bnB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 08:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=6TW6tzdC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8J2Z6MtWz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 08:32:37 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5768a7e3adbso71437027b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jul 2023 15:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690151554; x=1690756354;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6mJ5yjUa61OKtsotomDyQc7p3NQ997kyi3UbHr9vQck=;
        b=6TW6tzdCv/zJZetW3at30hfzlMddap7Z7fj+GldyzIgigr6T/xHW6mjhCM4pvSj3Q5
         h5TyPuiLMyS54ezUO7aFMsJB86VYDD1vKE694/gkNGbdnL9iY77JcmkcNUGvyjawJaIq
         BjAE9MN2ZbLEq/LNBLIFuF2Ek09JgxgKNG9cXLscgacxJQ5lJbuWKmjJuALrca8xMAt3
         5DroplM2hCTuaQrXESdTEpiFCx+/8R7A51nPLTYCGWcc5xPkH47MNRHi+ctmstGgrSf9
         eVsau7CwzmMa2SBw+NS5ElWiu1xHP1FxRVmTB4ePG0Chh3dV63YJC00zhVrRRqL4zgXj
         HBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690151554; x=1690756354;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mJ5yjUa61OKtsotomDyQc7p3NQ997kyi3UbHr9vQck=;
        b=TixPwYusgZGnPcWv8A6Q4d/IvPqFAoI8GeWEPjRCu6vbOoSVnRII/anTdhg1avzxIF
         NAIKlnJg7picNvKQeQ44//jEMpd8LKxaTFTUe3gYfpbIv0CUiChMwZIgSxXc9K8jZEUM
         lEqSYiUfVEilVS6p0JiFU4X5kQL7ZsATjV/56Idwt+Dpt+uiNYrXZ481GBAV3T8dvn5y
         Lo05//ZFlpCOc8JNI1FBOC5zyOMuX9vFo12xw1DacYdTTq/YAIpP+gm8EG4rseMQgbGk
         DBHciTVz1VPeYAZ/kyhVDDs2OyB3Jouj1z9g5/zrlSKqu9zVi3BaFA9W9YumYW/8/BVr
         E0zw==
X-Gm-Message-State: ABy/qLbkcJ21EstmVWSf+L0hGYE77DKSHOFQDD69CMv3612P/ZU9W3/n
	EI60qLSFC3+Lcdr0AJLEWlGcYA==
X-Google-Smtp-Source: APBJJlHufBlazAq/Jg+6fKB/G5aofMpIvebr8HbzAqYoBP3QAOOO5H84n4F6vZlA+flxU3ygHkBQcw==
X-Received: by 2002:a0d:e211:0:b0:583:4064:a35f with SMTP id l17-20020a0de211000000b005834064a35fmr4569918ywe.23.1690151554487;
        Sun, 23 Jul 2023 15:32:34 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n189-20020a8172c6000000b005771bb5a25dsm2391276ywc.61.2023.07.23.15.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 15:32:34 -0700 (PDT)
Date: Sun, 23 Jul 2023 15:32:27 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/13 fix] mm/khugepaged: collapse_pte_mapped_thp() with
 mmap_read_lock(): fix
In-Reply-To: <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com>
Message-ID: <d3d9ff14-ef8-8f84-e160-bfa1f5794275@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com>
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

madvise_collapse() setting "mmap_locked = true" after calling
collapse_pte_mapped_thp() looked good but was wrong.  If the loop then
moves on to the next extent, mmap_locked assures it that "vma" has been
revalidated under mmap_lock, which was not the case: and led to UAFs,
crashes in __fput() or task_work_run(), even collapse_file()'s
VM_BUG_ON(start & (HPAGE_PMD_NR - 1)) - all detected by syzbot.

(collapse_pte_mapped_thp() does validate the vma that it works on:
but it's not passed in as an argument, collapse_pte_mapped_thp() finds
the vma for mm and addr by itself - which may by this time have changed
from the vma saved in madvise_collapse().)

Reported-by: syzbot+fe7b1487405295d29268@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/lkml/000000000000f9de430600ae05db@google.com/
Reported-by: syzbot+173cc8cfdfbbef6dd755@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-mm/000000000000e4b0f0060123ca40@google.com/
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 6bad69c0e4bd..1c773db26e88 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2747,7 +2747,7 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
 			BUG_ON(*prev);
 			mmap_read_lock(mm);
 			result = collapse_pte_mapped_thp(mm, addr, true);
-			mmap_locked = true;
+			mmap_read_unlock(mm);
 			goto handle_result;
 		/* Whitelisted set of results where continuing OK */
 		case SCAN_PMD_NULL:
-- 
2.35.3

