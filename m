Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9472236C79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 08:44:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KGNH0bXyzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 16:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=haiyanx.song@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KGM16pntzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 16:43:05 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 23:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; d="scan'208";a="182203962"
Received: from haiyan.sh.intel.com ([10.239.48.70])
 by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2019 23:42:55 -0700
Date: Thu, 6 Jun 2019 14:51:29 +0800
From: Haiyan Song <haiyanx.song@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v12 00/31] Speculative page faults
Message-ID: <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190416134522.17540-1-ldufour@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: jack@suse.cz, sergey.senozhatsky.work@gmail.com, peterz@infradead.org,
 Will Deacon <will.deacon@arm.com>, mhocko@kernel.org, linux-mm@kvack.org,
 paulus@samba.org, Punit Agrawal <punitagrawal@gmail.com>, hpa@zytor.com,
 Michel Lespinasse <walken@google.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrea Arcangeli <aarcange@redhat.com>, ak@linux.intel.com,
 Minchan Kim <minchan@kernel.org>, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 David Rientjes <rientjes@google.com>, paulmck@linux.vnet.ibm.com,
 npiggin@gmail.com, sj38.park@gmail.com, Jerome Glisse <jglisse@redhat.com>,
 dave@stgolabs.net, kemi.wang@intel.com, kirill@shutemov.name,
 Thomas Gleixner <tglx@linutronix.de>, zhong jiang <zhongjiang@huawei.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Regression test for v12 patch serials have been run on Intel 2s skylake platform,
some regressions were found by LKP-tools (linux kernel performance). Only tested the
cases that have been run and found regressions on v11 patch serials.

Get the patch serials from https://github.com/ldu4/linux/tree/spf-v12.
Kernel commit:
  base: a297558ad4479e0c9c5c14f3f69fe43113f72d1c (v5.1-rc4-mmotm-2019-04-09-17-51)
  head: 02c5a1f984a8061d075cfd74986ac8aa01d81064 (spf-v12)

Benchmark: will-it-scale
Download link: https://github.com/antonblanchard/will-it-scale/tree/master
Metrics: will-it-scale.per_thread_ops=threads/nr_cpu
test box: lkp-skl-2sp8(nr_cpu=72,memory=192G)
THP: enable / disable
nr_task: 100%

The following is benchmark results, tested 4 times for every case.

a). Enable THP
                                            base  %stddev   change    head   %stddev
will-it-scale.page_fault3.per_thread_ops    63216  �3%      -16.9%    52537   �4%
will-it-scale.page_fault2.per_thread_ops    36862           -9.8%     33256

b). Disable THP
                                            base  %stddev   change    head   %stddev
will-it-scale.page_fault3.per_thread_ops    65111           -18.6%    53023  �2%
will-it-scale.page_fault2.per_thread_ops    38164           -12.0%    33565

Best regards,
Haiyan Song

