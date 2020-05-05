Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6801C4EF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 09:21:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GWP82HsgzDqBW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:21:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWJX3lpkzDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:17:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GWJT426qz9sSW;
 Tue,  5 May 2020 17:17:29 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 26/28] powerpc: Support prefixed instructions in
 alignment handler
Date: Tue, 05 May 2020 17:17:29 +1000
Message-ID: <7738808.RemDxODYhF@townsend>
In-Reply-To: <20200501034220.8982-27-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-27-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:18 PM AEST Jordan Niethe wrote:
> If a prefixed instruction results in an alignment exception, the
> SRR1_PREFIXED bit is set. The handler attempts to emulate the
> responsible instruction and then increment the NIP past it. Use
> SRR1_PREFIXED to determine by how much the NIP should be incremented.
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
>     - Rename sufx to suffix
>     - Use a macro for calculating instruction length
> v3: Move __get_user_{instr(), instr_inatomic()} up with the other
> get_user definitions and remove nested if.
> v4: Rolled into "Add prefixed instructions to instruction data type"
> v5: Only one definition of inst_length()
> ---
>  arch/powerpc/kernel/traps.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 493a3fa0ac1a..105242cc2f28 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -583,6 +583,8 @@ static inline int check_io_access(struct pt_regs *regs)
>  #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
>  #define REASON_PRIVILEGED	ESR_PPR
>  #define REASON_TRAP		ESR_PTR
> +#define REASON_PREFIXED		0
> +#define REASON_BOUNDARY		0
> 
>  /* single-step stuff */
>  #define single_stepping(regs)	(current->thread.debug.dbcr0 & DBCR0_IC)
> @@ -597,12 +599,16 @@ static inline int check_io_access(struct pt_regs
> *regs) #define REASON_ILLEGAL		SRR1_PROGILL
>  #define REASON_PRIVILEGED	SRR1_PROGPRIV
>  #define REASON_TRAP		SRR1_PROGTRAP
> +#define REASON_PREFIXED		SRR1_PREFIXED
> +#define REASON_BOUNDARY		SRR1_BOUNDARY
> 
>  #define single_stepping(regs)	((regs)->msr & MSR_SE)
>  #define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
>  #define clear_br_trace(regs)	((regs)->msr &= ~MSR_BE)
>  #endif
> 
> +#define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
> +
>  #if defined(CONFIG_E500)
>  int machine_check_e500mc(struct pt_regs *regs)
>  {
> @@ -1593,11 +1599,20 @@ void alignment_exception(struct pt_regs *regs)
>  {
>  	enum ctx_state prev_state = exception_enter();
>  	int sig, code, fixed = 0;
> +	unsigned long  reason;
> 
>  	/* We restore the interrupt state now */
>  	if (!arch_irq_disabled_regs(regs))
>  		local_irq_enable();
> 
> +	reason = get_reason(regs);
> +
> +	if (reason & REASON_BOUNDARY) {
> +		sig = SIGBUS;
> +		code = BUS_ADRALN;
> +		goto bad;
> +	}
> +
>  	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
>  		goto bail;
> 
> @@ -1606,7 +1621,8 @@ void alignment_exception(struct pt_regs *regs)
>  		fixed = fix_alignment(regs);
> 
>  	if (fixed == 1) {
> -		regs->nip += 4;	/* skip over emulated instruction */
> +		/* skip over emulated instruction */
> +		regs->nip += inst_length(reason);
>  		emulate_single_step(regs);
>  		goto bail;
>  	}
> @@ -1619,6 +1635,7 @@ void alignment_exception(struct pt_regs *regs)
>  		sig = SIGBUS;
>  		code = BUS_ADRALN;
>  	}
> +bad:
>  	if (user_mode(regs))
>  		_exception(sig, regs, code, regs->dar);
>  	else




