Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF5318302
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 02:20:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbf2B2H1PzDwlB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 12:20:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbf0Q5S6ZzDwkM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 12:18:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11B1DS1v041156; Wed, 10 Feb 2021 20:18:40 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36mtqm82kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 20:18:40 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11B11WWR030618;
 Thu, 11 Feb 2021 01:18:39 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 36hjr9j6n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 01:18:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11B1Ic4l18153852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Feb 2021 01:18:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BA647805F;
 Thu, 11 Feb 2021 01:18:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34F827805C;
 Thu, 11 Feb 2021 01:18:38 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.85.176.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Feb 2021 01:18:38 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 0DA2FBC0B2F;
 Wed, 10 Feb 2021 17:51:42 -0600 (CST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Feb 2021 17:51:41 -0600
Message-Id: <C96964LJ0J4S.2HRQMFIJZP1IK@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 03/10] powerpc/signal64: Move non-inline functions
 out of setup_sigcontext()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-4-cmr@codefail.de>
 <87czxbdv8c.fsf@dja-thinkpad.axtens.net>
 <C95KM1QVX9G3.3HP1E2NXRPNSG@oc8246131445.ibm.com>
 <87a6sbeipz.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87a6sbeipz.fsf@dja-thinkpad.axtens.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_11:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1034 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110002
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

