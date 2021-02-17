Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AD31DFA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 20:31:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgnyV3vDcz3cZh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 06:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.43;
 helo=h2.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 217 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 06:31:13 AEDT
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgny93lGBz3cGf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 06:31:13 +1100 (AEDT)
Received: from MTA-10-1.privateemail.com (mta-10.privateemail.com
 [68.65.122.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id CBB7D80C2B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 14:31:10 -0500 (EST)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 8960B60083;
 Wed, 17 Feb 2021 14:31:06 -0500 (EST)
Received: from localhost (unknown [10.20.151.209])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 5374460081;
 Wed, 17 Feb 2021 19:31:06 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Feb 2021 13:31:05 -0600
Message-Id: <C9C20ESIUOD7.1KTQN13WUTA9B@oc8246131445.ibm.com>
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5 06/10] powerpc/signal64: Replace setup_sigcontext()
 w/ unsafe_setup_sigcontext()
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-7-cmr@codefail.de>
 <871rdletbo.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <871rdletbo.fsf@dja-thinkpad.axtens.net>
X-Virus-Scanned: ClamAV using ClamSMTP
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

On Thu Feb 11, 2021 at 11:41 PM CST, Daniel Axtens wrote:
> Hi Chris,
>
> > Previously setup_sigcontext() performed a costly KUAP switch on every
> > uaccess operation. These repeated uaccess switches cause a significant
> > drop in signal handling performance.
> >
> > Rewrite setup_sigcontext() to assume that a userspace write access wind=
ow
> > is open. Replace all uaccess functions with their 'unsafe' versions
> > which avoid the repeated uaccess switches.
>
> Just to clarify the commit message a bit: you're also changing the
> callers of the old safe versions to first open the window, then call the
> unsafe variants, then close the window again.

Noted!

>
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >  arch/powerpc/kernel/signal_64.c | 70 ++++++++++++++++++++-------------
> >  1 file changed, 43 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index 8e1d804ce552..4248e4489ff1 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -101,9 +101,13 @@ static void prepare_setup_sigcontext(struct task_s=
truct *tsk, int ctx_has_vsx_re
> >   * Set up the sigcontext for the signal frame.
> >   */
> > =20
> > -static long setup_sigcontext(struct sigcontext __user *sc,
> > -		struct task_struct *tsk, int signr, sigset_t *set,
> > -		unsigned long handler, int ctx_has_vsx_region)
> > +#define unsafe_setup_sigcontext(sc, tsk, signr, set, handler,		\
> > +				ctx_has_vsx_region, e)			\
> > +	unsafe_op_wrap(__unsafe_setup_sigcontext(sc, tsk, signr, set,	\
> > +			handler, ctx_has_vsx_region), e)
> > +static long notrace __unsafe_setup_sigcontext(struct sigcontext __user=
 *sc,
> > +					struct task_struct *tsk, int signr, sigset_t *set,
> > +					unsigned long handler, int ctx_has_vsx_region)
> >  {
> >  	/* When CONFIG_ALTIVEC is set, we _always_ setup v_regs even if the
> >  	 * process never used altivec yet (MSR_VEC is zero in pt_regs of
> > @@ -118,20 +122,19 @@ static long setup_sigcontext(struct sigcontext __=
user *sc,
> >  #endif
> >  	struct pt_regs *regs =3D tsk->thread.regs;
> >  	unsigned long msr =3D regs->msr;
> > -	long err =3D 0;
> >  	/* Force usr to alway see softe as 1 (interrupts enabled) */
> >  	unsigned long softe =3D 0x1;
> > =20
> >  	BUG_ON(tsk !=3D current);
> > =20
> >  #ifdef CONFIG_ALTIVEC
> > -	err |=3D __put_user(v_regs, &sc->v_regs);
> > +	unsafe_put_user(v_regs, &sc->v_regs, efault_out);
> > =20
> >  	/* save altivec registers */
> >  	if (tsk->thread.used_vr) {
> >  		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
> > -		err |=3D __copy_to_user(v_regs, &tsk->thread.vr_state,
> > -				      33 * sizeof(vector128));
> > +		unsafe_copy_to_user(v_regs, &tsk->thread.vr_state,
> > +				    33 * sizeof(vector128), efault_out);
> >  		/* set MSR_VEC in the MSR value in the frame to indicate that sc->v_=
reg)
> >  		 * contains valid data.
> >  		 */
> > @@ -140,12 +143,12 @@ static long setup_sigcontext(struct sigcontext __=
user *sc,
> >  	/* We always copy to/from vrsave, it's 0 if we don't have or don't
> >  	 * use altivec.
> >  	 */
> > -	err |=3D __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> > +	unsafe_put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33], efault=
_out);
> >  #else /* CONFIG_ALTIVEC */
> > -	err |=3D __put_user(0, &sc->v_regs);
> > +	unsafe_put_user(0, &sc->v_regs, efault_out);
> >  #endif /* CONFIG_ALTIVEC */
> >  	/* copy fpr regs and fpscr */
> > -	err |=3D copy_fpr_to_user(&sc->fp_regs, tsk);
> > +	unsafe_copy_fpr_to_user(&sc->fp_regs, tsk, efault_out);
> > =20
> >  	/*
> >  	 * Clear the MSR VSX bit to indicate there is no valid state attached
> > @@ -160,24 +163,27 @@ static long setup_sigcontext(struct sigcontext __=
user *sc,
> >  	 */
> >  	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
> >  		v_regs +=3D ELF_NVRREG;
> > -		err |=3D copy_vsx_to_user(v_regs, tsk);
> > +		unsafe_copy_vsx_to_user(v_regs, tsk, efault_out);
> >  		/* set MSR_VSX in the MSR value in the frame to
> >  		 * indicate that sc->vs_reg) contains valid data.
> >  		 */
> >  		msr |=3D MSR_VSX;
> >  	}
> >  #endif /* CONFIG_VSX */
> > -	err |=3D __put_user(&sc->gp_regs, &sc->regs);
> > +	unsafe_put_user(&sc->gp_regs, &sc->regs, efault_out);
> >  	WARN_ON(!FULL_REGS(regs));
> > -	err |=3D __copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE);
> > -	err |=3D __put_user(msr, &sc->gp_regs[PT_MSR]);
> > -	err |=3D __put_user(softe, &sc->gp_regs[PT_SOFTE]);
> > -	err |=3D __put_user(signr, &sc->signal);
> > -	err |=3D __put_user(handler, &sc->handler);
> > +	unsafe_copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE, efault_out);
> > +	unsafe_put_user(msr, &sc->gp_regs[PT_MSR], efault_out);
> > +	unsafe_put_user(softe, &sc->gp_regs[PT_SOFTE], efault_out);
> > +	unsafe_put_user(signr, &sc->signal, efault_out);
> > +	unsafe_put_user(handler, &sc->handler, efault_out);
> >  	if (set !=3D NULL)
> > -		err |=3D  __put_user(set->sig[0], &sc->oldmask);
> > +		unsafe_put_user(set->sig[0], &sc->oldmask, efault_out);
> > =20
> > -	return err;
> > +	return 0;
> > +
> > +efault_out:
> > +	return -EFAULT;
> >  }
> > =20
> >  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > @@ -664,12 +670,15 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __us=
er *, old_ctx,
> > =20
> >  	if (old_ctx !=3D NULL) {
> >  		prepare_setup_sigcontext(current, ctx_has_vsx_region);
> > -		if (!access_ok(old_ctx, ctx_size)
> > -		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
> > -					ctx_has_vsx_region)
> > -		    || __copy_to_user(&old_ctx->uc_sigmask,
> > -				      &current->blocked, sizeof(sigset_t)))
> > +		if (!user_write_access_begin(old_ctx, ctx_size))
> >  			return -EFAULT;
>
> I notice we get rid of access_ok, but that's fine because
> user_write_access_begin includes access_ok since Linus decided that was
> a good idea.
>
> > +
> > +		unsafe_setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL,
> > +					0, ctx_has_vsx_region, efault_out);
> > +		unsafe_copy_to_user(&old_ctx->uc_sigmask, &current->blocked,
> > +				    sizeof(sigset_t), efault_out);
> > +
> > +		user_write_access_end();
> >  	}
> >  	if (new_ctx =3D=3D NULL)
> >  		return 0;
> > @@ -698,6 +707,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __use=
r *, old_ctx,
> >  	/* This returns like rt_sigreturn */
> >  	set_thread_flag(TIF_RESTOREALL);
> >  	return 0;
> > +
> > +efault_out:
> > +	user_write_access_end();
> > +	return -EFAULT;
> >  }
> > =20
> > =20
> > @@ -850,9 +863,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigse=
t_t *set,
> >  	} else {
> >  		err |=3D __put_user(0, &frame->uc.uc_link);
> >  		prepare_setup_sigcontext(tsk, 1);
> > -		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> > -					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> > -					1);
> > +		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> > +			return -EFAULT;
>
> Here you're opening a window for all of `frame`...
>
> > +		err |=3D __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
> ... but here you're only passing in frame->uc.uc_mcontext for writing.
>
> ISTR that the underlying AMR switch is fully on / fully off so I don't
> think it really matters, but in this case should you be calling
> user_write_access_begin() with &frame->uc.uc_mcontext and the size of
> that?

You are correct that it doesn't _really_ matter w/ the current
implementation of KUAP/AMR. It's still inconsistent and could cause
problems in the future so I will fix this to pass the proper size.

>
> > +						ksig->sig, NULL,
> > +						(unsigned long)ksig->ka.sa.sa_handler, 1);
> > +		user_write_access_end();
> >  	}
> >  	err |=3D __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
> >  	if (err)
>
>
> Apart from the size thing, everything looks good to me. I checked that
> all the things you've changed from safe to unsafe pass the same
> parameters, and they all looked good to me.

Thanks!

>
> With those caveats,
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>
> Kind regards,
> Daniel

