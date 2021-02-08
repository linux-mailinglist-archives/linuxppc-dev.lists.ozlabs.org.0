Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E43129DA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 05:46:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYtl41xpszDsXY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 15:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YfDJg5JA; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYtjC5LzHzDsTG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 15:44:28 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id gb24so1074957pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 20:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=YDvqL4w+xiyYuDoLoMTqkpdGpGZOV0KZLRBZPdgUdzo=;
 b=YfDJg5JAtyg0K6DR2iPyp4iy2RTXCVDxiRH2oTPfpFNUUP5afaLBPI5tC62XbkG7/F
 1PcCi34zjL3ci/lAU7Plyjr0PQ6AImkUoKG69+HhN2GZQfmPCQ7aecD29+praUskjt6W
 xnzYCHHwNPCMehpIKjUlpsknImaBevyF6oeAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YDvqL4w+xiyYuDoLoMTqkpdGpGZOV0KZLRBZPdgUdzo=;
 b=oR51kUE5PSGP5wp0Z1y7Cdlun2IbvULxqoZVtdTHD3Iii8jF9TomEMMjt5JbG64qHh
 e7QmpxKqOfbno/hf0Yc962w5bPCLNqI/GOWRak3Dnwir9fQLqElQmGYQb1rw7vk1tJCH
 sg7CraDKddFRab1qThY6PT4V2bDVsvRMuu2+pcMpcqaOMdPeJ08H8SrDOn+M3mAxChkO
 RoUDyEspM20p2ardFak+unu287jiXi6FQR+b7YTe69YcfBOMggys8ddMeVGRx1UQeG04
 vvjQNvk/Rm6+h/sNbowifbePCj2MLgafmPLks+B/mWL+B1MpQINxcSQgMW3/keXIyMKM
 JWJQ==
X-Gm-Message-State: AOAM531YUcKBkUimehv06BHGC4FmqeZHN/b/SNNCfJpc8pnX7Mrgv6+B
 s3BvnolMBI2dVkfYzd6bBl6YQw==
X-Google-Smtp-Source: ABdhPJyzjoTMr565oXKdiO5RkBsAiW742quha8NV7k9s81GjdGLQmj3mtDGeAukBsA4ZKfIblmjjIw==
X-Received: by 2002:a17:90b:17c8:: with SMTP id
 me8mr16094534pjb.197.1612759463729; 
 Sun, 07 Feb 2021 20:44:23 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-5856-8ba6-6cb5-3e81.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5856:8ba6:6cb5:3e81])
 by smtp.gmail.com with ESMTPSA id fv11sm3562309pjb.18.2021.02.07.20.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 20:44:22 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 03/10] powerpc/signal64: Move non-inline functions out
 of setup_sigcontext()
In-Reply-To: <20210203184323.20792-4-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-4-cmr@codefail.de>
Date: Mon, 08 Feb 2021 15:44:19 +1100
Message-ID: <87czxbdv8c.fsf@dja-thinkpad.axtens.net>
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

Hi Chris,

These two paragraphs are a little confusing and they seem slightly
repetitive. But I get the general idea. Two specific comments below:

> There are non-inline functions which get called in setup_sigcontext() to
> save register state to the thread struct. Move these functions into a
> separate prepare_setup_sigcontext() function so that
> setup_sigcontext() can be refactored later into an "unsafe" version
> which assumes an open uaccess window. Non-inline functions should be
> avoided when uaccess is open.

Why do we want to avoid non-inline functions? We came up with:

 - we want KUAP protection for as much of the kernel as possible: each
   extra bit of code run with the window open is another piece of attack
   surface.
   
 - non-inline functions default to traceable, which means we could end
   up ftracing while uaccess is enabled. That's a pretty big hole in the
   defences that KUAP provides.

I think we've also had problems with the window being opened or closed
unexpectedly by various bits of code? So the less code runs in uaccess
context the less likely that is to occur.
 
> The majority of setup_sigcontext() can be refactored to execute in an
> "unsafe" context (uaccess window is opened) except for some non-inline
> functions. Move these out into a separate prepare_setup_sigcontext()
> function which must be called first and before opening up a uaccess
> window. A follow-up commit converts setup_sigcontext() to be "unsafe".

This was a bit confusing until we realise that you're moving the _calls_
to the non-inline functions out, not the non-inline functions themselves.

> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index f9e4a1ac440f..b211a8ea4f6e 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -79,6 +79,24 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(struct sigcontext __user *sc)
>  }
>  #endif
>  
> +static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_region)

ctx_has_vsx_region should probably be a bool? Although setup_sigcontext
also has it as an int so I guess that's arguable, and maybe it's better
to stick with this for constency.

