Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC9569EB9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 11:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldrzn6N9lz3c9B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdrzN5fhCz3btt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 19:42:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdrzH2d4Nz9tCW;
	Thu,  7 Jul 2022 11:42:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdHpqO682jL6; Thu,  7 Jul 2022 11:42:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdrzH1jMHz9tCP;
	Thu,  7 Jul 2022 11:42:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BFD98B79F;
	Thu,  7 Jul 2022 11:42:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NtHxox4L4Da7; Thu,  7 Jul 2022 11:42:03 +0200 (CEST)
Received: from [192.168.233.174] (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AB2778B768;
	Thu,  7 Jul 2022 11:42:02 +0200 (CEST)
Message-ID: <31f48655-650b-0bd0-425b-9b744fce2560@csgroup.eu>
Date: Thu, 7 Jul 2022 11:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] powerpc/kexec: avoid hard coding when automatically
 allocating mem for crashkernel
Content-Language: fr-FR
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Sourabh Jain <sourabhjain@linux.ibm.com>
References: <1535700623-23750-1-git-send-email-kernelfans@gmail.com>
 <1535700623-23750-3-git-send-email-kernelfans@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1535700623-23750-3-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Anton Blanchard <anton@samba.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/08/2018 à 09:30, Pingfan Liu a écrit :
> If no start address is specified for crashkernel, the current program hard
> code as: crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
> This limits the candidate memory region, and may cause failure while there
> is enough mem for crashkernel. This patch suggests to find a suitable mem
> chunk by memblock_find_in_range()

Seems like something more or less similar was done with commit 
7c5ed82b800d ("powerpc: Set crashkernel offset to mid of RMA region")

At least your patch conflicts with that commit, so if you think your 
patch is still relevant, please rebase and resubmit your series.

Thanks
Christophe

> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Cc: Anton Blanchard <anton@samba.org>
> ---
>   arch/powerpc/kernel/machine_kexec.c | 24 +++++++++++++++---------
>   arch/powerpc/kernel/prom.c          |  7 +++++--
>   2 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> index 63f5a93..78005bf 100644
> --- a/arch/powerpc/kernel/machine_kexec.c
> +++ b/arch/powerpc/kernel/machine_kexec.c
> @@ -22,6 +22,9 @@
>   #include <asm/pgalloc.h>
>   #include <asm/prom.h>
>   #include <asm/sections.h>
> +#include <asm/mmu.h>
> +
> +#include "setup.h"
>   
>   void machine_kexec_mask_interrupts(void) {
>   	unsigned int i;
> @@ -117,6 +120,7 @@ void machine_kexec(struct kimage *image)
>   void __init reserve_crashkernel(void)
>   {
>   	unsigned long long crash_size, crash_base;
> +	phys_addr_t start, up_boundary;
>   	int ret;
>   
>   	/* use common parsing */
> @@ -146,22 +150,24 @@ void __init reserve_crashkernel(void)
>   #else
>   	if (!crashk_res.start) {
>   #ifdef CONFIG_PPC64
> -		/*
> -		 * On 64bit we split the RMO in half but cap it at half of
> -		 * a small SLB (128MB) since the crash kernel needs to place
> -		 * itself and some stacks to be in the first segment.
> -		 */
> -		crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
> +		up_boundary = min(ppc64_bolted_size(), ppc64_rma_size);
> +		start = memblock_find_in_range(KDUMP_KERNELBASE, up_boundary,
> +				crash_size, PAGE_SIZE);
> +		if (start == 0) {
> +			pr_err("Failed to reserve memory for crashkernel!\n");
> +			crashk_res.start = crashk_res.end = 0;
> +			return;
> +		} else
> +			crashk_res.start = start;
>   #else
>   		crashk_res.start = KDUMP_KERNELBASE;
>   #endif
>   	}
>   
> -	crash_base = PAGE_ALIGN(crashk_res.start);
> -	if (crash_base != crashk_res.start) {
> +	if (crashk_res.start != PAGE_ALIGN(crashk_res.start)) {
>   		printk("Crash kernel base must be aligned to 0x%lx\n",
>   				PAGE_SIZE);
> -		crashk_res.start = crash_base;
> +		crashk_res.start = PAGE_ALIGN(crashk_res.start);
>   	}
>   
>   #endif
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index cae4a78..8b2ab99 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -688,6 +688,7 @@ static void tm_init(void) { }
>   void __init early_init_devtree(void *params)
>   {
>   	phys_addr_t limit;
> +	bool fadump_enabled = false;
>   
>   	DBG(" -> early_init_devtree(%p)\n", params);
>   
> @@ -737,9 +738,9 @@ void __init early_init_devtree(void *params)
>   	 * If we fail to reserve memory for firmware-assisted dump then
>   	 * fallback to kexec based kdump.
>   	 */
> -	if (fadump_reserve_mem() == 0)
> +	if (fadump_reserve_mem() == 1)
> +		fadump_enabled = true;
>   #endif
> -		reserve_crashkernel();
>   	early_reserve_mem();
>   
>   	/* Ensure that total memory size is page-aligned. */
> @@ -761,6 +762,8 @@ void __init early_init_devtree(void *params)
>   
>   	dt_cpu_ftrs_scan();
>   	mmu_early_init_devtree();
> +	if (!fadump_enabled)
> +		reserve_crashkernel();
>   
>   	/* Retrieve CPU related informations from the flat tree
>   	 * (altivec support, boot CPU ID, ...)
