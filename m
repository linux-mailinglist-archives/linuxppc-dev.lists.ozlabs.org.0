Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 861B3895763
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 16:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V89kj2jnSz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 01:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V89kJ3hS2z3d2K
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 01:48:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D961007;
	Tue,  2 Apr 2024 07:48:52 -0700 (PDT)
Received: from [10.1.38.163] (XHFQ2J9959.cambridge.arm.com [10.1.38.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C1E13F64C;
	Tue,  2 Apr 2024 07:48:17 -0700 (PDT)
Message-ID: <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
Date: Tue, 2 Apr 2024 15:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Content-Language: en-GB
To: peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240327152332.950956-14-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On 27/03/2024 15:23, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Now follow_page() is ready to handle hugetlb pages in whatever form, and
> over all architectures.  Switch to the generic code path.
> 
> Time to retire hugetlb_follow_page_mask(), following the previous
> retirement of follow_hugetlb_page() in 4849807114b8.
> 
> There may be a slight difference of how the loops run when processing slow
> GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> loop of __get_user_pages() will resolve one pgtable entry with the patch
> applied, rather than relying on the size of hugetlb hstate, the latter may
> cover multiple entries in one loop.
> 
> A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> a tight loop of slow gup after the path switched.  That shouldn't be a
> problem because slow-gup should not be a hot path for GUP in general: when
> page is commonly present, fast-gup will already succeed, while when the
> page is indeed missing and require a follow up page fault, the slow gup
> degrade will probably buried in the fault paths anyway.  It also explains
> why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> a performance analysis but a side benefit.  If the performance will be a
> concern, we can consider handle CONT_PTE in follow_page().
> 
> Before that is justified to be necessary, keep everything clean and simple.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Afraid I'm seeing an oops when running gup_longterm test on arm64 with current mm-unstable. Git bisect blames this patch. The oops reproduces for me every time on 2 different machines:


[    9.340416] kernel BUG at mm/gup.c:778!
[    9.340746] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
[    9.341199] Modules linked in:
[    9.341481] CPU: 1 PID: 1159 Comm: gup_longterm Not tainted 6.9.0-rc2-00210-g910ff1a347e4 #11
[    9.342232] Hardware name: linux,dummy-virt (DT)
[    9.342647] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    9.343195] pc : follow_page_mask+0x4d4/0x880
[    9.343580] lr : follow_page_mask+0x4d4/0x880
[    9.344018] sp : ffff8000898b3aa0
[    9.344345] x29: ffff8000898b3aa0 x28: fffffdffc53973e8 x27: 00003c0005d08000
[    9.345028] x26: ffff00014e5cfd08 x25: ffffd3513a40c000 x24: fffffdffc5d08000
[    9.345682] x23: ffffc1ffc0000000 x22: 0000000000080101 x21: ffff8000898b3ba8
[    9.346337] x20: 0000fffff4200000 x19: ffff00014e52d508 x18: 0000000000000010
[    9.347005] x17: 5f656e6f7a5f7369 x16: 2120262620296567 x15: 6170286461654865
[    9.347713] x14: 6761502128454741 x13: 2929656761702865 x12: 6761705f65636976
[    9.348371] x11: 65645f656e6f7a5f x10: ffffd3513b31d6e0 x9 : ffffd3513852f090
[    9.349062] x8 : 00000000ffffefff x7 : ffffd3513b31d6e0 x6 : 0000000000000000
[    9.349753] x5 : ffff00017ff98cc8 x4 : 0000000000000fff x3 : 0000000000000000
[    9.350397] x2 : 0000000000000000 x1 : ffff000190e8b480 x0 : 0000000000000052
[    9.351097] Call trace:
[    9.351312]  follow_page_mask+0x4d4/0x880
[    9.351700]  __get_user_pages+0xf4/0x3e8
[    9.352089]  __gup_longterm_locked+0x204/0xa70
[    9.352516]  pin_user_pages+0x88/0xc0
[    9.352873]  gup_test_ioctl+0x860/0xc40
[    9.353249]  __arm64_sys_ioctl+0xb0/0x100
[    9.353648]  invoke_syscall+0x50/0x128
[    9.354022]  el0_svc_common.constprop.0+0x48/0xf8
[    9.354488]  do_el0_svc+0x28/0x40
[    9.354822]  el0_svc+0x34/0xe0
[    9.355128]  el0t_64_sync_handler+0x13c/0x158
[    9.355489]  el0t_64_sync+0x190/0x198
[    9.355793] Code: aa1803e0 d000d8e1 91220021 97fff560 (d4210000) 
[    9.356280] ---[ end trace 0000000000000000 ]---
[    9.356651] note: gup_longterm[1159] exited with irqs disabled
[    9.357141] note: gup_longterm[1159] exited with preempt_count 2
[    9.358033] ------------[ cut here ]------------
[    9.358800] WARNING: CPU: 1 PID: 0 at kernel/context_tracking.c:128 ct_kernel_exit.constprop.0+0x108/0x120
[    9.360157] Modules linked in:
[    9.360541] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D            6.9.0-rc2-00210-g910ff1a347e4 #11
[    9.361626] Hardware name: linux,dummy-virt (DT)
[    9.362087] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    9.362758] pc : ct_kernel_exit.constprop.0+0x108/0x120
[    9.363306] lr : ct_idle_enter+0x10/0x20
[    9.363845] sp : ffff8000801abdc0
[    9.364222] x29: ffff8000801abdc0 x28: 0000000000000000 x27: 0000000000000000
[    9.364961] x26: 0000000000000000 x25: ffff00014149d780 x24: 0000000000000000
[    9.365557] x23: 0000000000000000 x22: ffffd3513b299d48 x21: ffffd3513a785730
[    9.366239] x20: ffffd3513b299c28 x19: ffff00017ffa7da0 x18: 0000fffff5ffffff
[    9.366869] x17: 0000000000000000 x16: 1fffe0002a21a8c1 x15: 0000000000000000
[    9.367524] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000002
[    9.368207] x11: 0000000000000001 x10: 0000000000000ad0 x9 : ffffd35138589230
[    9.369123] x8 : ffff00014149e2b0 x7 : 0000000000000000 x6 : 000000000f8c0fb2
[    9.370403] x5 : 4000000000000002 x4 : ffff2cb045825000 x3 : ffff8000801abdc0
[    9.371170] x2 : ffffd3513a782da0 x1 : 4000000000000000 x0 : ffffd3513a782da0
[    9.372279] Call trace:
[    9.372519]  ct_kernel_exit.constprop.0+0x108/0x120
[    9.373216]  ct_idle_enter+0x10/0x20
[    9.373562]  default_idle_call+0x3c/0x160
[    9.374055]  do_idle+0x21c/0x280
[    9.374394]  cpu_startup_entry+0x3c/0x50
[    9.374797]  secondary_start_kernel+0x140/0x168
[    9.375220]  __secondary_switched+0xb8/0xc0
[    9.375875] ---[ end trace 0000000000000000 ]---


