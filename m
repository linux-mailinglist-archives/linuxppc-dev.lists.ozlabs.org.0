Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED8F7563FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 15:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4MvF2ljTz2yVm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 23:12:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Mtl2FhXz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 23:12:10 +1000 (AEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R4Msk3BL7z18LY9;
	Mon, 17 Jul 2023 21:11:22 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 21:12:03 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <catalin.marinas@arm.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<will@kernel.org>, <anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>
Subject: [PATCH v11 0/4] arm64: support batched/deferred tlb shootdown during page reclamation/migration
Date: Mon, 17 Jul 2023 21:10:00 +0800
Message-ID: <20230717131004.12662-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, Jonathan.Cameron@Huawei.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yicong Yang <yangyicong@hisilicon.com>

Though ARM64 has the hardware to do tlb shootdown, the hardware broadcasting is
not free. A simplest micro benchmark shows even on snapdragon 888 with only
8 cores, the overhead for ptep_clear_flush is huge even for paging out one page
mapped by only one process:
5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush

While pages are mapped by multiple processes or HW has more CPUs, the cost should
become even higher due to the bad scalability of tlb shootdown. The same benchmark
can result in 16.99% CPU consumption on ARM64 server with around 100 cores
according to the test on patch 4/4.

This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
1. only send tlbi instructions in the first stage -
	arch_tlbbatch_add_mm()
2. wait for the completion of tlbi by dsb while doing tlbbatch
	sync in arch_tlbbatch_flush()

Testing on snapdragon shows the overhead of ptep_clear_flush is removed by the
patchset. The micro benchmark becomes 5% faster even for one page mapped by
single process on snapdragon 888.

Since BATCHED_UNMAP_TLB_FLUSH is implemented only on x86, the patchset does some
renaming/extension for the current implementation first (Patch 1-3), then add the
support on arm64 (Patch 4).

-v11:
- Enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH config unconditionally on arm64.
Link: https://lore.kernel.org/linux-mm/20230710083914.18336-1-yangyicong@huawei.com/T/#mc343b7e7c4a090392ef43b620af85a3eea76abad

-v10:
1. Enable BATCHED_UNMAP_TLB_FLUSH regardless of CPU numbers, per Catalin.
2. Split the renaming/extension works in a separate PATCH 2, per Catalin. Since
   it's split from PATCH 2/2 in v9, so inherit the tags.
3. Add arch_flush_tlb_batched_pending() to allow arch-specific implementation,
   per Catalin. Since it's some kind of an optimization on arm64 so a separate
   Patch 3/4.
Link: https://lore.kernel.org/linux-mm/20230518065934.12877-1-yangyicong@huawei.com/

-v9:
1. Using a runtime tunable to control batched TLB flush, per Catalin in v7.
   Sorry for missing this on v8.
Link: https://lore.kernel.org/all/20230329035512.57392-1-yangyicong@huawei.com/

-v8:
1. Rebase on 6.3-rc4
2. Tested the optimization on page migration and mentioned it in the commit
3. Thanks the review from Anshuman.
Link: https://lore.kernel.org/linux-mm/20221117082648.47526-1-yangyicong@huawei.com/

-v7:
1. rename arch_tlbbatch_add_mm() to arch_tlbbatch_add_pending() as suggested, since it
   takes an extra address for arm64, per Nadav and Anshuman. Also mentioned in the commit.
2. add tags from Xin Hao, thanks.
Link: https://lore.kernel.org/lkml/20221115031425.44640-1-yangyicong@huawei.com/

-v6:
1. comment we don't defer TLB flush on platforms affected by ARM64_WORKAROUND_REPEAT_TLBI
2. use cpus_have_const_cap() instead of this_cpu_has_cap()
3. add tags from Punit, Thanks.
4. default enable the feature when cpus >= 8 rather than > 8, since the original
   improvement is observed on snapdragon 888 with 8 cores.
Link: https://lore.kernel.org/lkml/20221028081255.19157-1-yangyicong@huawei.com/

-v5:
1. Make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends on EXPERT for this stage on arm64.
2. Make a threshold of CPU numbers for enabling batched TLP flush on arm64
Link: https://lore.kernel.org/linux-arm-kernel/20220921084302.43631-1-yangyicong@huawei.com/T/

-v4:
1. Add tags from Kefeng and Anshuman, Thanks.
2. Limit the TLB batch/defer on systems with >4 CPUs, per Anshuman
3. Merge previous Patch 1,2-3 into one, per Anshuman
Link: https://lore.kernel.org/linux-mm/20220822082120.8347-1-yangyicong@huawei.com/

-v3:
1. Declare arch's tlbbatch defer support by arch_tlbbatch_should_defer() instead
   of ARCH_HAS_MM_CPUMASK, per Barry and Kefeng
2. Add Tested-by from Xin Hao
Link: https://lore.kernel.org/linux-mm/20220711034615.482895-1-21cnbao@gmail.com/

-v2:
1. Collected Yicong's test result on kunpeng920 ARM64 server;
2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
   according to the comments of Peter Zijlstra and Dave Hansen
3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
   is empty according to the comments of Nadav Amit

Thanks, Peter, Dave and Nadav for your testing or reviewing
, and comments.

-v1:
https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/

Anshuman Khandual (1):
  mm/tlbbatch: Introduce arch_tlbbatch_should_defer()

Barry Song (2):
  mm/tlbbatch: Rename and extend some functions
  arm64: support batched/deferred tlb shootdown during page
    reclamation/migration

Yicong Yang (1):
  mm/tlbbatch: Introduce arch_flush_tlb_batched_pending()

 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 +++++
 arch/arm64/include/asm/tlbflush.h             | 44 +++++++++++++++++--
 arch/x86/include/asm/tlbflush.h               | 22 +++++++++-
 include/linux/mm_types_task.h                 |  4 +-
 mm/rmap.c                                     | 23 ++++------
 7 files changed, 86 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

-- 
2.24.0

