Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A6636124
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 15:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHNKY4GSQz3f37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 01:09:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHNK155cmz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 01:08:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815761FB;
	Wed, 23 Nov 2022 06:08:23 -0800 (PST)
Received: from [192.168.0.110] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F21F13F73B;
	Wed, 23 Nov 2022 06:08:06 -0800 (PST)
Message-ID: <16e3ac80-1d13-60f1-666b-a74fab92b7a6@arm.com>
Date: Wed, 23 Nov 2022 19:37:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
References: <20221117082648.47526-1-yangyicong@huawei.com>
 <20221117082648.47526-3-yangyicong@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20221117082648.47526-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/17/22 13:56, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> on x86, batched and deferred tlb shootdown has lead to 90%
> performance increase on tlb shootdown. on arm64, HW can do
> tlb shootdown without software IPI. But sync tlbi is still
> quite expensive.
> 
> Even running a simplest program which requires swapout can
> prove this is true,
>  #include <sys/types.h>
>  #include <unistd.h>
>  #include <sys/mman.h>
>  #include <string.h>
> 
>  int main()
>  {
>  #define SIZE (1 * 1024 * 1024)
>          volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>                                           MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> 
>          memset(p, 0x88, SIZE);
> 
>          for (int k = 0; k < 10000; k++) {
>                  /* swap in */
>                  for (int i = 0; i < SIZE; i += 4096) {
>                          (void)p[i];
>                  }
> 
>                  /* swap out */
>                  madvise(p, SIZE, MADV_PAGEOUT);
>          }
>  }
> 
> Perf result on snapdragon 888 with 8 cores by using zRAM
> as the swap block device.
> 
>  ~ # perf record taskset -c 4 ./a.out
>  [ perf record: Woken up 10 times to write data ]
>  [ perf record: Captured and wrote 2.297 MB perf.data (60084 samples) ]
>  ~ # perf report
>  # To display the perf.data header info, please use --header/--header-only options.
>  # To display the perf.data header info, please use --header/--header-only options.
>  #
>  #
>  # Total Lost Samples: 0
>  #
>  # Samples: 60K of event 'cycles'
>  # Event count (approx.): 35706225414
>  #
>  # Overhead  Command  Shared Object      Symbol
>  # ........  .......  .................  .............................................................................
>  #
>     21.07%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irq
>      8.23%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestore
>      6.67%  a.out    [kernel.kallsyms]  [k] filemap_map_pages
>      6.16%  a.out    [kernel.kallsyms]  [k] __zram_bvec_write
>      5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>      3.71%  a.out    [kernel.kallsyms]  [k] _raw_spin_lock
>      3.49%  a.out    [kernel.kallsyms]  [k] memset64
>      1.63%  a.out    [kernel.kallsyms]  [k] clear_page
>      1.42%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock
>      1.26%  a.out    [kernel.kallsyms]  [k] mod_zone_state.llvm.8525150236079521930
>      1.23%  a.out    [kernel.kallsyms]  [k] xas_load
>      1.15%  a.out    [kernel.kallsyms]  [k] zram_slot_lock
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
>  ~ # time taskset -c 4 ./a.out
>  0.21user 14.34system 0:14.69elapsed
> w/ patch:
>  ~ # time taskset -c 4 ./a.out
>  0.22user 13.45system 0:13.80elapsed
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
> on CONFIG_EXPERT for this stage and make this disabled on systems
> with less than 8 CPUs. User can modify this threshold according to
> their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
> 
> This patch extends arch_tlbbatch_add_mm() to take an address of the
> target page to support the feature on arm64. Also rename it to
> arch_tlbbatch_add_pending() to better match its function since we
> don't need to handle the mm on arm64 and add_mm is not proper.
> add_pending will make sense to both as on x86 we're pending the
> TLB flush operations while on arm64 we're pending the synchronize
> operations.
> 
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Xin Hao <xhao@linux.alibaba.com>
> ---

