Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C94A6E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 18:30:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45StqL00NlzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 02:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ElKmZSCg"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Stn75q5gzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 02:28:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Stmz6L1dz9v0bH;
 Tue, 18 Jun 2019 18:28:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ElKmZSCg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wKDsziUzR4Iq; Tue, 18 Jun 2019 18:28:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Stmz4BbWz9v0bG;
 Tue, 18 Jun 2019 18:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560875315; bh=7a8k5EJMxMkqWoqwSwYSVX3IVs6PngeGr7hnbR0I5Go=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ElKmZSCgVfguSTKxqZN9krSQ7VEY+QiiTd+t7KH4uPO/sYarUh2r1E3Qk1Lnm+yrE
 OAJyLhtGw2rhu3SSHwAPVrtGuYmBdX80e1RxYngRRHLFNZX/lnVYx9QZi4RuWFEi7q
 +TAcDQO7owjc+qIFQSREsDht63EwyQ75x2yjFtGA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A9868B8D7;
 Tue, 18 Jun 2019 18:28:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uBcMbo5E-1tJ; Tue, 18 Jun 2019 18:28:36 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D82348B8D8;
 Tue, 18 Jun 2019 18:28:34 +0200 (CEST)
Subject: Re: [PATCH v5 2/2] powerpc: Fix compile issue with force DAWR
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190604030037.9424-1-mikey@neuling.org>
 <20190604030037.9424-2-mikey@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e20b2d44-508c-7d06-1af8-b608563b8c57@c-s.fr>
