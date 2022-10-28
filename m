Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9C6107AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 04:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz5fV3chcz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz5dt4s3xz2xkw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 13:11:59 +1100 (AEDT)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mz5X1670Xz15MFB;
	Fri, 28 Oct 2022 10:06:57 +0800 (CST)
Received: from [10.174.151.185] (10.174.151.185) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 10:11:52 +0800
Subject: Re: [PATCH v3 1/2] mm, hwpoison: Try to recover from copy-on write
 faults
To: Tony Luck <tony.luck@intel.com>
References: <20221019170835.155381-1-tony.luck@intel.com>
 <20221021200120.175753-1-tony.luck@intel.com>
 <20221021200120.175753-2-tony.luck@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <a60484bf-2107-8bc4-acdc-5f582f9637af@huawei.com>
Date: Fri, 28 Oct 2022 10:11:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20221021200120.175753-2-tony.luck@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.151.185]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Cc: Matthew Wilcox <willy@infradead.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Shuai Xue <xueshuai@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/10/22 4:01, Tony Luck wrote:
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
> 
> Note that this patch avoids a system crash and signals the process that
> triggered the copy-on-write action. It does not take any action for the
> memory error that is still in the shared page. To handle that a call to
> memory_failure() is needed. But this cannot be done from wp_page_copy()
> because it holds mmap_lock(). Perhaps the architecture fault handlers
> can deal with this loose end in a subsequent patch?
> 
> On Intel/x86 this loose end will often be handled automatically because
> the memory controller provides an additional notification of the h/w
> poison in memory, the handler for this will call memory_failure(). This
> isn't a 100% solution. If there are multiple errors, not all may be
> logged in this way.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Thanks for your work, Tony.

> 
> ---
> Changes in V3:
>     Dan Williams
> 	Rename copy_user_highpage_mc() to copy_mc_user_highpage() for
> 	consistency with Linus' discussion on names of functions that
> 	check for machine check.
> 	Write complete functions for the have/have-not copy_mc_to_kernel
> 	cases (so grep shows there are two versions)
> 	Change __wp_page_copy_user() to return 0 for success, negative for fail
> 	[I picked -EAGAIN for both non-EHWPOISON cases]
> 
> Changes in V2:
>    Naoya Horiguchi:
> 	1) Use -EHWPOISON error code instead of minus one.
> 	2) Poison path needs also to deal with old_page
>    Tony Luck:
> 	Rewrote commit message
> 	Added some powerpc folks to Cc: list
> ---
>  include/linux/highmem.h | 24 ++++++++++++++++++++++++
>  mm/memory.c             | 30 ++++++++++++++++++++----------
>  2 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index e9912da5441b..a32c64681f03 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -319,6 +319,30 @@ static inline void copy_user_highpage(struct page *to, struct page *from,
>  
>  #endif
>  
> +#ifdef copy_mc_to_kernel
> +static inline int copy_mc_user_highpage(struct page *to, struct page *from,
> +					unsigned long vaddr, struct vm_area_struct *vma)
> +{
> +	unsigned long ret;
> +	char *vfrom, *vto;
> +
> +	vfrom = kmap_local_page(from);
> +	vto = kmap_local_page(to);
> +	ret = copy_mc_to_kernel(vto, vfrom, PAGE_SIZE);

In copy_user_highpage(), kmsan_unpoison_memory(page_address(to), PAGE_SIZE) is done after the copy when
__HAVE_ARCH_COPY_USER_HIGHPAGE isn't defined. Do we need to do something similar here? But I'm not familiar
with kmsan, so I can easy be wrong.

Anyway, this patch looks good to me. Thanks.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks,
Miaohe Lin


