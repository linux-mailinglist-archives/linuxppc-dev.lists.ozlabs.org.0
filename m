Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB91589ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:16:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GswY28ZpzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:16:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=VlLRGtXg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gstb3wNzzDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 17:14:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GstW4Q3Dz9v4jS;
 Tue, 11 Feb 2020 07:14:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VlLRGtXg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WL3qK1Nn1fW6; Tue, 11 Feb 2020 07:14:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GstW1rRhz9v4jR;
 Tue, 11 Feb 2020 07:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581401667; bh=ryUBhb77ZdJ/5fMX0I1W8VrDNYs83WAWaLX4Qu5Nz58=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VlLRGtXgEZtP0NSBKqpm0MYf6/YPB+SZK46Jx3SPqO7yKOmPBVOIPx5ILSK1+cOkc
 VcvaELseXQGAW+flSydlYVdP7uhl529qz5FXC8IGbfzqZKqj8yI1WnCffkFocBUE5V
 GoybxzJuCsjvYuBdjOvcfHxGUkT9ozAqYfA+tWzA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 158AF8B78B;
 Tue, 11 Feb 2020 07:14:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LKJmOfGKQ-9i; Tue, 11 Feb 2020 07:14:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E1F18B776;
 Tue, 11 Feb 2020 07:14:27 +0100 (CET)
