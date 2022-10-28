Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAB6107FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 04:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz61x2tggz3cJc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:29:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=linmiaohe@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz61N3TjNz2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 13:28:51 +1100 (AEDT)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mz5vV674vz15MG0;
	Fri, 28 Oct 2022 10:23:50 +0800 (CST)
Received: from [10.174.151.185] (10.174.151.185) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 10:28:45 +0800
Subject: Re: [PATCH v3 2/2] mm, hwpoison: When copy-on-write hits poison, take
 page offline
To: Tony Luck <tony.luck@intel.com>
References: <20221019170835.155381-1-tony.luck@intel.com>
 <20221021200120.175753-1-tony.luck@intel.com>
 <20221021200120.175753-3-tony.luck@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <c5ade8ea-6349-7ade-f245-273de69888a4@huawei.com>
Date: Fri, 28 Oct 2022 10:28:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20221021200120.175753-3-tony.luck@intel.com>
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
> Cannot call memory_failure() directly from the fault handler because
> mmap_lock (and others) are held.

Could you please explain which lock makes it unfeasible to call memory_failure() directly and
why? I'm somewhat confused. But I agree using memory_failure_queue() should be a good idea.

> 
> It is important, but not urgent, to mark the source page as h/w poisoned
> and unmap it from other tasks.
> 
> Use memory_failure_queue() to request a call to memory_failure() for the
> page with the error.
> 
> Also provide a stub version for CONFIG_MEMORY_FAILURE=n
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>  include/linux/mm.h | 5 ++++-
>  mm/memory.c        | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8bbcccbc5565..03ced659eb58 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3268,7 +3268,6 @@ enum mf_flags {
>  int mf_dax_kill_procs(struct address_space *mapping, pgoff_t index,
>  		      unsigned long count, int mf_flags);
>  extern int memory_failure(unsigned long pfn, int flags);
> -extern void memory_failure_queue(unsigned long pfn, int flags);
>  extern void memory_failure_queue_kick(int cpu);
>  extern int unpoison_memory(unsigned long pfn);
>  extern int sysctl_memory_failure_early_kill;
> @@ -3277,8 +3276,12 @@ extern void shake_page(struct page *p);
>  extern atomic_long_t num_poisoned_pages __read_mostly;
>  extern int soft_offline_page(unsigned long pfn, int flags);
>  #ifdef CONFIG_MEMORY_FAILURE
> +extern void memory_failure_queue(unsigned long pfn, int flags);
>  extern int __get_huge_page_for_hwpoison(unsigned long pfn, int flags);
>  #else
> +static inline void memory_failure_queue(unsigned long pfn, int flags)
> +{
> +}
>  static inline int __get_huge_page_for_hwpoison(unsigned long pfn, int flags)
>  {
>  	return 0;
> diff --git a/mm/memory.c b/mm/memory.c
> index b6056eef2f72..eae242351726 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2866,8 +2866,10 @@ static inline int __wp_page_copy_user(struct page *dst, struct page *src,
>  	unsigned long addr = vmf->address;
>  
>  	if (likely(src)) {
> -		if (copy_mc_user_highpage(dst, src, addr, vma))
> +		if (copy_mc_user_highpage(dst, src, addr, vma)) {
> +			memory_failure_queue(page_to_pfn(src), 0);

It seems MF_ACTION_REQUIRED is not needed for memory_failure_queue() here. Thanks for your patch.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks,
Miaohe Lin

