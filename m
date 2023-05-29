Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22471442C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:19:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV53C3dR0z3f88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:19:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1iA4YfG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1iA4YfG+;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV52M3kY5z3ckZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:18:51 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bacfc573647so4367481276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685341128; x=1687933128;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7tbEFbFk5pzLjwVra+37SCseEW8dJexk2Np2YDtZH+c=;
        b=1iA4YfG+l9uCrVK/VfGes1VI6E6dNElNmfH0Ym6MNMAOfLc3iDqikpG9Fh1kd0GZyN
         S2vDJSr0c2W4FoH5DTwBlYn9D4ysTNQfO/tuIIGYNqiQ41PKjRspMrJoqD8nN+1AW+Ll
         ZG2b3ePp7JtiTJ6Eed3Cy8FX00RyB15yPBCU8A7XIPIx+RIeQ7MpGS9HzfE/9OdJpx+S
         pAKYTbnfjluypjHVFpFATeSkHhnhYcVPl6qM+K8dkTFH6eXbpsYJ5LutgoPOrieOlSV3
         oZuduBLXP+Ip6U8GW3EdevUfmC5f9cH9uaENaWd8adKsUbZ/byUTAk7/38rOHk1lVCDe
         TGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685341128; x=1687933128;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tbEFbFk5pzLjwVra+37SCseEW8dJexk2Np2YDtZH+c=;
        b=AcXIkT1uIKXqYYzXHqubSsq/s1+yGuxXqDokao/l1n+stCpEGytfRaj+JdvJK0ciT4
         B+kNlEQ2ar/udVp1XDqNWlvIWOmzCkaSleeE17m0USQnSRkFzAhGo4ElORqNN+1ALWa7
         CGXhBVTs92vIJ7ntoWtvCYLzzLARekNvOXUYEyoDgvbJnwp1Padxcs9HVUG8kl7y1dpj
         A3ZbbT64GrPrWmShmnb1hF9037Zs/FFZeIRDJOHs/xdf7HPYg1Uib++J8gZDZWvME5jc
         dkJQpzYl0IO9/yxNZm7P1I2qsFToFR/p3ou6uiXaI4Ak+minVJl564UKu6Q8h8eE1IlB
         bGIg==
X-Gm-Message-State: AC+VfDwgBl366II6KCls+xN8wBuzs/FswBH4rDjgu48esIZCWNrHYCho
	dZ6l40csIkI2KYgRQWXNmE/ZZw==
X-Google-Smtp-Source: ACHHUZ5wa1HnlGmpMM6V73fepd9odIlgE0K/gNhr4bUAPSedVjgsksTyRpOUN3YO0dkzYJPD3+qKCw==
X-Received: by 2002:a81:6b09:0:b0:561:c147:1d46 with SMTP id g9-20020a816b09000000b00561c1471d46mr12682711ywc.9.1685341127900;
        Sun, 28 May 2023 23:18:47 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id m19-20020a819e13000000b00560c648ef1esm3382356ywj.72.2023.05.28.23.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:18:47 -0700 (PDT)
Date: Sun, 28 May 2023 23:18:43 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/12] powerpc: assert_pte_locked() use
 pte_offset_map_nolock()
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
Message-ID: <e51ac0fd-4f96-4728-925-bc54f09ec013@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
in assert_pte_locked().  BUG if pte_offset_map_nolock() fails: this is
stricter than the previous implementation, which skipped when pmd_none()
(with a comment on khugepaged collapse transitions): but wouldn't we want
to know, if an assert_pte_locked() caller can be racing such transitions?

This mod might cause new crashes: which either expose my ignorance, or
indicate issues to be fixed, or limit the usage of assert_pte_locked().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/mm/pgtable.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cb2dcdb18f8e..16b061af86d7 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -311,6 +311,8 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
+	pte_t *pte;
+	spinlock_t *ptl;
 
 	if (mm == &init_mm)
 		return;
@@ -321,16 +323,10 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	pud = pud_offset(p4d, addr);
 	BUG_ON(pud_none(*pud));
 	pmd = pmd_offset(pud, addr);
-	/*
-	 * khugepaged to collapse normal pages to hugepage, first set
-	 * pmd to none to force page fault/gup to take mmap_lock. After
-	 * pmd is set to none, we do a pte_clear which does this assertion
-	 * so if we find pmd none, return.
-	 */
-	if (pmd_none(*pmd))
-		return;
-	BUG_ON(!pmd_present(*pmd));
-	assert_spin_locked(pte_lockptr(mm, pmd));
+	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
+	BUG_ON(!pte);
+	assert_spin_locked(ptl);
+	pte_unmap(pte);
 }
 #endif /* CONFIG_DEBUG_VM */
 
-- 
2.35.3

