Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9339C4FB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 04:11:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fxjmc1yWbz3097
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 12:11:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxjmB607jz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 12:11:03 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fxjgg198lz68q4;
 Sat,  5 Jun 2021 10:07:11 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 10:10:58 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 10:10:57 +0800
Subject: Re: [PATCH] powerpc: Remove klimit
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
References: <9fa9ba6807c17f93f35a582c199c646c4a8bfd9c.1622800638.git.christophe.leroy@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <99bdf356-4698-56eb-c3b0-3e4069d01c07@huawei.com>
Date: Sat, 5 Jun 2021 10:10:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9fa9ba6807c17f93f35a582c199c646c4a8bfd9c.1622800638.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/6/4 17:57, Christophe Leroy wrote:
> klimit is a global variable initialised at build time with the
> value of _end.
>
> This variable is never modified, so _end symbol can be used directly.
>
> Remove klimit.
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/powerpc/include/asm/setup.h             | 1 -
>   arch/powerpc/kernel/head_book3s_32.S         | 6 ++----
>   arch/powerpc/kernel/prom.c                   | 2 +-
>   arch/powerpc/kernel/setup-common.c           | 4 +---
>   arch/powerpc/platforms/powermac/bootx_init.c | 2 +-
>   5 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
> index e89bfebd4e00..6c1a7d217d1a 100644
> --- a/arch/powerpc/include/asm/setup.h
> +++ b/arch/powerpc/include/asm/setup.h
> @@ -10,7 +10,6 @@ extern void ppc_printk_progress(char *s, unsigned short hex);
>   extern unsigned int rtas_data;
>   extern unsigned long long memory_limit;
>   extern bool init_mem_is_free;
> -extern unsigned long klimit;
>   extern void *zalloc_maybe_bootmem(size_t size, gfp_t mask);
>   
>   struct device_node;
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index 326262030279..b724e88bcdaf 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -766,9 +766,6 @@ PerformanceMonitor:
>    * the kernel image to physical address PHYSICAL_START.
>    */
>   relocate_kernel:
> -	addis	r9,r26,klimit@ha	/* fetch klimit */
> -	lwz	r25,klimit@l(r9)
> -	addis	r25,r25,-KERNELBASE@h
>   	lis	r3,PHYSICAL_START@h	/* Destination base address */
>   	li	r6,0			/* Destination offset */
>   	li	r5,0x4000		/* # bytes of memory to copy */
> @@ -776,7 +773,8 @@ relocate_kernel:
>   	addi	r0,r3,4f@l		/* jump to the address of 4f */
>   	mtctr	r0			/* in copy and do the rest. */
>   	bctr				/* jump to the copy */
> -4:	mr	r5,r25
> +4:	lis	r5,_end-KERNELBASE@h
> +	ori	r5,r5,_end-KERNELBASE@l
>   	bl	copy_and_flush		/* copy the rest */
>   	b	turn_on_mmu
>   
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index fbe9deebc8e1..f620e04dc9bf 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -758,7 +758,7 @@ void __init early_init_devtree(void *params)
>   		first_memblock_size = min_t(u64, first_memblock_size, memory_limit);
>   	setup_initial_memory_limit(memstart_addr, first_memblock_size);
>   	/* Reserve MEMBLOCK regions used by kernel, initrd, dt, etc... */
> -	memblock_reserve(PHYSICAL_START, __pa(klimit) - PHYSICAL_START);
> +	memblock_reserve(PHYSICAL_START, __pa(_end) - PHYSICAL_START);
>   	/* If relocatable, reserve first 32k for interrupt vectors etc. */
>   	if (PHYSICAL_START > MEMORY_START)
>   		memblock_reserve(MEMORY_START, 0x8000);
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 74a98fff2c2f..138bb7f49ef9 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -91,8 +91,6 @@ EXPORT_SYMBOL_GPL(boot_cpuid);
>   int dcache_bsize;
>   int icache_bsize;
>   
> -unsigned long klimit = (unsigned long) _end;
> -
>   /*
>    * This still seems to be needed... -- paulus
>    */
> @@ -930,7 +928,7 @@ void __init setup_arch(char **cmdline_p)
>   	init_mm.start_code = (unsigned long)_stext;
>   	init_mm.end_code = (unsigned long) _etext;
>   	init_mm.end_data = (unsigned long) _edata;
> -	init_mm.brk = klimit;
> +	init_mm.brk = (unsigned long)_end;
>   
>   	mm_iommu_init(&init_mm);
>   	irqstack_early_init();
> diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
> index 9d4ecd292255..d20ef35e6d9d 100644
> --- a/arch/powerpc/platforms/powermac/bootx_init.c
> +++ b/arch/powerpc/platforms/powermac/bootx_init.c
> @@ -433,7 +433,7 @@ static void __init btext_welcome(boot_infos_t *bi)
>   	bootx_printf("\nframe buffer at  : 0x%x", bi->dispDeviceBase);
>   	bootx_printf(" (phys), 0x%x", bi->logicalDisplayBase);
>   	bootx_printf(" (log)");
> -	bootx_printf("\nklimit           : 0x%x",(unsigned long)klimit);
> +	bootx_printf("\nklimit           : 0x%x",(unsigned long)_end);
>   	bootx_printf("\nboot_info at     : 0x%x", bi);
>   	__asm__ __volatile__ ("mfmsr %0" : "=r" (flags));
>   	bootx_printf("\nMSR              : 0x%x", flags);
