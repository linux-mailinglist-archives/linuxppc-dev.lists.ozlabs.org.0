Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3315322FB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 18:36:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlR755r90z3cK4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 04:36:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlR6n0Yypz30Q7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 04:36:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DlR6c0vd9z9vBmy;
 Tue, 23 Feb 2021 18:36:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id p7DDkR198o_v; Tue, 23 Feb 2021 18:36:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DlR6c00fsz9vBmv;
 Tue, 23 Feb 2021 18:36:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE4438B831;
 Tue, 23 Feb 2021 18:36:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iarhLB72vDcF; Tue, 23 Feb 2021 18:36:09 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 972368B825;
 Tue, 23 Feb 2021 18:36:09 +0100 (CET)
Subject: Re: [PATCH v6 07/10] powerpc/signal64: Replace restore_sigcontext()
 w/ unsafe_restore_sigcontext()
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20210221012401.22328-1-cmr@codefail.de>
 <20210221012401.22328-8-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <67afcec9-6335-2bd5-938b-687ecb61bf3d@csgroup.eu>
Date: Tue, 23 Feb 2021 18:36:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210221012401.22328-8-cmr@codefail.de>
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



Le 21/02/2021 à 02:23, Christopher M. Riedl a écrit :
> Previously restore_sigcontext() performed a costly KUAP switch on every
> uaccess operation. These repeated uaccess switches cause a significant
> drop in signal handling performance.
> 
> Rewrite restore_sigcontext() to assume that a userspace read access
> window is open by replacing all uaccess functions with their 'unsafe'
> versions. Modify the callers to first open, call
> unsafe_restore_sigcontext(), and then close the uaccess window.
> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal_64.c | 68 ++++++++++++++++++++-------------
>   1 file changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 3faaa736ed62..76b525261f61 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -326,14 +326,14 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>   /*
>    * Restore the sigcontext from the signal frame.
>    */
> -
> -static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
> -			      struct sigcontext __user *sc)
> +#define unsafe_restore_sigcontext(tsk, set, sig, sc, e) \
> +	unsafe_op_wrap(__unsafe_restore_sigcontext(tsk, set, sig, sc), e)

unsafe_op_wrap() was not initially meant to be used outside of uaccess.h

In the begining, it has been copied from include/linux/uaccess.h and was used
for unsafe_put_user(), unsafe_get_user() and unsafe_copy_to_user(). After other changes, only 
unsafe_get_user() is still using it and I'm going to drop unsafe_op_wrap() soon.

I'd prefer if you can do the same as unsafe_save_general_regs() and others in signal_32.c

> +static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_t *set,
> +						int sig, struct sigcontext __user *sc)
>   {
>   #ifdef CONFIG_ALTIVEC
>   	elf_vrreg_t __user *v_regs;
>   #endif
> -	unsigned long err = 0;
>   	unsigned long save_r13 = 0;
>   	unsigned long msr;
>   	struct pt_regs *regs = tsk->thread.regs;
> @@ -348,27 +348,28 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
>   		save_r13 = regs->gpr[13];
>   
>   	/* copy the GPRs */
> -	err |= __copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr));
> -	err |= __get_user(regs->nip, &sc->gp_regs[PT_NIP]);
> +	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr),
> +			      efault_out);

I think it would be better to keep the above on a single line for readability.
Nowadays we tolerate 100 chars lines for cases like this one.

