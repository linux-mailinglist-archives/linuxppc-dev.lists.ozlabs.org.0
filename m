Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1F31DFAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 20:32:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgnzl3VQWz3ckS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 06:32:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.30;
 helo=mta-10-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 06:32:18 AEDT
Received: from MTA-10-1.privateemail.com (mta-10-1.privateemail.com
 [68.65.122.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgnzQ47Jfz3cGV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 06:32:18 +1100 (AEDT)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id DABC860081;
 Wed, 17 Feb 2021 14:32:16 -0500 (EST)
Received: from localhost (unknown [10.20.151.220])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id A605A60083;
 Wed, 17 Feb 2021 19:32:16 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Feb 2021 13:32:16 -0600
Message-Id: <C9C21B3R4J4S.3KF3PF5YCX4VP@oc8246131445.ibm.com>
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5 07/10] powerpc/signal64: Replace restore_sigcontext()
 w/ unsafe_restore_sigcontext()
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-8-cmr@codefail.de>
 <87y2ftc7el.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87y2ftc7el.fsf@dja-thinkpad.axtens.net>
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

On Fri Feb 12, 2021 at 3:17 PM CST, Daniel Axtens wrote:
> Hi Chris,
>
> > Previously restore_sigcontext() performed a costly KUAP switch on every
> > uaccess operation. These repeated uaccess switches cause a significant
> > drop in signal handling performance.
> >
> > Rewrite restore_sigcontext() to assume that a userspace read access
> > window is open. Replace all uaccess functions with their 'unsafe'
> > versions which avoid the repeated uaccess switches.
> >
>
> Much of the same comments apply here as to the last patch:
> - the commit message might be improved by adding that you are also
> changing the calling functions to open the uaccess window before
> calling into the new unsafe functions
>
> - I have checked that the safe to unsafe conversions look right.
>
> - I think you're opening too wide a window in user_read_access_begin,
> it seems to me that it could be reduced to just the
> uc_mcontext. (Again, not that it makes a difference with the current
> HW.)

Ok, I'll fix these in the next version as well.

>
> Kind regards,
> Daniel
>
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >  arch/powerpc/kernel/signal_64.c | 68 ++++++++++++++++++++-------------
> >  1 file changed, 41 insertions(+), 27 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index 4248e4489ff1..d668f8af18fe 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -326,14 +326,14 @@ static long setup_tm_sigcontexts(struct sigcontex=
t __user *sc,
> >  /*
> >   * Restore the sigcontext from the signal frame.
> >   */
> > -
> > -static long restore_sigcontext(struct task_struct *tsk, sigset_t *set,=
 int sig,
> > -			      struct sigcontext __user *sc)
> > +#define unsafe_restore_sigcontext(tsk, set, sig, sc, e) \
> > +	unsafe_op_wrap(__unsafe_restore_sigcontext(tsk, set, sig, sc), e)
> > +static long notrace __unsafe_restore_sigcontext(struct task_struct *ts=
k, sigset_t *set,
> > +						int sig, struct sigcontext __user *sc)
> >  {
> >  #ifdef CONFIG_ALTIVEC
> >  	elf_vrreg_t __user *v_regs;
> >  #endif
> > -	unsigned long err =3D 0;
> >  	unsigned long save_r13 =3D 0;
> >  	unsigned long msr;
> >  	struct pt_regs *regs =3D tsk->thread.regs;
> > @@ -348,27 +348,28 @@ static long restore_sigcontext(struct task_struct=
 *tsk, sigset_t *set, int sig,
> >  		save_r13 =3D regs->gpr[13];
> > =20
> >  	/* copy the GPRs */
> > -	err |=3D __copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr));
> > -	err |=3D __get_user(regs->nip, &sc->gp_regs[PT_NIP]);
> > +	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr),
> > +			      efault_out);
> > +	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
> >  	/* get MSR separately, transfer the LE bit if doing signal return */
> > -	err |=3D __get_user(msr, &sc->gp_regs[PT_MSR]);
> > +	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
> >  	if (sig)
> >  		regs->msr =3D (regs->msr & ~MSR_LE) | (msr & MSR_LE);
> > -	err |=3D __get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3]);
> > -	err |=3D __get_user(regs->ctr, &sc->gp_regs[PT_CTR]);
> > -	err |=3D __get_user(regs->link, &sc->gp_regs[PT_LNK]);
> > -	err |=3D __get_user(regs->xer, &sc->gp_regs[PT_XER]);
> > -	err |=3D __get_user(regs->ccr, &sc->gp_regs[PT_CCR]);
> > +	unsafe_get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3], efault_out=
);
> > +	unsafe_get_user(regs->ctr, &sc->gp_regs[PT_CTR], efault_out);
> > +	unsafe_get_user(regs->link, &sc->gp_regs[PT_LNK], efault_out);
> > +	unsafe_get_user(regs->xer, &sc->gp_regs[PT_XER], efault_out);
> > +	unsafe_get_user(regs->ccr, &sc->gp_regs[PT_CCR], efault_out);
> >  	/* Don't allow userspace to set SOFTE */
> >  	set_trap_norestart(regs);
> > -	err |=3D __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
> > -	err |=3D __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
> > -	err |=3D __get_user(regs->result, &sc->gp_regs[PT_RESULT]);
> > +	unsafe_get_user(regs->dar, &sc->gp_regs[PT_DAR], efault_out);
> > +	unsafe_get_user(regs->dsisr, &sc->gp_regs[PT_DSISR], efault_out);
> > +	unsafe_get_user(regs->result, &sc->gp_regs[PT_RESULT], efault_out);
> > =20
> >  	if (!sig)
> >  		regs->gpr[13] =3D save_r13;
> >  	if (set !=3D NULL)
> > -		err |=3D  __get_user(set->sig[0], &sc->oldmask);
> > +		unsafe_get_user(set->sig[0], &sc->oldmask, efault_out);
> > =20
> >  	/*
> >  	 * Force reload of FP/VEC.
> > @@ -378,29 +379,28 @@ static long restore_sigcontext(struct task_struct=
 *tsk, sigset_t *set, int sig,
> >  	regs->msr &=3D ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
> > =20
> >  #ifdef CONFIG_ALTIVEC
> > -	err |=3D __get_user(v_regs, &sc->v_regs);
> > -	if (err)
> > -		return err;
> > +	unsafe_get_user(v_regs, &sc->v_regs, efault_out);
> >  	if (v_regs && !access_ok(v_regs, 34 * sizeof(vector128)))
> >  		return -EFAULT;
> >  	/* Copy 33 vec registers (vr0..31 and vscr) from the stack */
> >  	if (v_regs !=3D NULL && (msr & MSR_VEC) !=3D 0) {
> > -		err |=3D __copy_from_user(&tsk->thread.vr_state, v_regs,
> > -					33 * sizeof(vector128));
> > +		unsafe_copy_from_user(&tsk->thread.vr_state, v_regs,
> > +				      33 * sizeof(vector128), efault_out);
> >  		tsk->thread.used_vr =3D true;
> >  	} else if (tsk->thread.used_vr) {
> >  		memset(&tsk->thread.vr_state, 0, 33 * sizeof(vector128));
> >  	}
> >  	/* Always get VRSAVE back */
> >  	if (v_regs !=3D NULL)
> > -		err |=3D __get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> > +		unsafe_get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33],
> > +				efault_out);
> >  	else
> >  		tsk->thread.vrsave =3D 0;
> >  	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> >  		mtspr(SPRN_VRSAVE, tsk->thread.vrsave);
> >  #endif /* CONFIG_ALTIVEC */
> >  	/* restore floating point */
> > -	err |=3D copy_fpr_from_user(tsk, &sc->fp_regs);
> > +	unsafe_copy_fpr_from_user(tsk, &sc->fp_regs, efault_out);
> >  #ifdef CONFIG_VSX
> >  	/*
> >  	 * Get additional VSX data. Update v_regs to point after the
> > @@ -409,14 +409,17 @@ static long restore_sigcontext(struct task_struct=
 *tsk, sigset_t *set, int sig,
> >  	 */
> >  	v_regs +=3D ELF_NVRREG;
> >  	if ((msr & MSR_VSX) !=3D 0) {
> > -		err |=3D copy_vsx_from_user(tsk, v_regs);
> > +		unsafe_copy_vsx_from_user(tsk, v_regs, efault_out);
> >  		tsk->thread.used_vsr =3D true;
> >  	} else {
> >  		for (i =3D 0; i < 32 ; i++)
> >  			tsk->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] =3D 0;
> >  	}
> >  #endif
> > -	return err;
> > +	return 0;
> > +
> > +efault_out:
> > +	return -EFAULT;
> >  }
> > =20
> >  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > @@ -701,8 +704,14 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __use=
r *, old_ctx,
> >  	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
> >  		do_exit(SIGSEGV);
> >  	set_current_blocked(&set);
> > -	if (restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext))
> > +
> > +	if (!user_read_access_begin(new_ctx, ctx_size))
> > +		return -EFAULT;
> > +	if (__unsafe_restore_sigcontext(current, NULL, 0, &new_ctx->uc_mconte=
xt)) {
> > +		user_read_access_end();
> >  		do_exit(SIGSEGV);
> > +	}
> > +	user_read_access_end();
> > =20
> >  	/* This returns like rt_sigreturn */
> >  	set_thread_flag(TIF_RESTOREALL);
> > @@ -807,8 +816,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >  		 * causing a TM bad thing.
> >  		 */
> >  		current->thread.regs->msr &=3D ~MSR_TS_MASK;
> > -		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
> > +		if (!user_read_access_begin(uc, sizeof(*uc)))
> > +			return -EFAULT;
> > +		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))=
 {
> > +			user_read_access_end();
> >  			goto badframe;
> > +		}
> > +		user_read_access_end();
> >  	}
> > =20
> >  	if (restore_altstack(&uc->uc_stack))
> > --=20
> > 2.26.1

