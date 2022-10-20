Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B478D605E33
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 12:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtPYf4pRyz3dwX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 21:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.45; helo=out30-45.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=<UNKNOWN>)
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir; Thu, 20 Oct 2022 13:02:18 AEDT
Received: from out30-45.freemail.mail.aliyun.com (out30-45.freemail.mail.aliyun.com [115.124.30.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mt9pL330Hz3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 13:02:17 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VSccLAj_1666231025;
Received: from 30.13.190.170(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0VSccLAj_1666231025)
          by smtp.aliyun-inc.com;
          Thu, 20 Oct 2022 09:57:07 +0800
Message-ID: <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
Date: Thu, 20 Oct 2022 09:57:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Content-Language: en-US
To: Tony Luck <tony.luck@intel.com>, Naoya Horiguchi
 <naoya.horiguchi@nec.com>, Andrew Morton <akpm@linux-foundation.org>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20221019170835.155381-1-tony.luck@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Oct 2022 21:51:40 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/10/20 AM1:08, Tony Luck 写道:
> If the kernel is copying a page as the result of a copy-on-write
> fault and runs into an uncorrectable error, Linux will crash because
> it does not have recovery code for this case where poison is consumed
> by the kernel.
> 
> It is easy to set up a test case. Just inject an error into a private
> page, fork(2), and have the child process write to the page.
> 
> I wrapped that neatly into a test at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/aegl/ras-tools.git
> 
> just enable ACPI error injection and run:
> 
>   # ./einj_mem-uc -f copy-on-write
> 
> Add a new copy_user_highpage_mc() function that uses copy_mc_to_kernel()
> on architectures where that is available (currently x86 and powerpc).
> When an error is detected during the page copy, return VM_FAULT_HWPOISON
> to caller of wp_page_copy(). This propagates up the call stack. Both x86
> and powerpc have code in their fault handler to deal with this code by
> sending a SIGBUS to the application.

Does it send SIGBUS to only child process or both parent and child process?

> 
> Note that this patch avoids a system crash and signals the process that
> triggered the copy-on-write action. It does not take any action for the
> memory error that is still in the shared page. To handle that a call to
> memory_failure() is needed. 

If the error page is not poisoned, should the return value of wp_page_copy
be VM_FAULT_HWPOISON or VM_FAULT_SIGBUS? When is_hwpoison_entry(entry) or
PageHWPoison(page) is true, do_swap_page return VM_FAULT_HWPOISON to caller.
And when is_swapin_error_entry is true, do_swap_page return VM_FAULT_SIGBUS.

Thanks.

Best Regards,
Shuai


> But this cannot be done from wp_page_copy()
> because it holds mmap_lock(). Perhaps the architecture fault handlers
> can deal with this loose end in a subsequent patch?
> 
> On Intel/x86 this loose end will often be handled automatically because
> the memory controller provides an additional notification of the h/w
> poison in memory, the handler for this will call memory_failure(). This
> isn't a 100% solution. If there are multiple errors, not all may be
> logged in this way.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> 
> ---
> Changes in V2:
>    Naoya Horiguchi:
> 	1) Use -EHWPOISON error code instead of minus one.
> 	2) Poison path needs also to deal with old_page
>    Tony Luck:
> 	Rewrote commit message
> 	Added some powerpc folks to Cc: list
> ---
>  include/linux/highmem.h | 19 +++++++++++++++++++
>  mm/memory.c             | 28 +++++++++++++++++++---------
>  2 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index e9912da5441b..5967541fbf0e 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -319,6 +319,25 @@ static inline void copy_user_highpage(struct page *to, struct page *from,
>  
>  #endif
>  
> +static inline int copy_user_highpage_mc(struct page *to, struct page *from,
> +					unsigned long vaddr, struct vm_area_struct *vma)
> +{
> +	unsigned long ret = 0;
> +#ifdef copy_mc_to_kernel
> +	char *vfrom, *vto;
> +
> +	vfrom = kmap_local_page(from);
> +	vto = kmap_local_page(to);
> +	ret = copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);
> +	kunmap_local(vto);
> +	kunmap_local(vfrom);
> +#else
> +	copy_user_highpage(to, from, vaddr, vma);
> +#endif
> +
> +	return ret;
> +}
> +
>  #ifndef __HAVE_ARCH_COPY_HIGHPAGE
>  
>  static inline void copy_highpage(struct page *to, struct page *from)
> diff --git a/mm/memory.c b/mm/memory.c
> index f88c351aecd4..a32556c9b689 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2848,8 +2848,14 @@ static inline int pte_unmap_same(struct vm_fault *vmf)
>  	return same;
>  }
>  
> -static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
> -				       struct vm_fault *vmf)
> +/*
> + * Return:
> + *	-EHWPOISON:	copy failed due to hwpoison in source page
> + *	0:		copied failed (some other reason)
> + *	1:		copied succeeded
> + */
> +static inline int __wp_page_copy_user(struct page *dst, struct page *src,
> +				      struct vm_fault *vmf)
>  {
>  	bool ret;
>  	void *kaddr;
> @@ -2860,8 +2866,9 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  	unsigned long addr = vmf->address;
>  
>  	if (likely(src)) {
> -		copy_user_highpage(dst, src, addr, vma);
> -		return true;
> +		if (copy_user_highpage_mc(dst, src, addr, vma))
> +			return -EHWPOISON;
> +		return 1;
>  	}
>  
>  	/*
> @@ -2888,7 +2895,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  			 * and update local tlb only
>  			 */
>  			update_mmu_tlb(vma, addr, vmf->pte);
> -			ret = false;
> +			ret = 0;
>  			goto pte_unlock;
>  		}
>  
> @@ -2913,7 +2920,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
>  			/* The PTE changed under us, update local tlb */
>  			update_mmu_tlb(vma, addr, vmf->pte);
> -			ret = false;
> +			ret = 0;
>  			goto pte_unlock;
>  		}
>  
> @@ -2932,7 +2939,7 @@ static inline bool __wp_page_copy_user(struct page *dst, struct page *src,
>  		}
>  	}
>  
> -	ret = true;
> +	ret = 1;
>  
>  pte_unlock:
>  	if (locked)
> @@ -3104,6 +3111,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  	pte_t entry;
>  	int page_copied = 0;
>  	struct mmu_notifier_range range;
> +	int ret;
>  
>  	delayacct_wpcopy_start();
>  
> @@ -3121,19 +3129,21 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		if (!new_page)
>  			goto oom;
>  
> -		if (!__wp_page_copy_user(new_page, old_page, vmf)) {
> +		ret = __wp_page_copy_user(new_page, old_page, vmf);
> +		if (ret <= 0) {
>  			/*
>  			 * COW failed, if the fault was solved by other,
>  			 * it's fine. If not, userspace would re-fault on
>  			 * the same address and we will handle the fault
>  			 * from the second attempt.
> +			 * The -EHWPOISON case will not be retried.
>  			 */
>  			put_page(new_page);
>  			if (old_page)
>  				put_page(old_page);
>  
>  			delayacct_wpcopy_end();
> -			return 0;
> +			return ret == -EHWPOISON ? VM_FAULT_HWPOISON : 0;
>  		}
>  		kmsan_copy_page_meta(new_page, old_page);
>  	}
