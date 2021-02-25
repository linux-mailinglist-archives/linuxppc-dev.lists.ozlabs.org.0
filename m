Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F9432499B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmJnn6GzHz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:54:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.122.58;
 helo=mta-08-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 35586 seconds by postgrey-1.36 at boromir;
 Thu, 25 Feb 2021 14:54:20 AEDT
Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com
 [198.54.122.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmJnS6dJCz30QK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:54:19 +1100 (AEDT)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 4E32360087;
 Wed, 24 Feb 2021 22:54:16 -0500 (EST)
Received: from localhost (unknown [10.20.151.235])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 175AA60080;
 Thu, 25 Feb 2021 03:54:16 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Feb 2021 21:54:15 -0600
Message-Id: <C9IB3H0UJ9RJ.2BX505RC7K5DQ@oc8246131445.ibm.com>
Subject: Re: [PATCH v6 07/10] powerpc/signal64: Replace restore_sigcontext()
 w/ unsafe_restore_sigcontext()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210221012401.22328-1-cmr@codefail.de>
 <20210221012401.22328-8-cmr@codefail.de>
 <67afcec9-6335-2bd5-938b-687ecb61bf3d@csgroup.eu>
In-Reply-To: <67afcec9-6335-2bd5-938b-687ecb61bf3d@csgroup.eu>
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

On Tue Feb 23, 2021 at 11:36 AM CST, Christophe Leroy wrote:
>
>
> Le 21/02/2021 =C3=A0 02:23, Christopher M. Riedl a =C3=A9crit :
> > Previously restore_sigcontext() performed a costly KUAP switch on every
> > uaccess operation. These repeated uaccess switches cause a significant
> > drop in signal handling performance.
> >=20
> > Rewrite restore_sigcontext() to assume that a userspace read access
> > window is open by replacing all uaccess functions with their 'unsafe'
> > versions. Modify the callers to first open, call
> > unsafe_restore_sigcontext(), and then close the uaccess window.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/signal_64.c | 68 ++++++++++++++++++++------------=
-
> >   1 file changed, 41 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index 3faaa736ed62..76b525261f61 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -326,14 +326,14 @@ static long setup_tm_sigcontexts(struct sigcontex=
t __user *sc,
> >   /*
> >    * Restore the sigcontext from the signal frame.
> >    */
> > -
> > -static long restore_sigcontext(struct task_struct *tsk, sigset_t *set,=
 int sig,
> > -			      struct sigcontext __user *sc)
> > +#define unsafe_restore_sigcontext(tsk, set, sig, sc, e) \
> > +	unsafe_op_wrap(__unsafe_restore_sigcontext(tsk, set, sig, sc), e)
>
> unsafe_op_wrap() was not initially meant to be used outside of uaccess.h
>
> In the begining, it has been copied from include/linux/uaccess.h and was
> used
> for unsafe_put_user(), unsafe_get_user() and unsafe_copy_to_user().
> After other changes, only
> unsafe_get_user() is still using it and I'm going to drop
> unsafe_op_wrap() soon.
>
> I'd prefer if you can do the same as unsafe_save_general_regs() and
> others in signal_32.c

Sounds good, will change this in the next version (and also the wrapper
around unsafe_setup_sigcontext()).

>
> > +static long notrace __unsafe_restore_sigcontext(struct task_struct *ts=
k, sigset_t *set,
> > +						int sig, struct sigcontext __user *sc)
> >   {
> >   #ifdef CONFIG_ALTIVEC
> >   	elf_vrreg_t __user *v_regs;
> >   #endif
> > -	unsigned long err =3D 0;
> >   	unsigned long save_r13 =3D 0;
> >   	unsigned long msr;
> >   	struct pt_regs *regs =3D tsk->thread.regs;
> > @@ -348,27 +348,28 @@ static long restore_sigcontext(struct task_struct=
 *tsk, sigset_t *set, int sig,
> >   		save_r13 =3D regs->gpr[13];
> >  =20
> >   	/* copy the GPRs */
> > -	err |=3D __copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr));
> > -	err |=3D __get_user(regs->nip, &sc->gp_regs[PT_NIP]);
> > +	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr),
> > +			      efault_out);
>
> I think it would be better to keep the above on a single line for
> readability.
> Nowadays we tolerate 100 chars lines for cases like this one.

Ok, changed this (and the line you mention further below) in the next
version.

