Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FCD74D05F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 10:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzyDV6vrxz3bnx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzyCP1NGlz309q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 18:41:20 +1000 (AEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QzyBd1pnCz1FDnF;
	Mon, 10 Jul 2023 16:40:41 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 16:41:12 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <catalin.marinas@arm.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<will@kernel.org>, <anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>
Subject: [PATCH v10 4/4] arm64: support batched/deferred tlb shootdown during page reclamation/migration
Date: Mon, 10 Jul 2023 16:39:14 +0800
Message-ID: <20230710083914.18336-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230710083914.18336-1-yangyicong@huawei.com>
References: <20230710083914.18336-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, Jonathan.Cameron@Huawei.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Barry Song <v-songbaohua@oppo.com>

on x86, batched and deferred tlb shootdown has lead to 90%
performance increase on tlb shootdown. on arm64, HW can do
tlb shootdown without software IPI. But sync tlbi is still
quite expensive.

Even running a simplest program which requires swapout can
prove this is true,
 #include <sys/types.h>
 #include <unistd.h>
 #include <sys/mman.h>
 #include <string.h>

 int main()
 {
 #define SIZE (1 * 1024 * 1024)
         volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
                                          MAP_SHARED | MAP_ANONYMOUS, -1, 0);

         memset(p, 0x88, SIZE);

         for (int k = 0; k < 10000; k++) {
                 /* swap in */
                 for (int i = 0; i < SIZE; i += 4096) {
                         (void)p[i];
                 }

                 /* swap out */
                 madvise(p, SIZE, MADV_PAGEOUT);
         }
 }

Perf result on snapdragon 888 with 8 cores by using zRAM
as the swap block device.

 ~ # perf record taskset -c 4 ./a.out
 [ perf record: Woken up 10 times to write data ]
 [ perf record: Captured and wrote 2.297 MB perf.data (60084 samples) ]
 ~ # perf report
 # To display the perf.data header info, please use --header/--header-only options.
 # To display the perf.data header info, please use --header/--header-only options.
 #
 #
 # Total Lost Samples: 0
 #
 # Samples: 60K of event 'cycles'
 # Event count (approx.): 35706225414
 #
 # Overhead  Command  Shared Object      Symbol
 # ........  .......  .................  ......
 #
    21.07%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irq
     8.23%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestore
     6.67%  a.out    [kernel.kallsyms]  [k] filemap_map_pages
     6.16%  a.out    [kernel.kallsyms]  [k] __zram_bvec_write
     5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
     3.71%  a.out    [kernel.kallsyms]  [k] _raw_spin_lock
     3.49%  a.out    [kernel.kallsyms]  [k] memset64
     1.63%  a.out    [kernel.kallsyms]  [k] clear_page
     1.42%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock
     1.26%  a.out    [kernel.kallsyms]  [k] mod_zone_state.llvm.8525150236079521930
     1.23%  a.out    [kernel.kallsyms]  [k] xas_load
     1.15%  a.out    [kernel.kallsyms]  [k] zram_slot_lock

ptep_clear_flush() takes 5.36% CPU in the micro-benchmark
swapping in/out a page mapped by only one process. If the
page is mapped by multiple processes, typically, like more
than 100 on a phone, the overhead would be much higher as
we have to run tlb flush 100 times for one single page.
Plus, tlb flush overhead will increase with the number
of CPU cores due to the bad scalability of tlb shootdown
in HW, so those ARM64 servers should expect much higher
overhead.

Further perf annonate shows 95% cpu time of ptep_clear_flush
is actually used by the final dsb() to wait for the completion
of tlb flush. This provides us a very good chance to leverage
the existing batched tlb in kernel. The minimum modification
is that we only send async tlbi in the first stage and we send
dsb while we have to sync in the second stage.

With the above simplest micro benchmark, collapsed time to
finish the program decreases around 5%.

