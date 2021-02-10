Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264353171F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 22:07:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbXQd1yC7zDwjJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 08:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZU9c7GGx; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbXNy0b0vzDsVH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 08:06:07 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id u11so1894117plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 13:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=iF8+PdsshZKQ3rPVUeFLraKCKs9Kvdnv0TkAYFDYyyk=;
 b=ZU9c7GGxdQUhp8Eh7q+L5iNR7YY04EpKY+9KyAoZESLJQw6gPIWsxvFIXLgLWVe42X
 nY/pfGzxSPJmfI7bXu5uMCrZ8ZpiS7lFbgWIDIb1SDU/WbR7AeumHdYy1Ce7c7IaOa6D
 X61SRkXUWQS4iwS+9vYpdKGxjDUT549xO9Oz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=iF8+PdsshZKQ3rPVUeFLraKCKs9Kvdnv0TkAYFDYyyk=;
 b=FvZuayjxQ74eUirjfqelCRV5agv3UXM9Ht7Mgi3EKoJjJ0x/UVhIhV7AV1dfK8pv/w
 1obs5VHDOUC1zUOildUjmnquwpe09PF2DXC6XifsImSdCJEISwUsq6UbYOQMPUDeNRQ9
 vfg6X+15rMqZMWlPt1v7/vhIUIc/UcrDrbVhGJKoyYL5r/KWXmK6EAXjUuiGVuLMG26r
 2kBxyJ3LgCxYyvh4ZiVC1P6scamPLWP4DnOVd8b6qM2WCk6sVbv82dxynUz2KohsYpVg
 KOPvFQNDfrmrc9uPvLHhU0ksfYzlzNr4YJw+8Mh6fJ6KnvJ766OODPPWp3o13FTi9+ps
 NxVA==
X-Gm-Message-State: AOAM533Bjty0Q+m7lc2apW8Kp9EZgfZ9s4A08IxIEc384BhyMmMmcCSj
 oaT8UY3VXQZxzwNmEcpbk4Snvw==
X-Google-Smtp-Source: ABdhPJze4Or48v8qyyZXyKy8q5XZOjJQjyqtD3rei+31PsaOCYkvr9nTRO1WQtI0YaL3uHi6tnvs+Q==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr790022pjr.134.1612991163937; 
 Wed, 10 Feb 2021 13:06:03 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-1e64-f4c9-88ed-7e0c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:1e64:f4c9:88ed:7e0c])
 by smtp.gmail.com with ESMTPSA id j9sm3323142pgb.47.2021.02.10.13.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 13:06:03 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 03/10] powerpc/signal64: Move non-inline functions out
 of setup_sigcontext()
In-Reply-To: <C95KM1QVX9G3.3HP1E2NXRPNSG@oc8246131445.ibm.com>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-4-cmr@codefail.de>
 <87czxbdv8c.fsf@dja-thinkpad.axtens.net>
 <C95KM1QVX9G3.3HP1E2NXRPNSG@oc8246131445.ibm.com>
Date: Thu, 11 Feb 2021 08:06:00 +1100
Message-ID: <87a6sbeipz.fsf@dja-thinkpad.axtens.net>
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

"Christopher M. Riedl" <cmr@codefail.de> writes:

> On Sun Feb 7, 2021 at 10:44 PM CST, Daniel Axtens wrote:
>> Hi Chris,
>>
>> These two paragraphs are a little confusing and they seem slightly
>> repetitive. But I get the general idea. Two specific comments below:
>
> Umm... yeah only one of those was supposed to be sent. I will reword
> this for the next spin and address the comment below about how it is
> not entirely clear that the inline functions are being moved out.
>
>>
>> > There are non-inline functions which get called in setup_sigcontext() to
>> > save register state to the thread struct. Move these functions into a
>> > separate prepare_setup_sigcontext() function so that
>> > setup_sigcontext() can be refactored later into an "unsafe" version
>> > which assumes an open uaccess window. Non-inline functions should be
>> > avoided when uaccess is open.
>>
>> Why do we want to avoid non-inline functions? We came up with:
>>
>> - we want KUAP protection for as much of the kernel as possible: each
>> extra bit of code run with the window open is another piece of attack
>> surface.
>>    
>> - non-inline functions default to traceable, which means we could end
>> up ftracing while uaccess is enabled. That's a pretty big hole in the
>> defences that KUAP provides.
>>
>> I think we've also had problems with the window being opened or closed
>> unexpectedly by various bits of code? So the less code runs in uaccess
>> context the less likely that is to occur.
>
> That is my understanding as well.
>
>>  
>> > The majority of setup_sigcontext() can be refactored to execute in an
>> > "unsafe" context (uaccess window is opened) except for some non-inline
>> > functions. Move these out into a separate prepare_setup_sigcontext()
>> > function which must be called first and before opening up a uaccess
>> > window. A follow-up commit converts setup_sigcontext() to be "unsafe".
>>
>> This was a bit confusing until we realise that you're moving the _calls_
>> to the non-inline functions out, not the non-inline functions
>> themselves.
>>
>> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
>> > ---
>> >  arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++-----------
>> >  1 file changed, 21 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
>> > index f9e4a1ac440f..b211a8ea4f6e 100644
>> > --- a/arch/powerpc/kernel/signal_64.c
>> > +++ b/arch/powerpc/kernel/signal_64.c
>> > @@ -79,6 +79,24 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(struct sigcontext __user *sc)
>> >  }
>> >  #endif
>> >  
>> > +static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_region)
>>
>> ctx_has_vsx_region should probably be a bool? Although setup_sigcontext
>> also has it as an int so I guess that's arguable, and maybe it's better
>> to stick with this for constency.
>
> I've been told not to introduce unrelated changes in my patches before
> so chose to keep this as an int for consistency.

Seems reasonable.