>
> > +	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
> >   	/* get MSR separately, transfer the LE bit if doing signal return */
> > -	err |=3D __get_user(msr, &sc->gp_regs[PT_MSR]);
> > +	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
> >   	if (sig)
> >   		regs->msr =3D (regs->msr & ~MSR_LE) | (msr & MSR_LE);
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
> >   	/* Don't allow userspace to set SOFTE */
> >   	set_trap_norestart(regs);
> > -	err |=3D __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
> > -	err |=3D __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
> > -	err |=3D __get_user(regs->result, &sc->gp_regs[PT_RESULT]);
> > +	unsafe_get_user(regs->dar, &sc->gp_regs[PT_DAR], efault_out);
> > +	unsafe_get_user(regs->dsisr, &sc->gp_regs[PT_DSISR], efault_out);
> > +	unsafe_get_user(regs->result, &sc->gp_regs[PT_RESULT], efault_out);
> >  =20
> >   	if (!sig)
> >   		regs->gpr[13] =3D save_r13;
> >   	if (set !=3D NULL)
> > -		err |=3D  __get_user(set->sig[0], &sc->oldmask);
> > +		unsafe_get_user(set->sig[0], &sc->oldmask, efault_out);
> >  =20
> >   	/*
> >   	 * Force reload of FP/VEC.
> > @@ -378,29 +379,28 @@ static long restore_sigcontext(struct task_struct=
 *tsk, sigset_t *set, int sig,
> >   	regs->msr &=3D ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
> >  =20
> >   #ifdef CONFIG_ALTIVEC
> > -	err |=3D __get_user(v_regs, &sc->v_regs);
> > -	if (err)
> > -		return err;
> > +	unsafe_get_user(v_regs, &sc->v_regs, efault_out);
> >   	if (v_regs && !access_ok(v_regs, 34 * sizeof(vector128)))
> >   		return -EFAULT;
> >   	/* Copy 33 vec registers (vr0..31 and vscr) from the stack */
> >   	if (v_regs !=3D NULL && (msr & MSR_VEC) !=3D 0) {
> > -		err |=3D __copy_from_user(&tsk->thread.vr_state, v_regs,
> > -					33 * sizeof(vector128));
> > +		unsafe_copy_from_user(&tsk->thread.vr_state, v_regs,
> > +				      33 * sizeof(vector128), efault_out);
> >   		tsk->thread.used_vr =3D true;
> >   	} else if (tsk->thread.used_vr) {
> >   		memset(&tsk->thread.vr_state, 0, 33 * sizeof(vector128));
> >   	}
> >   	/* Always get VRSAVE back */
> >   	if (v_regs !=3D NULL)
> > -		err |=3D __get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
> > +		unsafe_get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33],
> > +				efault_out);
>
> Same, would be better on a single line I think.
>
> >   	else
> >   		tsk->thread.vrsave =3D 0;
> >   	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> >   		mtspr(SPRN_VRSAVE, tsk->thread.vrsave);
> >   #endif /* CONFIG_ALTIVEC */
> >   	/* restore floating point */
> > -	err |=3D copy_fpr_from_user(tsk, &sc->fp_regs);
> > +	unsafe_copy_fpr_from_user(tsk, &sc->fp_regs, efault_out);
> >   #ifdef CONFIG_VSX
> >   	/*
> >   	 * Get additional VSX data. Update v_regs to point after the
> > @@ -409,14 +409,17 @@ static long restore_sigcontext(struct task_struct=
 *tsk, sigset_t *set, int sig,
> >   	 */
> >   	v_regs +=3D ELF_NVRREG;
> >   	if ((msr & MSR_VSX) !=3D 0) {
> > -		err |=3D copy_vsx_from_user(tsk, v_regs);
> > +		unsafe_copy_vsx_from_user(tsk, v_regs, efault_out);
> >   		tsk->thread.used_vsr =3D true;
> >   	} else {
> >   		for (i =3D 0; i < 32 ; i++)
> >   			tsk->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] =3D 0;
> >   	}
> >   #endif
> > -	return err;
> > +	return 0;
> > +
> > +efault_out:
> > +	return -EFAULT;
> >   }
> >  =20
> >   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > @@ -707,8 +710,14 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __use=
r *, old_ctx,
> >   	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
> >   		do_exit(SIGSEGV);
> >   	set_current_blocked(&set);
> > -	if (restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext))
> > +
> > +	if (!user_read_access_begin(new_ctx, ctx_size))
> > +		return -EFAULT;
> > +	if (__unsafe_restore_sigcontext(current, NULL, 0, &new_ctx->uc_mconte=
xt)) {
> > +		user_read_access_end();
> >   		do_exit(SIGSEGV);
> > +	}
> > +	user_read_access_end();
> >  =20
> >   	/* This returns like rt_sigreturn */
> >   	set_thread_flag(TIF_RESTOREALL);
> > @@ -811,8 +820,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   		 * causing a TM bad thing.
> >   		 */
> >   		current->thread.regs->msr &=3D ~MSR_TS_MASK;
> > -		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
> > +		if (!user_read_access_begin(&uc->uc_mcontext, sizeof(uc->uc_mcontext=
)))
> > +			return -EFAULT;
> > +		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))=
 {
> > +			user_read_access_end();
> >   			goto badframe;
> > +		}
> > +		user_read_access_end();
> >   	}
> >  =20
> >   	if (restore_altstack(&uc->uc_stack))
> >=20

