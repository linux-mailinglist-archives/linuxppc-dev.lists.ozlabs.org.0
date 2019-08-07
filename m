Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB984C8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 15:12:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463X3p4fLtzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 23:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463WsX2bffzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 23:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 463WsR3f5pz9sNx;
 Wed,  7 Aug 2019 23:03:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jason Yan <yanaijie@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 diana.craciun@nxp.com, christophe.leroy@c-s.fr, benh@kernel.crashing.org,
 paulus@samba.org, npiggin@gmail.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v5 10/10] powerpc/fsl_booke/kaslr: dump out kernel offset
 information on panic
In-Reply-To: <20190807065706.11411-11-yanaijie@huawei.com>
References: <20190807065706.11411-1-yanaijie@huawei.com>
 <20190807065706.11411-11-yanaijie@huawei.com>
Date: Wed, 07 Aug 2019 23:03:35 +1000
Message-ID: <87zhklt9eg.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason Yan <yanaijie@huawei.com> writes:
> When kaslr is enabled, the kernel offset is different for every boot.
> This brings some difficult to debug the kernel. Dump out the kernel
> offset when panic so that we can easily debug the kernel.

Some of this is taken from the arm64 version right? Please say so when
you copy other people's code.

> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> index c4ed328a7b96..078fe3d76feb 100644
> --- a/arch/powerpc/kernel/machine_kexec.c
> +++ b/arch/powerpc/kernel/machine_kexec.c
> @@ -86,6 +86,7 @@ void arch_crash_save_vmcoreinfo(void)
>  	VMCOREINFO_STRUCT_SIZE(mmu_psize_def);
>  	VMCOREINFO_OFFSET(mmu_psize_def, shift);
>  #endif
> +	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
>  }

There's no mention of that in the commit log.

Please split it into a separate patch and describe what you're doing and
why.

> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 1f8db666468d..064075f02837 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -715,12 +715,31 @@ static struct notifier_block ppc_panic_block = {
>  	.priority = INT_MIN /* may not return; must be done last */
>  };
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
>  void __init setup_panic(void)
>  {
>  	/* PPC64 always does a hard irq disable in its panic handler */
>  	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
>  		return;
>  	atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block);

> +	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0)
> +		atomic_notifier_chain_register(&panic_notifier_list,
> +					       &kernel_offset_notifier);

Don't you want to do that before the return above?

>  }

cheers
