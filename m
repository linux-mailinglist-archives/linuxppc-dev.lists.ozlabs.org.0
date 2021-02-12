Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD43199BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 06:43:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcMq31FJmzDwxH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 16:43:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=m55Yhf6g; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcMnN4gtszDwwm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 16:41:40 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id t25so5535009pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 21:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=onGl+ZRaF+44gJ+Iv/n6vfeyT0nCzYXnRK9fBS6zZqY=;
 b=m55Yhf6gFck5mSaPo/CixpFPoL+MA7a23BzlJ82yQOuSFq6gBWm/ePs7n+AHtE6ek0
 OrgL+uPMRNTBThI7VTtmZqLP9FQcx6+JBandAq1TI7oLQK8Xb72Zd5GWnIxela65+Fwu
 BpKYUB7YDee104eIlGXX61ZrtibNJL9tqWGlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=onGl+ZRaF+44gJ+Iv/n6vfeyT0nCzYXnRK9fBS6zZqY=;
 b=Rx1cSOrHGNubjBsCCdAg1TU3A0oghYEioVAefSKP82qFHCttNrogLEDDC3KS1gEiZO
 KY3y/pp9ycd7RL6IuDY7htCL2EcBay1TCDYZ+IXjqxA8DZ/l0/tb5ZjY8WQ9R1QFmYDd
 GJG4sP81NK6aLz9pyxNtG8Zto+ZvtDkg/8L+SJuff+h3/yTZ7Wr3o0OGlhTz29p/EbQC
 dgkLfEAP+aRz9eNZBeF9dgByRnOeRqNX26TvBr/vQaAokGXxcp6HOKgJsKjKWmgzZhHT
 eW0OtuxZnGkbFxomtIKvBLwy0m3YpFoOsXmBbmT4sH047sldA/hZKethn4/igIvOXbFH
 A/3A==
X-Gm-Message-State: AOAM532ygAdhvq03vOEPWTeYZFYNGRr+SYD5kYddRBIeROGenzsVPYl+
 gLq7eCTPP8iw0IoTey+m0qu7Ig==
X-Google-Smtp-Source: ABdhPJzMGjrEasYfZKaXHiKDk2JXjUMCt7+hPYvpYLv20XdAr541nfGZJuq7L+uymgGXVmCQCAyOOQ==
X-Received: by 2002:a63:1d4d:: with SMTP id d13mr1597884pgm.103.1613108495187; 
 Thu, 11 Feb 2021 21:41:35 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f9db-27eb-79e2-afa8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f9db:27eb:79e2:afa8])
 by smtp.gmail.com with ESMTPSA id c24sm7303030pfo.209.2021.02.11.21.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 21:41:34 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 06/10] powerpc/signal64: Replace setup_sigcontext() w/
 unsafe_setup_sigcontext()
In-Reply-To: <20210203184323.20792-7-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-7-cmr@codefail.de>
Date: Fri, 12 Feb 2021 16:41:31 +1100
Message-ID: <871rdletbo.fsf@dja-thinkpad.axtens.net>
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

> Previously setup_sigcontext() performed a costly KUAP switch on every
> uaccess operation. These repeated uaccess switches cause a significant
> drop in signal handling performance.
>
> Rewrite setup_sigcontext() to assume that a userspace write access window
> is open. Replace all uaccess functions with their 'unsafe' versions
> which avoid the repeated uaccess switches.

Just to clarify the commit message a bit: you're also changing the
callers of the old safe versions to first open the window, then call the
unsafe variants, then close the window again.

> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal_64.c | 70 ++++++++++++++++++++-------------
>  1 file changed, 43 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 8e1d804ce552..4248e4489ff1 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -101,9 +101,13 @@ static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_re
>   * Set up the sigcontext for the signal frame.
>   */
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
>  {
>  	/* When CONFIG_ALTIVEC is set, we _always_ setup v_regs even if the
>  	 * process never used altivec yet (MSR_VEC is zero in pt_regs of
> @@ -118,20 +122,19 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  #endif
>  	struct pt_regs *regs = tsk->thread.regs;
>  	unsigned long msr = regs->msr;
> -	long err = 0;
>  	/* Force usr to alway see softe as 1 (interrupts enabled) */
>  	unsigned long softe = 0x1;
>  
>  	BUG_ON(tsk != current);
>  
>  #ifdef CONFIG_ALTIVEC
> -	err |= __put_user(v_regs, &sc->v_regs);
> +	unsafe_put_user(v_regs, &sc->v_regs, efault_out);
>  
>  	/* save altivec registers */
>  	if (tsk->thread.used_vr) {
>  		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
> -		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
> -				      33 * sizeof(vector128));
> +		unsafe_copy_to_user(v_regs, &tsk->thread.vr_state,
> +				    33 * sizeof(vector128), efault_out);
>  		/* set MSR_VEC in the MSR value in the frame to indicate that sc->v_reg)
>  		 * contains valid data.
>  		 */
> @@ -140,12 +143,12 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  	/* We always copy to/from vrsave, it's 0 if we don't have or don't
>  	 * use altivec.
>  	 */
> -	err |= __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> +	unsafe_put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33], efault_out);
>  #else /* CONFIG_ALTIVEC */
> -	err |= __put_user(0, &sc->v_regs);
> +	unsafe_put_user(0, &sc->v_regs, efault_out);
>  #endif /* CONFIG_ALTIVEC */
>  	/* copy fpr regs and fpscr */
> -	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
> +	unsafe_copy_fpr_to_user(&sc->fp_regs, tsk, efault_out);
>  
>  	/*
>  	 * Clear the MSR VSX bit to indicate there is no valid state attached
> @@ -160,24 +163,27 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  	 */
>  	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
>  		v_regs += ELF_NVRREG;
> -		err |= copy_vsx_to_user(v_regs, tsk);
> +		unsafe_copy_vsx_to_user(v_regs, tsk, efault_out);
>  		/* set MSR_VSX in the MSR value in the frame to
>  		 * indicate that sc->vs_reg) contains valid data.
>  		 */
>  		msr |= MSR_VSX;
>  	}
>  #endif /* CONFIG_VSX */
> -	err |= __put_user(&sc->gp_regs, &sc->regs);
> +	unsafe_put_user(&sc->gp_regs, &sc->regs, efault_out);
>  	WARN_ON(!FULL_REGS(regs));
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
>  	if (set != NULL)
> -		err |=  __put_user(set->sig[0], &sc->oldmask);
> +		unsafe_put_user(set->sig[0], &sc->oldmask, efault_out);
>  
> -	return err;
> +	return 0;
> +
> +efault_out:
> +	return -EFAULT;
>  }
>  
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> @@ -664,12 +670,15 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  
>  	if (old_ctx != NULL) {
>  		prepare_setup_sigcontext(current, ctx_has_vsx_region);
> -		if (!access_ok(old_ctx, ctx_size)
> -		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
> -					ctx_has_vsx_region)
> -		    || __copy_to_user(&old_ctx->uc_sigmask,
> -				      &current->blocked, sizeof(sigset_t)))
> +		if (!user_write_access_begin(old_ctx, ctx_size))
>  			return -EFAULT;

I notice we get rid of access_ok, but that's fine because
user_write_access_begin includes access_ok since Linus decided that was
a good idea.

> +
> +		unsafe_setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL,
> +					0, ctx_has_vsx_region, efault_out);
> +		unsafe_copy_to_user(&old_ctx->uc_sigmask, &current->blocked,
> +				    sizeof(sigset_t), efault_out);
> +
> +		user_write_access_end();
>  	}
>  	if (new_ctx == NULL)
>  		return 0;
> @@ -698,6 +707,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  	/* This returns like rt_sigreturn */
>  	set_thread_flag(TIF_RESTOREALL);
>  	return 0;
> +
> +efault_out:
> +	user_write_access_end();
> +	return -EFAULT;
>  }
>  
>  
> @@ -850,9 +863,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  	} else {
>  		err |= __put_user(0, &frame->uc.uc_link);
>  		prepare_setup_sigcontext(tsk, 1);
> -		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> -					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> -					1);
> +		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> +			return -EFAULT;

Here you're opening a window for all of `frame`...

> +		err |= __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
... but here you're only passing in frame->uc.uc_mcontext for writing.

ISTR that the underlying AMR switch is fully on / fully off so I don't
think it really matters, but in this case should you be calling
user_write_access_begin() with &frame->uc.uc_mcontext and the size of
that?

> +						ksig->sig, NULL,
> +						(unsigned long)ksig->ka.sa.sa_handler, 1);
> +		user_write_access_end();
>  	}
>  	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
>  	if (err)


Apart from the size thing, everything looks good to me. I checked that
all the things you've changed from safe to unsafe pass the same
parameters, and they all looked good to me.

With those caveats,
 Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