On Tue, Apr 16, 2019 at 03:44:51PM +0200, Laurent Dufour wrote:
> This is a port on kernel 5.1 of the work done by Peter Zijlstra to handle
> page fault without holding the mm semaphore [1].
> 
> The idea is to try to handle user space page faults without holding the
> mmap_sem. This should allow better concurrency for massively threaded
> process since the page fault handler will not wait for other threads memory
> layout change to be done, assuming that this change is done in another part
> of the process's memory space. This type of page fault is named speculative
> page fault. If the speculative page fault fails because a concurrency has
> been detected or because underlying PMD or PTE tables are not yet
> allocating, it is failing its processing and a regular page fault is then
> tried.
> 
> The speculative page fault (SPF) has to look for the VMA matching the fault
> address without holding the mmap_sem, this is done by protecting the MM RB
> tree with RCU and by using a reference counter on each VMA. When fetching a
> VMA under the RCU protection, the VMA's reference counter is incremented to
> ensure that the VMA will not freed in our back during the SPF
> processing. Once that processing is done the VMA's reference counter is
> decremented. To ensure that a VMA is still present when walking the RB tree
> locklessly, the VMA's reference counter is incremented when that VMA is
> linked in the RB tree. When the VMA is unlinked from the RB tree, its
> reference counter will be decremented at the end of the RCU grace period,
> ensuring it will be available during this time. This means that the VMA
> freeing could be delayed and could delay the file closing for file
> mapping. Since the SPF handler is not able to manage file mapping, file is
> closed synchronously and not during the RCU cleaning. This is safe since
> the page fault handler is aborting if a file pointer is associated to the
> VMA.
> 
> Using RCU fixes the overhead seen by Haiyan Song using the will-it-scale
> benchmark [2].
> 
> The VMA's attributes checked during the speculative page fault processing
> have to be protected against parallel changes. This is done by using a per
> VMA sequence lock. This sequence lock allows the speculative page fault
> handler to fast check for parallel changes in progress and to abort the
> speculative page fault in that case.
> 
> Once the VMA has been found, the speculative page fault handler would check
> for the VMA's attributes to verify that the page fault has to be handled
> correctly or not. Thus, the VMA is protected through a sequence lock which
> allows fast detection of concurrent VMA changes. If such a change is
> detected, the speculative page fault is aborted and a *classic* page fault
> is tried.  VMA sequence lockings are added when VMA attributes which are
> checked during the page fault are modified.
> 
> When the PTE is fetched, the VMA is checked to see if it has been changed,
> so once the page table is locked, the VMA is valid, so any other changes
> leading to touching this PTE will need to lock the page table, so no
> parallel change is possible at this time.
> 
> The locking of the PTE is done with interrupts disabled, this allows
> checking for the PMD to ensure that there is not an ongoing collapsing
> operation. Since khugepaged is firstly set the PMD to pmd_none and then is
> waiting for the other CPU to have caught the IPI interrupt, if the pmd is
> valid at the time the PTE is locked, we have the guarantee that the
> collapsing operation will have to wait on the PTE lock to move
> forward. This allows the SPF handler to map the PTE safely. If the PMD
> value is different from the one recorded at the beginning of the SPF
> operation, the classic page fault handler will be called to handle the
> operation while holding the mmap_sem. As the PTE lock is done with the
> interrupts disabled, the lock is done using spin_trylock() to avoid dead
> lock when handling a page fault while a TLB invalidate is requested by
> another CPU holding the PTE.
> 
> In pseudo code, this could be seen as:
>     speculative_page_fault()
>     {
> 	    vma = find_vma_rcu()
> 	    check vma sequence count
> 	    check vma's support
> 	    disable interrupt
> 		  check pgd,p4d,...,pte
> 		  save pmd and pte in vmf
> 		  save vma sequence counter in vmf
> 	    enable interrupt
> 	    check vma sequence count
> 	    handle_pte_fault(vma)
> 		    ..
> 		    page = alloc_page()
> 		    pte_map_lock()
> 			    disable interrupt
> 				    abort if sequence counter has changed
> 				    abort if pmd or pte has changed
> 				    pte map and lock
> 			    enable interrupt
> 		    if abort
> 		       free page
> 		       abort
> 		    ...
> 	    put_vma(vma)
>     }
>     
>     arch_fault_handler()
>     {
> 	    if (speculative_page_fault(&vma))
> 	       goto done
>     again:
> 	    lock(mmap_sem)
> 	    vma = find_vma();
> 	    handle_pte_fault(vma);
> 	    if retry
> 	       unlock(mmap_sem)
> 	       goto again;
>     done:
> 	    handle fault error
>     }
> 
> Support for THP is not done because when checking for the PMD, we can be
> confused by an in progress collapsing operation done by khugepaged. The
> issue is that pmd_none() could be true either if the PMD is not already
> populated or if the underlying PTE are in the way to be collapsed. So we
> cannot safely allocate a PMD if pmd_none() is true.
> 
> This series add a new software performance event named 'speculative-faults'
> or 'spf'. It counts the number of successful page fault event handled
> speculatively. When recording 'faults,spf' events, the faults one is
> counting the total number of page fault events while 'spf' is only counting
> the part of the faults processed speculatively.
> 
> There are some trace events introduced by this series. They allow
> identifying why the page faults were not processed speculatively. This
> doesn't take in account the faults generated by a monothreaded process
> which directly processed while holding the mmap_sem. This trace events are
> grouped in a system named 'pagefault', they are:
> 
>  - pagefault:spf_vma_changed : if the VMA has been changed in our back
>  - pagefault:spf_vma_noanon : the vma->anon_vma field was not yet set.
>  - pagefault:spf_vma_notsup : the VMA's type is not supported
>  - pagefault:spf_vma_access : the VMA's access right are not respected
>  - pagefault:spf_pmd_changed : the upper PMD pointer has changed in our
>  back.
> 
> To record all the related events, the easier is to run perf with the
> following arguments :
> $ perf stat -e 'faults,spf,pagefault:*' <command>
> 
> There is also a dedicated vmstat counter showing the number of successful
> page fault handled speculatively. I can be seen this way:
> $ grep speculative_pgfault /proc/vmstat
> 
> It is possible to deactivate the speculative page fault handler by echoing
> 0 in /proc/sys/vm/speculative_page_fault.
> 
> This series builds on top of v5.1-rc4-mmotm-2019-04-09-17-51 and is
> functional on x86, PowerPC. I cross built it on arm64 but I was not able to
> test it.
> 
> This series is also available on github [4].
> 
> ---------------------
> Real Workload results
> 
> Test using a "popular in memory multithreaded database product" on 128cores
> SMT8 Power system are in progress and I will come back with performance
> mesurement as soon as possible. With the previous series we seen up to 30%
> improvements in the number of transaction processed per second, and we hope
> this will be the case with this series too.
> 
> ------------------
> Benchmarks results
> 
> Base kernel is v5.1-rc4-mmotm-2019-04-09-17-51
> SPF is BASE + this series
> 
> Kernbench:
> ----------
> Here are the results on a 48 CPUs X86 system using kernbench on a 5.0
> kernel (kernel is build 5 times):
> 
> Average	Half load -j 24
> 		 Run	(std deviation)
> 		 BASE			SPF
> Elapsed	Time	 56.52   (1.39185)      56.256  (1.15106)       0.47% 
> User	Time	 980.018 (2.94734)      984.958 (1.98518)       -0.50%
> System	Time	 130.744 (1.19148)      133.616 (0.873573)      -2.20%
> Percent	CPU	 1965.6  (49.682)       1988.4  (40.035)        -1.16%
> Context	Switches 29926.6 (272.789)      30472.4 (109.569)       -1.82%
> Sleeps		 124793  (415.87)       125003  (591.008)       -0.17%
> 						
> Average	Optimal	load -j	48
> 		 Run	(std deviation)
> 		 BASE			SPF
> Elapsed	Time	 46.354  (0.917949)     45.968 (1.42786)        0.83% 
> User	Time	 1193.42 (224.96)       1196.78 (223.28)        -0.28%
> System	Time	 143.306 (13.2726)      146.177 (13.2659)       -2.00%
> Percent	CPU	 2668.6  (743.157)      2699.9 (753.767)        -1.17%
> Context	Switches 62268.3 (34097.1)      62721.7 (33999.1)       -0.73%
> Sleeps		 132556  (8222.99)      132607 (8077.6)         -0.04%
> 
> During a run on the SPF, perf events were captured:
>  Performance counter stats for '../kernbench -M':
>        525,873,132      faults
>                242      spf
>                  0      pagefault:spf_vma_changed
>                  0      pagefault:spf_vma_noanon
>                441      pagefault:spf_vma_notsup
>                  0      pagefault:spf_vma_access
>                  0      pagefault:spf_pmd_changed
> 
> Very few speculative page faults were recorded as most of the processes
> involved are monothreaded (sounds that on this architecture some threads
> were created during the kernel build processing).
> 
> Here are the kerbench results on a 1024 CPUs Power8 VM:
> 
> 5.1.0-rc4-mm1+				5.1.0-rc4-mm1-spf-rcu+
> Average Half load -j 512 Run (std deviation):
> Elapsed Time 	 52.52   (0.906697)	52.778  (0.510069)	-0.49%
> User Time 	 3855.43 (76.378)	3890.44 (73.0466)	-0.91%
> System Time 	 1977.24 (182.316)	1974.56 (166.097)	0.14% 
> Percent CPU 	 11111.6 (540.461)	11115.2 (458.907)	-0.03%
> Context Switches 83245.6 (3061.44)	83651.8 (1202.31)	-0.49%
> Sleeps 		 613459  (23091.8)	628378  (27485.2) 	-2.43%
> 
> Average Optimal load -j 1024 Run (std deviation):
> Elapsed Time 	 52.964  (0.572346)	53.132 (0.825694)	-0.32%
> User Time 	 4058.22 (222.034)	4070.2 (201.646) 	-0.30%
> System Time 	 2672.81 (759.207)	2712.13 (797.292)	-1.47%
> Percent CPU 	 12756.7 (1786.35)	12806.5 (1858.89)	-0.39% 
> Context Switches 88818.5 (6772)		87890.6 (5567.72)	1.04% 
> Sleeps 		 618658  (20842.2)	636297 (25044) 		-2.85%
> 
> During a run on the SPF, perf events were captured:
>  Performance counter stats for '../kernbench -M':
>        149 375 832      faults
>                  1      spf
>                  0      pagefault:spf_vma_changed
>                  0      pagefault:spf_vma_noanon
>                561      pagefault:spf_vma_notsup
>                  0      pagefault:spf_vma_access
>                  0      pagefault:spf_pmd_changed
> 
> Most of the processes involved are monothreaded so SPF is not activated but
> there is no impact on the performance.
> 
> Ebizzy:
> -------
> The test is counting the number of records per second it can manage, the
> higher is the best. I run it like this 'ebizzy -mTt <nrcpus>'. To get
> consistent result I repeated the test 100 times and measure the average
> result. The number is the record processes per second, the higher is the best.
> 
>   		BASE		SPF		delta	
> 24 CPUs x86	5492.69		9383.07		70.83%
> 1024 CPUS P8 VM 8476.74		17144.38	102%
> 
> Here are the performance counter read during a run on a 48 CPUs x86 node:
>  Performance counter stats for './ebizzy -mTt 48':
>         11,846,569      faults
>         10,886,706      spf
>            957,702      pagefault:spf_vma_changed
>                  0      pagefault:spf_vma_noanon
>                815      pagefault:spf_vma_notsup
>                  0      pagefault:spf_vma_access
>                  0      pagefault:spf_pmd_changed
> 
> And the ones captured during a run on a 1024 CPUs Power VM:
>  Performance counter stats for './ebizzy -mTt 1024':
>          1 359 789      faults
>          1 284 910      spf
>             72 085      pagefault:spf_vma_changed
>                  0      pagefault:spf_vma_noanon
>              2 669      pagefault:spf_vma_notsup
>                  0      pagefault:spf_vma_access
>                  0      pagefault:spf_pmd_changed
> 		 
> In ebizzy's case most of the page fault were handled in a speculative way,
> leading the ebizzy performance boost.
> 
> ------------------
> Changes since v11 [3]
> - Check vm_ops.fault instead of vm_ops since now all the VMA as a vm_ops.
>  - Abort speculative page fault when doing swap readhead because VMA's
>    boundaries are not protected at this time. Doing this the first swap in
>    is doing a readhead, the next fault should be handled in a speculative
>    way as the page is present in the swap read page.
>  - Handle a race between copy_pte_range() and the wp_page_copy called by
>    the speculative page fault handler.
>  - Ported to Kernel v5.0
>  - Moved VM_FAULT_PTNOTSAME define in mm_types.h
>  - Use RCU to protect the MM RB tree instead of a rwlock.
>  - Add a toggle interface: /proc/sys/vm/speculative_page_fault
> 
> [1] https://lore.kernel.org/linux-mm/20141020215633.717315139@infradead.org/
> [2] https://lore.kernel.org/linux-mm/9FE19350E8A7EE45B64D8D63D368C8966B847F54@SHSMSX101.ccr.corp.intel.com/
> [3] https://lore.kernel.org/linux-mm/1526555193-7242-1-git-send-email-ldufour@linux.vnet.ibm.com/
> [4] https://github.com/ldu4/linux/tree/spf-v12
> 
> Laurent Dufour (25):
>   mm: introduce CONFIG_SPECULATIVE_PAGE_FAULT
>   x86/mm: define ARCH_SUPPORTS_SPECULATIVE_PAGE_FAULT
>   powerpc/mm: set ARCH_SUPPORTS_SPECULATIVE_PAGE_FAULT
>   mm: introduce pte_spinlock for FAULT_FLAG_SPECULATIVE
>   mm: make pte_unmap_same compatible with SPF
>   mm: introduce INIT_VMA()
>   mm: protect VMA modifications using VMA sequence count
>   mm: protect mremap() against SPF hanlder
>   mm: protect SPF handler against anon_vma changes
>   mm: cache some VMA fields in the vm_fault structure
>   mm/migrate: Pass vm_fault pointer to migrate_misplaced_page()
>   mm: introduce __lru_cache_add_active_or_unevictable
>   mm: introduce __vm_normal_page()
>   mm: introduce __page_add_new_anon_rmap()
>   mm: protect against PTE changes done by dup_mmap()
>   mm: protect the RB tree with a sequence lock
>   mm: introduce vma reference counter
>   mm: Introduce find_vma_rcu()
>   mm: don't do swap readahead during speculative page fault
>   mm: adding speculative page fault failure trace events
>   perf: add a speculative page fault sw event
>   perf tools: add support for the SPF perf event
>   mm: add speculative page fault vmstats
>   powerpc/mm: add speculative page fault
>   mm: Add a speculative page fault switch in sysctl
> 
> Mahendran Ganesh (2):
>   arm64/mm: define ARCH_SUPPORTS_SPECULATIVE_PAGE_FAULT
>   arm64/mm: add speculative page fault
> 
> Peter Zijlstra (4):
>   mm: prepare for FAULT_FLAG_SPECULATIVE
>   mm: VMA sequence count
>   mm: provide speculative fault infrastructure
>   x86/mm: add speculative pagefault handling
> 
>  arch/arm64/Kconfig                    |   1 +
>  arch/arm64/mm/fault.c                 |  12 +
>  arch/powerpc/Kconfig                  |   1 +
>  arch/powerpc/mm/fault.c               |  16 +
>  arch/x86/Kconfig                      |   1 +
>  arch/x86/mm/fault.c                   |  14 +
>  fs/exec.c                             |   1 +
>  fs/proc/task_mmu.c                    |   5 +-
>  fs/userfaultfd.c                      |  17 +-
>  include/linux/hugetlb_inline.h        |   2 +-
>  include/linux/migrate.h               |   4 +-
>  include/linux/mm.h                    | 138 +++++-
>  include/linux/mm_types.h              |  16 +-
>  include/linux/pagemap.h               |   4 +-
>  include/linux/rmap.h                  |  12 +-
>  include/linux/swap.h                  |  10 +-
>  include/linux/vm_event_item.h         |   3 +
>  include/trace/events/pagefault.h      |  80 ++++
>  include/uapi/linux/perf_event.h       |   1 +
>  kernel/fork.c                         |  35 +-
>  kernel/sysctl.c                       |   9 +
>  mm/Kconfig                            |  22 +
>  mm/huge_memory.c                      |   6 +-
>  mm/hugetlb.c                          |   2 +
>  mm/init-mm.c                          |   3 +
>  mm/internal.h                         |  45 ++
>  mm/khugepaged.c                       |   5 +
>  mm/madvise.c                          |   6 +-
>  mm/memory.c                           | 631 ++++++++++++++++++++++----
>  mm/mempolicy.c                        |  51 ++-
>  mm/migrate.c                          |   6 +-
>  mm/mlock.c                            |  13 +-
>  mm/mmap.c                             | 249 ++++++++--
>  mm/mprotect.c                         |   4 +-
>  mm/mremap.c                           |  13 +
>  mm/nommu.c                            |   1 +
>  mm/rmap.c                             |   5 +-
>  mm/swap.c                             |   6 +-
>  mm/swap_state.c                       |  10 +-
>  mm/vmstat.c                           |   5 +-
>  tools/include/uapi/linux/perf_event.h |   1 +
>  tools/perf/util/evsel.c               |   1 +
>  tools/perf/util/parse-events.c        |   4 +
>  tools/perf/util/parse-events.l        |   1 +
>  tools/perf/util/python.c              |   1 +
>  45 files changed, 1277 insertions(+), 196 deletions(-)
>  create mode 100644 include/trace/events/pagefault.h
> 
> -- 
> 2.21.0
> 
