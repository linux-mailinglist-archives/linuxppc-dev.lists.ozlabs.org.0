Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DEA6D30B2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 14:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ppbfx6Hzmz3chK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 23:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PpbfP08dhz3cGr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 23:13:28 +1100 (AEDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PpbZH6cNNz17LnP;
	Sat,  1 Apr 2023 20:09:59 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 1 Apr 2023 20:12:30 +0800
Subject: Re: [PATCH v8 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
From: Yicong Yang <yangyicong@huawei.com>
To: Punit Agrawal <punit.agrawal@bytedance.com>, <catalin.marinas@arm.com>
References: <20230329035512.57392-1-yangyicong@huawei.com>
 <20230329035512.57392-3-yangyicong@huawei.com> <87cz4qwfbt.fsf_-_@stealth>
 <2687a998-6dbe-de8f-2f62-1456d2de7940@huawei.com>
Message-ID: <241c3a4c-642e-e871-72ae-e3098a967b69@huawei.com>
Date: Sat, 1 Apr 2023 20:12:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2687a998-6dbe-de8f-2f62-1456d2de7940@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@Huawei.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/3/30 21:45, Yicong Yang wrote:
> Hi Punit,
> 
> On 2023/3/30 21:15, Punit Agrawal wrote:
>> Hi Yicong,
>>
>> Yicong Yang <yangyicong@huawei.com> writes:
>>
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> on x86, batched and deferred tlb shootdown has lead to 90%
>>> performance increase on tlb shootdown. on arm64, HW can do
>>> tlb shootdown without software IPI. But sync tlbi is still
>>> quite expensive.
>>>
>>> Even running a simplest program which requires swapout can
>>> prove this is true,
>>>  #include <sys/types.h>
>>>  #include <unistd.h>
>>>  #include <sys/mman.h>
>>>  #include <string.h>
>>>
>>>  int main()
>>>  {
>>>  #define SIZE (1 * 1024 * 1024)
>>>          volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>>>                                           MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>>>
>>>          memset(p, 0x88, SIZE);
>>>
>>>          for (int k = 0; k < 10000; k++) {
>>>                  /* swap in */
>>>                  for (int i = 0; i < SIZE; i += 4096) {
>>>                          (void)p[i];
>>>                  }
>>>
>>>                  /* swap out */
>>>                  madvise(p, SIZE, MADV_PAGEOUT);
>>>          }
>>>  }
>>>
>>> Perf result on snapdragon 888 with 8 cores by using zRAM
>>> as the swap block device.
>>>
>>>  ~ # perf record taskset -c 4 ./a.out
>>>  [ perf record: Woken up 10 times to write data ]
>>>  [ perf record: Captured and wrote 2.297 MB perf.data (60084 samples) ]
>>>  ~ # perf report
>>>  # To display the perf.data header info, please use --header/--header-only options.
>>>  # To display the perf.data header info, please use --header/--header-only options.
>>>  #
>>>  #
>>>  # Total Lost Samples: 0
>>>  #
>>>  # Samples: 60K of event 'cycles'
>>>  # Event count (approx.): 35706225414
>>>  #
>>>  # Overhead  Command  Shared Object      Symbol
>>>  # ........  .......  .................  .............................................................................
>>>  #
>>>     21.07%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irq
>>>      8.23%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestore
>>>      6.67%  a.out    [kernel.kallsyms]  [k] filemap_map_pages
>>>      6.16%  a.out    [kernel.kallsyms]  [k] __zram_bvec_write
>>>      5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>>>      3.71%  a.out    [kernel.kallsyms]  [k] _raw_spin_lock
>>>      3.49%  a.out    [kernel.kallsyms]  [k] memset64
>>>      1.63%  a.out    [kernel.kallsyms]  [k] clear_page
>>>      1.42%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock
>>>      1.26%  a.out    [kernel.kallsyms]  [k] mod_zone_state.llvm.8525150236079521930
>>>      1.23%  a.out    [kernel.kallsyms]  [k] xas_load
>>>      1.15%  a.out    [kernel.kallsyms]  [k] zram_slot_lock
>>>
>>> ptep_clear_flush() takes 5.36% CPU in the micro-benchmark
>>> swapping in/out a page mapped by only one process. If the
>>> page is mapped by multiple processes, typically, like more
>>> than 100 on a phone, the overhead would be much higher as
>>> we have to run tlb flush 100 times for one single page.
>>> Plus, tlb flush overhead will increase with the number
>>> of CPU cores due to the bad scalability of tlb shootdown
>>> in HW, so those ARM64 servers should expect much higher
>>> overhead.
>>>
>>> Further perf annonate shows 95% cpu time of ptep_clear_flush
>>> is actually used by the final dsb() to wait for the completion
>>> of tlb flush. This provides us a very good chance to leverage
>>> the existing batched tlb in kernel. The minimum modification
>>> is that we only send async tlbi in the first stage and we send
>>> dsb while we have to sync in the second stage.
>>>
>>> With the above simplest micro benchmark, collapsed time to
>>> finish the program decreases around 5%.
>>>
>>> Typical collapsed time w/o patch:
>>>  ~ # time taskset -c 4 ./a.out
>>>  0.21user 14.34system 0:14.69elapsed
>>> w/ patch:
>>>  ~ # time taskset -c 4 ./a.out
>>>  0.22user 13.45system 0:13.80elapsed
>>>
>>> Also, Yicong Yang added the following observation.
>>> 	Tested with benchmark in the commit on Kunpeng920 arm64 server,
>>> 	observed an improvement around 12.5% with command
>>> 	`time ./swap_bench`.
>>> 		w/o		w/
>>> 	real	0m13.460s	0m11.771s
>>> 	user	0m0.248s	0m0.279s
>>> 	sys	0m12.039s	0m11.458s
>>>
>>> 	Originally it's noticed a 16.99% overhead of ptep_clear_flush()
>>> 	which has been eliminated by this patch:
>>>
>>> 	[root@localhost yang]# perf record -- ./swap_bench && perf report
>>> 	[...]
>>> 	16.99%  swap_bench  [kernel.kallsyms]  [k] ptep_clear_flush
>>>
>>> It is tested on 4,8,128 CPU platforms and shows to be beneficial on
>>> large systems but may not have improvement on small systems like on
>>> a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
>>> on CONFIG_EXPERT for this stage and make this disabled on systems
>>> with less than 8 CPUs. User can modify this threshold according to
>>> their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
>>
>> The commit log and the patch disagree on the name of the config option
>> (CONFIG_NR_CPUS_FOR_BATCHED_TLB vs CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB).
>>
> 
> ah yes, it's a typo and I'll fix it.
> 
>> But more importantly, I was wondering why this posting doesn't address
>> Catalin's feedback [a] about using a runtime tunable. Maybe I missed the
>> follow-up discussion.
>>
> 

So I used below patch based on this to provide a knob /proc/sys/vm/batched_tlb_enabled
for turning on/off the batched TLB. But wondering flush.c is the best place for putting
this, any comments?

Thanks.

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 41a763cf8c1b..2b2c69c23b47 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -280,6 +280,8 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,

 #ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH

+extern struct static_key_false batched_tlb_enabled;
+
 static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 {
        /*
@@ -289,7 +291,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
         * a threshold for enabling this to avoid potential side effects on
         * these platforms.
         */
-       if (num_online_cpus() < CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
+       if (!static_branch_unlikely(&batched_tlb_enabled))
                return false;

        /*
diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
index 5f9379b3c8c8..ce3bc32523f7 100644
--- a/arch/arm64/mm/flush.c
+++ b/arch/arm64/mm/flush.c
@@ -7,8 +7,10 @@
  */

 #include <linux/export.h>
+#include <linux/jump_label.h>
 #include <linux/mm.h>
 #include <linux/pagemap.h>
+#include <linux/sysctl.h>

 #include <asm/cacheflush.h>
 #include <asm/cache.h>
@@ -107,3 +109,53 @@ void arch_invalidate_pmem(void *addr, size_t size)
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
 #endif
+
+#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
+
+DEFINE_STATIC_KEY_FALSE(batched_tlb_enabled);
+
+int batched_tlb_enabled_handler(struct ctl_table *table, int write,
+                                     void *buffer, size_t *lenp, loff_t *ppos)
+{
+       unsigned int enabled = static_branch_unlikely(&batched_tlb_enabled);
+       struct ctl_table t;
+       int err;
+
+       if (write && !capable(CAP_SYS_ADMIN))
+               return -EPERM;
+
+       t = *table;
+       t.data = &enabled;
+       err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
+       if (!err && write) {
+               if (enabled)
+                       static_branch_enable(&batched_tlb_enabled);
+               else
+                       static_branch_disable(&batched_tlb_enabled);
+       }
+
+       return err;
+}
+
+static struct ctl_table batched_tlb_sysctls[] = {
+       {
+               .procname       = "batched_tlb_enabled",
+               .data           = NULL,
+               .maxlen         = sizeof(unsigned int),
+               .mode           = 0644,
+               .proc_handler   = batched_tlb_enabled_handler,
+               .extra1         = SYSCTL_ZERO,
+               .extra2         = SYSCTL_ONE,
+       },
+       {}
+};
+
+static int __init batched_tlb_sysctls_init(void)
+{
+       register_sysctl_init("vm", batched_tlb_sysctls);
+
+       return 0;
+}
+late_initcall(batched_tlb_sysctls_init);
+
+#endif

