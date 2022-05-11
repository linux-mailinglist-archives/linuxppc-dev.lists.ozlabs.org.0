Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4751523292
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 14:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kytt455qhz3dsq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 22:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.56;
 helo=out30-56.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KytrX2tMbz3cDM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 22:05:00 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=32; SR=0;
 TI=SMTPD_---0VCw.G9V_1652270670; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCw.G9V_1652270670) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 11 May 2022 20:04:31 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	mike.kravetz@oracle.com
Subject: [PATCH v4 0/3] Fix CONT-PTE/PMD size hugetlb issue when unmapping or
 migrating
Date: Wed, 11 May 2022 20:04:16 +0800
Message-Id: <cover.1652270205.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, baolin.wang@linux.alibaba.com,
 songmuchun@bytedance.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, svens@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Now migrating a hugetlb page or unmapping a poisoned hugetlb page, we'll
use ptep_clear_flush() and set_pte_at() to nuke the page table entry
and remap it, and this is incorrect for CONT-PTE or CONT-PMD size hugetlb
page, which will cause potential data consistent issue. This patch set
will change to use hugetlb related APIs to fix this issue, please find
details in each patch. Thanks.

Note: Mike pointed out the huge_ptep_get() will only return the one specific
value, and it would not take into account the dirty or young bits of CONT-PTE/PMDs
like the huge_ptep_get_and_clear() [1]. This inconsistent issue is not introduced
by this patch set, and will address this issue in another thread [2]. Meanwhile
the uffd for hugetlb case [3] pointed by Gerald also need another patch to address.

[1] https://lore.kernel.org/linux-mm/85bd80b4-b4fd-0d3f-a2e5-149559f2f387@oracle.com/
[2] https://lore.kernel.org/all/cover.1651998586.git.baolin.wang@linux.alibaba.com/
[3] https://lore.kernel.org/linux-mm/20220503120343.6264e126@thinkpad/

Changes from v3:
 - Fix building errors for !CONFIG_MMU.

Changes from v2:
 - Collect reviewed tags from Muchun and Mike.
 - Drop the unnecessary casting in hugetlb.c.
 - Fix building errors with adding dummy functions for !CONFIG_HUGETLB_PAGE.

Changes from v1:
 - Add acked tag from Mike.
 - Update some commit message.
 - Add VM_BUG_ON in try_to_unmap() for hugetlb case.
 - Add an explict void casting for huge_ptep_clear_flush() in hugetlb.c.

Baolin Wang (3):
  mm: change huge_ptep_clear_flush() to return the original pte
  mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when migration
  mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when unmapping

 arch/arm64/include/asm/hugetlb.h   |  4 +--
 arch/arm64/mm/hugetlbpage.c        | 12 +++-----
 arch/ia64/include/asm/hugetlb.h    |  5 +--
 arch/mips/include/asm/hugetlb.h    |  9 ++++--
 arch/parisc/include/asm/hugetlb.h  |  5 +--
 arch/powerpc/include/asm/hugetlb.h |  9 ++++--
 arch/s390/include/asm/hugetlb.h    |  6 ++--
 arch/sh/include/asm/hugetlb.h      |  5 +--
 arch/sparc/include/asm/hugetlb.h   |  5 +--
 include/asm-generic/hugetlb.h      |  4 +--
 include/linux/hugetlb.h            | 11 +++++++
 mm/rmap.c                          | 63 ++++++++++++++++++++++++--------------
 12 files changed, 87 insertions(+), 51 deletions(-)

-- 
1.8.3.1