> +{
> +#ifdef CONFIG_ALTIVEC
> +	/* save altivec registers */
> +	if (tsk->thread.used_vr)
> +		flush_altivec_to_thread(tsk);
> +	if (cpu_has_feature(CPU_FTR_ALTIVEC))
> +		tsk->thread.vrsave = mfspr(SPRN_VRSAVE);
> +#endif /* CONFIG_ALTIVEC */
> +
> +	flush_fp_to_thread(tsk);
> +
> +#ifdef CONFIG_VSX
> +	if (tsk->thread.used_vsr && ctx_has_vsx_region)
> +		flush_vsx_to_thread(tsk);
> +#endif /* CONFIG_VSX */

Alternatively, given that this is the only use of ctx_has_vsx_region,
mpe suggested that perhaps we could drop it entirely and always
flush_vsx if used_vsr. The function is only ever called with either
`current` or wth ctx_has_vsx_region set to 1, so in either case I think
that's safe? I'm not sure if it would have performance implications.

Should we move this and the altivec ifdef to IS_ENABLED(CONFIG_VSX) etc?
I'm not sure if that runs into any problems with things like 'used_vsr'
only being defined if CONFIG_VSX is set, but I thought I'd ask.


> +}
> +
>  /*
>   * Set up the sigcontext for the signal frame.
>   */
> @@ -97,7 +115,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  	 */
>  #ifdef CONFIG_ALTIVEC
>  	elf_vrreg_t __user *v_regs = sigcontext_vmx_regs(sc);
> -	unsigned long vrsave;
>  #endif
>  	struct pt_regs *regs = tsk->thread.regs;
>  	unsigned long msr = regs->msr;
> @@ -112,7 +129,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  
>  	/* save altivec registers */
>  	if (tsk->thread.used_vr) {
> -		flush_altivec_to_thread(tsk);
>  		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
>  		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
>  				      33 * sizeof(vector128));
> @@ -124,17 +140,10 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  	/* We always copy to/from vrsave, it's 0 if we don't have or don't
>  	 * use altivec.
>  	 */
> -	vrsave = 0;
> -	if (cpu_has_feature(CPU_FTR_ALTIVEC)) {
> -		vrsave = mfspr(SPRN_VRSAVE);
> -		tsk->thread.vrsave = vrsave;
> -	}
> -
> -	err |= __put_user(vrsave, (u32 __user *)&v_regs[33]);
> +	err |= __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);

Previously, if !cpu_has_feature(ALTIVEC), v_regs[33] had vrsave stored,
which was set to 0 explicitly. Now we store thread.vrsave instead of the
local vrsave. That should be safe - it is initalised to 0 elsewhere.

So you don't have to do anything here, this is just letting you know
that we checked it and thought about it.

>  #else /* CONFIG_ALTIVEC */
>  	err |= __put_user(0, &sc->v_regs);
>  #endif /* CONFIG_ALTIVEC */
> -	flush_fp_to_thread(tsk);
>  	/* copy fpr regs and fpscr */
>  	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
>  
> @@ -150,7 +159,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>  	 * VMX data.
>  	 */
>  	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
> -		flush_vsx_to_thread(tsk);
>  		v_regs += ELF_NVRREG;
>  		err |= copy_vsx_to_user(v_regs, tsk);
>  		/* set MSR_VSX in the MSR value in the frame to
> @@ -655,6 +663,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
>  		ctx_has_vsx_region = 1;
>  
>  	if (old_ctx != NULL) {
> +		prepare_setup_sigcontext(current, ctx_has_vsx_region);
>  		if (!access_ok(old_ctx, ctx_size)
>  		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
>  					ctx_has_vsx_region)

I had a think about whether there was a problem with bubbling
prepare_setup_sigcontext over the access_ok() test, but given that
prepare_setup_sigcontext(current ...) doesn't access any of old_ctx, I'm
satisfied that it's OK - no changes needed.


> @@ -842,6 +851,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  #endif
>  	{
>  		err |= __put_user(0, &frame->uc.uc_link);
> +		prepare_setup_sigcontext(tsk, 1);

Why do we call with ctx_has_vsx_region = 1 here?  It's not immediately
clear to me why this is correct, but mpe and Mikey seem pretty convinced
that it is.

>  		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
>  					NULL, (unsigned long)ksig->ka.sa.sa_handler,
>  					1);


Finally, it's a bit hard to figure out where to put this, but we spent
some time making sure that the various things you moved into the
prepare_setup_sigcontext() function were called under the same
circumstances as they were before, and there were no concerns there.

Kind regards,
Daniel
