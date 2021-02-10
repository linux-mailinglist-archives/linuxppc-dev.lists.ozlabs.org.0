Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714D315E40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 05:38:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db6TX5KNXzDvWB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=codefail.de (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db6Rp0lrrzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 15:37:09 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11A4WvMb127677; Tue, 9 Feb 2021 23:37:06 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36m8hvg3ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 23:37:06 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11A4Ww1p023650;
 Wed, 10 Feb 2021 04:37:05 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 36hjr9jfms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 04:37:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11A4b4Fx25428468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Feb 2021 04:37:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3832878064;
 Wed, 10 Feb 2021 04:37:04 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E48E678063;
 Wed, 10 Feb 2021 04:37:03 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.80.193.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Feb 2021 04:37:03 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id DAFC4BC0F03;
 Tue,  9 Feb 2021 22:37:01 -0600 (CST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Feb 2021 22:37:01 -0600
Message-Id: <C95KM1QVX9G3.3HP1E2NXRPNSG@oc8246131445.ibm.com>
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5 03/10] powerpc/signal64: Move non-inline functions
 out of setup_sigcontext()
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-4-cmr@codefail.de>
 <87czxbdv8c.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87czxbdv8c.fsf@dja-thinkpad.axtens.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_08:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100039
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

On Sun Feb 7, 2021 at 10:44 PM CST, Daniel Axtens wrote:
> Hi Chris,
>
> These two paragraphs are a little confusing and they seem slightly
> repetitive. But I get the general idea. Two specific comments below:

Umm... yeah only one of those was supposed to be sent. I will reword
this for the next spin and address the comment below about how it is
not entirely clear that the inline functions are being moved out.

>
> > There are non-inline functions which get called in setup_sigcontext() t=
o
> > save register state to the thread struct. Move these functions into a
> > separate prepare_setup_sigcontext() function so that
> > setup_sigcontext() can be refactored later into an "unsafe" version
> > which assumes an open uaccess window. Non-inline functions should be
> > avoided when uaccess is open.
>
> Why do we want to avoid non-inline functions? We came up with:
>
> - we want KUAP protection for as much of the kernel as possible: each
> extra bit of code run with the window open is another piece of attack
> surface.
>   =20
> - non-inline functions default to traceable, which means we could end
> up ftracing while uaccess is enabled. That's a pretty big hole in the
> defences that KUAP provides.
>
> I think we've also had problems with the window being opened or closed
> unexpectedly by various bits of code? So the less code runs in uaccess
> context the less likely that is to occur.

That is my understanding as well.

> =20
> > The majority of setup_sigcontext() can be refactored to execute in an
> > "unsafe" context (uaccess window is opened) except for some non-inline
> > functions. Move these out into a separate prepare_setup_sigcontext()
> > function which must be called first and before opening up a uaccess
> > window. A follow-up commit converts setup_sigcontext() to be "unsafe".
>
> This was a bit confusing until we realise that you're moving the _calls_
> to the non-inline functions out, not the non-inline functions
> themselves.
>
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >  arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++-----------
> >  1 file changed, 21 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index f9e4a1ac440f..b211a8ea4f6e 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -79,6 +79,24 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(struc=
t sigcontext __user *sc)
> >  }
> >  #endif
> > =20
> > +static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_=
has_vsx_region)
>
> ctx_has_vsx_region should probably be a bool? Although setup_sigcontext
> also has it as an int so I guess that's arguable, and maybe it's better
> to stick with this for constency.

I've been told not to introduce unrelated changes in my patches before
so chose to keep this as an int for consistency.

