Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE674FE3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 06:34:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oKpaowvQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R14d70Vz6z3cCn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 14:34:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oKpaowvQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R14cG3RvRz304g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 14:33:17 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-c01e1c0402cso5788263276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689136394; x=1691728394;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3N9RNUACQk0rp/xTQEOUK2bEy9LceuxJNDbuu7Hdo=;
        b=oKpaowvQeaQUncOOMCvTBHmXQ/FtZl+zZp5+Fo04CzoCy9LRKSCy43wNQCF2w2abHG
         jYi2GRVb9SUA+cOJwBdOtClSXiZ2Z7OrQDz8b0C3ZKWCpyBSxxh9g0MDPDTlwWm1wpni
         MQq6dZQMaat5mVW33VG/Z/sJCOzOtM5JcugYkrHF0OjaZarDla2EabzCECYeLkptPTFA
         kvVOAdnkA+dARAIwQYkZ5QFG5BKKdFwsILzvRn8L6hIPQtsvNfCEpljLsKMHiBJ7Tb9i
         vvB9S1uM8vmPWQ9MN4Bos/RgNtKXVdLVIPeeQrun3EY+oUKy7MowWj11CHLrlgzQNYzJ
         ikwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689136394; x=1691728394;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3N9RNUACQk0rp/xTQEOUK2bEy9LceuxJNDbuu7Hdo=;
        b=Pr9UdOWijtkNO+gt1GY1NVuXUMvs4rw0oBvPzkjIg2yGjlkeKtJxyhgalfCXEj0TsX
         jYz9aR/qGx3trV4M2x+3tyrUISxTyIF9mh5iOMADvAwvmn6WPRDWa/ecq7bjRoHNhcUk
         retzIyuo5CZZJkPw0HkCIK4pE1SG6F8Sd/vfqFhc4gzQhyj0EVuylj2vrfRstDLS5DES
         y2Co7rgacNBi6euSVc/WQQwx2H7wtFNNAx5pQbvyZHr1oHao3KuK0dTCoRn25+su/AaO
         C8WUYdcoUi7+y4xDtv5drodmniK29j4j098xYjLYWrrX1j3H55jKyFisLgMTP0z5OB17
         5j7g==
X-Gm-Message-State: ABy/qLafPkTtz/lSbvi5E+9Vk9+f/PDNlRalXlNJPFSEG/YNXu1QXvl8
	iOTN3hQagLIfDbMgpMNXkGmhkA==
X-Google-Smtp-Source: APBJJlHtqAOgfTEvtz6FEYsO4J7wfUGe8UB05ARnUaznX7yxHAtr1BNRbw9aWEHw4YhpidgoA6BFwQ==
X-Received: by 2002:a5b:70d:0:b0:c01:308a:44f2 with SMTP id g13-20020a5b070d000000b00c01308a44f2mr13992957ybq.57.1689136393735;
        Tue, 11 Jul 2023 21:33:13 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b8-20020a252e48000000b00c61af359b15sm751502ybn.43.2023.07.11.21.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 21:33:13 -0700 (PDT)
Date: Tue, 11 Jul 2023 21:33:08 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 03/13] arm: adjust_pte() use pte_offset_map_nolock()
In-Reply-To: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com>
Message-ID: <4d5258bd-ffa0-018-253a-25f2c9b783f7@google.com>
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

Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
in adjust_pte(): because it gives the not-locked ptl for precisely that
pte, which the caller can then safely lock; whereas pte_lockptr() is not
so tightly coupled, because it dereferences the pmd pointer again.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/arm/mm/fault-armv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index ca5302b0b7ee..7cb125497976 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -117,11 +117,10 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	pte = pte_offset_map(pmd, address);
+	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
 	if (!pte)
 		return 0;
 
-	ptl = pte_lockptr(vma->vm_mm, pmd);
 	do_pte_lock(ptl);
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
-- 
2.35.3

