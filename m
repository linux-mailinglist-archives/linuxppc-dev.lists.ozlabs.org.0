Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22D3E1232
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 12:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgPVF2Gqbz3d82
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 20:09:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgPTv6dw2z2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 20:09:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgPTs0GH3z9sWL;
 Thu,  5 Aug 2021 12:09:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrCC9IOrwgJL; Thu,  5 Aug 2021 12:09:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgPTq5Q1rz9sWH;
 Thu,  5 Aug 2021 12:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 94D538B7BF;
 Thu,  5 Aug 2021 12:09:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1RA1AC0yMRHI; Thu,  5 Aug 2021 12:09:19 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B02EA8B7BD;
 Thu,  5 Aug 2021 12:09:18 +0200 (CEST)
Subject: Re: [RFC PATCH 3/4] powerpc: Optimize register usage for dear register
To: sxwjean@me.com, linuxppc-dev@lists.ozlabs.org
References: <20210726143053.532839-1-sxwjean@me.com>
 <20210726143053.532839-3-sxwjean@me.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <56d9e3ce-f303-fd41-bd16-5655d9dc5e52@csgroup.eu>
Date: Thu, 5 Aug 2021 12:09:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726143053.532839-3-sxwjean@me.com>
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
 efremov@linux.com, paulus@samba.org, aneesh.kumar@linux.ibm.com,
 peterx@redhat.com, akpm@linux-foundation.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/07/2021 à 16:30, sxwjean@me.com a écrit :
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> Create an anonymous union for dar and dear regsiters, we can reference
> dear to get the effective address when CONFIG_4xx=y or CONFIG_BOOKE=y.
> Otherwise, reference dar. This makes code more clear.

Same comment here as for patch 1.


> 
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   arch/powerpc/include/asm/ptrace.h      | 5 ++++-
>   arch/powerpc/include/uapi/asm/ptrace.h | 5 ++++-
>   arch/powerpc/kernel/process.c          | 2 +-
>   arch/powerpc/kernel/ptrace/ptrace.c    | 2 ++
>   arch/powerpc/kernel/traps.c            | 5 ++++-
>   arch/powerpc/mm/fault.c                | 2 +-
>   6 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index c252d04b1206..fa725e3238c2 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -43,7 +43,10 @@ struct pt_regs
>   			unsigned long mq;
>   #endif
>   			unsigned long trap;
> -			unsigned long dar;
> +			union {
> +				unsigned long dar;
> +				unsigned long dear;
> +			};
>   			union {
>   				unsigned long dsisr;
>   				unsigned long esr;
> diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
> index e357288b5f34..9ae150fb4c4b 100644
> --- a/arch/powerpc/include/uapi/asm/ptrace.h
> +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> @@ -52,7 +52,10 @@ struct pt_regs
>   	unsigned long trap;		/* Reason for being here */
>   	/* N.B. for critical exceptions on 4xx, the dar and dsisr
>   	   fields are overloaded to hold srr0 and srr1. */
> -	unsigned long dar;		/* Fault registers */
> +	union {
> +		unsigned long dar;		/* Fault registers */
> +		unsigned long dear;
> +	};
>   	union {
>   		unsigned long dsisr;		/* on Book-S used for DSISR */
>   		unsigned long esr;		/* on 4xx/Book-E used for ESR */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index f74af8f9133c..50436b52c213 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
>   	    trap == INTERRUPT_DATA_STORAGE ||
>   	    trap == INTERRUPT_ALIGNMENT) {
>   		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> -			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, regs->esr);
> +			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dear, regs->esr);
>   		else
>   			pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
>   	}
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 00789ad2c4a3..969dca8b0718 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -373,6 +373,8 @@ void __init pt_regs_check(void)
>   		     offsetof(struct user_pt_regs, trap));
>   	BUILD_BUG_ON(offsetof(struct pt_regs, dar) !=
>   		     offsetof(struct user_pt_regs, dar));
> +	BUILD_BUG_ON(offsetof(struct pt_regs, dear) !=
> +		     offsetof(struct user_pt_regs, dear));
>   	BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=
>   		     offsetof(struct user_pt_regs, dsisr));
>   	BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 2164f5705a0b..0796630d3d23 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1609,7 +1609,10 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>   	}
>   bad:
>   	if (user_mode(regs))
> -		_exception(sig, regs, code, regs->dar);
> +		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> +			_exception(sig, regs, code, regs->dear);
> +		else
> +			_exception(sig, regs, code, regs->dar);
>   	else
>   		bad_page_fault(regs, sig);
>   }
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 62953d4e7c93..3db6b39a1178 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -542,7 +542,7 @@ static __always_inline void __do_page_fault(struct pt_regs *regs)
>   	long err;
>   
>   	if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> -		err = ___do_page_fault(regs, regs->dar, regs->esr);
> +		err = ___do_page_fault(regs, regs->dear, regs->esr);
>   	else
>   		err = ___do_page_fault(regs, regs->dar, regs->dsisr);
>   
> 
