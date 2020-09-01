Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A129D258D06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 12:50:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgkPP4ZdszDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 20:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BgkMh64ghzDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 20:49:02 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4083E1045;
 Tue,  1 Sep 2020 03:48:59 -0700 (PDT)
Received: from [10.163.69.134] (unknown [10.163.69.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1DF3F68F;
 Tue,  1 Sep 2020 03:48:57 -0700 (PDT)
Subject: Re: [PATCH v2] powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200901094423.100149-1-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <ab7b4fe6-9b4a-8d65-85e0-689303b61fdf@arm.com>
Date: Tue, 1 Sep 2020 16:18:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200901094423.100149-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/01/2020 03:14 PM, Aneesh Kumar K.V wrote:
> The test is broken w.r.t page table update rules and results in kernel
> crash as below. Disable the support until we get the tests updated.
> 
> [   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
> cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
>     pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
>     lr: c0000000005eeeec: pte_update+0x11c/0x190
>     sp: c000000c6d1e7950
>    msr: 8000000002029033
>   current = 0xc000000c6d172c80
>   paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 1, comm = swapper/0
> kernel BUG at arch/powerpc/mm/pgtable.c:304!
> [link register   ] c0000000005eeeec pte_update+0x11c/0x190
> [c000000c6d1e7950] 0000000000000001 (unreliable)
> [c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
> [c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
> [c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
> [c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> [c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
> [c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
> [c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> 
> With DEBUG_VM disabled
> 
> [   20.530152] BUG: Kernel NULL pointer dereference on read at 0x00000000
> [   20.530183] Faulting instruction address: 0xc0000000000df330
> cpu 0x33: Vector: 380 (Data SLB Access) at [c000000c6d19f700]
>     pc: c0000000000df330: memset+0x68/0x104
>     lr: c00000000009f6d8: hash__pmdp_huge_get_and_clear+0xe8/0x1b0
>     sp: c000000c6d19f990
>    msr: 8000000002009033
>    dar: 0
>   current = 0xc000000c6d177480
>   paca    = 0xc00000001ec4f400   irqmask: 0x03   irq_happened: 0x01
>     pid   = 1, comm = swapper/0
> [link register   ] c00000000009f6d8 hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> [c000000c6d19f990] c00000000009f748 hash__pmdp_huge_get_and_clear+0x158/0x1b0 (unreliable)
> [c000000c6d19fa10] c0000000019ebf30 pmd_advanced_tests+0x1f0/0x378
> [c000000c6d19fab0] c0000000019ed088 debug_vm_pgtable+0x79c/0x1244
> [c000000c6d19fba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> [c000000c6d19fc80] c0000000019a4fac kernel_init_freeable+0x4dc/0x5a4
> [c000000c6d19fdb0] c000000000012474 kernel_init+0x24/0x160
> [c000000c6d19fe20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> 33:mon>
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 65bed1fdeaad..787e829b6f25 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -116,7 +116,6 @@ config PPC
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
>  	select ARCH_HAS_DEBUG_VIRTUAL
> -	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FORTIFY_SOURCE
> 

If support for powerpc is being dropped, please update the features file
here as well. They should be in sync.

Documentation/features/debug/debug-vm-pgtable/arch-support.txt
