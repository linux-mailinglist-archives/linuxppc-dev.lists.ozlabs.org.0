Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC67A53E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 11:54:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yX2W0p4nzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 19:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="gVISzoKt"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yWwb3pv6zDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 19:49:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45yWwW1BVGz9vBLV;
 Tue, 30 Jul 2019 11:48:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gVISzoKt; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mXrohcSYwk5G; Tue, 30 Jul 2019 11:48:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45yWwW05gcz9vBLN;
 Tue, 30 Jul 2019 11:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564480139; bh=tFSCyuXc6xQQsa1h4dVfNa0KvJuc0fYe9QTvxMXWUko=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gVISzoKtekQbUyLsLuz/fiSuqHr8hTH9GVy3MNjsYonNwQXwqaDGF4JIojVzSpw6s
 o+RcDtYDrqB1/6D3ZbKWuMfgQUgniAlw62L9NVMrAD+m3eLUpqcx8k1kdHQ8c9lyTM
 MXL5wJJnNCIb4BDP8JNrMMuS+OCntHIg0vEgGics=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 22B038B803;
 Tue, 30 Jul 2019 11:49:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eL2YwilihXe6; Tue, 30 Jul 2019 11:49:00 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D06DD8B801;
 Tue, 30 Jul 2019 11:48:59 +0200 (CEST)
Subject: Re: [PATCH v2 10/10] powerpc/fsl_booke/kaslr: dump out kernel offset
 information on panic
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com
References: <20190730074225.39544-1-yanaijie@huawei.com>
 <20190730074225.39544-11-yanaijie@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2a31b934-3658-c02e-4e86-c9ba03029bd6@c-s.fr>
Date: Tue, 30 Jul 2019 11:48:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730074225.39544-11-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/07/2019 à 09:42, Jason Yan a écrit :
> When kaslr is enabled, the kernel offset is different for every boot.
> This brings some difficult to debug the kernel. Dump out the kernel
> offset when panic so that we can easily debug the kernel.
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Cc: Diana Craciun <diana.craciun@nxp.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Kees Cook <keescook@chromium.org>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>


> ---
>   arch/powerpc/include/asm/page.h     |  5 +++++
>   arch/powerpc/kernel/machine_kexec.c |  1 +
>   arch/powerpc/kernel/setup-common.c  | 19 +++++++++++++++++++
>   3 files changed, 25 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 60a68d3a54b1..cd3ac530e58d 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -317,6 +317,11 @@ struct vm_area_struct;
>   
>   extern unsigned long kimage_vaddr;
>   
> +static inline unsigned long kaslr_offset(void)
> +{
> +	return kimage_vaddr - KERNELBASE;
> +}
> +
>   #include <asm-generic/memory_model.h>
>   #endif /* __ASSEMBLY__ */
>   #include <asm/slice.h>
> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> index c4ed328a7b96..078fe3d76feb 100644
> --- a/arch/powerpc/kernel/machine_kexec.c
> +++ b/arch/powerpc/kernel/machine_kexec.c
> @@ -86,6 +86,7 @@ void arch_crash_save_vmcoreinfo(void)
>   	VMCOREINFO_STRUCT_SIZE(mmu_psize_def);
>   	VMCOREINFO_OFFSET(mmu_psize_def, shift);
>   #endif
> +	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
>   }
>   
>   /*
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 1f8db666468d..064075f02837 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -715,12 +715,31 @@ static struct notifier_block ppc_panic_block = {
>   	.priority = INT_MIN /* may not return; must be done last */
>   };
>   
> +/*
> + * Dump out kernel offset information on panic.
> + */
> +static int dump_kernel_offset(struct notifier_block *self, unsigned long v,
> +			      void *p)
> +{
> +	pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
> +		 kaslr_offset(), KERNELBASE);
> +
> +	return 0;
> +}
> +
> +static struct notifier_block kernel_offset_notifier = {
> +	.notifier_call = dump_kernel_offset
> +};
> +
>   void __init setup_panic(void)
>   {
>   	/* PPC64 always does a hard irq disable in its panic handler */
>   	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
>   		return;
>   	atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block);
> +	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0)
> +		atomic_notifier_chain_register(&panic_notifier_list,
> +					       &kernel_offset_notifier);
>   }
>   
>   #ifdef CONFIG_CHECK_CACHE_COHERENCY
> 