Typical collapsed time w/o patch:
 ~ # time taskset -c 4 ./a.out
 0.21user 14.34system 0:14.69elapsed
w/ patch:
 ~ # time taskset -c 4 ./a.out
 0.22user 13.45system 0:13.80elapsed

Also tested with benchmark in the commit on Kunpeng920 arm64 server
and observed an improvement around 12.5% with command
`time ./swap_bench`.
        w/o             w/
real    0m13.460s       0m11.771s
user    0m0.248s        0m0.279s
sys     0m12.039s       0m11.458s

Originally it's noticed a 16.99% overhead of ptep_clear_flush()
which has been eliminated by this patch:

[root@localhost yang]# perf record -- ./swap_bench && perf report
[...]
16.99%  swap_bench  [kernel.kallsyms]  [k] ptep_clear_flush

It is tested on 4,8,128 CPU platforms and shows to be beneficial on
large systems but may not have improvement on small systems like on
a 4 CPU platform. So make this depends on EXPERT at this stage for
tests on more small platforms.

Also this patch improve the performance of page migration. Using pmbench
and tries to migrate the pages of pmbench between node 0 and node 1 for
100 times for 1G memory, this patch decrease the time used around 20%
(prev 18.338318910 sec after 13.981866350 sec) and saved the time used
by ptep_clear_flush().

Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Nadav Amit <namit@vmware.com>
Cc: Mel Gorman <mgorman@suse.de>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Tested-by: Xin Hao <xhao@linux.alibaba.com>
Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Xin Hao <xhao@linux.alibaba.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 +++++
 arch/arm64/include/asm/tlbflush.h             | 48 +++++++++++++++++--
 4 files changed, 59 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 7f049c251a79..76208db88f3b 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | N/A  |
+    |       arm64: |  ok  |
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7856c3a3e35a..f0ce8208c57f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -96,6 +96,7 @@ config ARM64
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
new file mode 100644
index 000000000000..fedb0b87b8db
--- /dev/null
+++ b/arch/arm64/include/asm/tlbbatch.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ARCH_ARM64_TLBBATCH_H
+#define _ARCH_ARM64_TLBBATCH_H
+
+struct arch_tlbflush_unmap_batch {
+	/*
+	 * For arm64, HW can do tlb shootdown, so we don't
+	 * need to record cpumask for sending IPI
+	 */
+};
+
+#endif /* _ARCH_ARM64_TLBBATCH_H */
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 412a3b9a3c25..4bb9cec62e26 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	dsb(ish);
 }
 
-static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
-					 unsigned long uaddr)
+static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
+					   unsigned long uaddr)
 {
 	unsigned long addr;
 
 	dsb(ishst);
-	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
+	addr = __TLBI_VADDR(uaddr, ASID(mm));
 	__tlbi(vale1is, addr);
 	__tlbi_user(vale1is, addr);
 }
 
+static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
+					 unsigned long uaddr)
+{
+	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
+}
+
 static inline void flush_tlb_page(struct vm_area_struct *vma,
 				  unsigned long uaddr)
 {
@@ -272,6 +278,42 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 	dsb(ish);
 }
 
+#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
+
+static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
+{
+#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
+	/*
+	 * TLB flush deferral is not required on systems, which are affected with
+	 * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
+	 * will have two consecutive TLBI instructions with a dsb(ish) in between
+	 * defeating the purpose (i.e save overall 'dsb ish' cost).
+	 */
+	if (unlikely(cpus_have_const_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
+		return false;
+#endif
+	return true;
+}
+
+static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					     struct mm_struct *mm,
+					     unsigned long uaddr)
+{
+	__flush_tlb_page_nosync(mm, uaddr);
+}
+
+static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
+{
+	dsb(ish);
+}
+
+static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
+{
+	dsb(ish);
+}
+
+#endif /* CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH */
+
 /*
  * This is meant to avoid soft lock-ups on large TLB flushing ranges and not
  * necessarily a performance improvement.
-- 
2.24.0

