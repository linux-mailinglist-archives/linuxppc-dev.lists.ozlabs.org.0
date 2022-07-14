Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0714C57421C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 06:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk1KL6v81z3cdx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 14:12:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=xhao@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 311 seconds by postgrey-1.36 at boromir; Thu, 14 Jul 2022 13:34:22 AEST
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk0Tp22Lyz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 13:34:21 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=xhao@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0VJHMqdX_1657769336;
Received: from B-X3VXMD6M-2058.local(mailfrom:xhao@linux.alibaba.com fp:SMTPD_---0VJHMqdX_1657769336)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 11:28:59 +0800
Subject: Re: [PATCH v2 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
References: <20220711034615.482895-1-21cnbao@gmail.com>
From: Xin Hao <xhao@linux.alibaba.com>
Message-ID: <24f5e25b-3946-b92a-975b-c34688005398@linux.alibaba.com>
Date: Thu, 14 Jul 2022 11:28:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220711034615.482895-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Jul 2022 14:11:47 +1000
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
Reply-To: xhao@linux.alibaba.com
Cc: linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, arnd@arndb.de, corbet@lwn.net, realmz6@gmail.com, linux-kernel@vger.kernel.org, yangyicong@hisilicon.com, openrisc@lists.librecores.org, darren@os.amperecomputing.com, huzhanyuan@oppo.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi barry.

I do some test on Kunpeng arm64 machine use Unixbench.

The test  result as below.

One core, we can see the performance improvement above +30%.
./Run -c 1 -i 1 shell1
w/o
System Benchmarks Partial Index              BASELINE RESULT INDEX
Shell Scripts (1 concurrent)                     42.4 5481.0 1292.7
========
System Benchmarks Index Score (Partial Only)                         1292.7

w/
System Benchmarks Partial Index              BASELINE RESULT INDEX
Shell Scripts (1 concurrent)                     42.4 6974.6 1645.0
========
System Benchmarks Index Score (Partial Only)                         1645.0


But with whole cores, there have little performance degradation above -5%

./Run -c 96 -i 1 shell1
w/o
Shell Scripts (1 concurrent)                  80765.5 lpm   (60.0 s, 1 
samples)
System Benchmarks Partial Index              BASELINE RESULT INDEX
Shell Scripts (1 concurrent)                     42.4 80765.5 19048.5
========
System Benchmarks Index Score (Partial Only)                        19048.5

w
Shell Scripts (1 concurrent)                  76333.6 lpm   (60.0 s, 1 
samples)
System Benchmarks Partial Index              BASELINE RESULT INDEX
Shell Scripts (1 concurrent)                     42.4 76333.6 18003.2
========
System Benchmarks Index Score (Partial Only)                        18003.2

---------------------------------------------------------------------------------------------- 


After discuss with you, and do some changes in the patch.

ndex a52381a680db..1ecba81f1277 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -727,7 +727,11 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
         int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;

         if (pending != flushed) {
+#ifdef CONFIG_ARCH_HAS_MM_CPUMASK
                 flush_tlb_mm(mm);
+#else
+               dsb(ish);
+#endif
                 /*
                  * If the new TLB flushing is pending during flushing, leave
                  * mm->tlb_flush_batched as is, to avoid losing flushing.

there have a performance improvement with whole cores, above +30%

./Run -c 96 -i 1 shell1
96 CPUs in system; running 96 parallel copies of tests

Shell Scripts (1 concurrent)                 109229.0 lpm   (60.0 s, 1 samples)
System Benchmarks Partial Index              BASELINE       RESULT    INDEX
Shell Scripts (1 concurrent)                     42.4     109229.0  25761.6
                                                                    ========
System Benchmarks Index Score (Partial Only)                        25761.6


Tested-by: Xin Hao<xhao@linux.alibaba.com>

Looking forward to your next version patch.

On 7/11/22 11:46 AM, Barry Song wrote:
> Though ARM64 has the hardware to do tlb shootdown, the hardware
> broadcasting is not free.
> A simplest micro benchmark shows even on snapdragon 888 with only
> 8 cores, the overhead for ptep_clear_flush is huge even for paging
> out one page mapped by only one process:
> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>
> While pages are mapped by multiple processes or HW has more CPUs,
> the cost should become even higher due to the bad scalability of
> tlb shootdown.
>
> The same benchmark can result in 16.99% CPU consumption on ARM64
> server with around 100 cores according to Yicong's test on patch
> 4/4.
>
> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
> 1. only send tlbi instructions in the first stage -
> 	arch_tlbbatch_add_mm()
> 2. wait for the completion of tlbi by dsb while doing tlbbatch
> 	sync in arch_tlbbatch_flush()
> My testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
>
>
> -v2:
> 1. Collected Yicong's test result on kunpeng920 ARM64 server;
> 2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
>     according to the comments of Peter Zijlstra and Dave Hansen
> 3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
>     is empty according to the comments of Nadav Amit
>
> Thanks, Yicong, Peter, Dave and Nadav for your testing or reviewing
> , and comments.
>
> -v1:
> https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/
>
> Barry Song (4):
>    Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
>      apply to ARM64"
>    mm: rmap: Allow platforms without mm_cpumask to defer TLB flush
>    mm: rmap: Extend tlbbatch APIs to fit new platforms
>    arm64: support batched/deferred tlb shootdown during page reclamation
>
>   Documentation/features/arch-support.txt       |  1 -
>   .../features/vm/TLB/arch-support.txt          |  2 +-
>   arch/arm/Kconfig                              |  1 +
>   arch/arm64/Kconfig                            |  1 +
>   arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++++
>   arch/arm64/include/asm/tlbflush.h             | 23 +++++++++++++++++--
>   arch/loongarch/Kconfig                        |  1 +
>   arch/mips/Kconfig                             |  1 +
>   arch/openrisc/Kconfig                         |  1 +
>   arch/powerpc/Kconfig                          |  1 +
>   arch/riscv/Kconfig                            |  1 +
>   arch/s390/Kconfig                             |  1 +
>   arch/um/Kconfig                               |  1 +
>   arch/x86/Kconfig                              |  1 +
>   arch/x86/include/asm/tlbflush.h               |  3 ++-
>   mm/Kconfig                                    |  3 +++
>   mm/rmap.c                                     | 14 +++++++----
>   17 files changed, 59 insertions(+), 9 deletions(-)
>   create mode 100644 arch/arm64/include/asm/tlbbatch.h
>
-- 
Best Regards!
Xin Hao

