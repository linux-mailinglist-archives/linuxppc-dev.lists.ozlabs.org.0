Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC022F941D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 18:16:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJhQs65lszDrfW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 04:16:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJhNn6VbPzDrVT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 04:14:33 +1100 (AEDT)
Received: from MTA-12-4.privateemail.com (mta-12.privateemail.com
 [198.54.127.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 16C65808CB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 12:14:30 -0500 (EST)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 27C67800BA;
 Sun, 17 Jan 2021 12:14:24 -0500 (EST)
Received: from localhost (unknown [10.20.151.223])
 by mta-12.privateemail.com (Postfix) with ESMTPA id E65EB80094;
 Sun, 17 Jan 2021 17:14:23 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v3 4/8] powerpc/signal64: Remove TM ifdefery in middle
 of if/else block
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Sun, 17 Jan 2021 11:16:12 -0600
Message-Id: <C8LLQ8KX9GGS.1V196MK9ZRRSE@geist>
In-Reply-To: <80d49969-880f-5161-c829-cf319f94351d@csgroup.eu>
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

On Mon Jan 11, 2021 at 7:29 AM CST, Christophe Leroy wrote:
>
>
> Le 09/01/2021 =C3=A0 04:25, Christopher M. Riedl a =C3=A9crit :
> > Rework the messy ifdef breaking up the if-else for TM similar to
> > commit f1cf4f93de2f ("powerpc/signal32: Remove ifdefery in middle of if=
/else").
> >=20
> > Unlike that commit for ppc32, the ifdef can't be removed entirely since
> > uc_transact in sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/signal_64.c | 17 +++++++----------
> >   1 file changed, 7 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index b211a8ea4f6e..dd3787f67a78 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -710,9 +710,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   	struct pt_regs *regs =3D current_pt_regs();
> >   	struct ucontext __user *uc =3D (struct ucontext __user *)regs->gpr[1=
];
> >   	sigset_t set;
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >   	unsigned long msr;
> > -#endif
> >  =20
> >   	/* Always make any pending restarted system calls return -EINTR */
> >   	current->restart_block.fn =3D do_no_restart_syscall;
> > @@ -762,10 +760,12 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   	 * restore_tm_sigcontexts.
> >   	 */
> >   	regs->msr &=3D ~MSR_TS_MASK;
> > +#endif
> >  =20
> >   	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
> >   		goto badframe;
>
> This means you are doing that __get_user() even when msr is not used.
> That should be avoided.
>

Thanks, I moved it into the #ifdef block right above it instead for the
next spin.

> >   	if (MSR_TM_ACTIVE(msr)) {
> > +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >   		/* We recheckpoint on return. */
> >   		struct ucontext __user *uc_transact;
> >  =20
> > @@ -778,9 +778,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
> >   					   &uc_transact->uc_mcontext))
> >   			goto badframe;
> > -	} else
> >   #endif
> > -	{
> > +	} else {
> >   		/*
> >   		 * Fall through, for non-TM restore
> >   		 *
> > @@ -818,10 +817,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigse=
t_t *set,
> >   	unsigned long newsp =3D 0;
> >   	long err =3D 0;
> >   	struct pt_regs *regs =3D tsk->thread.regs;
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >   	/* Save the thread's msr before get_tm_stackpointer() changes it */
> > -	unsigned long msr =3D regs->msr;
> > -#endif
> > +	unsigned long msr __maybe_unused =3D regs->msr;
>
> I don't thing __maybe_unused() is the right solution.
>
> I think MSR_TM_ACTIVE() should be fixed instead, either by changing it
> into a static inline
> function, or doing something similar to
> https://github.com/linuxppc/linux/commit/05a4ab823983d9136a460b7b5e0d49ee=
709a6f86
>

Agreed, I'll change MSR_TM_ACTIVE() to reference its argument in the
macro. This keeps it consistent with all the other MSR_TM_* macros in
reg.h. Probably better than changing it to static inline since that
would mean changing all the macros too which seems unecessary.

> >  =20
> >   	frame =3D get_sigframe(ksig, tsk, sizeof(*frame), 0);
> >   	if (!access_ok(frame, sizeof(*frame)))
> > @@ -836,8 +833,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
> >   	/* Create the ucontext.  */
> >   	err |=3D __put_user(0, &frame->uc.uc_flags);
> >   	err |=3D __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > +
> >   	if (MSR_TM_ACTIVE(msr)) {
> > +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >   		/* The ucontext_t passed to userland points to the second
> >   		 * ucontext_t (for transactional state) with its uc_link ptr.
> >   		 */
> > @@ -847,9 +845,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
> >   					    tsk, ksig->sig, NULL,
> >   					    (unsigned long)ksig->ka.sa.sa_handler,
> >   					    msr);
> > -	} else
> >   #endif
> > -	{
> > +	} else {
> >   		err |=3D __put_user(0, &frame->uc.uc_link);
> >   		prepare_setup_sigcontext(tsk, 1);
> >   		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> >=20
>
> Christophe