The oops trigger is at mm/gup.c:778:
VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);


This is the output of gup_longterm (last output is just before oops):

# [INFO] detected hugetlb page size: 2048 KiB
# [INFO] detected hugetlb page size: 32768 KiB
# [INFO] detected hugetlb page size: 64 KiB
# [INFO] detected hugetlb page size: 1048576 KiB
TAP version 13
1..70
# [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd
ok 1 Should have worked
# [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with tmpfile
ok 2 Should have failed
# [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with local tmpfile
ok 3 Should have failed
# [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd hugetlb (2048 kB)
ok 4 Should have worked
# [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd hugetlb (32768 kB)


So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?


I'm running with defconfig plus these:

./scripts/config --enable CONFIG_SQUASHFS_LZ4
./scripts/config --enable CONFIG_SQUASHFS_LZO
./scripts/config --enable CONFIG_SQUASHFS_XZ
./scripts/config --enable CONFIG_SQUASHFS_ZSTD
./scripts/config --enable CONFIG_XFS_FS
./scripts/config --enable CONFIG_FTRACE
./scripts/config --enable CONFIG_FUNCTION_TRACER
./scripts/config --enable CONFIG_KPROBES
./scripts/config --enable CONFIG_HIST_TRIGGERS
./scripts/config --enable CONFIG_FTRACE_SYSCALLS
./scripts/config --enable CONFIG_DEBUG_VM
./scripts/config --enable CONFIG_DEBUG_VM_MAPLE_TREE
./scripts/config --enable CONFIG_DEBUG_VM_RB
./scripts/config --enable CONFIG_DEBUG_VM_PGFLAGS
./scripts/config --enable CONFIG_DEBUG_VM_PGTABLE
./scripts/config --enable CONFIG_PAGE_TABLE_CHECK
./scripts/config --enable CONFIG_USERFAULTFD
./scripts/config --enable CONFIG_TEST_VMALLOC
./scripts/config --enable CONFIG_GUP_TEST


Thanks,
Ryan




