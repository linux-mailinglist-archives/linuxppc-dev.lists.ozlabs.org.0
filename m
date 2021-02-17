Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331531DFB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 20:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgp283H2Pz3clK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 06:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.43;
 helo=h2.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgp1q3vdTz3cGf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 06:34:23 +1100 (AEDT)
Received: from MTA-13-3.privateemail.com (mta-13.privateemail.com
 [198.54.118.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id C7D3F80A9A
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 14:27:29 -0500 (EST)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 3890E800A4;
 Wed, 17 Feb 2021 14:27:24 -0500 (EST)
Received: from localhost (unknown [10.20.151.236])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 0445C800A3;
 Wed, 17 Feb 2021 19:27:23 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Feb 2021 13:27:23 -0600
Message-Id: <C9C1XKNVRQC4.LHKIIQAIC3L7@oc8246131445.ibm.com>
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5 05/10] powerpc/signal64: Remove TM ifdefery in middle
 of if/else block
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-6-cmr@codefail.de>
 <874kiheu93.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <874kiheu93.fsf@dja-thinkpad.axtens.net>
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

On Thu Feb 11, 2021 at 11:21 PM CST, Daniel Axtens wrote:
> Hi Chris,
>
> > Rework the messy ifdef breaking up the if-else for TM similar to
> > commit f1cf4f93de2f ("powerpc/signal32: Remove ifdefery in middle of if=
/else").
>
> I'm not sure what 'the messy ifdef' and 'the if-else for TM' is (yet):
> perhaps you could start the commit message with a tiny bit of
> background.

Yup good point - I will reword this for the next spin.

>
> > Unlike that commit for ppc32, the ifdef can't be removed entirely since
> > uc_transact in sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM.
> >
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >  arch/powerpc/kernel/signal_64.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index b211a8ea4f6e..8e1d804ce552 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -710,9 +710,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >  	struct pt_regs *regs =3D current_pt_regs();
> >  	struct ucontext __user *uc =3D (struct ucontext __user *)regs->gpr[1]=
;
> >  	sigset_t set;
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >  	unsigned long msr;
> > -#endif
> > =20
> >  	/* Always make any pending restarted system calls return -EINTR */
> >  	current->restart_block.fn =3D do_no_restart_syscall;
> > @@ -765,7 +763,10 @@ SYSCALL_DEFINE0(rt_sigreturn)
> > =20
> >  	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
> >  		goto badframe;
> > +#endif
> > +
> >  	if (MSR_TM_ACTIVE(msr)) {
> > +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >  		/* We recheckpoint on return. */
> >  		struct ucontext __user *uc_transact;
> > =20
> > @@ -778,9 +779,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >  		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
> >  					   &uc_transact->uc_mcontext))
> >  			goto badframe;
> > -	} else
> >  #endif
> > -	{
> > +	} else {
> >  		/*
> >  		 * Fall through, for non-TM restore
> >  		 *
>
> I think you can get rid of all the ifdefs in _this function_ by
> providing a couple of stubs:
>
> diff --git a/arch/powerpc/kernel/process.c
> b/arch/powerpc/kernel/process.c
> index a66f435dabbf..19059a4b798f 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1120,6 +1120,7 @@ void restore_tm_state(struct pt_regs *regs)
> #else
> #define tm_recheckpoint_new_task(new)
> #define __switch_to_tm(prev, new)
> +void tm_reclaim_current(uint8_t cause) {}
> #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> =20
> static inline void save_sprs(struct thread_struct *t)
> diff --git a/arch/powerpc/kernel/signal_64.c
> b/arch/powerpc/kernel/signal_64.c
> index 8e1d804ce552..ed58ca019ad9 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -594,6 +594,13 @@ static long restore_tm_sigcontexts(struct
> task_struct *tsk,
> =20
> return err;
> }
> +#else
> +static long restore_tm_sigcontexts(struct task_struct *tsk,
> + struct sigcontext __user *sc,
> + struct sigcontext __user *tm_sc)
> +{
> + return -EINVAL;
> +}
> #endif
> =20
> /*
> @@ -722,7 +729,6 @@ SYSCALL_DEFINE0(rt_sigreturn)
> goto badframe;
> set_current_blocked(&set);
> =20
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> /*
> * If there is a transactional state then throw it away.
> * The purpose of a sigreturn is to destroy all traces of the
> @@ -763,10 +769,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
> =20
> if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
> goto badframe;
> -#endif
> =20
> if (MSR_TM_ACTIVE(msr)) {
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> /* We recheckpoint on return. */
> struct ucontext __user *uc_transact;
> =20
> @@ -779,7 +783,6 @@ SYSCALL_DEFINE0(rt_sigreturn)
> if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
> &uc_transact->uc_mcontext))
> goto badframe;
> -#endif
> } else {
> /*
> * Fall through, for non-TM restore
>
> My only concern here was whether it was valid to access
> if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
> if CONFIG_PPC_TRANSACTIONAL_MEM was not defined, but I didn't think of
> any obvious reason why it wouldn't be...

Hmm, we don't really need it for the non-TM case and it is another extra
uaccess. I will take your suggestion to remove the need for the other
ifdefs but might keep this one. Keeping it also makes it very clear this
call is only here for TM and possible to remove in a potentially TM-less
future :)

>
> > @@ -818,10 +818,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigse=
t_t *set,
> >  	unsigned long newsp =3D 0;
> >  	long err =3D 0;
> >  	struct pt_regs *regs =3D tsk->thread.regs;
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >  	/* Save the thread's msr before get_tm_stackpointer() changes it */
> >  	unsigned long msr =3D regs->msr;
> > -#endif
>
> I wondered if that comment still makes sense in the absence of the
> ifdef. It is preserved in commit f1cf4f93de2f ("powerpc/signal32: Remove
> ifdefery in middle of if/else"), and I can't figure out how you would
> improve it, so I guess it's probably good as it is.
>
> >  	frame =3D get_sigframe(ksig, tsk, sizeof(*frame), 0);
> >  	if (!access_ok(frame, sizeof(*frame)))
> > @@ -836,8 +834,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
> >  	/* Create the ucontext.  */
> >  	err |=3D __put_user(0, &frame->uc.uc_flags);
> >  	err |=3D __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > +
> >  	if (MSR_TM_ACTIVE(msr)) {
> > +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >  		/* The ucontext_t passed to userland points to the second
> >  		 * ucontext_t (for transactional state) with its uc_link ptr.
> >  		 */
> > @@ -847,9 +846,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
> >  					    tsk, ksig->sig, NULL,
> >  					    (unsigned long)ksig->ka.sa.sa_handler,
> >  					    msr);
> > -	} else
> >  #endif
> > -	{
> > +	} else {
> >  		err |=3D __put_user(0, &frame->uc.uc_link);
> >  		prepare_setup_sigcontext(tsk, 1);
> >  		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
>
> That seems reasonable to me.

Thanks for the feedback!

>
> Kind regards,
> Daniel