Subject: Re: [PATCH v2 06/13] powerpc: Support prefixed instructions in
 alignment handler
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-7-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c5381bc3-82c1-541e-6c8c-95997d61e0a5@c-s.fr>
Date: Tue, 11 Feb 2020 07:14:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211053355.21574-7-jniethe5@gmail.com>
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, mpe@ellerman.id.a,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2020 à 06:33, Jordan Niethe a écrit :
> Alignment interrupts can be caused by prefixed instructions accessing
> memory. In the alignment handler the instruction that caused the
> exception is loaded and attempted emulate. If the instruction is a
> prefixed instruction load the prefix and suffix to emulate. After
> emulating increment the NIP by 8.
> 
> Prefixed instructions are not permitted to cross 64-byte boundaries. If
> they do the alignment interrupt is invoked with SRR1 BOUNDARY bit set.
> If this occurs send a SIGBUS to the offending process if in user mode.
> If in kernel mode call bad_page_fault().
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
> commit (previously in "powerpc sstep: Prepare to support prefixed
> instructions").
>      - Rename sufx to suffix
>      - Use a macro for calculating instruction length
> ---
>   arch/powerpc/include/asm/uaccess.h | 30 ++++++++++++++++++++++++++++++
>   arch/powerpc/kernel/align.c        |  8 +++++---
>   arch/powerpc/kernel/traps.c        | 21 ++++++++++++++++++++-
>   3 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 2f500debae21..30f63a81c8d8 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -474,4 +474,34 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
>   #define unsafe_copy_to_user(d, s, l, e) \
>   	unsafe_op_wrap(raw_copy_to_user_allowed(d, s, l), e)
>   

Could it go close to other __get_user() and friends instead of being at 
the end of the file ?

> +/*
> + * When reading an instruction iff it is a prefix, the suffix needs to be also
> + * loaded.
> + */
> +#define __get_user_instr(x, y, ptr)			\
> +({							\
> +	long __gui_ret = 0;				\
> +	y = 0;						\
> +	__gui_ret = __get_user(x, ptr);			\
> +	if (!__gui_ret) {				\
> +		if (IS_PREFIX(x))			\

Does this apply to PPC32 ?
If not, can we make sure IS_PREFIX is constant 0 on PPC32 so that the 
second read gets dropped at compile time ?

Can we instead do :

	if (!__gui_ret && IS_PREFIX(x))

> +			__gui_ret = __get_user(y, ptr + 1);	\
> +	}						\
> +							\
> +	__gui_ret;					\
> +})
> +
> +#define __get_user_instr_inatomic(x, y, ptr)		\
> +({							\
> +	long __gui_ret = 0;				\
> +	y = 0;						\
> +	__gui_ret = __get_user_inatomic(x, ptr);	\
> +	if (!__gui_ret) {				\
> +		if (IS_PREFIX(x))			\

Same commments as above

> +			__gui_ret = __get_user_inatomic(y, ptr + 1);	\
> +	}						\
> +							\
> +	__gui_ret;					\
> +})
> +
>   #endif	/* _ARCH_POWERPC_UACCESS_H */
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index ba3bf5c3ab62..e42cfaa616d3 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -293,7 +293,7 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
>   
>   int fix_alignment(struct pt_regs *regs)
>   {
> -	unsigned int instr;
> +	unsigned int instr, suffix;
>   	struct instruction_op op;
>   	int r, type;
>   
> @@ -303,13 +303,15 @@ int fix_alignment(struct pt_regs *regs)
>   	 */
>   	CHECK_FULL_REGS(regs);
>   
> -	if (unlikely(__get_user(instr, (unsigned int __user *)regs->nip)))
> +	if (unlikely(__get_user_instr(instr, suffix,
> +				 (unsigned int __user *)regs->nip)))
>   		return -EFAULT;
>   	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
>   		/* We don't handle PPC little-endian any more... */
>   		if (cpu_has_feature(CPU_FTR_PPC_LE))
>   			return -EIO;
>   		instr = swab32(instr);
> +		suffix = swab32(suffix);
>   	}
>   
>   #ifdef CONFIG_SPE
> @@ -334,7 +336,7 @@ int fix_alignment(struct pt_regs *regs)
>   	if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
>   		return -EIO;
>   
> -	r = analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
> +	r = analyse_instr(&op, regs, instr, suffix);
>   	if (r < 0)
>   		return -EINVAL;
>   
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 82a3438300fd..d80b82fc1ae3 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -583,6 +583,10 @@ static inline int check_io_access(struct pt_regs *regs)
>   #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
>   #define REASON_PRIVILEGED	ESR_PPR
>   #define REASON_TRAP		ESR_PTR
> +#define REASON_PREFIXED		0
> +#define REASON_BOUNDARY		0
> +
> +#define inst_length(reason)	4
>   
>   /* single-step stuff */
>   #define single_stepping(regs)	(current->thread.debug.dbcr0 & DBCR0_IC)
> @@ -597,6 +601,10 @@ static inline int check_io_access(struct pt_regs *regs)
>   #define REASON_ILLEGAL		SRR1_PROGILL
>   #define REASON_PRIVILEGED	SRR1_PROGPRIV
>   #define REASON_TRAP		SRR1_PROGTRAP
> +#define REASON_PREFIXED		SRR1_PREFIXED
> +#define REASON_BOUNDARY		SRR1_BOUNDARY
> +
> +#define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
>   
>   #define single_stepping(regs)	((regs)->msr & MSR_SE)
>   #define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
> @@ -1593,11 +1601,20 @@ void alignment_exception(struct pt_regs *regs)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   	int sig, code, fixed = 0;
> +	unsigned long  reason;
>   
>   	/* We restore the interrupt state now */
>   	if (!arch_irq_disabled_regs(regs))
>   		local_irq_enable();
>   
> +	reason = get_reason(regs);
> +
> +	if (reason & REASON_BOUNDARY) {
> +		sig = SIGBUS;
> +		code = BUS_ADRALN;
> +		goto bad;
> +	}
> +
>   	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
>   		goto bail;
>   
> @@ -1606,7 +1623,8 @@ void alignment_exception(struct pt_regs *regs)
>   		fixed = fix_alignment(regs);
>   
>   	if (fixed == 1) {
> -		regs->nip += 4;	/* skip over emulated instruction */
> +		/* skip over emulated instruction */
> +		regs->nip += inst_length(reason);
>   		emulate_single_step(regs);
>   		goto bail;
>   	}
> @@ -1619,6 +1637,7 @@ void alignment_exception(struct pt_regs *regs)
>   		sig = SIGBUS;
>   		code = BUS_ADRALN;
>   	}
> +bad:
>   	if (user_mode(regs))
>   		_exception(sig, regs, code, regs->dar);
>   	else
> 

Christophe
