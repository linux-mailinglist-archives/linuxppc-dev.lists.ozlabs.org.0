Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3E2446D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 11:17:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSd9m1ppxzDqmd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 19:17:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSd7c5fkvzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 19:15:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSd7R6kb9zB09b5;
 Fri, 14 Aug 2020 11:14:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Xjq95Fm1vYdV; Fri, 14 Aug 2020 11:14:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSd7R4nKBzB09Zk;
 Fri, 14 Aug 2020 11:14:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7B888B796;
 Fri, 14 Aug 2020 11:15:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KE7IhrMTrHS3; Fri, 14 Aug 2020 11:15:00 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 13D218B767;
 Fri, 14 Aug 2020 11:15:00 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc: Add POWER10 raw mode cputable entry
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
References: <20200814074520.3667973-1-maddy@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9cfb8ac6-7b2f-658b-4d0a-23067a76014f@csgroup.eu>
Date: Fri, 14 Aug 2020 11:14:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814074520.3667973-1-maddy@linux.ibm.com>
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



Le 14/08/2020 à 09:45, Madhavan Srinivasan a écrit :
> Add a raw mode cputable entry for POWER10. Copies most of the fields
> from commit a3ea40d5c736 ("powerpc: Add POWER10 architected mode")
> except for oprofile_cpu_type, machine_check_early, pvr_mask and pvr_mask
> fields. On bare metal systems we use DT CPU features, which doesn't need a
> cputable entry. But in VMs we still rely on the raw cputable entry to
> set the correct values for the PMU related fields.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v1:
> - Fixed function undeclared compiler error.
> 
>   arch/powerpc/kernel/cputable.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
> index b4066354f0730..bb0c7f43a8283 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -75,6 +75,7 @@ extern void __restore_cpu_power10(void);
>   extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
>   extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
>   extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
> +extern long __machine_check_early_realmode_p10(struct pt_regs *regs);

'extern' keyword is useless and deprecated for function declaration. 
Please don't add new prototypes with that keyword.

Also, when you check arch/powerpc/kernel/mce_power.o with sparse, you 
get the following issues:

   CHECK   arch/powerpc/kernel/mce_power.c
arch/powerpc/kernel/mce_power.c:709:6: warning: symbol 
'__machine_check_early_realmode_p7' was not declared. Should it be static?
arch/powerpc/kernel/mce_power.c:717:6: warning: symbol 
'__machine_check_early_realmode_p8' was not declared. Should it be static?
arch/powerpc/kernel/mce_power.c:722:6: warning: symbol 
'__machine_check_early_realmode_p9' was not declared. Should it be static?
arch/powerpc/kernel/mce_power.c:740:6: warning: symbol 
'__machine_check_early_realmode_p10' was not declared. Should it be static?

This needs to be fixed by declaring the functions in a .h file that you 
include in both arch/powerpc/kernel/mce_power.c and 
arch/powerpc/kernel/cputable.c

Christophe

>   #endif /* CONFIG_PPC64 */
>   #if defined(CONFIG_E500)
>   extern void __setup_cpu_e5500(unsigned long offset, struct cpu_spec* spec);
> @@ -541,6 +542,25 @@ static struct cpu_spec __initdata cpu_specs[] = {
>   		.machine_check_early	= __machine_check_early_realmode_p9,
>   		.platform		= "power9",
>   	},
> +	{	/* Power10 */
> +		.pvr_mask		= 0xffff0000,
> +		.pvr_value		= 0x00800000,
> +		.cpu_name		= "POWER10 (raw)",
> +		.cpu_features		= CPU_FTRS_POWER10,
> +		.cpu_user_features	= COMMON_USER_POWER10,
> +		.cpu_user_features2	= COMMON_USER2_POWER10,
> +		.mmu_features		= MMU_FTRS_POWER10,
> +		.icache_bsize		= 128,
> +		.dcache_bsize		= 128,
> +		.num_pmcs		= 6,
> +		.pmc_type		= PPC_PMC_IBM,
> +		.oprofile_cpu_type	= "ppc64/power10",
> +		.oprofile_type		= PPC_OPROFILE_INVALID,
> +		.cpu_setup		= __setup_cpu_power10,
> +		.cpu_restore		= __restore_cpu_power10,
> +		.machine_check_early	= __machine_check_early_realmode_p10,
> +		.platform		= "power10",
> +	},
>   	{	/* Cell Broadband Engine */
>   		.pvr_mask		= 0xffff0000,
>   		.pvr_value		= 0x00700000,
> 
