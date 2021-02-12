Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BBF31A6B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 22:19:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dcmbl3x2LzDwtr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 08:19:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZPJpfqG8; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcmYs0KpRzDwl4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 08:18:04 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id r38so447326pgk.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 13:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=npnYCB7PHdPGIH2PRN4TJlk4XUoP3LYnVjcHwGlXOZk=;
 b=ZPJpfqG8kmUHBkC6AZ++qud8t9piM3jY32mSoH1Zt/XcKYin9BlLLHyFtKxBbODjxe
 Hx2CmExnKgTnULtRP7Vwl1sNkG2p1+ZihM5+HMaWqiuSN3G5BRsqvNXj75Oic68WYd9N
 aeL4Fj5PQXG/H10SrsJ/1R+mWtP1IfCR+sMf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=npnYCB7PHdPGIH2PRN4TJlk4XUoP3LYnVjcHwGlXOZk=;
 b=jaiS10aMKm8lTyrAT/njHPQvIF5rGDLY+ZmW7b6zYz72u9hdJuGgjGPg6yVf/PHpnH
 VMy7taWjVTT0onsJDboHA4HGUACDeEgWWBF8a202p4SPOnTrFC4RRjtIDW9Ba7WIifEI
 Y+J+5T4rGnWBOWERlHBKVCNHvN/eKOjdZTc39170jkvHi69Wl4EqXZguLrUvijsRSoOz
 Z5QhkfnSUt3CiJt+PGQ23HBl2AwnAWjoIDhoaFRiGoWGt9B7lKPx60/6F0fum38UfX2s
 4M8VBXZNk8VpwGd4YeHtlLGSIJxFX5Up5yqoBR4+K6d79RyjNzEKw1haI7wOyfV9zq7J
 TqDA==
X-Gm-Message-State: AOAM530xQQG4Nr7lA5mXe6YQuvsl+KQFXCjwoXCcT322P3iHBM5aM56d
 Qo4UR8sjroJPGafpEqBYCZCYpQ==
X-Google-Smtp-Source: ABdhPJzwuyqFLIOeH4PVe8Jg8xkAR3JzLBVGOEpFqqWq4jWRQXnHlkcNzQHjPaRw1oPc/UI1kYqF8w==
X-Received: by 2002:a63:4b15:: with SMTP id y21mr5078747pga.234.1613164678067; 
 Fri, 12 Feb 2021 13:17:58 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-c245-dfb7-be39-91ab.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:c245:dfb7:be39:91ab])
 by smtp.gmail.com with ESMTPSA id o189sm9646588pfd.73.2021.02.12.13.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 13:17:57 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 07/10] powerpc/signal64: Replace restore_sigcontext()
 w/ unsafe_restore_sigcontext()
In-Reply-To: <20210203184323.20792-8-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-8-cmr@codefail.de>
Date: Sat, 13 Feb 2021 08:17:54 +1100
Message-ID: <87y2ftc7el.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Chris,

> Previously restore_sigcontext() performed a costly KUAP switch on every
> uaccess operation. These repeated uaccess switches cause a significant
> drop in signal handling performance.
>
> Rewrite restore_sigcontext() to assume that a userspace read access
> window is open. Replace all uaccess functions with their 'unsafe'
> versions which avoid the repeated uaccess switches.
>

Much of the same comments apply here as to the last patch:
 - the commit message might be improved by adding that you are also
   changing the calling functions to open the uaccess window before
   calling into the new unsafe functions

 - I have checked that the safe to unsafe conversions look right.

 - I think you're opening too wide a window in user_read_access_begin,
   it seems to me that it could be reduced to just the
   uc_mcontext. (Again, not that it makes a difference with the current
   HW.)

Kind regards,
Daniel

> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal_64.c | 68 ++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 4248e4489ff1..d668f8af18fe 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -326,14 +326,14 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>  /*
>   * Restore the sigcontext from the signal frame.
>   */
> -
> -static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
> -			      struct sigcontext __user *sc)
> +#define unsafe_restore_sigcontext(tsk, set, sig, sc, e) \
> +	unsafe_op_wrap(__unsafe_restore_sigcontext(tsk, set, sig, sc), e)
> +static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_t *set,
> +						int sig, struct sigcontext __user *sc)
>  {
>  #ifdef CONFIG_ALTIVEC
>  	elf_vrreg_t __user *v_regs;
>  #endif
> -	unsigned long err = 0;
>  	unsigned long save_r13 = 0;
>  	unsigned long msr;
>  	struct pt_regs *regs = tsk->thread.regs;
> @@ -348,27 +348,28 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
>  		save_r13 = regs->gpr[13];
>  
>  	/* copy the GPRs */
> -	err |= __copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr));
> -	err |= __get_user(regs->nip, &sc->gp_regs[PT_NIP]);
> +	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr),
> +			      efault_out);
> +	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
>  	/* get MSR separately, transfer the LE bit if doing signal return */
> -	err |= __get_user(msr, &sc->gp_regs[PT_MSR]);
> +	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
>  	if (sig)
>  		regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
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
>  	/* Don't allow userspace to set SOFTE */
>  	set_trap_norestart(regs);
> -	err |= __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
> -	err |= __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
> -	err |= __get_user(regs->result, &sc->gp_regs[PT_RESULT]);
> +	unsafe_get_user(regs->dar, &sc->gp_regs[PT_DAR], efault_out);
> +	unsafe_get_user(regs->dsisr, &sc->gp_regs[PT_DSISR], efault_out);
> +	unsafe_get_user(regs->result, &sc->gp_regs[PT_RESULT], efault_out);
>  
>  	if (!sig)
>  		regs->gpr[13] = save_r13;
>  	if (set != NULL)
> -		err |=  __get_user(set->sig[0], &sc->oldmask);
> +		unsafe_get_user(set->sig[0], &sc->oldmask, efault_out);
>  
>  	/*
>  	 * Force reload of FP/VEC.
> @@ -378,29 +379,28 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
>  	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
>  
>  #ifdef CONFIG_ALTIVEC
> -	err |= __get_user(v_regs, &sc->v_regs);
> -	if (err)
> -		return err;
> +	unsafe_get_user(v_regs, &sc->v_regs, efault_out);
>  	if (v_regs && !access_ok(v_regs, 34 * sizeof(vector128)))
>  		return -EFAULT;
>  	/* Copy 33 vec registers (vr0..31 and vscr) from the stack */
>  	if (v_regs != NULL && (msr & MSR_VEC) != 0) {
> -		err |= __copy_from_user(&tsk->thread.vr_state, v_regs,
> -					33 * sizeof(vector128));
> +		unsafe_copy_from_user(&tsk->thread.vr_state, v_regs,
> +				      33 * sizeof(vector128), efault_out);
>  		tsk->thread.used_vr = true;
>  	} else if (tsk->thread.used_vr) {
>  		memset(&tsk->thread.vr_state, 0, 33 * sizeof(vector128));
>  	}
>  	/* Always get VRSAVE back */
>  	if (v_regs != NULL)
> -		err |= __get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> +		unsafe_get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33],
> +				efault_out);
>  	else
>  		tsk->thread.vrsave = 0;
>  	if (cpu_has_feature(CPU_FTR_ALTIVEC))
>  		mtspr(SPRN_VRSAVE, tsk->thread.vrsave);
>  #endif /* CONFIG_ALTIVEC */
>  	/* restore floating point */
> -	err |= copy_fpr_from_user(tsk, &sc->fp_regs);
> +	unsafe_copy_fpr_from_user(tsk, &sc->fp_regs, efault_out);
>  #ifdef CONFIG_VSX
>  	/*
>  	 * Get additional VSX data. Update v_regs to point after the
> @@ -409,14 +409,17 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
>  	 */
>  	v_regs += ELF_NVRREG;
>  	if ((msr & MSR_VSX) != 0) {
> -		err |= copy_vsx_from_user(tsk, v_regs);
> +		unsafe_copy_vsx_from_user(tsk, v_regs, efault_out);
>  		tsk->thread.used_vsr = true;
>  	} else {
>  		for (i = 0; i < 32 ; i++)
>  			tsk->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = 0;
>  	}
>  #endif
> -	return err;
> +	return 0;
> +
> +efault_out:
> +	return -EFAULT;
>  }
>  
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -701,8 +704,14 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
>  		do_exit(SIGSEGV);
>  	set_current_blocked(&set);
> -	if (restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext))
> +
> +	if (!user_read_access_begin(new_ctx, ctx_size))
> +		return -EFAULT;
> +	if (__unsafe_restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext)) {
> +		user_read_access_end();
>  		do_exit(SIGSEGV);
> +	}
> +	user_read_access_end();
>  
>  	/* This returns like rt_sigreturn */
>  	set_thread_flag(TIF_RESTOREALL);
> @@ -807,8 +816,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  		 * causing a TM bad thing.
>  		 */
>  		current->thread.regs->msr &= ~MSR_TS_MASK;
> -		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
> +		if (!user_read_access_begin(uc, sizeof(*uc)))
> +			return -EFAULT;
> +		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
> +			user_read_access_end();
>  			goto badframe;
> +		}
> +		user_read_access_end();
>  	}
>  
>  	if (restore_altstack(&uc->uc_stack))
> -- 
> 2.26.1
