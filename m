Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73675E584
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 00:27:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iVLb6pAc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8HwF6wBbz3bXH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 08:27:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iVLb6pAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8HvL2Fr2z2yTc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 08:26:20 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-57a551ce7e9so46941157b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jul 2023 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690151175; x=1690755975;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrAdJXY/DYoZ1QqZrxUyGx5Ypm1XnUOGUxRagKc/Az8=;
        b=iVLb6pAcMPMbH+sKIFDKrp13WE2BH14wgf0sfLLhG3EUD8G/hlzddsk9BjOLwwBDek
         i4tMCHQWviMOQirYDf83bTCcJPZWFHJR7xkFk3VHd5hC7xG8MCrz4NcetF3qgqDqKUnu
         xAsV+Rie6eGsL074ig7H7XBphUKKdrVVeh2TIH148CpPb1+P0n1+X7jZdveWNOjVJ6Ba
         Kp6B7SozJs02j+R5YidTAfbP/CCuxGe3VqDtLCHCvJZKMpIS4f/D4qj/sIim49FJ+8/T
         kdqRCusHGpxIPd559J2JIVCjJWnkF/KB5ylzgPVROKPwcB7Y5HxAlrSuCa01u6hWj0LC
         1Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690151175; x=1690755975;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xrAdJXY/DYoZ1QqZrxUyGx5Ypm1XnUOGUxRagKc/Az8=;
        b=FudBPzzMslcSEmf0V0QNxNRvlT0k7cUSc1iZz+M+EAJcIvXP/tmRkJ1OnuBtluZoMi
         lA+WNPQUYwxkqv7IIh5Zf8yP8GEL9yWV8OORrbHeFTJ4JeA85b2FiKWSIBWaJJLBPP2i
         91ZAnDMnZqqv5VJw6DySVe3vgGUB/+fTBYE1yzIBmHuCgeEsMfmDF+PjuCcM56ftLvqT
         w3d3QlQg9909z8Dff77TYQ7aFldUrK8JZCXwTDZG3A/+26LHeDdTi4YF3YWtGXXlmxLF
         y9bfWNs+JeGZGKpAd3y7LIjgdy2OsEYKZbihKlZJiOzrXt7lsekg85W4B0tsuUhP2o5U
         AJEA==
X-Gm-Message-State: ABy/qLa3tWcoL3Sg0/UiHwIV/wXX2cjCPzPHWQE9nD4VGjMu2fysQ1lV
	j+K6i0mx1BsvpiyaWqVEcAi4hQ==
X-Google-Smtp-Source: APBJJlG9iREnJulltCfWnEIqWXVGbxKFPc9M2vviU+KVFolzwpucWCLcuiZJ3CMHwTth2+2e2Ovuug==
X-Received: by 2002:a81:7d88:0:b0:583:9018:6fbb with SMTP id y130-20020a817d88000000b0058390186fbbmr5157782ywc.37.1690151174666;
        Sun, 23 Jul 2023 15:26:14 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n124-20020a817282000000b00573898fb12bsm78328ywc.82.2023.07.23.15.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 15:26:13 -0700 (PDT)
Date: Sun, 23 Jul 2023 15:26:02 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 04/13 fix] powerpc: assert_pte_locked() use pte_offset_map_nolock():
 fix
In-Reply-To: <20230721131341.w5abuxcbohofpzwa@patel>
Message-ID: <c73d1543-532c-3da2-8cf2-a95363a14116@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <e8d56c95-c132-a82e-5f5f-7bb1b738b057@google.com> <87msztbiy8.fsf@linux.ibm.com> <392f311f-83ac-a5a2-d16e-2c7736d1b577@google.com> <6762c880-6d2b-233f-6786-7ad5b0472dc7@linux.ibm.com>
 <20230721131341.w5abuxcbohofpzwa@patel>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Ira Weiny <ira.weiny@intel.com>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <
 gor@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Camp bell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Will Deacon <will@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, Mel Gorman <mgorman@techsingularity.net>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Jay Patel <jaypatel@linux.ibm.com>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh points out that assert_pte_locked() still needs the pmd_none()
check, to stop crashing in khugepaged: restore that comment and check.

Andrew, when merging with original commit, please edit its 1st para to:

Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
in assert_pte_locked().  BUG if pte_offset_map_nolock() fails.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/mm/pgtable.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 16b061af86d7..a3dcdb2d5b4b 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -323,6 +323,14 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	pud = pud_offset(p4d, addr);
 	BUG_ON(pud_none(*pud));
 	pmd = pmd_offset(pud, addr);
+	/*
+	 * khugepaged to collapse normal pages to hugepage, first set
+	 * pmd to none to force page fault/gup to take mmap_lock. After
+	 * pmd is set to none, we do a pte_clear which does this assertion
+	 * so if we find pmd none, return.
+	 */
+	if (pmd_none(*pmd))
+		return;
 	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
 	BUG_ON(!pte);
 	assert_spin_locked(ptl);
-- 
2.35.3