LGTM, FWIW.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  6 +++
>  arch/arm64/include/asm/tlbbatch.h             | 12 +++++
>  arch/arm64/include/asm/tlbflush.h             | 52 ++++++++++++++++++-
>  arch/x86/include/asm/tlbflush.h               |  5 +-
>  include/linux/mm_types_task.h                 |  4 +-
>  mm/rmap.c                                     | 10 ++--
>  7 files changed, 80 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/include/asm/tlbbatch.h
> 
> diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
> index 039e4e91ada3..2caf815d7c6c 100644
> --- a/Documentation/features/vm/TLB/arch-support.txt
> +++ b/Documentation/features/vm/TLB/arch-support.txt
> @@ -9,7 +9,7 @@
>      |       alpha: | TODO |
>      |         arc: | TODO |
>      |         arm: | TODO |
> -    |       arm64: | N/A  |
> +    |       arm64: |  ok  |
>      |        csky: | TODO |
>      |     hexagon: | TODO |
>      |        ia64: | TODO |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 505c8a1ccbe0..72975e82c7d7 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -93,6 +93,7 @@ config ARM64
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>  	select ARCH_WANT_DEFAULT_BPF_JIT
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> @@ -268,6 +269,11 @@ config ARM64_CONT_PMD_SHIFT
>  	default 5 if ARM64_16K_PAGES
>  	default 4
>  
> +config ARM64_NR_CPUS_FOR_BATCHED_TLB
> +	int "Threshold to enable batched TLB flush"
> +	default 8
> +	depends on ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> +
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 14 if ARM64_64K_PAGES
>  	default 16 if ARM64_16K_PAGES
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
> index 412a3b9a3c25..41a763cf8c1b 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	dsb(ish);
>  }
>  
> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>  					 unsigned long uaddr)
>  {
>  	unsigned long addr;
>  
>  	dsb(ishst);
> -	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
> +	addr = __TLBI_VADDR(uaddr, ASID(mm));
>  	__tlbi(vale1is, addr);
>  	__tlbi_user(vale1is, addr);
>  }
>  
> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> +					 unsigned long uaddr)
> +{
> +	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
> +}
> +
>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>  				  unsigned long uaddr)
>  {
> @@ -272,6 +278,48 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>  	dsb(ish);
>  }
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
> +	if (num_online_cpus() < CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
> +		return false;
> +
> +	/*
> +	 * TLB flush deferral is not required on systems, which are affected with
> +	 * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
> +	 * will have two consecutive TLBI instructions with a dsb(ish) in between
> +	 * defeating the purpose (i.e save overall 'dsb ish' cost).
> +	 */
> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> +	if (unlikely(cpus_have_const_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
> +		return false;
> +#endif
> +
> +	return true;
> +}
> +
> +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +					     struct mm_struct *mm,
> +					     unsigned long uaddr)
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
>  /*
>   * This is meant to avoid soft lock-ups on large TLB flushing ranges and not
>   * necessarily a performance improvement.
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 8a497d902c16..15cada9635c1 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -263,8 +263,9 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  	return atomic64_inc_return(&mm->context.tlb_gen);
>  }
>  
> -static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> -					struct mm_struct *mm)
> +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +					     struct mm_struct *mm,
> +					     unsigned long uaddr)
>  {
>  	inc_mm_tlb_gen(mm);
>  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index 0bb4b6da9993..b98098e81390 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -65,8 +65,8 @@ struct tlbflush_unmap_batch {
>  #ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	/*
>  	 * The arch code makes the following promise: generic code can modify a
> -	 * PTE, then call arch_tlbbatch_add_mm() (which internally provides all
> -	 * needed barriers), then call arch_tlbbatch_flush(), and the entries
> +	 * PTE, then call arch_tlbbatch_add_pending() (which internally provides
> +	 * all needed barriers), then call arch_tlbbatch_flush(), and the entries
>  	 * will be flushed on all CPUs by the time that arch_tlbbatch_flush()
>  	 * returns.
>  	 */
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a9ab10bc0144..603912aa3f19 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -640,12 +640,13 @@ void try_to_unmap_flush_dirty(void)
>  #define TLB_FLUSH_BATCH_PENDING_LARGE			\
>  	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
>  
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>  {
>  	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
>  	int batch, nbatch;
>  
> -	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
> +	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
>  	tlb_ubc->flush_required = true;
>  
>  	/*
> @@ -723,7 +724,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
>  	}
>  }
>  #else
> -static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
> +static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
> +				      unsigned long uaddr)
>  {
>  }
>  
> @@ -1596,7 +1598,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				 */
>  				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
>  
> -				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
> +				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
>  			} else {
>  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
>  			}
