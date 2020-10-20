Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9E293345
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 04:44:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFdJH4kv0zDqVB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 13:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.87;
 helo=se18-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se18-4.privateemail.com (se18-4.privateemail.com
 [198.54.127.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFdF63dZFzDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 13:42:02 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kUhb4-0006nA-Mr; Mon, 19 Oct 2020 19:42:00 -0700
Received: from MTA-07-1.privateemail.com (unknown [10.20.147.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 96CD0A6F;
 Tue, 20 Oct 2020 02:41:58 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 7733A60043;
 Mon, 19 Oct 2020 22:41:58 -0400 (EDT)
Received: from localhost (unknown [10.20.151.222])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 32BA060034;
 Tue, 20 Oct 2020 02:41:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 7/8] powerpc/signal64: Rewrite handle_rt_signal64() to
 minimise uaccess switches
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 19 Oct 2020 21:44:26 -0500
Message-Id: <C6HDGA21FU6I.17O37JPOYTU74@geist>
In-Reply-To: <1cedcf43-4594-5db1-d248-7c06a572aecc@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0acxlbLX9+ibl6ixChE10xOpSDasLI4SayDByyq9LIhVjNyOd7HWM8nP
 8P/YmsD68ETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZ/Mp
 AFfZKu6jiKhfDEdeK2Dn98dacUsL66kgvenDmrmPkbNQWAhniA2nZ6Uf9X6bEYSGaQOYvUz3Qyrl
 0TYKe/LS6SVcTDfu4zA3T/zuN4cDgDyRBtxzzAkC8+c76cJoYLk5JPeAOPgn+kMHnHQHwyxJf1OL
 05gxFbhTnU32bkEaVWMlqXXd+RxAnk9GBmPz0QiZvPgV2a3WEfKXnN3tGysL1eMfTtpF2Ne0CNAY
 Q7BTrEoBPa5iwIbD+Ed7E28GGEpCHkq3t2QWc5y7R2vgTKTvxnrnHtOKPp7r4O3DezwNkL/+h1aL
 2OqtpSX2AHJEJUCbUeEMVjDon5rfSznEF9Wn0xds8xzlI9bNNBd60UaawOdYtt/eE4r9wJTVwPfY
 y51IIYAHBv0PxorZCJ/m663fX8TdqEXkwxwMjsp2mNApCMwC0i1RRNpAlj0OowkrVj+H82wvQb0g
 HPVMHF2w2QAZIKC9G3JBLnu48CZ5VbHJ2OUMeHyTpNN0eXybX/w7//Zvfrj9M8hBE8kGoYdZPbva
 tYdwupvwQrDHqRrQu5J2Zn+vVGR4luu90BTZxVQ9Gszy2Bn0t5m309L9BZiIzZmGLeg4WuHOGVQa
 DWQcnAfY2CvahWOro3IxCk6nqUEVnKbAvktuOzccmiJIz3CLNOD3Y80OmAux3oN13+ztUzneP+S4
 6cVT15kZfIXezOFWrB1apvGATgE5tBtX1GachK5EKmMUMJs/+9TtbwznOTkllA9oURQQPYAldHid
 i+yCj1z1pRXWhjh9fdbl44I0Df0jvQPmnK7fqtOA5qdy+9OVxd3c3Kfd5qt829jOOLZ182jY8Z3i
 onkEsAtooCA9BVI1N30qb7V+5A0U/gKkK9k9DTfrDXGPRZLzTm2++Q8HGZWgSKo14Yb74FuTYKbd
 WDxFgwmpUOXPcPeresbPjCmpN6mgRXwmhaF+5Wzan3ZpsxTn16PwFWAtupNMkSg+YYmlfd9rFdR+
 aToR9BhbMnBp
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 16, 2020 at 11:00 AM CDT, Christophe Leroy wrote:
>
>
> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> > From: Daniel Axtens <dja@axtens.net>
> >=20
> > Add uaccess blocks and use the 'unsafe' versions of functions doing use=
r
> > access where possible to reduce the number of times uaccess has to be
> > opened/closed.
> >=20
> > There is no 'unsafe' version of copy_siginfo_to_user, so move it
> > slightly to allow for a "longer" uaccess block.
> >=20
> > Signed-off-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/signal_64.c | 54 ++++++++++++++++----------------=
-
> >   1 file changed, 27 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index 6d4f7a5c4fbf..3b97e3681a8f 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -843,46 +843,42 @@ int handle_rt_signal64(struct ksignal *ksig, sigs=
et_t *set,
> >   	/* Save the thread's msr before get_tm_stackpointer() changes it */
> >   	unsigned long msr =3D regs->msr;
> >   #endif
> > -
> >   	frame =3D get_sigframe(ksig, tsk, sizeof(*frame), 0);
> > -	if (!access_ok(frame, sizeof(*frame)))
> > +	if (!user_write_access_begin(frame, sizeof(*frame)))
> >   		goto badframe;
> >  =20
> > -	err |=3D __put_user(&frame->info, &frame->pinfo);
> > -	err |=3D __put_user(&frame->uc, &frame->puc);
> > -	err |=3D copy_siginfo_to_user(&frame->info, &ksig->info);
> > -	if (err)
> > -		goto badframe;
> > +	unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
> > +	unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
> >  =20
> >   	/* Create the ucontext.  */
> > -	err |=3D __put_user(0, &frame->uc.uc_flags);
> > -	err |=3D __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
> > +	unsafe_put_user(0, &frame->uc.uc_flags, badframe_block);
> > +	unsafe_save_altstack(&frame->uc.uc_stack, regs->gpr[1], badframe_bloc=
k);
> > +
> >   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >   	if (MSR_TM_ACTIVE(msr)) {
> >   		/* The ucontext_t passed to userland points to the second
> >   		 * ucontext_t (for transactional state) with its uc_link ptr.
> >   		 */
> > -		err |=3D __put_user(&frame->uc_transact, &frame->uc.uc_link);
> > +		unsafe_put_user(&frame->uc_transact, &frame->uc.uc_link, badframe_bl=
ock);
> > +		user_write_access_end();
>
> Whaou. Doing this inside an #ifdef sequence is dirty.
> Can you reorganise code to avoid that and to avoid nesting #ifdef/#endif
> and the if/else as I did in
> signal32 ?

Hopefully yes - next spin!

>
> >   		err |=3D setup_tm_sigcontexts(&frame->uc.uc_mcontext,
> >   					    &frame->uc_transact.uc_mcontext,
> >   					    tsk, ksig->sig, NULL,
> >   					    (unsigned long)ksig->ka.sa.sa_handler,
> >   					    msr);
> > +		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> > +			goto badframe;
> > +
> >   	} else
> >   #endif
> >   	{
> > -		err |=3D __put_user(0, &frame->uc.uc_link);
> > -
> > -		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> > -			return -EFAULT;
> > -		err |=3D __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
> > -						ksig->sig, NULL,
> > -						(unsigned long)ksig->ka.sa.sa_handler, 1);
> > -		user_write_access_end();
> > +		unsafe_put_user(0, &frame->uc.uc_link, badframe_block);
> > +		unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> > +					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> > +					1, badframe_block);
> >   	}
> > -	err |=3D __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
> > -	if (err)
> > -		goto badframe;
> > +
> > +	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badfram=
e_block);
> >  =20
> >   	/* Make sure signal handler doesn't get spurious FP exceptions */
> >   	tsk->thread.fp_state.fpscr =3D 0;
> > @@ -891,15 +887,17 @@ int handle_rt_signal64(struct ksignal *ksig, sigs=
et_t *set,
> >   	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
> >   		regs->nip =3D tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
> >   	} else {
> > -		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> > -			return -EFAULT;
> > -		err |=3D __unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[=
0]);
> > -		user_write_access_end();
> > -		if (err)
> > -			goto badframe;
> > +		unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0],
> > +					badframe_block);
> >   		regs->nip =3D (unsigned long) &frame->tramp[0];
> >   	}
> >  =20
> > +	user_write_access_end();
> > +
> > +	/* Save the siginfo outside of the unsafe block. */
> > +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> > +		goto badframe;
> > +
> >   	/* Allocate a dummy caller frame for the signal handler. */
> >   	newsp =3D ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
> >   	err |=3D put_user(regs->gpr[1], (unsigned long __user *)newsp);
> > @@ -939,6 +937,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
> >  =20
> >   	return 0;
> >  =20
> > +badframe_block:
> > +	user_write_access_end();
> >   badframe:
> >   	signal_fault(current, regs, "handle_rt_signal64", frame);
> >  =20
> >=20
>
>
> Christophe