>
>>
>> > +{
>> > +#ifdef CONFIG_ALTIVEC
>> > +	/* save altivec registers */
>> > +	if (tsk->thread.used_vr)
>> > +		flush_altivec_to_thread(tsk);
>> > +	if (cpu_has_feature(CPU_FTR_ALTIVEC))
>> > +		tsk->thread.vrsave = mfspr(SPRN_VRSAVE);
>> > +#endif /* CONFIG_ALTIVEC */
>> > +
>> > +	flush_fp_to_thread(tsk);
>> > +
>> > +#ifdef CONFIG_VSX
>> > +	if (tsk->thread.used_vsr && ctx_has_vsx_region)
>> > +		flush_vsx_to_thread(tsk);
>> > +#endif /* CONFIG_VSX */
>>
>> Alternatively, given that this is the only use of ctx_has_vsx_region,
>> mpe suggested that perhaps we could drop it entirely and always
>> flush_vsx if used_vsr. The function is only ever called with either
>> `current` or wth ctx_has_vsx_region set to 1, so in either case I think
>> that's safe? I'm not sure if it would have performance implications.
>
> I think that could work as long as we can guarantee that the context
> passed to swapcontext will always be sufficiently sized if used_vsr,
> which I think *has* to be the case?

I think you're always guaranteed that you'll have a big enough one
in your kernel thread, which is what you end up writing to, iiuc?

>>
>> Should we move this and the altivec ifdef to IS_ENABLED(CONFIG_VSX) etc?
>> I'm not sure if that runs into any problems with things like 'used_vsr'
>> only being defined if CONFIG_VSX is set, but I thought I'd ask.
>
> That's why I didn't use IS_ENABLED(CONFIG_...) here - all of these
> field (used_vr, vrsave, used_vsr) declarations are guarded by #ifdefs :/

Dang. Oh well.
>
>>
>>
>> > +}
>> > +
>> >  /*
>> >   * Set up the sigcontext for the signal frame.
>> >   */
>> > @@ -97,7 +115,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>> >  	 */
>> >  #ifdef CONFIG_ALTIVEC
>> >  	elf_vrreg_t __user *v_regs = sigcontext_vmx_regs(sc);
>> > -	unsigned long vrsave;
>> >  #endif
>> >  	struct pt_regs *regs = tsk->thread.regs;
>> >  	unsigned long msr = regs->msr;
>> > @@ -112,7 +129,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>> >  
>> >  	/* save altivec registers */
>> >  	if (tsk->thread.used_vr) {
>> > -		flush_altivec_to_thread(tsk);
>> >  		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
>> >  		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
>> >  				      33 * sizeof(vector128));
>> > @@ -124,17 +140,10 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>> >  	/* We always copy to/from vrsave, it's 0 if we don't have or don't
>> >  	 * use altivec.
>> >  	 */
>> > -	vrsave = 0;
>> > -	if (cpu_has_feature(CPU_FTR_ALTIVEC)) {
>> > -		vrsave = mfspr(SPRN_VRSAVE);
>> > -		tsk->thread.vrsave = vrsave;
>> > -	}
>> > -
>> > -	err |= __put_user(vrsave, (u32 __user *)&v_regs[33]);
>> > +	err |= __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
>>
>> Previously, if !cpu_has_feature(ALTIVEC), v_regs[33] had vrsave stored,
>> which was set to 0 explicitly. Now we store thread.vrsave instead of the
>> local vrsave. That should be safe - it is initalised to 0 elsewhere.
>>
>> So you don't have to do anything here, this is just letting you know
>> that we checked it and thought about it.
>
> Thanks! I thought about adding a comment/note here as I had to convince
> myself that thread.vrsave is indeed initialized to 0 before making this
> change as well. I will mention it in the word-smithed commit message for
> posterity.
>
>>
>> >  #else /* CONFIG_ALTIVEC */
>> >  	err |= __put_user(0, &sc->v_regs);
>> >  #endif /* CONFIG_ALTIVEC */
>> > -	flush_fp_to_thread(tsk);
>> >  	/* copy fpr regs and fpscr */
>> >  	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
>> >  
>> > @@ -150,7 +159,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>> >  	 * VMX data.
>> >  	 */
>> >  	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
>> > -		flush_vsx_to_thread(tsk);
>> >  		v_regs += ELF_NVRREG;
>> >  		err |= copy_vsx_to_user(v_regs, tsk);
>> >  		/* set MSR_VSX in the MSR value in the frame to
>> > @@ -655,6 +663,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>> >  		ctx_has_vsx_region = 1;
>> >  
>> >  	if (old_ctx != NULL) {
>> > +		prepare_setup_sigcontext(current, ctx_has_vsx_region);
>> >  		if (!access_ok(old_ctx, ctx_size)
>> >  		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
>> >  					ctx_has_vsx_region)
>>
>> I had a think about whether there was a problem with bubbling
>> prepare_setup_sigcontext over the access_ok() test, but given that
>> prepare_setup_sigcontext(current ...) doesn't access any of old_ctx, I'm
>> satisfied that it's OK - no changes needed.
>
> Not sure I understand what you mean by 'bubbling over'?


Yeah sorry, overly flowery language there. I mean that the accesses that
prepare_setup_sigcontext does have moved up - like a bubble in fluid -
from after access_ok to before access_ok.

Kind regards,
Daniel
>>
>>
>> > @@ -842,6 +851,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>> >  #endif
>> >  	{
>> >  		err |= __put_user(0, &frame->uc.uc_link);
>> > +		prepare_setup_sigcontext(tsk, 1);
>>
>> Why do we call with ctx_has_vsx_region = 1 here? It's not immediately
>> clear to me why this is correct, but mpe and Mikey seem pretty convinced
>> that it is.
>
> I think it's because we always have a "complete" sigcontext w/ the VSX
> save area here, unlike in swapcontext where we have to check. Also, the
> following unsafe_setup_sigcontext() is called with ctx_has_vsx_region=1
> so assumes that the VSX data was copied by prepare_setup_sigcontext().
>
>>
>> >  		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
>> >  					NULL, (unsigned long)ksig->ka.sa.sa_handler,
>> >  					1);
>>
>>
>> Finally, it's a bit hard to figure out where to put this, but we spent
>> some time making sure that the various things you moved into the
>> prepare_setup_sigcontext() function were called under the same
>> circumstances as they were before, and there were no concerns there.
>
> Thanks for reviewing and double checking my work :)
>
>>
>> Kind regards,
>> Daniel
