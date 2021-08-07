Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55E3E33D6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 08:58:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhY8V65vxz3dGy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 16:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhY815Bfgz3bX5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 16:57:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GhY7r0XKFz9sTr;
 Sat,  7 Aug 2021 08:57:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2RQ1Ao3thCU; Sat,  7 Aug 2021 08:57:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GhY7q6W8kz9sTq;
 Sat,  7 Aug 2021 08:57:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BBB248B76D;
 Sat,  7 Aug 2021 08:57:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fQtPJIfsPKYH; Sat,  7 Aug 2021 08:57:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AF9B8B766;
 Sat,  7 Aug 2021 08:57:42 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] powerpc: Optimize register usage for esr register
To: sxwjean@me.com, linuxppc-dev@lists.ozlabs.org
References: <20210807010239.416055-1-sxwjean@me.com>
 <20210807010239.416055-2-sxwjean@me.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <127de0c7-5e30-6797-1e72-6414d4a60119@csgroup.eu>
Date: Sat, 7 Aug 2021 08:56:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210807010239.416055-2-sxwjean@me.com>
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@gmail.com>,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 efremov@linux.com, paulus@samba.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2021 à 03:02, sxwjean@me.com a écrit :
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> Create an anonymous union for dsisr and esr regsiters, we can reference
> esr to get the exception detail when CONFIG_4xx=y or CONFIG_BOOKE=y.
> Otherwise, reference dsisr. This makes code more clear.
> 
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   arch/powerpc/include/asm/ptrace.h          | 5 ++++-
>   arch/powerpc/kernel/process.c              | 2 +-
>   arch/powerpc/kernel/ptrace/ptrace.c        | 2 ++
>   arch/powerpc/kernel/traps.c                | 2 +-
>   arch/powerpc/platforms/44x/machine_check.c | 4 ++--
>   arch/powerpc/platforms/4xx/machine_check.c | 2 +-
>   6 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index 3e5d470a6155..c252d04b1206 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -44,7 +44,10 @@ struct pt_regs
>   #endif
>   			unsigned long trap;
>   			unsigned long dar;
> -			unsigned long dsisr;
> +			union {
> +				unsigned long dsisr;
> +				unsigned long esr;
> +			};
>   			unsigned long result;
>   		};
>   	};
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 185beb290580..f74af8f9133c 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
>   	    trap == INTERRUPT_DATA_STORAGE ||
>   	    trap == INTERRUPT_ALIGNMENT) {
>   		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> -			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->dsisr);
> +			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->esr);
>   		else
>   			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>   	}
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 0a0a33eb0d28..a222fd4d6334 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -375,6 +375,8 @@ void __init pt_regs_check(void)
>   		     offsetof(struct user_pt_regs, dar));
>   	BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=
>   		     offsetof(struct user_pt_regs, dsisr));
> +	BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=
> +		     offsetof(struct user_pt_regs, dsisr));

esr and dsisr are the same, so checking the same thing a second time is pointless.

>   	BUILD_BUG_ON(offsetof(struct pt_regs, result) !=
>   		     offsetof(struct user_pt_regs, result));
>   
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index dfbce527c98e..2164f5705a0b 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -562,7 +562,7 @@ static inline int check_io_access(struct pt_regs *regs)
>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>   /* On 4xx, the reason for the machine check or program exception
>      is in the ESR. */
> -#define get_reason(regs)	((regs)->dsisr)
> +#define get_reason(regs)	((regs)->esr)
>   #define REASON_FP		ESR_FP
>   #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
>   #define REASON_PRIVILEGED	ESR_PPR
> diff --git a/arch/powerpc/platforms/44x/machine_check.c b/arch/powerpc/platforms/44x/machine_check.c
> index a5c898bb9bab..5d19daacd78a 100644
> --- a/arch/powerpc/platforms/44x/machine_check.c
> +++ b/arch/powerpc/platforms/44x/machine_check.c
> @@ -11,7 +11,7 @@
>   
>   int machine_check_440A(struct pt_regs *regs)
>   {
> -	unsigned long reason = regs->dsisr;
> +	unsigned long reason = regs->esr;
>   
>   	printk("Machine check in kernel mode.\n");
>   	if (reason & ESR_IMCP){
> @@ -48,7 +48,7 @@ int machine_check_440A(struct pt_regs *regs)
>   #ifdef CONFIG_PPC_47x
>   int machine_check_47x(struct pt_regs *regs)
>   {
> -	unsigned long reason = regs->dsisr;
> +	unsigned long reason = regs->esr;
>   	u32 mcsr;
>   
>   	printk(KERN_ERR "Machine check in kernel mode.\n");
> diff --git a/arch/powerpc/platforms/4xx/machine_check.c b/arch/powerpc/platforms/4xx/machine_check.c
> index a71c29892a91..a905da1d6f41 100644
> --- a/arch/powerpc/platforms/4xx/machine_check.c
> +++ b/arch/powerpc/platforms/4xx/machine_check.c
> @@ -10,7 +10,7 @@
>   
>   int machine_check_4xx(struct pt_regs *regs)
>   {
> -	unsigned long reason = regs->dsisr;
> +	unsigned long reason = regs->esr;
>   
>   	if (reason & ESR_IMCP) {
>   		printk("Instruction");
> 