> ---
>  include/linux/hugetlb.h |  7 ----
>  mm/gup.c                | 15 +++------
>  mm/hugetlb.c            | 71 -----------------------------------------
>  3 files changed, 5 insertions(+), 88 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 294c78b3549f..a546140f89cd 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -328,13 +328,6 @@ static inline void hugetlb_zap_end(
>  {
>  }
>  
> -static inline struct page *hugetlb_follow_page_mask(
> -    struct vm_area_struct *vma, unsigned long address, unsigned int flags,
> -    unsigned int *page_mask)
> -{
> -	BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
> -}
> -
>  static inline int copy_hugetlb_page_range(struct mm_struct *dst,
>  					  struct mm_struct *src,
>  					  struct vm_area_struct *dst_vma,
> diff --git a/mm/gup.c b/mm/gup.c
> index a02463c9420e..c803d0b0f358 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1135,18 +1135,11 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
>  {
>  	pgd_t *pgd;
>  	struct mm_struct *mm = vma->vm_mm;
> +	struct page *page;
>  
> -	ctx->page_mask = 0;
> -
> -	/*
> -	 * Call hugetlb_follow_page_mask for hugetlb vmas as it will use
> -	 * special hugetlb page table walking code.  This eliminates the
> -	 * need to check for hugetlb entries in the general walking code.
> -	 */
> -	if (is_vm_hugetlb_page(vma))
> -		return hugetlb_follow_page_mask(vma, address, flags,
> -						&ctx->page_mask);
> +	vma_pgtable_walk_begin(vma);
>  
> +	ctx->page_mask = 0;
>  	pgd = pgd_offset(mm, address);
>  
>  	if (unlikely(is_hugepd(__hugepd(pgd_val(*pgd)))))
> @@ -1157,6 +1150,8 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
>  	else
>  		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
>  
> +	vma_pgtable_walk_end(vma);
> +
>  	return page;
>  }
>  
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 65b9c9a48fd2..cc79891a3597 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6870,77 +6870,6 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>  }
>  #endif /* CONFIG_USERFAULTFD */
>  
> -struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> -				      unsigned long address, unsigned int flags,
> -				      unsigned int *page_mask)
> -{
> -	struct hstate *h = hstate_vma(vma);
> -	struct mm_struct *mm = vma->vm_mm;
> -	unsigned long haddr = address & huge_page_mask(h);
> -	struct page *page = NULL;
> -	spinlock_t *ptl;
> -	pte_t *pte, entry;
> -	int ret;
> -
> -	hugetlb_vma_lock_read(vma);
> -	pte = hugetlb_walk(vma, haddr, huge_page_size(h));
> -	if (!pte)
> -		goto out_unlock;
> -
> -	ptl = huge_pte_lock(h, mm, pte);
> -	entry = huge_ptep_get(pte);
> -	if (pte_present(entry)) {
> -		page = pte_page(entry);
> -
> -		if (!huge_pte_write(entry)) {
> -			if (flags & FOLL_WRITE) {
> -				page = NULL;
> -				goto out;
> -			}
> -
> -			if (gup_must_unshare(vma, flags, page)) {
> -				/* Tell the caller to do unsharing */
> -				page = ERR_PTR(-EMLINK);
> -				goto out;
> -			}
> -		}
> -
> -		page = nth_page(page, ((address & ~huge_page_mask(h)) >> PAGE_SHIFT));
> -
> -		/*
> -		 * Note that page may be a sub-page, and with vmemmap
> -		 * optimizations the page struct may be read only.
> -		 * try_grab_page() will increase the ref count on the
> -		 * head page, so this will be OK.
> -		 *
> -		 * try_grab_page() should always be able to get the page here,
> -		 * because we hold the ptl lock and have verified pte_present().
> -		 */
> -		ret = try_grab_page(page, flags);
> -
> -		if (WARN_ON_ONCE(ret)) {
> -			page = ERR_PTR(ret);
> -			goto out;
> -		}
> -
> -		*page_mask = (1U << huge_page_order(h)) - 1;
> -	}
> -out:
> -	spin_unlock(ptl);
> -out_unlock:
> -	hugetlb_vma_unlock_read(vma);
> -
> -	/*
> -	 * Fixup retval for dump requests: if pagecache doesn't exist,
> -	 * don't try to allocate a new page but just skip it.
> -	 */
> -	if (!page && (flags & FOLL_DUMP) &&
> -	    !hugetlbfs_pagecache_present(h, vma, address))
> -		page = ERR_PTR(-EFAULT);
> -
> -	return page;
> -}
> -
>  long hugetlb_change_protection(struct vm_area_struct *vma,
>  		unsigned long address, unsigned long end,
>  		pgprot_t newprot, unsigned long cp_flags)

