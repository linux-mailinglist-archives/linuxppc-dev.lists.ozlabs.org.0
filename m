Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E354D3533
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 18:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDJyK4kZjz3bkv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 04:26:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDJxx187jz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 04:25:55 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDJxs1FTwz9sSh;
 Wed,  9 Mar 2022 18:25:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61sbSPcpHskw; Wed,  9 Mar 2022 18:25:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDJxs0Sy2z9sSX;
 Wed,  9 Mar 2022 18:25:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1AC18B780;
 Wed,  9 Mar 2022 18:25:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ty9wnmXBYP6S; Wed,  9 Mar 2022 18:25:52 +0100 (CET)
Received: from [192.168.202.27] (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9973C8B763;
 Wed,  9 Mar 2022 18:25:52 +0100 (CET)
Message-ID: <c7b22d4b-3580-2b8c-4c6e-a5ba0771c027@csgroup.eu>
Date: Wed, 9 Mar 2022 18:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] powerpc/instruction_dump: Fix kernel crash with
 show_instructions
Content-Language: fr-FR
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200524093822.423487-1-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200524093822.423487-1-aneesh.kumar@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/05/2020 à 11:38, Aneesh Kumar K.V a écrit :
> With Hard Lockup watchdog, we can hit a BUG() if we take a watchdog
> interrupt when in OPAL mode. This happens in show_instructions()
> where the kernel takes the watchdog NMI IPI with MSR_IR == 0.
> With that show_instructions() updates the variable pc in the loop
> and the second iterations will result in BUG().
> 
> We hit the BUG_ON due the below check in  __va()
> 
>   #define __va(x)								\
> ({									\
> 	VIRTUAL_BUG_ON((unsigned long)(x) >= PAGE_OFFSET);		\
> 	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
> })
> 
> Fixes: 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va and __pa addresses")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

If still relevant, this series needs rebase.

Patch 1 was applied with changes, at least patch 3 won't apply

Thanks
Christophe


> ---
>   arch/powerpc/kernel/process.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 048d64c4e115..93bf4a766707 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1253,29 +1253,32 @@ struct task_struct *__switch_to(struct task_struct *prev,
>   static void show_instructions(struct pt_regs *regs)
>   {
>   	int i;
> +	unsigned long nip = regs->nip;
>   	unsigned long pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
>   
>   	printk("Instruction dump:");
>   
> +#if !defined(CONFIG_BOOKE)
> +	/* If executing with the IMMU off, adjust pc rather
> +	 * than print XXXXXXXX.
> +	 */
> +	if (!(regs->msr & MSR_IR)) {
> +		pc = (unsigned long)phys_to_virt(pc);
> +		nip = (unsigned long)phys_to_virt(regs->nip);
> +	}
> +#endif
> +
>   	for (i = 0; i < NR_INSN_TO_PRINT; i++) {
>   		int instr;
>   
>   		if (!(i % 8))
>   			pr_cont("\n");
>   
> -#if !defined(CONFIG_BOOKE)
> -		/* If executing with the IMMU off, adjust pc rather
> -		 * than print XXXXXXXX.
> -		 */
> -		if (!(regs->msr & MSR_IR))
> -			pc = (unsigned long)phys_to_virt(pc);
> -#endif
> -
>   		if (!__kernel_text_address(pc) ||
>   		    probe_kernel_address((const void *)pc, instr)) {
>   			pr_cont("XXXXXXXX ");
>   		} else {
> -			if (regs->nip == pc)
> +			if (nip == pc)
>   				pr_cont("<%08x> ", instr);
>   			else
>   				pr_cont("%08x ", instr);
