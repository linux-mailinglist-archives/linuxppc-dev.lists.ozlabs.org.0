Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9831DFDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 20:54:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgpSS4fVGz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 06:54:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.30;
 helo=mta-10-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-10-1.privateemail.com (mta-10-1.privateemail.com
 [68.65.122.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgpS65995z3cHl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 06:53:41 +1100 (AEDT)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 8AFF86007F;
 Wed, 17 Feb 2021 14:53:39 -0500 (EST)
Received: from localhost (unknown [10.20.151.207])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 5372D600FA;
 Wed, 17 Feb 2021 19:53:39 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Feb 2021 13:53:38 -0600
Message-Id: <C9C2HOCOHQZW.10KGT1IRO1GOL@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 10/10] powerpc/signal64: Use __get_user() to copy
 sigset_t
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-11-cmr@codefail.de>
 <87v9axc78z.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87v9axc78z.fsf@dja-thinkpad.axtens.net>
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

On Fri Feb 12, 2021 at 3:21 PM CST, Daniel Axtens wrote:
> "Christopher M. Riedl" <cmr@codefail.de> writes:
>
> > Usually sigset_t is exactly 8B which is a "trivial" size and does not
> > warrant using __copy_from_user(). Use __get_user() directly in
> > anticipation of future work to remove the trivial size optimizations
> > from __copy_from_user(). Calling __get_user() also results in a small
> > boost to signal handling throughput here.
>
> Modulo the comments from Christophe, this looks good to me. It seems to
> do what it says on the tin.
>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>
> Do you know if this patch is responsible for the slightly increase in
> radix performance you observed in your cover letter? The rest of the
> series shouldn't really make things faster than the no-KUAP case...

No, this patch just results in a really small improvement overall.

I looked over this again and I think the reason for the speedup is that
my implementation of unsafe_copy_from_user() in this series calls
__copy_tofrom_user() directly avoiding a barrier_nospec(). This speeds
up all the unsafe_get_from_user() calls in this version.

Skipping the barrier_nospec() like that is incorrect, but Christophe
recently sent a patch which moves barrier_nospec() into the uaccess
allowance helpers. It looks like mpe has already accepted that patch:

https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-February/223959.html

That means that my implementation of unsafe_copy_from_user() is _now_
correct _and_ faster. We do not need to call barrier_nospec() since the
precondition for the 'unsafe' routine is that we called one of the
helpers to open up a uaccess window earlier.

>
> Kind regards,
> Daniel
>
> >
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >  arch/powerpc/kernel/signal_64.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index 817b64e1e409..42fdc4a7ff72 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -97,6 +97,14 @@ static void prepare_setup_sigcontext(struct task_str=
uct *tsk, int ctx_has_vsx_re
> >  #endif /* CONFIG_VSX */
> >  }
> > =20
> > +static inline int get_user_sigset(sigset_t *dst, const sigset_t *src)
> > +{
> > +	if (sizeof(sigset_t) <=3D 8)
> > +		return __get_user(dst->sig[0], &src->sig[0]);
> > +	else
> > +		return __copy_from_user(dst, src, sizeof(sigset_t));
> > +}
> > +
> >  /*
> >   * Set up the sigcontext for the signal frame.
> >   */
> > @@ -701,8 +709,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user=
 *, old_ctx,
> >  	 * We kill the task with a SIGSEGV in this situation.
> >  	 */
> > =20
> > -	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
> > +	if (get_user_sigset(&set, &new_ctx->uc_sigmask))
> >  		do_exit(SIGSEGV);
> > +
> >  	set_current_blocked(&set);
> > =20
> >  	if (!user_read_access_begin(new_ctx, ctx_size))
> > @@ -740,8 +749,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >  	if (!access_ok(uc, sizeof(*uc)))
> >  		goto badframe;
> > =20
> > -	if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
> > +	if (get_user_sigset(&set, &uc->uc_sigmask))
> >  		goto badframe;
> > +
> >  	set_current_blocked(&set);
> > =20
> >  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > --=20
> > 2.26.1

