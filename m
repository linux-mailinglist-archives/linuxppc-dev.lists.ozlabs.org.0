Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B974D1B25F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 11:09:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452ZlJ0pPzzDqG1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 19:09:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hPDtQVjb"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452Zjy39SKzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 19:08:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 452Zjl591hz9v1JR;
 Mon, 13 May 2019 11:08:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hPDtQVjb; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JA6anqpL0UF4; Mon, 13 May 2019 11:08:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 452Zjl45gwz9v1J0;
 Mon, 13 May 2019 11:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557738507; bh=UFshgb6BIzVj7GEw7kicCu5xvS4eKXDuXt2CkYkULag=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hPDtQVjbAHcUKXUJuBVSHV3pz/VpiM1p6SDj/1AC3VYul3wp0ZVc7zikUNbb0BlRY
 wXtGH5dUMEPjPiAwnCrvwRedC5norTIlX6d7t9Z+A1SzTRx5hcZIUYdqncY6dmppOU
 9eG+GD91iPxvs55VVsHzlLFa4EVuNMtOf4v3AYEI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FC5B8B88E;
 Mon, 13 May 2019 11:08:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vQGZAey8eaZk; Mon, 13 May 2019 11:08:32 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12BDA8B883;
 Mon, 13 May 2019 11:08:32 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: Fix compile issue with force DAWR
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190513071703.25243-1-mikey@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f1015de7-faf1-ae6d-d1f9-9c904f19c58b@c-s.fr>
Date: Mon, 13 May 2019 11:08:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513071703.25243-1-mikey@neuling.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/05/2019 à 09:17, Michael Neuling a écrit :
> If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
> at linking with:
>    arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined reference to `dawr_force_enable'
> 
> This was caused by commit c1fe190c0672 ("powerpc: Add force enable of
> DAWR on P9 option").
> 
> This puts more of the dawr infrastructure in a new file.

I think you are doing a bit more than that. I think you should explain 
that you define a new CONFIG_ option, when it is selected, etc ...

The commit you are referring to is talking about P9. It looks like your 
patch covers a lot more, so it should be mentionned her I guess.

> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>

You should add a Fixes: tag, ie:

Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")

> --
> v2:
>    Fixes based on Christophe Leroy's comments:
>    - Fix commit message formatting
>    - Move more DAWR code into dawr.c
> ---
>   arch/powerpc/Kconfig                     |  5 ++
>   arch/powerpc/include/asm/hw_breakpoint.h | 20 ++++---
>   arch/powerpc/kernel/Makefile             |  1 +
>   arch/powerpc/kernel/dawr.c               | 75 ++++++++++++++++++++++++
>   arch/powerpc/kernel/hw_breakpoint.c      | 56 ------------------
>   arch/powerpc/kvm/Kconfig                 |  1 +
>   6 files changed, 94 insertions(+), 64 deletions(-)
>   create mode 100644 arch/powerpc/kernel/dawr.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2711aac246..f4b19e48cc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -242,6 +242,7 @@ config PPC
>   	select SYSCTL_EXCEPTION_TRACE
>   	select THREAD_INFO_IN_TASK
>   	select VIRT_TO_BUS			if !PPC64
> +	select PPC_DAWR_FORCE_ENABLE		if PPC64 || PERF

What's PERF ? Did you mean PERF_EVENTS ?

Then what you mean is:
- Selected all the time for PPC64
- Selected for PPC32 when PERF is also selected.

Is that what you want ? At first I thought it was linked to P9.


And ... did you read below statement ?

>   	#
>   	# Please keep this list sorted alphabetically.
>   	#
> @@ -369,6 +370,10 @@ config PPC_ADV_DEBUG_DAC_RANGE
>   	depends on PPC_ADV_DEBUG_REGS && 44x
>   	default y
>   
> +config PPC_DAWR_FORCE_ENABLE
> +	bool
> +	default y
> +

Why defaulting it to y. Then how is it set to n ?

>   config ZONE_DMA
>   	bool
>   	default y if PPC_BOOK3E_64
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 0fe8c1e46b..ffbc8eab41 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -47,6 +47,8 @@ struct arch_hw_breakpoint {
>   #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
>   				 HW_BRK_TYPE_HYP)
>   
> +extern int set_dawr(struct arch_hw_breakpoint *brk);
> +
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
>   #include <linux/kdebug.h>
>   #include <asm/reg.h>
> @@ -90,18 +92,20 @@ static inline void hw_breakpoint_disable(void)
>   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
>   int hw_breakpoint_handler(struct die_args *args);
>   
> -extern int set_dawr(struct arch_hw_breakpoint *brk);
> -extern bool dawr_force_enable;
> -static inline bool dawr_enabled(void)
> -{
> -	return dawr_force_enable;
> -}
> -

That's a very simple function, why not keep it here (or in another .h) 
as 'static inline' ?

>   #else	/* CONFIG_HAVE_HW_BREAKPOINT */
>   static inline void hw_breakpoint_disable(void) { }
>   static inline void thread_change_pc(struct task_struct *tsk,
>   					struct pt_regs *regs) { }
> -static inline bool dawr_enabled(void) { return false; }
> +
>   #endif	/* CONFIG_HAVE_HW_BREAKPOINT */
> +
> +extern bool dawr_force_enable;
> +
> +#ifdef CONFIG_PPC_DAWR_FORCE_ENABLE
> +extern bool dawr_enabled(void);

Functions should not be 'extern'. I'm sure checkpatch --strict will tell 
you.

> +#else
> +#define dawr_enabled() true

true by default ?
Previously it was false by default.

And why a #define ? That's better to keep a static inline.

> +#endif
> +
>   #endif	/* __KERNEL__ */
>   #endif	/* _PPC_BOOK3S_64_HW_BREAKPOINT_H */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 0ea6c4aa3a..a9c497c34f 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
>   obj-$(CONFIG_VDSO32)		+= vdso32/
>   obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
>   obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> +obj-$(CONFIG_PPC_DAWR_FORCE_ENABLE)	+= dawr.o
>   obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
>   obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
>   obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
> diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
> new file mode 100644
> index 0000000000..cf1d02fe1e
> --- /dev/null
> +++ b/arch/powerpc/kernel/dawr.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// DAWR infrastructure
> +//
> +// Copyright 2019, Michael Neuling, IBM Corporation.
> +
> +#include <linux/types.h>
> +#include <linux/export.h>
> +#include <linux/fs.h>
> +#include <linux/debugfs.h>
> +#include <asm/debugfs.h>
> +#include <asm/machdep.h>
> +#include <asm/hvcall.h>
> +
> +bool dawr_force_enable;
> +EXPORT_SYMBOL_GPL(dawr_force_enable);
> +
> +extern bool dawr_enabled(void)

extern ????

> +{
> +	return dawr_force_enable;
> +}
> +EXPORT_SYMBOL_GPL(dawr_enabled);

Since dawr_force_enable is also exported, I see no point in having such 
a tiny function as an exported function, was better as a 'static inline'.

> +
> +static ssize_t dawr_write_file_bool(struct file *file,
> +				    const char __user *user_buf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct arch_hw_breakpoint null_brk = {0, 0, 0};
> +	size_t rc;
> +
> +	/* Send error to user if they hypervisor won't allow us to write DAWR */
> +	if ((!dawr_force_enable) &&
> +	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> +	    (set_dawr(&null_brk) != H_SUCCESS))

The above is not real clear.
set_dabr() returns 0, H_SUCCESS is not used there.

> +		return -1;
> +
> +	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
> +	if (rc)
> +		return rc;
> +
> +	/* If we are clearing, make sure all CPUs have the DAWR cleared */
> +	if (!dawr_force_enable)
> +		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> +
> +	return rc;
> +}
> +
> +static const struct file_operations dawr_enable_fops = {
> +	.read =		debugfs_read_file_bool,
> +	.write =	dawr_write_file_bool,
> +	.open =		simple_open,
> +	.llseek =	default_llseek,
> +};
> +
> +static int __init dawr_force_setup(void)
> +{
> +	dawr_force_enable = false;

The above is not needed, the BSS is zeroised at kernel startup.

> +
> +	if (cpu_has_feature(CPU_FTR_DAWR)) {
> +		/* Don't setup sysfs file for user control on P8 */
> +		dawr_force_enable = true;

Strange comment, word "don't" doesn't really fit with a 'true'

> +		return 0;
> +	}
> +
> +	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {

You could use pvr_version_is(PVR_POWER9) instead of open codiing.

> +		/* Turn DAWR off by default, but allow admin to turn it on */
> +		dawr_force_enable = false;
> +		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
> +					   powerpc_debugfs_root,
> +					   &dawr_force_enable,
> +					   &dawr_enable_fops);
> +	}
> +	return 0;
> +}
> +arch_initcall(dawr_force_setup);

Wouldn't it also make sense to move set_dawr() from process.c to here ?

> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index da307dd93e..95605a9c9a 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -380,59 +380,3 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
>   {
>   	/* TODO */
>   }
> -
> -bool dawr_force_enable;
> -EXPORT_SYMBOL_GPL(dawr_force_enable);
> -
> -static ssize_t dawr_write_file_bool(struct file *file,
> -				    const char __user *user_buf,
> -				    size_t count, loff_t *ppos)
> -{
> -	struct arch_hw_breakpoint null_brk = {0, 0, 0};
> -	size_t rc;
> -
> -	/* Send error to user if they hypervisor won't allow us to write DAWR */
> -	if ((!dawr_force_enable) &&
> -	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> -	    (set_dawr(&null_brk) != H_SUCCESS))
> -		return -1;
> -
> -	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
> -	if (rc)
> -		return rc;
> -
> -	/* If we are clearing, make sure all CPUs have the DAWR cleared */
> -	if (!dawr_force_enable)
> -		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> -
> -	return rc;
> -}
> -
> -static const struct file_operations dawr_enable_fops = {
> -	.read =		debugfs_read_file_bool,
> -	.write =	dawr_write_file_bool,
> -	.open =		simple_open,
> -	.llseek =	default_llseek,
> -};
> -
> -static int __init dawr_force_setup(void)
> -{
> -	dawr_force_enable = false;
> -
> -	if (cpu_has_feature(CPU_FTR_DAWR)) {
> -		/* Don't setup sysfs file for user control on P8 */
> -		dawr_force_enable = true;
> -		return 0;
> -	}
> -
> -	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {
> -		/* Turn DAWR off by default, but allow admin to turn it on */
> -		dawr_force_enable = false;
> -		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
> -					   powerpc_debugfs_root,
> -					   &dawr_force_enable,
> -					   &dawr_enable_fops);
> -	}
> -	return 0;
> -}
> -arch_initcall(dawr_force_setup);
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index bfdde04e49..9c0d315108 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -39,6 +39,7 @@ config KVM_BOOK3S_32_HANDLER
>   config KVM_BOOK3S_64_HANDLER
>   	bool
>   	select KVM_BOOK3S_HANDLER
> +	select PPC_DAWR_FORCE_ENABLE
>   
>   config KVM_BOOK3S_PR_POSSIBLE
>   	bool
> 

Christophe
