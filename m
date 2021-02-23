Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2BC322F5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 18:13:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlQc60kp7z3cVg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 04:13:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlQbn6vNHz30NP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 04:12:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DlQbc0NChz9ty2d;
 Tue, 23 Feb 2021 18:12:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kN38xoFLVsq5; Tue, 23 Feb 2021 18:12:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DlQbb6MSBz9ty2c;
 Tue, 23 Feb 2021 18:12:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA5AF8B831;
 Tue, 23 Feb 2021 18:12:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O5WHnn1SRoe7; Tue, 23 Feb 2021 18:12:45 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41C7E8B825;
 Tue, 23 Feb 2021 18:12:45 +0100 (CET)
Subject: Re: [PATCH v6 06/10] powerpc/signal64: Replace setup_sigcontext() w/
 unsafe_setup_sigcontext()
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20210221012401.22328-1-cmr@codefail.de>
 <20210221012401.22328-7-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2115850c-8687-6b61-11ca-0f6fab94a14f@csgroup.eu>
Date: Tue, 23 Feb 2021 18:12:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210221012401.22328-7-cmr@codefail.de>
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
> Previously setup_sigcontext() performed a costly KUAP switch on every
> uaccess operation. These repeated uaccess switches cause a significant
> drop in signal handling performance.
> 
> Rewrite setup_sigcontext() to assume that a userspace write access window
> is open by replacing all uaccess functions with their 'unsafe' versions.
> Modify the callers to first open, call unsafe_setup_sigcontext() and
> then close the uaccess window.

Do you plan to also convert setup_tm_sigcontexts() ?
It would allow to then remove copy_fpr_to_user() and copy_ckfpr_to_user() and maybe other functions too.

Christophe

> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal_64.c | 71 ++++++++++++++++++++-------------
>   1 file changed, 44 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index bd8d210c9115..3faaa736ed62 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -101,9 +101,13 @@ static void prepare_setup_sigcontext(struct task_struct *tsk)
>    * Set up the sigcontext for the signal frame.
>    */
>   
> -static long setup_sigcontext(struct sigcontext __user *sc,
> -		struct task_struct *tsk, int signr, sigset_t *set,
> -		unsigned long handler, int ctx_has_vsx_region)
> +#define unsafe_setup_sigcontext(sc, tsk, signr, set, handler,		\
> +				ctx_has_vsx_region, e)			\
> +	unsafe_op_wrap(__unsafe_setup_sigcontext(sc, tsk, signr, set,	\
> +			handler, ctx_has_vsx_region), e)
> +static long notrace __unsafe_setup_sigcontext(struct sigcontext __user *sc,
> +					struct task_struct *tsk, int signr, sigset_t *set,
> +					unsigned long handler, int ctx_has_vsx_region)
>   {
>   	/* When CONFIG_ALTIVEC is set, we _always_ setup v_regs even if the
>   	 * process never used altivec yet (MSR_VEC is zero in pt_regs of
> @@ -118,20 +122,19 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>   #endif
>   	struct pt_regs *regs = tsk->thread.regs;
>   	unsigned long msr = regs->msr;
> -	long err = 0;
>   	/* Force usr to alway see softe as 1 (interrupts enabled) */
>   	unsigned long softe = 0x1;
>   
>   	BUG_ON(tsk != current);
>   
>   #ifdef CONFIG_ALTIVEC
> -	err |= __put_user(v_regs, &sc->v_regs);
> +	unsafe_put_user(v_regs, &sc->v_regs, efault_out);
>   
>   	/* save altivec registers */
>   	if (tsk->thread.used_vr) {
>   		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
> -		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
> -				      33 * sizeof(vector128));
> +		unsafe_copy_to_user(v_regs, &tsk->thread.vr_state,
> +				    33 * sizeof(vector128), efault_out);
>   		/* set MSR_VEC in the MSR value in the frame to indicate that sc->v_reg)
>   		 * contains valid data.
>   		 */
> @@ -140,12 +143,12 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>   	/* We always copy to/from vrsave, it's 0 if we don't have or don't
>   	 * use altivec.
>   	 */
> -	err |= __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> +	unsafe_put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33], efault_out);
>   #else /* CONFIG_ALTIVEC */
> -	err |= __put_user(0, &sc->v_regs);
> +	unsafe_put_user(0, &sc->v_regs, efault_out);
>   #endif /* CONFIG_ALTIVEC */
>   	/* copy fpr regs and fpscr */
> -	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
> +	unsafe_copy_fpr_to_user(&sc->fp_regs, tsk, efault_out);
>   
>   	/*
>   	 * Clear the MSR VSX bit to indicate there is no valid state attached
> @@ -160,24 +163,27 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>   	 */
>   	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
>   		v_regs += ELF_NVRREG;
> -		err |= copy_vsx_to_user(v_regs, tsk);
> +		unsafe_copy_vsx_to_user(v_regs, tsk, efault_out);
>   		/* set MSR_VSX in the MSR value in the frame to
>   		 * indicate that sc->vs_reg) contains valid data.
>   		 */
>   		msr |= MSR_VSX;
>   	}
>   #endif /* CONFIG_VSX */
> -	err |= __put_user(&sc->gp_regs, &sc->regs);
> +	unsafe_put_user(&sc->gp_regs, &sc->regs, efault_out);
>   	WARN_ON(!FULL_REGS(regs));
> -	err |= __copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE);
> -	err |= __put_user(msr, &sc->gp_regs[PT_MSR]);
> -	err |= __put_user(softe, &sc->gp_regs[PT_SOFTE]);
> -	err |= __put_user(signr, &sc->signal);
> -	err |= __put_user(handler, &sc->handler);
> +	unsafe_copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE, efault_out);
> +	unsafe_put_user(msr, &sc->gp_regs[PT_MSR], efault_out);
> +	unsafe_put_user(softe, &sc->gp_regs[PT_SOFTE], efault_out);
> +	unsafe_put_user(signr, &sc->signal, efault_out);
> +	unsafe_put_user(handler, &sc->handler, efault_out);
>   	if (set != NULL)
> -		err |=  __put_user(set->sig[0], &sc->oldmask);
> +		unsafe_put_user(set->sig[0], &sc->oldmask, efault_out);
>   
> -	return err;
> +	return 0;
> +
> +efault_out:
> +	return -EFAULT;
>   }
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -670,12 +676,15 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>   
>   	if (old_ctx != NULL) {
>   		prepare_setup_sigcontext(current);
> -		if (!access_ok(old_ctx, ctx_size)
> -		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
> -					ctx_has_vsx_region)
> -		    || __copy_to_user(&old_ctx->uc_sigmask,
> -				      &current->blocked, sizeof(sigset_t)))
> +		if (!user_write_access_begin(old_ctx, ctx_size))
>   			return -EFAULT;
> +
> +		unsafe_setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL,
> +					0, ctx_has_vsx_region, efault_out);
> +		unsafe_copy_to_user(&old_ctx->uc_sigmask, &current->blocked,
> +				    sizeof(sigset_t), efault_out);
> +
> +		user_write_access_end();
>   	}
>   	if (new_ctx == NULL)
>   		return 0;
> @@ -704,6 +713,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>   	/* This returns like rt_sigreturn */
>   	set_thread_flag(TIF_RESTOREALL);
>   	return 0;
> +
> +efault_out:
> +	user_write_access_end();
> +	return -EFAULT;
>   }
>   
>   
> @@ -854,9 +867,13 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	} else {
>   		err |= __put_user(0, &frame->uc.uc_link);
>   		prepare_setup_sigcontext(tsk);
> -		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> -					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> -					1);
> +		if (!user_write_access_begin(&frame->uc.uc_mcontext,
> +					     sizeof(frame->uc.uc_mcontext)))
> +			return -EFAULT;
> +		err |= __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
> +						ksig->sig, NULL,
> +						(unsigned long)ksig->ka.sa.sa_handler, 1);
> +		user_write_access_end();
>   	}
>   	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
>   	if (err)
> 
