Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75610606D17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 03:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtnGB2HdLz3dwy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 12:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtnFd2jtNz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 12:39:32 +1100 (AEDT)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mtn7R1NH2zmV8m;
	Fri, 21 Oct 2022 09:34:11 +0800 (CST)
Received: from [10.174.151.185] (10.174.151.185) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:38:56 +0800
Subject: Re: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
To: Tony Luck <tony.luck@intel.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
 <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <900bd42d-10c2-e83d-80ad-5c1fa94e8d94@huawei.com>
Date: Fri, 21 Oct 2022 09:38:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.151.185]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500002.china.huawei.com (7.192.104.244)
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
Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/10/21 4:05, Tony Luck wrote:
> On Thu, Oct 20, 2022 at 09:57:04AM +0800, Shuai Xue wrote:
>>
>>
>> 在 2022/10/20 AM1:08, Tony Luck 写道:
>>> If the kernel is copying a page as the result of a copy-on-write
>>> fault and runs into an uncorrectable error, Linux will crash because
>>> it does not have recovery code for this case where poison is consumed
>>> by the kernel.
>>>
>>> It is easy to set up a test case. Just inject an error into a private
>>> page, fork(2), and have the child process write to the page.
>>>
>>> I wrapped that neatly into a test at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/aegl/ras-tools.git
>>>
>>> just enable ACPI error injection and run:
>>>
>>>   # ./einj_mem-uc -f copy-on-write
>>>
>>> Add a new copy_user_highpage_mc() function that uses copy_mc_to_kernel()
>>> on architectures where that is available (currently x86 and powerpc).
>>> When an error is detected during the page copy, return VM_FAULT_HWPOISON
>>> to caller of wp_page_copy(). This propagates up the call stack. Both x86
>>> and powerpc have code in their fault handler to deal with this code by
>>> sending a SIGBUS to the application.
>>
>> Does it send SIGBUS to only child process or both parent and child process?
> 
> This only sends a SIGBUS to the process that wrote the page (typically
> the child, but also possible that the parent is the one that does the
> write that causes the COW).
> 
>>>
>>> Note that this patch avoids a system crash and signals the process that
>>> triggered the copy-on-write action. It does not take any action for the
>>> memory error that is still in the shared page. To handle that a call to
>>> memory_failure() is needed. 
>>
>> If the error page is not poisoned, should the return value of wp_page_copy
>> be VM_FAULT_HWPOISON or VM_FAULT_SIGBUS? When is_hwpoison_entry(entry) or
>> PageHWPoison(page) is true, do_swap_page return VM_FAULT_HWPOISON to caller.
>> And when is_swapin_error_entry is true, do_swap_page return VM_FAULT_SIGBUS.
> 
> The page has uncorrected data in it, but this patch doesn't mark it
> as poisoned.  Returning VM_FAULT_SIGBUS would send an "ordinary" SIGBUS
> that doesn't include the BUS_MCEERR_AR and "lsb" information. It would
> also skip the:
> 
> 	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n"
> 
> console message. So might result in confusion and attepmts to debug a
> s/w problem with the application instead of blaming the death on a bad
> DIMM.
> 
>>> But this cannot be done from wp_page_copy()
>>> because it holds mmap_lock(). Perhaps the architecture fault handlers
>>> can deal with this loose end in a subsequent patch?
> 
> I started looking at this for x86 ... but I have changed my mind
> about this being a good place for a fix. When control returns back
> to the architecture fault handler it no longer has easy access to
> the physical page frame number. It has the virtual address, so it
> could descend back into somee new mm/memory.c function to get the
> physical address ... but that seems silly.
> 
> I'm experimenting with using sched_work() to handle the call to
> memory_failure() (echoing what the machine check handler does using
> task_work)_add() to avoid the same problem of not being able to directly
> call memory_failure()).
> 
> So far it seems to be working. Patch below (goes on top of original
> patch ... well on top of the internal version with mods based on
> feedback from Dan Williams ... but should show the general idea)
> 
> With this patch applied the page does get unmapped from all users.
> Other tasks that shared the page will get a SIGBUS if they attempt
> to access it later (from the page fault handler because of
> is_hwpoison_entry() as you mention above.
> 
> -Tony
> 
>>From d3879e83bf91cd6c61e12d32d3e15eb6ef069204 Mon Sep 17 00:00:00 2001
> From: Tony Luck <tony.luck@intel.com>
> Date: Thu, 20 Oct 2022 09:57:28 -0700
> Subject: [PATCH] mm, hwpoison: Call memory_failure() for source page of COW
>  failure
> 
> Cannot call memory_failure() directly from the fault handler because
> mmap_lock (and others) are held.
> 
> It is important, but not urgent, to mark the source page as h/w poisoned
> and unmap it from other tasks.
> 
> Use schedule_work() to queue a request to call memory_failure() for the
> page with the error.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>  mm/memory.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index b6056eef2f72..4a1304cf1f4e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2848,6 +2848,37 @@ static inline int pte_unmap_same(struct vm_fault *vmf)
>  	return same;
>  }
>  
> +#ifdef CONFIG_MEMORY_FAILURE
> +struct pfn_work {
> +	struct work_struct work;
> +	unsigned long pfn;
> +};
> +
> +static void do_sched_memory_failure(struct work_struct *w)
> +{
> +	struct pfn_work *p = container_of(w, struct pfn_work, work);
> +
> +	memory_failure(p->pfn, 0);
> +	kfree(p);
> +}
> +
> +static void sched_memory_failure(unsigned long pfn)
> +{
> +	struct pfn_work *p;
> +
> +	p = kmalloc(sizeof *p, GFP_KERNEL);
> +	if (!p)
> +		return;
> +	INIT_WORK(&p->work, do_sched_memory_failure);
> +	p->pfn = pfn;
> +	schedule_work(&p->work);

There is already memory_failure_queue() that can do this. Can we use it directly?

Thanks,
Miaohe Lin


> +}
> +#else
> +static void sched_memory_failure(unsigned long pfn)
> +{
> +}
> +#endif
> +
>  /*
>   * Return:
>   *	0:		copied succeeded
> @@ -2866,8 +2897,10 @@ static inline int __wp_page_copy_user(struct page *dst, struct page *src,
>  	unsigned long addr = vmf->address;
>  
>  	if (likely(src)) {
> -		if (copy_mc_user_highpage(dst, src, addr, vma))
> +		if (copy_mc_user_highpage(dst, src, addr, vma)) {
> +			sched_memory_failure(page_to_pfn(src));
>  			return -EHWPOISON;
> +		}
>  		return 0;
>  	}
>  
> 