On Wed Feb 10, 2021 at 3:06 PM CST, Daniel Axtens wrote:
> "Christopher M. Riedl" <cmr@codefail.de> writes:
>
> > On Sun Feb 7, 2021 at 10:44 PM CST, Daniel Axtens wrote:
> >> Hi Chris,
> >>
> >> These two paragraphs are a little confusing and they seem slightly
> >> repetitive. But I get the general idea. Two specific comments below:
> >
> > Umm... yeah only one of those was supposed to be sent. I will reword
> > this for the next spin and address the comment below about how it is
> > not entirely clear that the inline functions are being moved out.
> >
> >>
> >> > There are non-inline functions which get called in setup_sigcontext(=
) to
> >> > save register state to the thread struct. Move these functions into =
a
> >> > separate prepare_setup_sigcontext() function so that
> >> > setup_sigcontext() can be refactored later into an "unsafe" version
> >> > which assumes an open uaccess window. Non-inline functions should be
> >> > avoided when uaccess is open.
> >>
> >> Why do we want to avoid non-inline functions? We came up with:
> >>
> >> - we want KUAP protection for as much of the kernel as possible: each
> >> extra bit of code run with the window open is another piece of attack
> >> surface.
> >>   =20
> >> - non-inline functions default to traceable, which means we could end
> >> up ftracing while uaccess is enabled. That's a pretty big hole in the
> >> defences that KUAP provides.
> >>
> >> I think we've also had problems with the window being opened or closed
> >> unexpectedly by various bits of code? So the less code runs in uaccess
> >> context the less likely that is to occur.
> >
> > That is my understanding as well.
> >
> >> =20
> >> > The majority of setup_sigcontext() can be refactored to execute in a=
n
> >> > "unsafe" context (uaccess window is opened) except for some non-inli=
ne
> >> > functions. Move these out into a separate prepare_setup_sigcontext()
> >> > function which must be called first and before opening up a uaccess
> >> > window. A follow-up commit converts setup_sigcontext() to be "unsafe=
".
> >>
> >> This was a bit confusing until we realise that you're moving the _call=
s_
> >> to the non-inline functions out, not the non-inline functions
> >> themselves.
> >>
> >> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> >> > ---
> >> >  arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++---------=
--
> >> >  1 file changed, 21 insertions(+), 11 deletions(-)
> >> >
> >> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/s=
ignal_64.c
> >> > index f9e4a1ac440f..b211a8ea4f6e 100644
> >> > --- a/arch/powerpc/kernel/signal_64.c
> >> > +++ b/arch/powerpc/kernel/signal_64.c
> >> > @@ -79,6 +79,24 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(st=
ruct sigcontext __user *sc)
> >> >  }
> >> >  #endif
> >> > =20
> >> > +static void prepare_setup_sigcontext(struct task_struct *tsk, int c=
tx_has_vsx_region)
> >>
> >> ctx_has_vsx_region should probably be a bool? Although setup_sigcontex=
t
> >> also has it as an int so I guess that's arguable, and maybe it's bette=
r
> >> to stick with this for constency.
> >
> > I've been told not to introduce unrelated changes in my patches before
> > so chose to keep this as an int for consistency.
>
> Seems reasonable.
>
> >
> >>
> >> > +{
> >> > +#ifdef CONFIG_ALTIVEC
> >> > +	/* save altivec registers */
> >> > +	if (tsk->thread.used_vr)
> >> > +		flush_altivec_to_thread(tsk);
> >> > +	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> >> > +		tsk->thread.vrsave =3D mfspr(SPRN_VRSAVE);
> >> > +#endif /* CONFIG_ALTIVEC */
> >> > +
> >> > +	flush_fp_to_thread(tsk);
> >> > +
> >> > +#ifdef CONFIG_VSX
> >> > +	if (tsk->thread.used_vsr && ctx_has_vsx_region)
> >> > +		flush_vsx_to_thread(tsk);
> >> > +#endif /* CONFIG_VSX */
> >>
> >> Alternatively, given that this is the only use of ctx_has_vsx_region,
> >> mpe suggested that perhaps we could drop it entirely and always
> >> flush_vsx if used_vsr. The function is only ever called with either
> >> `current` or wth ctx_has_vsx_region set to 1, so in either case I thin=
k
> >> that's safe? I'm not sure if it would have performance implications.
> >
> > I think that could work as long as we can guarantee that the context
> > passed to swapcontext will always be sufficiently sized if used_vsr,
> > which I think *has* to be the case?
>
> I think you're always guaranteed that you'll have a big enough one
> in your kernel thread, which is what you end up writing to, iiuc?

Ah yup you are correct. I confused myself with the comment in
swapcontext about the ctx_size. We call prepare_setup_sigcontext() with
current which will always have space. The ctx_size only matters on the
next call to setup_sigcontext() which ends up potentially copying the
VSX region to userspace (v_regs).

TL;DR - yes, I'll remove the ctx_has_vsx_region argument to
prepare_setup_sigcontext() with the next version. Thanks!

>
> >>
> >> Should we move this and the altivec ifdef to IS_ENABLED(CONFIG_VSX) et=
c?
> >> I'm not sure if that runs into any problems with things like 'used_vsr=
'
> >> only being defined if CONFIG_VSX is set, but I thought I'd ask.
> >
> > That's why I didn't use IS_ENABLED(CONFIG_...) here - all of these
> > field (used_vr, vrsave, used_vsr) declarations are guarded by #ifdefs :=
/
>
> Dang. Oh well.
> >
> >>
> >>
> >> > +}
> >> > +
> >> >  /*
> >> >   * Set up the sigcontext for the signal frame.
> >> >   */
> >> > @@ -97,7 +115,6 @@ static long setup_sigcontext(struct sigcontext __=
user *sc,
> >> >  	 */
> >> >  #ifdef CONFIG_ALTIVEC
> >> >  	elf_vrreg_t __user *v_regs =3D sigcontext_vmx_regs(sc);
> >> > -	unsigned long vrsave;
> >> >  #endif
> >> >  	struct pt_regs *regs =3D tsk->thread.regs;
> >> >  	unsigned long msr =3D regs->msr;
> >> > @@ -112,7 +129,6 @@ static long setup_sigcontext(struct sigcontext _=
_user *sc,
> >> > =20
> >> >  	/* save altivec registers */
> >> >  	if (tsk->thread.used_vr) {
> >> > -		flush_altivec_to_thread(tsk);
> >> >  		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
> >> >  		err |=3D __copy_to_user(v_regs, &tsk->thread.vr_state,
> >> >  				      33 * sizeof(vector128));
> >> > @@ -124,17 +140,10 @@ static long setup_sigcontext(struct sigcontext=
 __user *sc,
> >> >  	/* We always copy to/from vrsave, it's 0 if we don't have or don't
> >> >  	 * use altivec.
> >> >  	 */
> >> > -	vrsave =3D 0;
> >> > -	if (cpu_has_feature(CPU_FTR_ALTIVEC)) {
> >> > -		vrsave =3D mfspr(SPRN_VRSAVE);
> >> > -		tsk->thread.vrsave =3D vrsave;
> >> > -	}
> >> > -
> >> > -	err |=3D __put_user(vrsave, (u32 __user *)&v_regs[33]);
> >> > +	err |=3D __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33])=
;
> >>
> >> Previously, if !cpu_has_feature(ALTIVEC), v_regs[33] had vrsave stored=
,
> >> which was set to 0 explicitly. Now we store thread.vrsave instead of t=
he
> >> local vrsave. That should be safe - it is initalised to 0 elsewhere.
> >>
> >> So you don't have to do anything here, this is just letting you know
> >> that we checked it and thought about it.
> >
> > Thanks! I thought about adding a comment/note here as I had to convince
> > myself that thread.vrsave is indeed initialized to 0 before making this
> > change as well. I will mention it in the word-smithed commit message fo=
r
> > posterity.
> >
> >>
> >> >  #else /* CONFIG_ALTIVEC */
> >> >  	err |=3D __put_user(0, &sc->v_regs);
> >> >  #endif /* CONFIG_ALTIVEC */
> >> > -	flush_fp_to_thread(tsk);
> >> >  	/* copy fpr regs and fpscr */
> >> >  	err |=3D copy_fpr_to_user(&sc->fp_regs, tsk);
> >> > =20
> >> > @@ -150,7 +159,6 @@ static long setup_sigcontext(struct sigcontext _=
_user *sc,
> >> >  	 * VMX data.
> >> >  	 */
> >> >  	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
> >> > -		flush_vsx_to_thread(tsk);
> >> >  		v_regs +=3D ELF_NVRREG;
> >> >  		err |=3D copy_vsx_to_user(v_regs, tsk);
> >> >  		/* set MSR_VSX in the MSR value in the frame to
> >> > @@ -655,6 +663,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __u=
ser *, old_ctx,
> >> >  		ctx_has_vsx_region =3D 1;
> >> > =20
> >> >  	if (old_ctx !=3D NULL) {
> >> > +		prepare_setup_sigcontext(current, ctx_has_vsx_region);
> >> >  		if (!access_ok(old_ctx, ctx_size)
> >> >  		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, =
0,
> >> >  					ctx_has_vsx_region)
> >>
> >> I had a think about whether there was a problem with bubbling
> >> prepare_setup_sigcontext over the access_ok() test, but given that
> >> prepare_setup_sigcontext(current ...) doesn't access any of old_ctx, I=
'm
> >> satisfied that it's OK - no changes needed.
> >
> > Not sure I understand what you mean by 'bubbling over'?
>
>
> Yeah sorry, overly flowery language there. I mean that the accesses that
> prepare_setup_sigcontext does have moved up - like a bubble in fluid -
> from after access_ok to before access_ok.
>
> Kind regards,
> Daniel
> >>
> >>
> >> > @@ -842,6 +851,7 @@ int handle_rt_signal64(struct ksignal *ksig, sig=
set_t *set,
> >> >  #endif
> >> >  	{
> >> >  		err |=3D __put_user(0, &frame->uc.uc_link);
> >> > +		prepare_setup_sigcontext(tsk, 1);
> >>
> >> Why do we call with ctx_has_vsx_region =3D 1 here? It's not immediatel=
y
> >> clear to me why this is correct, but mpe and Mikey seem pretty convinc=
ed
> >> that it is.
> >
> > I think it's because we always have a "complete" sigcontext w/ the VSX
> > save area here, unlike in swapcontext where we have to check. Also, the
> > following unsafe_setup_sigcontext() is called with ctx_has_vsx_region=
=3D1
> > so assumes that the VSX data was copied by prepare_setup_sigcontext().
> >
> >>
> >> >  		err |=3D setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> >> >  					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> >> >  					1);
> >>
> >>
> >> Finally, it's a bit hard to figure out where to put this, but we spent
> >> some time making sure that the various things you moved into the
> >> prepare_setup_sigcontext() function were called under the same
> >> circumstances as they were before, and there were no concerns there.
> >
> > Thanks for reviewing and double checking my work :)
> >
> >>
> >> Kind regards,
> >> Daniel