> +	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
>   	/* get MSR separately, transfer the LE bit if doing signal return */
> -	err |= __get_user(msr, &sc->gp_regs[PT_MSR]);
> +	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
>   	if (sig)
>   		regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
> -	err |= __get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3]);
> -	err |= __get_user(regs->ctr, &sc->gp_regs[PT_CTR]);
> -	err |= __get_user(regs->link, &sc->gp_regs[PT_LNK]);
> -	err |= __get_user(regs->xer, &sc->gp_regs[PT_XER]);
> -	err |= __get_user(regs->ccr, &sc->gp_regs[PT_CCR]);
> +	unsafe_get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3], efault_out);
> +	unsafe_get_user(regs->ctr, &sc->gp_regs[PT_CTR], efault_out);
> +	unsafe_get_user(regs->link, &sc->gp_regs[PT_LNK], efault_out);
> +	unsafe_get_user(regs->xer, &sc->gp_regs[PT_XER], efault_out);
> +	unsafe_get_user(regs->ccr, &sc->gp_regs[PT_CCR], efault_out);
>   	/* Don't allow userspace to set SOFTE */
>   	set_trap_norestart(regs);
> -	err |= __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
> -	err |= __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
> -	err |= __get_user(regs->result, &sc->gp_regs[PT_RESULT]);
> +	unsafe_get_user(regs->dar, &sc->gp_regs[PT_DAR], efault_out);
> +	unsafe_get_user(regs->dsisr, &sc->gp_regs[PT_DSISR], efault_out);
> +	unsafe_get_user(regs->result, &sc->gp_regs[PT_RESULT], efault_out);
>   
>   	if (!sig)
>   		regs->gpr[13] = save_r13;
>   	if (set != NULL)
> -		err |=  __get_user(set->sig[0], &sc->oldmask);
> +		unsafe_get_user(set->sig[0], &sc->oldmask, efault_out);
>   
>   	/*
>   	 * Force reload of FP/VEC.
> @@ -378,29 +379,28 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
>   	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
>   
>   #ifdef CONFIG_ALTIVEC
> -	err |= __get_user(v_regs, &sc->v_regs);
> -	if (err)
> -		return err;
> +	unsafe_get_user(v_regs, &sc->v_regs, efault_out);
>   	if (v_regs && !access_ok(v_regs, 34 * sizeof(vector128)))
>   		return -EFAULT;
>   	/* Copy 33 vec registers (vr0..31 and vscr) from the stack */
>   	if (v_regs != NULL && (msr & MSR_VEC) != 0) {
> -		err |= __copy_from_user(&tsk->thread.vr_state, v_regs,
> -					33 * sizeof(vector128));
> +		unsafe_copy_from_user(&tsk->thread.vr_state, v_regs,
> +				      33 * sizeof(vector128), efault_out);
>   		tsk->thread.used_vr = true;
>   	} else if (tsk->thread.used_vr) {
>   		memset(&tsk->thread.vr_state, 0, 33 * sizeof(vector128));
>   	}
>   	/* Always get VRSAVE back */
>   	if (v_regs != NULL)
> -		err |= __get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> +		unsafe_get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33],
> +				efault_out);

Same, would be better on a single line I think.

>   	else
>   		tsk->thread.vrsave = 0;
>   	if (cpu_has_feature(CPU_FTR_ALTIVEC))
>   		mtspr(SPRN_VRSAVE, tsk->thread.vrsave);
>   #endif /* CONFIG_ALTIVEC */
>   	/* restore floating point */
> -	err |= copy_fpr_from_user(tsk, &sc->fp_regs);
> +	unsafe_copy_fpr_from_user(tsk, &sc->fp_regs, efault_out);
>   #ifdef CONFIG_VSX
>   	/*
>   	 * Get additional VSX data. Update v_regs to point after the
> @@ -409,14 +409,17 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
>   	 */
>   	v_regs += ELF_NVRREG;
>   	if ((msr & MSR_VSX) != 0) {
> -		err |= copy_vsx_from_user(tsk, v_regs);
> +		unsafe_copy_vsx_from_user(tsk, v_regs, efault_out);
>   		tsk->thread.used_vsr = true;
>   	} else {
>   		for (i = 0; i < 32 ; i++)
>   			tsk->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = 0;
>   	}
>   #endif
> -	return err;
> +	return 0;
> +
> +efault_out:
> +	return -EFAULT;
>   }
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -707,8 +710,14 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>   	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
>   		do_exit(SIGSEGV);
>   	set_current_blocked(&set);
> -	if (restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext))
> +
> +	if (!user_read_access_begin(new_ctx, ctx_size))
> +		return -EFAULT;
> +	if (__unsafe_restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext)) {
> +		user_read_access_end();
>   		do_exit(SIGSEGV);
> +	}
> +	user_read_access_end();
>   
>   	/* This returns like rt_sigreturn */
>   	set_thread_flag(TIF_RESTOREALL);
> @@ -811,8 +820,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   		 * causing a TM bad thing.
>   		 */
>   		current->thread.regs->msr &= ~MSR_TS_MASK;
> -		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
> +		if (!user_read_access_begin(&uc->uc_mcontext, sizeof(uc->uc_mcontext)))
> +			return -EFAULT;
> +		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
> +			user_read_access_end();
>   			goto badframe;
> +		}
> +		user_read_access_end();
>   	}
>   
>   	if (restore_altstack(&uc->uc_stack))
> 