Date: Tue, 18 Jun 2019 18:28:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190604030037.9424-2-mikey@neuling.org>
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
Cc: Mathieu Malaterre <malat@debian.org>, hch@infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/06/2019 à 05:00, Michael Neuling a écrit :
> If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
> at linking with:
>    arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined reference to `dawr_force_enable'
> 
> This was caused by commit c1fe190c0672 ("powerpc: Add force enable of
> DAWR on P9 option").
> 
> This moves a bunch of code around to fix this. It moves a lot of the
> DAWR code in a new file and creates a new CONFIG_PPC_DAWR to enable
> compiling it.

After looking at all this once more, I'm just wondering: why are we 
creating stuff specific to DAWR ?

In the old days, we only add DABR, and everything was named on DABR.
When DAWR was introduced some years ago we renamed stuff like do_dabr() 
to do_break() so that we could regroup things together. And now we are 
taking dawr() out of the rest. Why not keep dabr() stuff and dawr() 
stuff all together in something dedicated to breakpoints, and try to 
regroup all breakpoint stuff in a single place ? I see some 
breakpointing stuff done in kernel/process.c and other things done in 
hw_breakpoint.c, to common functions call from one file to the other, 
preventing GCC to fully optimise, etc ...

Also, behing this thinking, I have the idea that we could easily 
implement 512 bytes breakpoints on the 8xx too. The 8xx have neither 
DABR nor DAWR, but is using a set of comparators. And as you can see in 
the 8xx version of __set_dabr() in kernel/process.c, we emulate the DABR 
behaviour by setting two comparators. By using the same comparators with 
a different setup, we should be able to implement breakpoints on larger 
ranges of address.

Christophe

> 
> Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> --
> v5:
>    - Changes based on comments by hch
>      - Change // to /* comments
>      - Change return code from -1 to -ENODEV
>      - Remove unneeded default n in new Kconfig option
>      - Remove setting to default value
>      - Remove unnecessary braces
> 
> v4:
>    - Fix merge conflict with patch from Mathieu Malaterre:
>       powerpc: silence a -Wcast-function-type warning in dawr_write_file_bool
>    - Fixed checkpatch issues noticed by Christophe Leroy.
> 
> v3:
>    Fixes based on Christophe Leroy's comments:
>    - Fix Kconfig options to better reflect reality
>    - Reorder alphabetically
>    - Inline vs #define
>    - Fixed default return for dawr_enabled() when CONFIG_PPC_DAWR=N
> 
> V2:
>    Fixes based on Christophe Leroy's comments:
>    - Fix commit message formatting
>    - Move more DAWR code into dawr.c
> ---
>   arch/powerpc/Kconfig                     |  4 +
>   arch/powerpc/include/asm/hw_breakpoint.h | 21 +++--
>   arch/powerpc/kernel/Makefile             |  1 +
>   arch/powerpc/kernel/dawr.c               | 98 ++++++++++++++++++++++++
>   arch/powerpc/kernel/hw_breakpoint.c      | 61 ---------------
>   arch/powerpc/kernel/process.c            | 28 -------
>   arch/powerpc/kvm/Kconfig                 |  1 +
>   7 files changed, 118 insertions(+), 96 deletions(-)
>   create mode 100644 arch/powerpc/kernel/dawr.c
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308..9d61b36df4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -234,6 +234,7 @@ config PPC
>   	select OLD_SIGSUSPEND
>   	select PCI_DOMAINS			if PCI
>   	select PCI_SYSCALL			if PCI
> +	select PPC_DAWR				if PPC64
>   	select RTC_LIB
>   	select SPARSE_IRQ
>   	select SYSCTL_EXCEPTION_TRACE
> @@ -370,6 +371,9 @@ config PPC_ADV_DEBUG_DAC_RANGE
>   	depends on PPC_ADV_DEBUG_REGS && 44x
>   	default y
>   
> +config PPC_DAWR
> +	bool
> +
>   config ZONE_DMA
>   	bool
>   	default y if PPC_BOOK3E_64
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 0fe8c1e46b..41abdae6d0 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -90,18 +90,25 @@ static inline void hw_breakpoint_disable(void)
>   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
>   int hw_breakpoint_handler(struct die_args *args);
>   
> -extern int set_dawr(struct arch_hw_breakpoint *brk);
> +#else	/* CONFIG_HAVE_HW_BREAKPOINT */
> +static inline void hw_breakpoint_disable(void) { }
> +static inline void thread_change_pc(struct task_struct *tsk,
> +					struct pt_regs *regs) { }
> +
> +#endif	/* CONFIG_HAVE_HW_BREAKPOINT */
> +
> +
> +#ifdef CONFIG_PPC_DAWR
>   extern bool dawr_force_enable;
>   static inline bool dawr_enabled(void)
>   {
>   	return dawr_force_enable;
>   }
> -
> -#else	/* CONFIG_HAVE_HW_BREAKPOINT */
> -static inline void hw_breakpoint_disable(void) { }
> -static inline void thread_change_pc(struct task_struct *tsk,
> -					struct pt_regs *regs) { }
> +int set_dawr(struct arch_hw_breakpoint *brk);
> +#else
>   static inline bool dawr_enabled(void) { return false; }
> -#endif	/* CONFIG_HAVE_HW_BREAKPOINT */
> +static inline int set_dawr(struct arch_hw_breakpoint *brk) { return -1; }
> +#endif
> +
>   #endif	/* __KERNEL__ */
>   #endif	/* _PPC_BOOK3S_64_HW_BREAKPOINT_H */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 0ea6c4aa3a..56dfa7a2a6 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
>   obj-$(CONFIG_VDSO32)		+= vdso32/
>   obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
>   obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> +obj-$(CONFIG_PPC_DAWR)		+= dawr.o
>   obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
>   obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
>   obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
> diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
> new file mode 100644
> index 0000000000..ae3bd6abac
> --- /dev/null
> +++ b/arch/powerpc/kernel/dawr.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * DAWR infrastructure
> + *
> + * Copyright 2019, Michael Neuling, IBM Corporation.
> + */
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
> +int set_dawr(struct arch_hw_breakpoint *brk)
> +{
> +	unsigned long dawr, dawrx, mrd;
> +
> +	dawr = brk->address;
> +
> +	dawrx  = (brk->type & (HW_BRK_TYPE_READ | HW_BRK_TYPE_WRITE))
> +		<< (63 - 58);
> +	dawrx |= ((brk->type & (HW_BRK_TYPE_TRANSLATE)) >> 2) << (63 - 59);
> +	dawrx |= (brk->type & (HW_BRK_TYPE_PRIV_ALL)) >> 3;
> +	/* dawr length is stored in field MDR bits 48:53.  Matches range in
> +	 * doublewords (64 bits) baised by -1 eg. 0b000000=1DW and
> +	 * 0b111111=64DW.
> +	 * brk->len is in bytes.
> +	 * This aligns up to double word size, shifts and does the bias.
> +	 */
> +	mrd = ((brk->len + 7) >> 3) - 1;
> +	dawrx |= (mrd & 0x3f) << (63 - 53);
> +
> +	if (ppc_md.set_dawr)
> +		return ppc_md.set_dawr(dawr, dawrx);
> +	mtspr(SPRN_DAWR, dawr);
> +	mtspr(SPRN_DAWRX, dawrx);
> +	return 0;
> +}
> +
> +static void set_dawr_cb(void *info)
> +{
> +	set_dawr(info);
> +}
> +
> +static ssize_t dawr_write_file_bool(struct file *file,
> +				    const char __user *user_buf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct arch_hw_breakpoint null_brk = {0, 0, 0};
> +	size_t rc;
> +
> +	/* Send error to user if they hypervisor won't allow us to write DAWR */
> +	if (!dawr_force_enable &&
> +	    firmware_has_feature(FW_FEATURE_LPAR) &&
> +	    set_dawr(&null_brk) != H_SUCCESS)
> +		return -ENODEV;
> +
> +	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
> +	if (rc)
> +		return rc;
> +
> +	/* If we are clearing, make sure all CPUs have the DAWR cleared */
> +	if (!dawr_force_enable)
> +		smp_call_function(set_dawr_cb, &null_brk, 0);
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
> +	if (cpu_has_feature(CPU_FTR_DAWR)) {
> +		/* Don't setup sysfs file for user control on P8 */
> +		dawr_force_enable = true;
> +		return 0;
> +	}
> +
> +	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {
> +		/* Turn DAWR off by default, but allow admin to turn it on */
> +		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
> +					   powerpc_debugfs_root,
> +					   &dawr_force_enable,
> +					   &dawr_enable_fops);
> +	}
> +	return 0;
> +}
> +arch_initcall(dawr_force_setup);
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index ca3a2358b7..95605a9c9a 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -380,64 +380,3 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
>   {
>   	/* TODO */
>   }
> -
> -bool dawr_force_enable;
> -EXPORT_SYMBOL_GPL(dawr_force_enable);
> -
> -static void set_dawr_cb(void *info)
> -{
> -	set_dawr(info);
> -}
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
> -		smp_call_function(set_dawr_cb, &null_brk, 0);
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
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 87da401299..03a2da35ce 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -797,34 +797,6 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
>   	return __set_dabr(dabr, dabrx);
>   }
>   
> -int set_dawr(struct arch_hw_breakpoint *brk)
> -{
> -	unsigned long dawr, dawrx, mrd;
> -
> -	dawr = brk->address;
> -
> -	dawrx  = (brk->type & (HW_BRK_TYPE_READ | HW_BRK_TYPE_WRITE)) \
> -		                   << (63 - 58); //* read/write bits */
> -	dawrx |= ((brk->type & (HW_BRK_TYPE_TRANSLATE)) >> 2) \
> -		                   << (63 - 59); //* translate */
> -	dawrx |= (brk->type & (HW_BRK_TYPE_PRIV_ALL)) \
> -		                   >> 3; //* PRIM bits */
> -	/* dawr length is stored in field MDR bits 48:53.  Matches range in
> -	   doublewords (64 bits) baised by -1 eg. 0b000000=1DW and
> -	   0b111111=64DW.
> -	   brk->len is in bytes.
> -	   This aligns up to double word size, shifts and does the bias.
> -	*/
> -	mrd = ((brk->len + 7) >> 3) - 1;
> -	dawrx |= (mrd & 0x3f) << (63 - 53);
> -
> -	if (ppc_md.set_dawr)
> -		return ppc_md.set_dawr(dawr, dawrx);
> -	mtspr(SPRN_DAWR, dawr);
> -	mtspr(SPRN_DAWRX, dawrx);
> -	return 0;
> -}
> -
>   void __set_breakpoint(struct arch_hw_breakpoint *brk)
>   {
>   	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index f53997a8ca..b8e13d5a4a 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -38,6 +38,7 @@ config KVM_BOOK3S_32_HANDLER
>   config KVM_BOOK3S_64_HANDLER
>   	bool
>   	select KVM_BOOK3S_HANDLER
> +	select PPC_DAWR_FORCE_ENABLE
>   
>   config KVM_BOOK3S_PR_POSSIBLE
>   	bool
> 
