Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F036834C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:27:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR1Wx4gF2z3bTv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR1Wc2M5Pz2xZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 01:27:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FR1WR6Ykrz9v4h8;
 Thu, 22 Apr 2021 17:27:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5X18jCbvHMHQ; Thu, 22 Apr 2021 17:27:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FR1WR5bvkz9v4gH;
 Thu, 22 Apr 2021 17:27:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DCF898B846;
 Thu, 22 Apr 2021 17:27:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5QPcsvrhPnYt; Thu, 22 Apr 2021 17:27:32 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34D3D8B845;
 Thu, 22 Apr 2021 17:27:32 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc: Make the code in __show_regs nice-looking
To: Xiongwei Song <sxwjean@me.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, aneesh.kumar@linux.ibm.com,
 0x7f454c46@gmail.com
References: <20210422151022.17868-1-sxwjean@me.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <15aac264-8626-ad15-7301-044c622d7f60@csgroup.eu>
Date: Thu, 22 Apr 2021 17:27:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210422151022.17868-1-sxwjean@me.com>
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/04/2021 à 17:10, Xiongwei Song a écrit :
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> Create a new function named interrupt_detail_printable to judge which
> interrupts can print esr/dsisr register.

What is the benefit of that function ? It may be interesting if the test was done at several places, 
but as it is done at only one place, I don't thing it is an improvement.

Until know, you new immediately what was the traps that would print it. Now you have to go and look 
into a sub-function.

And the name is not nice either. All other functions testing anything on the trap type are called 
trap_is_something()

Here your function would be better called something like trap_sets_dsisr()

> 
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   arch/powerpc/kernel/process.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 89e34aa273e2..5c3830837f3a 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1453,9 +1453,23 @@ static void print_msr_bits(unsigned long val)
>   #define REGS_PER_LINE	8
>   #endif
>   
> +static bool interrupt_detail_printable(int trap)
> +{
> +	switch (trap) {
> +	case INTERRUPT_MACHINE_CHECK:
> +	case INTERRUPT_DATA_STORAGE:
> +	case INTERRUPT_ALIGNMENT:
> +		return true;
> +	default:
> +		return false;
> +	}
> +
> +	return false;

That's redundant with the default case inside the switch.

> +}
> +
>   static void __show_regs(struct pt_regs *regs)
>   {
> -	int i, trap;
> +	int i;
>   
>   	printk("NIP:  "REG" LR: "REG" CTR: "REG"\n",
>   	       regs->nip, regs->link, regs->ctr);
> @@ -1464,12 +1478,9 @@ static void __show_regs(struct pt_regs *regs)
>   	printk("MSR:  "REG" ", regs->msr);
>   	print_msr_bits(regs->msr);
>   	pr_cont("  CR: %08lx  XER: %08lx\n", regs->ccr, regs->xer);
> -	trap = TRAP(regs);
>   	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
>   		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
> -	if (trap == INTERRUPT_MACHINE_CHECK ||
> -	    trap == INTERRUPT_DATA_STORAGE ||
> -	    trap == INTERRUPT_ALIGNMENT) {
> +	if (interrupt_detail_printable(TRAP(regs))) {
>   		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
>   			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
>   		else
> 
