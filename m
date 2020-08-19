Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B77249525
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 08:46:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWdbK3jHCzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 16:46:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWdYL1pfKzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 16:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BWdYK6SZLz8tCH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 16:44:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BWdYK5vdVz9sTX; Wed, 19 Aug 2020 16:44:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BWdYJ4NZQz9sPf
 for <linuxppc-dev@ozlabs.org>; Wed, 19 Aug 2020 16:44:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWdY675mnz9tx2s;
 Wed, 19 Aug 2020 08:44:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NTuT2RQzFReN; Wed, 19 Aug 2020 08:44:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWdY66GSfz9tx2r;
 Wed, 19 Aug 2020 08:44:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CABBC8B7F1;
 Wed, 19 Aug 2020 08:44:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tQMR9cjshjT9; Wed, 19 Aug 2020 08:44:11 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A444C8B767;
 Wed, 19 Aug 2020 08:44:11 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc/smp: Move ppc_md.cpu_die() to
 smp_ops.cpu_offline_self()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200819015634.1974478-1-mpe@ellerman.id.au>
 <20200819015634.1974478-3-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1d8db011-66e6-3385-18a4-e273a77b14fc@csgroup.eu>
Date: Wed, 19 Aug 2020 08:44:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819015634.1974478-3-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2020 à 03:56, Michael Ellerman a écrit :
> We have smp_ops->cpu_die() and ppc_md.cpu_die(). One of them offlines
> the current CPU and one offlines another CPU, can you guess which is
> which? Also one is in smp_ops and one is in ppc_md?
> 
> So rename ppc_md.cpu_die(), to cpu_offline_self(), because that's what
> it does. And move it into smp_ops where it belongs.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/include/asm/machdep.h           | 1 -
>   arch/powerpc/include/asm/smp.h               | 3 +++
>   arch/powerpc/kernel/smp.c                    | 4 ++--
>   arch/powerpc/kernel/sysfs.c                  | 4 +++-
>   arch/powerpc/platforms/85xx/smp.c            | 4 ++--
>   arch/powerpc/platforms/powermac/pmac.h       | 2 +-
>   arch/powerpc/platforms/powermac/sleep.S      | 6 +++---
>   arch/powerpc/platforms/powermac/smp.c        | 8 ++++----
>   arch/powerpc/platforms/powernv/smp.c         | 4 ++--
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 6 +++---
>   10 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
> index a90b892f0bfe..cc2ec7101520 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -65,7 +65,6 @@ struct machdep_calls {
>   	void __noreturn	(*restart)(char *cmd);
>   	void __noreturn (*halt)(void);
>   	void		(*panic)(char *str);
> -	void		(*cpu_die)(void);
>   
>   	long		(*time_init)(void); /* Optional, may be NULL */
>   
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index a314d2d2d2be..0d00faf8f119 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -49,6 +49,9 @@ struct smp_ops_t {
>   	int   (*cpu_disable)(void);
>   	void  (*cpu_die)(unsigned int nr);
>   	int   (*cpu_bootable)(unsigned int nr);
> +#ifdef CONFIG_HOTPLUG_CPU

Is that a performance issue to have that member all the time in smp_ops_t ?
Otherwise we could avoid the #ifdef here and in arch/powerpc/kernel/sysfs.c

Christophe

> +	void  (*cpu_offline_self)(void);
> +#endif
>   };
>   
>   extern int smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us);
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index c616d975bf95..faba0fdee500 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1439,8 +1439,8 @@ void arch_cpu_idle_dead(void)
>   	 */
>   	this_cpu_disable_ftrace();
>   
> -	if (ppc_md.cpu_die)
> -		ppc_md.cpu_die();
> +	if (smp_ops->cpu_offline_self)
> +		smp_ops->cpu_offline_self();
>   
>   	/* If we return, we re-enter start_secondary */
>   	start_secondary_resume();
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 6bebc9a52444..7c4ccc03c2de 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -1161,6 +1161,7 @@ static int __init topology_init(void)
>   	for_each_possible_cpu(cpu) {
>   		struct cpu *c = &per_cpu(cpu_devices, cpu);
>   
> +#ifdef CONFIG_HOTPLUG_CPU
>   		/*
>   		 * For now, we just see if the system supports making
>   		 * the RTAS calls for CPU hotplug.  But, there may be a
> @@ -1168,8 +1169,9 @@ static int __init topology_init(void)
>   		 * CPU.  For instance, the boot cpu might never be valid
>   		 * for hotplugging.
>   		 */
> -		if (ppc_md.cpu_die)
> +		if (smp_ops->cpu_offline_self)
>   			c->hotpluggable = 1;
> +#endif
>   
>   		if (cpu_online(cpu) || c->hotpluggable) {
>   			register_cpu(c, cpu);
> diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
> index fda108bae95f..c6df294054fe 100644
> --- a/arch/powerpc/platforms/85xx/smp.c
> +++ b/arch/powerpc/platforms/85xx/smp.c
> @@ -112,7 +112,7 @@ static void mpc85xx_take_timebase(void)
>   	local_irq_restore(flags);
>   }
>   
> -static void smp_85xx_mach_cpu_die(void)
> +static void smp_85xx_cpu_offline_self(void)
>   {
>   	unsigned int cpu = smp_processor_id();
>   
> @@ -506,7 +506,7 @@ void __init mpc85xx_smp_init(void)
>   	if (qoriq_pm_ops) {
>   		smp_85xx_ops.give_timebase = mpc85xx_give_timebase;
>   		smp_85xx_ops.take_timebase = mpc85xx_take_timebase;
> -		ppc_md.cpu_die = smp_85xx_mach_cpu_die;
> +		smp_85xx_ops.cpu_offline_self = smp_85xx_cpu_offline_self;
>   		smp_85xx_ops.cpu_die = qoriq_cpu_kill;
>   	}
>   #endif
> diff --git a/arch/powerpc/platforms/powermac/pmac.h b/arch/powerpc/platforms/powermac/pmac.h
> index 16a52afdb76e..0d715db434dc 100644
> --- a/arch/powerpc/platforms/powermac/pmac.h
> +++ b/arch/powerpc/platforms/powermac/pmac.h
> @@ -34,7 +34,7 @@ extern void pmac_check_ht_link(void);
>   
>   extern void pmac_setup_smp(void);
>   extern int psurge_secondary_virq;
> -extern void low_cpu_die(void) __attribute__((noreturn));
> +extern void low_cpu_offline_self(void) __attribute__((noreturn));
>   
>   extern int pmac_nvram_init(void);
>   extern void pmac_pic_init(void);
> diff --git a/arch/powerpc/platforms/powermac/sleep.S b/arch/powerpc/platforms/powermac/sleep.S
> index f9a680fdd9c4..c51bb63c9417 100644
> --- a/arch/powerpc/platforms/powermac/sleep.S
> +++ b/arch/powerpc/platforms/powermac/sleep.S
> @@ -201,8 +201,8 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
>   	addi r3,r3,sleep_storage@l
>   	stw r5,0(r3)
>   
> -	.globl	low_cpu_die
> -low_cpu_die:
> +	.globl	low_cpu_offline_self
> +low_cpu_offline_self:
>   	/* Flush & disable all caches */
>   	bl	flush_disable_caches
>   
> @@ -244,7 +244,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPEC7450)
>   	mtmsr	r2
>   	isync
>   	b	1b
> -_ASM_NOKPROBE_SYMBOL(low_cpu_die)
> +_ASM_NOKPROBE_SYMBOL(low_cpu_offline_self)
>   /*
>    * Here is the resume code.
>    */
> diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
> index eb23264910e1..a6fedcfb714f 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -920,7 +920,7 @@ static int smp_core99_cpu_disable(void)
>   
>   #ifdef CONFIG_PPC32
>   
> -static void pmac_cpu_die(void)
> +static void pmac_cpu_offline_self(void)
>   {
>   	int cpu = smp_processor_id();
>   
> @@ -930,12 +930,12 @@ static void pmac_cpu_die(void)
>   	generic_set_cpu_dead(cpu);
>   	smp_wmb();
>   	mb();
> -	low_cpu_die();
> +	low_cpu_offline_self();
>   }
>   
>   #else /* CONFIG_PPC32 */
>   
> -static void pmac_cpu_die(void)
> +static void pmac_cpu_offline_self(void)
>   {
>   	int cpu = smp_processor_id();
>   
> @@ -1020,7 +1020,7 @@ void __init pmac_setup_smp(void)
>   #endif /* CONFIG_PPC_PMAC32_PSURGE */
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> -	ppc_md.cpu_die = pmac_cpu_die;
> +	smp_ops->cpu_offline_self = pmac_cpu_offline_self;
>   #endif
>   }
>   
> diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
> index bbf361f23ae8..54c4ba45c7ce 100644
> --- a/arch/powerpc/platforms/powernv/smp.c
> +++ b/arch/powerpc/platforms/powernv/smp.c
> @@ -158,7 +158,7 @@ static void pnv_flush_interrupts(void)
>   	}
>   }
>   
> -static void pnv_smp_cpu_kill_self(void)
> +static void pnv_cpu_offline_self(void)
>   {
>   	unsigned long srr1, unexpected_mask, wmask;
>   	unsigned int cpu;
> @@ -417,6 +417,7 @@ static struct smp_ops_t pnv_smp_ops = {
>   #ifdef CONFIG_HOTPLUG_CPU
>   	.cpu_disable	= pnv_smp_cpu_disable,
>   	.cpu_die	= generic_cpu_die,
> +	.cpu_offline_self = pnv_cpu_offline_self,
>   #endif /* CONFIG_HOTPLUG_CPU */
>   };
>   
> @@ -430,7 +431,6 @@ void __init pnv_smp_init(void)
>   	smp_ops = &pnv_smp_ops;
>   
>   #ifdef CONFIG_HOTPLUG_CPU
> -	ppc_md.cpu_die	= pnv_smp_cpu_kill_self;
>   #ifdef CONFIG_KEXEC_CORE
>   	crash_wake_offline = 1;
>   #endif
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index c6e0d8abf75e..43b020a30072 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -55,7 +55,7 @@ static void rtas_stop_self(void)
>   	panic("Alas, I survived.\n");
>   }
>   
> -static void pseries_mach_cpu_die(void)
> +static void pseries_cpu_offline_self(void)
>   {
>   	unsigned int hwcpu = hard_smp_processor_id();
>   
> @@ -102,7 +102,7 @@ static int pseries_cpu_disable(void)
>    * to self-destroy so that the cpu-offline thread can send the CPU_DEAD
>    * notifications.
>    *
> - * OTOH, pseries_mach_cpu_die() is called by the @cpu when it wants to
> + * OTOH, pseries_cpu_offline_self() is called by the @cpu when it wants to
>    * self-destruct.
>    */
>   static void pseries_cpu_die(unsigned int cpu)
> @@ -895,7 +895,7 @@ static int __init pseries_cpu_hotplug_init(void)
>   		return 0;
>   	}
>   
> -	ppc_md.cpu_die = pseries_mach_cpu_die;
> +	smp_ops->cpu_offline_self = pseries_cpu_offline_self;
>   	smp_ops->cpu_disable = pseries_cpu_disable;
>   	smp_ops->cpu_die = pseries_cpu_die;
>   
> 
