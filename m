Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA7494739
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 07:17:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfXNJ20P3z3cCT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 17:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=chenjingwen6@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfXMp6JGbz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 17:16:34 +1100 (AEDT)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JfXL94MJKzccch;
 Thu, 20 Jan 2022 14:15:13 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 14:15:58 +0800
Received: from linux-suspe12sp5.huawei.com (10.67.133.83) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 14:15:58 +0800
From: ChenJingwen <chenjingwen6@huawei.com>
To: <chenjingwen6@huawei.com>
Subject: Re: [PATCH] powerpc/kasan: Fix early region not updated correctly
Date: Thu, 20 Jan 2022 14:15:58 +0800
Message-ID: <20220120061558.60526-1-chenjingwen6@huawei.com>
X-Mailer: git-send-email 2.12.3
References: <20211229035226.59159-1-chenjingwen6@huawei.com>
In-Reply-To: 20211229035226.59159-1-chenjingwen6@huawei.com
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.133.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
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
Cc: christophe.leroy@c-s.fr, kasan-dev@googlegroups.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chen Jingwen <chenjingwen6@huawei.com>

> The shadow's page table is not updated when PTE_RPN_SHIFT is 24
> and PAGE_SHIFT is 12. It not only causes false positives but
> also false negative as shown the following text.
> 
> Fix it by bringing the logic of kasan_early_shadow_page_entry here.
> 
> 1. False Positive:
> ==================================================================
> BUG: KASAN: vmalloc-out-of-bounds in pcpu_alloc+0x508/0xa50
> Write of size 16 at addr f57f3be0 by task swapper/0/1
> 
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-12267-gdebe436e77c7 #1
> Call Trace:
> [c80d1c20] [c07fe7b8] dump_stack_lvl+0x4c/0x6c (unreliable)
> [c80d1c40] [c02ff668] print_address_description.constprop.0+0x88/0x300
> [c80d1c70] [c02ff45c] kasan_report+0x1ec/0x200
> [c80d1cb0] [c0300b20] kasan_check_range+0x160/0x2f0
> [c80d1cc0] [c03018a4] memset+0x34/0x90
> [c80d1ce0] [c0280108] pcpu_alloc+0x508/0xa50
> [c80d1d40] [c02fd7bc] __kmem_cache_create+0xfc/0x570
> [c80d1d70] [c0283d64] kmem_cache_create_usercopy+0x274/0x3e0
> [c80d1db0] [c2036580] init_sd+0xc4/0x1d0
> [c80d1de0] [c00044a0] do_one_initcall+0xc0/0x33c
> [c80d1eb0] [c2001624] kernel_init_freeable+0x2c8/0x384
> [c80d1ef0] [c0004b14] kernel_init+0x24/0x170
> [c80d1f10] [c001b26c] ret_from_kernel_thread+0x5c/0x64
> 
> Memory state around the buggy address:
>  f57f3a80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  f57f3b00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> >f57f3b80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>                                                ^
>  f57f3c00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  f57f3c80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> ==================================================================
> 
> 2. False Negative (with KASAN tests):
> ==================================================================
> Before fix:
>     ok 45 - kmalloc_double_kzfree
>     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:1039
>     KASAN failure expected in "((volatile char *)area)[3100]", but none occurred
>     not ok 46 - vmalloc_oob
>     not ok 1 - kasan
> 
> ==================================================================
> After fix:
>     ok 1 - kasan
> 
> Fixes: cbd18991e24fe ("powerpc/mm: Fix an Oops in kasan_mmu_init()")
> Cc: stable@vger.kernel.org # 5.4.x
> Signed-off-by: Chen Jingwen <chenjingwen6@huawei.com>
> ---
>  arch/powerpc/mm/kasan/kasan_init_32.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
> index cf8770b1a692e..f3e4d069e0ba7 100644
> --- a/arch/powerpc/mm/kasan/kasan_init_32.c
> +++ b/arch/powerpc/mm/kasan/kasan_init_32.c
> @@ -83,13 +83,12 @@ void __init
>  kasan_update_early_region(unsigned long k_start, unsigned long k_end, pte_t pte)
>  {
>  	unsigned long k_cur;
> -	phys_addr_t pa = __pa(kasan_early_shadow_page);
>  
>  	for (k_cur = k_start; k_cur != k_end; k_cur += PAGE_SIZE) {
>  		pmd_t *pmd = pmd_off_k(k_cur);
>  		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
>  
> -		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
> +		if (pte_page(*ptep) != virt_to_page(lm_alias(kasan_early_shadow_page)))
>  			continue;
>  
>  		__set_pte_at(&init_mm, k_cur, ptep, pte, 0);
> -- 
> 2.19.1

Hi, It can be reproduced with the following kernel configs.
make corenet32_smp_defconfig

CONFIG_PPC_QEMU_E500=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
CONFIG_KASAN_OUTLINE=y
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y

And boot the kernel with the rootfs created by buildroot-2021.08.1.
qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel /code/linux/vmlinux \
-drive file=output/images/rootfs.ext2,if=virtio,format=raw \
-append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic

Could you help review this patch?
I will add the necessary info if any is needed.
