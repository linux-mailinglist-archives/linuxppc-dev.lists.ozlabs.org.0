Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A18627710
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 09:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9hhT2mnbz3dvS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 19:06:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54; helo=out30-54.freemail.mail.aliyun.com; envelope-from=xhao@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir; Mon, 14 Nov 2022 19:05:32 AEDT
Received: from out30-54.freemail.mail.aliyun.com (out30-54.freemail.mail.aliyun.com [115.124.30.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9hgw4rFwz307C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 19:05:32 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xhao@linux.alibaba.com;NM=1;PH=DS;RN=32;SR=0;TI=SMTPD_---0VUjZSxU_1668412818;
Received: from 30.240.96.240(mailfrom:xhao@linux.alibaba.com fp:SMTPD_---0VUjZSxU_1668412818)
          by smtp.aliyun-inc.com;
          Mon, 14 Nov 2022 16:00:20 +0800
Message-ID: <9b6e1098-3d0a-d01c-ede2-344730a9450e@linux.alibaba.com>
Date: Mon, 14 Nov 2022 16:00:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 linux-doc@vger.kernel.org
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
From: haoxin <xhao@linux.alibaba.com>
In-Reply-To: <20221028081255.19157-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2022/10/28 下午4:12, Yicong Yang 写道:
> From: Barry Song <v-songbaohua@oppo.com>
>
> on x86, batched and deferred tlb shootdown has lead to 90%
> performance increase on tlb shootdown. on arm64, HW can do
> tlb shootdown without software IPI. But sync tlbi is still
> quite expensive.
>
> Even running a simplest program which requires swapout can
> prove this is true,
>   #include <sys/types.h>
>   #include <unistd.h>
>   #include <sys/mman.h>
>   #include <string.h>
>
>   int main()
>   {
>   #define SIZE (1 * 1024 * 1024)
>           volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>                                            MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>
>           memset(p, 0x88, SIZE);
>
>           for (int k = 0; k < 10000; k++) {
>                   /* swap in */
>                   for (int i = 0; i < SIZE; i += 4096) {
>                           (void)p[i];
>                   }
>
>                   /* swap out */
>                   madvise(p, SIZE, MADV_PAGEOUT);
>           }
>   }
>
> Perf result on snapdragon 888 with 8 cores by using zRAM
> as the swap block device.
>
>   ~ # perf record taskset -c 4 ./a.out
>   [ perf record: Woken up 10 times to write data ]
>   [ perf record: Captured and wrote 2.297 MB perf.data (60084 samples) ]
>   ~ # perf report
>   # To display the perf.data header info, please use --header/--header-only options.
>   # To display the perf.data header info, please use --header/--header-only options.
>   #
>   #
>   # Total Lost Samples: 0
>   #
>   # Samples: 60K of event 'cycles'
>   # Event count (approx.): 35706225414
>   #
>   # Overhead  Command  Shared Object      Symbol
>   # ........  .......  .................  .............................................................................
>   #
>      21.07%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irq
>       8.23%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestore
>       6.67%  a.out    [kernel.kallsyms]  [k] filemap_map_pages
>       6.16%  a.out    [kernel.kallsyms]  [k] __zram_bvec_write
>       5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>       3.71%  a.out    [kernel.kallsyms]  [k] _raw_spin_lock
>       3.49%  a.out    [kernel.kallsyms]  [k] memset64
>       1.63%  a.out    [kernel.kallsyms]  [k] clear_page
>       1.42%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock
>       1.26%  a.out    [kernel.kallsyms]  [k] mod_zone_state.llvm.8525150236079521930
>       1.23%  a.out    [kernel.kallsyms]  [k] xas_load
>       1.15%  a.out    [kernel.kallsyms]  [k] zram_slot_lock
>
> ptep_clear_flush() takes 5.36% CPU in the micro-benchmark
> swapping in/out a page mapped by only one process. If the
> page is mapped by multiple processes, typically, like more
> than 100 on a phone, the overhead would be much higher as
> we have to run tlb flush 100 times for one single page.
> Plus, tlb flush overhead will increase with the number
> of CPU cores due to the bad scalability of tlb shootdown
> in HW, so those ARM64 servers should expect much higher
> overhead.
>
> Further perf annonate shows 95% cpu time of ptep_clear_flush
> is actually used by the final dsb() to wait for the completion
> of tlb flush. This provides us a very good chance to leverage
> the existing batched tlb in kernel. The minimum modification
> is that we only send async tlbi in the first stage and we send
> dsb while we have to sync in the second stage.
>
> With the above simplest micro benchmark, collapsed time to
> finish the program decreases around 5%.
>
> Typical collapsed time w/o patch:
>   ~ # time taskset -c 4 ./a.out
>   0.21user 14.34system 0:14.69elapsed
> w/ patch:
>   ~ # time taskset -c 4 ./a.out
>   0.22user 13.45system 0:13.80elapsed
>
> Also, Yicong Yang added the following observation.
> 	Tested with benchmark in the commit on Kunpeng920 arm64 server,
> 	observed an improvement around 12.5% with command
> 	`time ./swap_bench`.
> 		w/o		w/
> 	real	0m13.460s	0m11.771s
> 	user	0m0.248s	0m0.279s
> 	sys	0m12.039s	0m11.458s
>
> 	Originally it's noticed a 16.99% overhead of ptep_clear_flush()
> 	which has been eliminated by this patch:
>
> 	[root@localhost yang]# perf record -- ./swap_bench && perf report
> 	[...]
> 	16.99%  swap_bench  [kernel.kallsyms]  [k] ptep_clear_flush
>
> It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> large systems but may not have improvement on small systems like on
> a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> on CONFIG_EXPERT for this stage and only make this enabled on systems
> with more than 8 CPUs. User can modify this threshold according to
> their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   .../features/vm/TLB/arch-support.txt          |  2 +-
>   arch/arm64/Kconfig                            |  6 +++
>   arch/arm64/include/asm/tlbbatch.h             | 12 +++++
>   arch/arm64/include/asm/tlbflush.h             | 46 ++++++++++++++++++-
>   arch/x86/include/asm/tlbflush.h               |  3 +-
>   mm/rmap.c                                     | 10 ++--
>   6 files changed, 71 insertions(+), 8 deletions(-)
>   create mode 100644 arch/arm64/include/asm/tlbbatch.h
>
> diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
> index 039e4e91ada3..2caf815d7c6c 100644
> --- a/Documentation/features/vm/TLB/arch-support.txt
> +++ b/Documentation/features/vm/TLB/arch-support.txt
> @@ -9,7 +9,7 @@
>       |       alpha: | TODO |
>       |         arc: | TODO |
>       |         arm: | TODO |
> -    |       arm64: | N/A  |
> +    |       arm64: |  ok  |
>       |        csky: | TODO |
>       |     hexagon: | TODO |
>       |        ia64: | TODO |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 505c8a1ccbe0..72975e82c7d7 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -93,6 +93,7 @@ config ARM64
>   	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>   	select ARCH_SUPPORTS_NUMA_BALANCING
>   	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT
>   	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>   	select ARCH_WANT_DEFAULT_BPF_JIT
>   	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> @@ -268,6 +269,11 @@ config ARM64_CONT_PMD_SHIFT
>   	default 5 if ARM64_16K_PAGES
>   	default 4
>   
> +config ARM64_NR_CPUS_FOR_BATCHED_TLB
> +	int "Threshold to enable batched TLB flush"
> +	default 8
> +	depends on ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> +
>   config ARCH_MMAP_RND_BITS_MIN
>   	default 14 if ARM64_64K_PAGES
>   	default 16 if ARM64_16K_PAGES
> diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
> new file mode 100644
> index 000000000000..fedb0b87b8db
> --- /dev/null
> +++ b/arch/arm64/include/asm/tlbbatch.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ARCH_ARM64_TLBBATCH_H
> +#define _ARCH_ARM64_TLBBATCH_H
> +
> +struct arch_tlbflush_unmap_batch {
> +	/*
> +	 * For arm64, HW can do tlb shootdown, so we don't
> +	 * need to record cpumask for sending IPI
> +	 */
> +};
> +
> +#endif /* _ARCH_ARM64_TLBBATCH_H */
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 412a3b9a3c25..b21cdeb57a18 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>   	dsb(ish);
>   }
>   
> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>   					 unsigned long uaddr)
>   {
>   	unsigned long addr;
>   
>   	dsb(ishst);
> -	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
> +	addr = __TLBI_VADDR(uaddr, ASID(mm));
>   	__tlbi(vale1is, addr);
>   	__tlbi_user(vale1is, addr);
>   }
>   
> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> +					 unsigned long uaddr)
> +{
> +	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
> +}
> +
>   static inline void flush_tlb_page(struct vm_area_struct *vma,
>   				  unsigned long uaddr)
>   {
> @@ -272,6 +278,42 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>   	dsb(ish);
>   }
>   
> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> +
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	/*
> +	 * TLB batched flush is proved to be beneficial for systems with large
> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
> +	 * is cheap on small systems which may not need this feature. So use
> +	 * a threshold for enabling this to avoid potential side effects on
> +	 * these platforms.
> +	 */
> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
> +		return false;
> +
> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
Maybe there need a comment  why set  ARM64_WORKAROUND_REPEAT_TLBI it 
should return false?
> +		return false;
> +#endif
> +
> +	return true;
> +}
> +
> +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> +					struct mm_struct *mm,
> +					unsigned long uaddr)
> +{
> +	__flush_tlb_page_nosync(mm, uaddr);
> +}
> +
> +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> +{
> +	dsb(ish);
> +}
> +
> +#endif /* CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH */
> +
>   /*
>    * This is meant to avoid soft lock-ups on large TLB flushing ranges and not
>    * necessarily a performance improvement.
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 8a497d902c16..5bd78ae55cd4 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -264,7 +264,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>   }
>   
>   static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> -					struct mm_struct *mm)
> +					struct mm_struct *mm,
> +					unsigned long uaddr)
>   {
>   	inc_mm_tlb_gen(mm);
>   	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a9ab10bc0144..a1b408ff44e5 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -640,12 +640,13 @@ void try_to_unmap_flush_dirty(void)
>   #define TLB_FLUSH_BATCH_PENDING_LARGE			\
>   	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
>   
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>   {
>   	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>   	int batch, nbatch;
>   
> -	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
> +	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
>   	tlb_ubc->flush_required = true;
>   
>   	/*
> @@ -723,7 +724,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>   	}
>   }
>   #else
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>   {
>   }
>   
> @@ -1596,7 +1598,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				 */
>   				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>   
> -				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> +				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
>   			} else {
>   				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>   			}
