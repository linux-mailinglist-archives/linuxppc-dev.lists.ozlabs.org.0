Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B555F716
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 08:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXsWp25mTz3dQc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1097 seconds by postgrey-1.36 at boromir; Wed, 29 Jun 2022 16:49:02 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXsWL0jBtz3bkq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 16:48:58 +1000 (AEST)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LXs3X2wHVz1L8f7;
	Wed, 29 Jun 2022 14:28:24 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 29 Jun 2022 14:30:40 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 29 Jun 2022 14:30:40 +0800
Message-ID: <9b850fd9-f3a1-265e-7de9-4f6d1e217a0c@huawei.com>
Date: Wed, 29 Jun 2022 14:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] powerpc/memhotplug: Add add_pages override for PPC
Content-Language: en-US
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>
References: <20220629050925.31447-1-aneesh.kumar@linux.ibm.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220629050925.31447-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2022/6/29 13:09, Aneesh Kumar K.V wrote:
> With commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> the kernel now validate the addr against high_memory value. This results
> in the below BUG_ON with dax pfns.
>
> [  635.798741][T26531] kernel BUG at mm/page_alloc.c:5521!
> 1:mon> e
> cpu 0x1: Vector: 700 (Program Check) at [c000000007287630]
>      pc: c00000000055ed48: free_pages.part.0+0x48/0x110
>      lr: c00000000053ca70: tlb_finish_mmu+0x80/0xd0
>      sp: c0000000072878d0
>     msr: 800000000282b033
>    current = 0xc00000000afabe00
>    paca    = 0xc00000037ffff300   irqmask: 0x03   irq_happened: 0x05
>      pid   = 26531, comm = 50-landscape-sy
> kernel BUG at :5521!
> Linux version 5.19.0-rc3-14659-g4ec05be7c2e1 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #625 SMP Thu Jun 23 00:35:43 CDT 2022
> 1:mon> t
> [link register   ] c00000000053ca70 tlb_finish_mmu+0x80/0xd0
> [c0000000072878d0] c00000000053ca54 tlb_finish_mmu+0x64/0xd0 (unreliable)
> [c000000007287900] c000000000539424 exit_mmap+0xe4/0x2a0
> [c0000000072879e0] c00000000019fc1c mmput+0xcc/0x210
> [c000000007287a20] c000000000629230 begin_new_exec+0x5e0/0xf40
> [c000000007287ae0] c00000000070b3cc load_elf_binary+0x3ac/0x1e00
> [c000000007287c10] c000000000627af0 bprm_execve+0x3b0/0xaf0
> [c000000007287cd0] c000000000628414 do_execveat_common.isra.0+0x1e4/0x310
> [c000000007287d80] c00000000062858c sys_execve+0x4c/0x60
> [c000000007287db0] c00000000002c1b0 system_call_exception+0x160/0x2c0
> [c000000007287e10] c00000000000c53c system_call_common+0xec/0x250
>
> The fix is to make sure we update high_memory on memory hotplug.
> This is similar to what x86 does in commit 3072e413e305 ("mm/memory_hotplug: introduce add_pages")
>
> Fixes: ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
> Changes from v2:
> * drop WARN_ON_ONCE
> * check for error from __add_pages
>
>   arch/powerpc/Kconfig  |  4 ++++
>   arch/powerpc/mm/mem.c | 33 ++++++++++++++++++++++++++++++++-
>   2 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c2ce2e60c8f0..7aa12e88c580 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -358,6 +358,10 @@ config ARCH_SUSPEND_NONZERO_CPU
>   	def_bool y
>   	depends on PPC_POWERNV || PPC_PSERIES
>   
> +config ARCH_HAS_ADD_PAGES
> +	def_bool y
> +	depends on ARCH_ENABLE_MEMORY_HOTPLUG
> +
>   config PPC_DCR_NATIVE
>   	bool
>   
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 52b77684acda..a97128a48817 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -105,6 +105,37 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
>   	vm_unmap_aliases();
>   }
>   
> +/*
> + * After memory hotplug the variables max_pfn, max_low_pfn and high_memory need
> + * updating.
> + */
> +static void update_end_of_memory_vars(u64 start, u64 size)
> +{
> +	unsigned long end_pfn = PFN_UP(start + size);
> +
> +	if (end_pfn > max_pfn) {
> +		max_pfn = end_pfn;
> +		max_low_pfn = end_pfn;
> +		high_memory = (void *)__va(max_pfn * PAGE_SIZE - 1) + 1;
> +	}
> +}
> +
> +int __ref add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> +		    struct mhp_params *params)
> +{
> +	int ret;
                 int ret = -EINVAL;
> +
> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
> +	if (ret)
> +		return ret;
> +
> +	/* update max_pfn, max_low_pfn and high_memory */
> +	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> +				  nr_pages << PAGE_SHIFT);
> +
> +	return ret;
> +}
> +
and could we only call update_end_of_memory_vars() in arch_add_memory()?
>   int __ref arch_add_memory(int nid, u64 start, u64 size,
>   			  struct mhp_params *params)
>   {
> @@ -115,7 +146,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>   	rc = arch_create_linear_mapping(nid, start, size, params);
>   	if (rc)
>   		return rc;
> -	rc = __add_pages(nid, start_pfn, nr_pages, params);
> +	rc = add_pages(nid, start_pfn, nr_pages, params);
>   	if (rc)
>   		arch_remove_linear_mapping(start, size);

if (!rc)

     update_end_of_memory_vars(start_pfn << PAGE_SHIFT, nr_pages << 
PAGE_SHIFT);

else

     arch_remove_linear_mapping(start, size);

Thanks

>   	return rc;