>
> > +{
> > +#ifdef CONFIG_ALTIVEC
> > +	/* save altivec registers */
> > +	if (tsk->thread.used_vr)
> > +		flush_altivec_to_thread(tsk);
> > +	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> > +		tsk->thread.vrsave =3D mfspr(SPRN_VRSAVE);
> > +#endif /* CONFIG_ALTIVEC */
> > +
> > +	flush_fp_to_thread(tsk);
> > +
> > +#ifdef CONFIG_VSX
> > +	if (tsk->thread.used_vsr && ctx_has_vsx_region)
> > +		flush_vsx_to_thread(tsk);
> > +#endif /* CONFIG_VSX */
>
> Alternatively, given that this is the only use of ctx_has_vsx_region,
> mpe suggested that perhaps we could drop it entirely and always
> flush_vsx if used_vsr. The function is only ever called with either
> `current` or wth ctx_has_vsx_region set to 1, so in either case I think
> that's safe? I'm not sure if it would have performance implications.

I think that could work as long as we can guarantee that the context
passed to swapcontext will always be sufficiently sized if used_vsr,
which I think *has* to be the case?

>
> Should we move this and the altivec ifdef to IS_ENABLED(CONFIG_VSX) etc?
> I'm not sure if that runs into any problems with things like 'used_vsr'
> only being defined if CONFIG_VSX is set, but I thought I'd ask.

That's why I didn't use IS_ENABLED(CONFIG_...) here - all of these
field (used_vr, vrsave, used_vsr) declarations are guarded by #ifdefs :/

>
>
> > +}
> > +
> >  /*
> >   * Set up the sigcontext for the signal frame.
> >   */
> > @@ -97,7 +115,6 @@ static long setup_sigcontext(struct sigcontext __use=
r *sc,
> >  	 */
> >  #ifdef CONFIG_ALTIVEC
> >  	elf_vrreg_t __user *v_regs =3D sigcontext_vmx_regs(sc);
> > -	unsigned long vrsave;
> >  #endif
> >  	struct pt_regs *regs =3D tsk->thread.regs;
> >  	unsigned long msr =3D regs->msr;
> > @@ -112,7 +129,6 @@ static long setup_sigcontext(struct sigcontext __us=
er *sc,
> > =20
> >  	/* save altivec registers */
> >  	if (tsk->thread.used_vr) {
> > -		flush_altivec_to_thread(tsk);
> >  		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
> >  		err |=3D __copy_to_user(v_regs, &tsk->thread.vr_state,
> >  				      33 * sizeof(vector128));
> > @@ -124,17 +140,10 @@ static long setup_sigcontext(struct sigcontext __=
user *sc,
> >  	/* We always copy to/from vrsave, it's 0 if we don't have or don't
> >  	 * use altivec.
> >  	 */
> > -	vrsave =3D 0;
> > -	if (cpu_has_feature(CPU_FTR_ALTIVEC)) {
> > -		vrsave =3D mfspr(SPRN_VRSAVE);
> > -		tsk->thread.vrsave =3D vrsave;
> > -	}
> > -
> > -	err |=3D __put_user(vrsave, (u32 __user *)&v_regs[33]);
> > +	err |=3D __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
>
> Previously, if !cpu_has_feature(ALTIVEC), v_regs[33] had vrsave stored,
> which was set to 0 explicitly. Now we store thread.vrsave instead of the
> local vrsave. That should be safe - it is initalised to 0 elsewhere.
>
> So you don't have to do anything here, this is just letting you know
> that we checked it and thought about it.

Thanks! I thought about adding a comment/note here as I had to convince
myself that thread.vrsave is indeed initialized to 0 before making this
change as well. I will mention it in the word-smithed commit message for
posterity.

>
> >  #else /* CONFIG_ALTIVEC */
> >  	err |=3D __put_user(0, &sc->v_regs);
> >  #endif /* CONFIG_ALTIVEC */
> > -	flush_fp_to_thread(tsk);
> >  	/* copy fpr regs and fpscr */
> >  	err |=3D copy_fpr_to_user(&sc->fp_regs, tsk);
> > =20
> > @@ -150,7 +159,6 @@ static long setup_sigcontext(struct sigcontext __us=
er *sc,
> >  	 * VMX data.
> >  	 */
> >  	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
> > -		flush_vsx_to_thread(tsk);
> >  		v_regs +=3D ELF_NVRREG;
> >  		err |=3D copy_vsx_to_user(v_regs, tsk);
> >  		/* set MSR_VSX in the MSR value in the frame to
> > @@ -655,6 +663,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user=
 *, old_ctx,
> >  		ctx_has_vsx_region =3D 1;
> > =20
> >  	if (old_ctx !=3D NULL) {
> > +		prepare_setup_sigcontext(current, ctx_has_vsx_region);
> >  		if (!access_ok(old_ctx, ctx_size)
> >  		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
> >  					ctx_has_vsx_region)
>
> I had a think about whether there was a problem with bubbling
> prepare_setup_sigcontext over the access_ok() test, but given that
> prepare_setup_sigcontext(current ...) doesn't access any of old_ctx, I'm
> satisfied that it's OK - no changes needed.

Not sure I understand what you mean by 'bubbling over'?

>
>
> > @@ -842,6 +851,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
> >  #endif
> >  	{
> >  		err |=3D __put_user(0, &frame->uc.uc_link);
> > +		prepare_setup_sigcontext(tsk, 1);
>
> Why do we call with ctx_has_vsx_region =3D 1 here? It's not immediately
> clear to me why this is correct, but mpe and Mikey seem pretty convinced
> that it is.

I think it's because we always have a "complete" sigcontext w/ the VSX
save area here, unlike in swapcontext where we have to check. Also, the
following unsafe_setup_sigcontext() is called with ctx_has_vsx_region=3D1
so assumes that the VSX data was copied by prepare_setup_sigcontext().

>
> >  		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> >  					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> >  					1);
>
>
> Finally, it's a bit hard to figure out where to put this, but we spent
> some time making sure that the various things you moved into the
> prepare_setup_sigcontext() function were called under the same
> circumstances as they were before, and there were no concerns there.

Thanks for reviewing and double checking my work :)

>
> Kind regards,
> Daniel

