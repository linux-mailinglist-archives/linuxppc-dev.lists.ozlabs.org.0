Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B986273A7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 08:02:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwW0m0yGTzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 16:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwVyW2TzxzDqD8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 15:59:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BwVyL3WyNz9tyqS;
 Tue, 22 Sep 2020 07:59:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4usaXr2Ol8Cn; Tue, 22 Sep 2020 07:59:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BwVyL1TxBz9tyqR;
 Tue, 22 Sep 2020 07:59:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECF918B7BE;
 Tue, 22 Sep 2020 07:59:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oyHlu31yiSgC; Tue, 22 Sep 2020 07:59:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01E758B75B;
 Tue, 22 Sep 2020 07:59:53 +0200 (CEST)
Subject: Re: [PATCH v3 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200922055307.10647-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a4bc673b-74e2-98ea-dac7-4e6d86d10d15@csgroup.eu>
Date: Tue, 22 Sep 2020 07:59:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922055307.10647-1-jniethe5@gmail.com>
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
Cc: oohall@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/09/2020 à 07:53, Jordan Niethe a écrit :
> Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
> is called before a stack has been set up in r1. This was previously fine
> as the cpu_restore() functions were implemented in assembly and did not
> use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
> device tree binding for discovering CPU features") used
> __restore_cpu_cpufeatures() as the cpu_restore() function for a
> device-tree features based cputable entry. This is a C function and
> hence uses a stack in r1.
> 
> generic_secondary_smp_init() is entered on the secondary cpus via the
> primary cpu using the OPAL call opal_start_cpu(). In OPAL, each hardware
> thread has its own stack. The OPAL call is ran in the primary's hardware
> thread. During the call, a job is scheduled on a secondary cpu that will
> start executing at the address of generic_secondary_smp_init().  Hence
> the value that will be left in r1 when the secondary cpu enters the
> kernel is part of that secondary cpu's individual OPAL stack. This means
> that __restore_cpu_cpufeatures() will write to that OPAL stack. This is
> not horribly bad as each hardware thread has its own stack and the call
> that enters the kernel from OPAL never returns, but it is still wrong
> and should be corrected.
> 
> Create the temp kernel stack before calling cpu_restore().
> 
> As noted by mpe, for a kexec boot, the secondary CPUs are released from
> the spin loop at address 0x60 by smp_release_cpus() and then jump to
> generic_secondary_smp_init(). The call to smp_release_cpus() is in
> setup_arch(), and it comes before the call to emergency_stack_init().
> emergency_stack_init() allocates an emergency stack in the PACA for each
> CPU.  This address in the PACA is what is used to set up the temp kernel
> stack in generic_secondary_smp_init(). Move releasing the secondary CPUs
> to after the PACAs have been allocated an emergency stack, otherwise the
> PACA stack pointer will contain garbage and hence the temp kernel stack
> created from it will be broken.
> 
> Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Add more detail to the commit message
> v3: Release secondary CPUs after the emergency stack is created
> ---
>   arch/powerpc/kernel/head_64.S      | 8 ++++----
>   arch/powerpc/kernel/setup-common.c | 6 ++++--
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index 0e05a9a47a4b..4b7f4c6c2600 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -420,6 +420,10 @@ generic_secondary_common_init:
>   	/* From now on, r24 is expected to be logical cpuid */
>   	mr	r24,r5
>   
> +	/* Create a temp kernel stack for use before relocation is on.	*/
> +	ld	r1,PACAEMERGSP(r13)
> +	subi	r1,r1,STACK_FRAME_OVERHEAD
> +
>   	/* See if we need to call a cpu state restore handler */
>   	LOAD_REG_ADDR(r23, cur_cpu_spec)
>   	ld	r23,0(r23)
> @@ -448,10 +452,6 @@ generic_secondary_common_init:
>   	sync				/* order paca.run and cur_cpu_spec */
>   	isync				/* In case code patching happened */
>   
> -	/* Create a temp kernel stack for use before relocation is on.	*/
> -	ld	r1,PACAEMERGSP(r13)
> -	subi	r1,r1,STACK_FRAME_OVERHEAD
> -
>   	b	__secondary_start
>   #endif /* SMP */
>   
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 808ec9fab605..fff714e36b37 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -919,8 +919,6 @@ void __init setup_arch(char **cmdline_p)
>   
>   	/* On BookE, setup per-core TLB data structures. */
>   	setup_tlb_core_data();
> -
> -	smp_release_cpus();
>   #endif
>   
>   	/* Print various info about the machine that has been gathered so far. */
> @@ -944,6 +942,10 @@ void __init setup_arch(char **cmdline_p)
>   	exc_lvl_early_init();
>   	emergency_stack_init();
>   
> +#ifdef CONFIG_SMP
> +	smp_release_cpus();
> +#endif

Are you sure you need that #ifdef ?

In asm/smp.h, we have:

#if defined(CONFIG_PPC64) && (defined(CONFIG_SMP) || 
defined(CONFIG_KEXEC_CORE))
extern void smp_release_cpus(void);
#else
static inline void smp_release_cpus(void) { };
#endif


> +
>   	initmem_init();
>   
>   	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
> 

Christophe
