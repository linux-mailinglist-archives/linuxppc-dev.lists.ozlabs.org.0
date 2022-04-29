Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D034514A46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 15:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqXrR2YQCz3cMM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 23:09:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqQRC3hBpz3bYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 18:20:39 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VBgmoZg_1651220109; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VBgmoZg_1651220109) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 29 Apr 2022 16:15:10 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org, mike.kravetz@oracle.com,
 catalin.marinas@arm.com, will@kernel.org
Subject: [PATCH 0/3] Fix CONT-PTE/PMD size hugetlb issue when unmapping or
 migrating
Date: Fri, 29 Apr 2022 16:14:40 +0800
Message-Id: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Fri, 29 Apr 2022 23:08:22 +1000
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
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de,
 borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
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

Baolin Wang (3):
  mm: change huge_ptep_clear_flush() to return the original pte
  mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when migration
  mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when unmapping

 arch/arm64/include/asm/hugetlb.h   |  4 +--
 arch/arm64/mm/hugetlbpage.c        | 12 ++++----
 arch/ia64/include/asm/hugetlb.h    |  4 +--
 arch/mips/include/asm/hugetlb.h    |  9 ++++--
 arch/parisc/include/asm/hugetlb.h  |  4 +--
 arch/powerpc/include/asm/hugetlb.h |  9 ++++--
 arch/s390/include/asm/hugetlb.h    |  6 ++--
 arch/sh/include/asm/hugetlb.h      |  4 +--
 arch/sparc/include/asm/hugetlb.h   |  4 +--
 include/asm-generic/hugetlb.h      |  4 +--
 mm/rmap.c                          | 58 +++++++++++++++++++++++---------------
 11 files changed, 67 insertions(+), 51 deletions(-)

-- 
1.8.3.1

