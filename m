Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362E319983
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 06:23:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcMMm01F4zDwxw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 16:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=iJQGMl5e; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcML91p54zDwtZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 16:21:34 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id 18so5142637pfz.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 21:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=KHEeofl9MAtSzGXNGFyRQXcPpYDdCmHCK0u/YNzZCtQ=;
 b=iJQGMl5enVYmY9JDnsLriVxrRIxGY3uUx5EXxifRnXr7k1JvK/icj/zpw4TZiZCw0/
 Pyjoi4wjAlWcSI+NH1OlEWggWQhYj0sFEwTwVaU/ZJxor+mH5T3/QsrrC7R+j8bF+urr
 CjjqpS7/CXmpM0b3PhUKXlysDr1K5jfRKcoIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KHEeofl9MAtSzGXNGFyRQXcPpYDdCmHCK0u/YNzZCtQ=;
 b=G05WWq+xDiHhY0WdsqGdVJxKaCqHFxp1OxC78NM/z+t2m3qb709/1dM/seLigUGHP4
 s+kfQuPl4bmar2iPC5eWxM6AurS2wflt2th8gF2jlCzzCjnxaji8ArW1WMxs5VdUiFqS
 ODV2CjcwZMZ3cNHYPxf5cH7J4wHdm9UMYGtMReg2XC9Yea+afjelDcS6PEXjhgOMSC+0
 YiA1zjpy2QFOWf2HfOvSzNCq3iFyPHBYnjNxlCHupez3/5Je/cvMSwNUkfEy/uMhNxYy
 /jFmF/6wAq0wkFuLNQ+PS0wOm6vAnCa8i03tOaHqjVMyS9nUP3ylmYrpQ09NaFUGjGYT
 IBEg==
X-Gm-Message-State: AOAM530yI0C/meA6ejihpUkJWY5lrFrHZbxghAvvbrJlPD31m/c0PRSb
 lAGRuthDrmE0R6n2QUicSGEqrQ==
X-Google-Smtp-Source: ABdhPJwt2OpTTTqITpQcp0GAkh9gxoFzkdFqAGMhGqrZm9Mzj3ukbT8DWF/3pVnjTUqvTra12VZImQ==
X-Received: by 2002:a63:884a:: with SMTP id l71mr1560526pgd.75.1613107292070; 
 Thu, 11 Feb 2021 21:21:32 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-f9db-27eb-79e2-afa8.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:f9db:27eb:79e2:afa8])
 by smtp.gmail.com with ESMTPSA id c84sm7452917pfb.16.2021.02.11.21.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 21:21:31 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 05/10] powerpc/signal64: Remove TM ifdefery in middle
 of if/else block
In-Reply-To: <20210203184323.20792-6-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-6-cmr@codefail.de>
Date: Fri, 12 Feb 2021 16:21:28 +1100
Message-ID: <874kiheu93.fsf@dja-thinkpad.axtens.net>
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

> Rework the messy ifdef breaking up the if-else for TM similar to
> commit f1cf4f93de2f ("powerpc/signal32: Remove ifdefery in middle of if/else").

I'm not sure what 'the messy ifdef' and 'the if-else for TM' is (yet):
perhaps you could start the commit message with a tiny bit of
background.

> Unlike that commit for ppc32, the ifdef can't be removed entirely since
> uc_transact in sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM.
>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal_64.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index b211a8ea4f6e..8e1d804ce552 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -710,9 +710,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	struct pt_regs *regs = current_pt_regs();
>  	struct ucontext __user *uc = (struct ucontext __user *)regs->gpr[1];
>  	sigset_t set;
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	unsigned long msr;
> -#endif
>  
>  	/* Always make any pending restarted system calls return -EINTR */
>  	current->restart_block.fn = do_no_restart_syscall;
> @@ -765,7 +763,10 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  
>  	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
>  		goto badframe;
> +#endif
> +
>  	if (MSR_TM_ACTIVE(msr)) {
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  		/* We recheckpoint on return. */
>  		struct ucontext __user *uc_transact;
>  
> @@ -778,9 +779,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
>  					   &uc_transact->uc_mcontext))
>  			goto badframe;
> -	} else
>  #endif
> -	{
> +	} else {
>  		/*
>  		 * Fall through, for non-TM restore
>  		 *

I think you can get rid of all the ifdefs in _this function_ by
providing a couple of stubs:

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a66f435dabbf..19059a4b798f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1120,6 +1120,7 @@ void restore_tm_state(struct pt_regs *regs)
 #else
 #define tm_recheckpoint_new_task(new)
 #define __switch_to_tm(prev, new)
+void tm_reclaim_current(uint8_t cause) {}
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 static inline void save_sprs(struct thread_struct *t)
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 8e1d804ce552..ed58ca019ad9 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -594,6 +594,13 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 
 	return err;
 }
+#else
+static long restore_tm_sigcontexts(struct task_struct *tsk,
+				   struct sigcontext __user *sc,
+				   struct sigcontext __user *tm_sc)
+{
+	return -EINVAL;
+}
 #endif
 
 /*
@@ -722,7 +729,6 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		goto badframe;
 	set_current_blocked(&set);
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/*
 	 * If there is a transactional state then throw it away.
 	 * The purpose of a sigreturn is to destroy all traces of the
@@ -763,10 +769,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 
 	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
 		goto badframe;
-#endif
 
 	if (MSR_TM_ACTIVE(msr)) {
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* We recheckpoint on return. */
 		struct ucontext __user *uc_transact;
 
@@ -779,7 +783,6 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
-#endif
 	} else {
 		/*
 		 * Fall through, for non-TM restore

My only concern here was whether it was valid to access
 	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
if CONFIG_PPC_TRANSACTIONAL_MEM was not defined, but I didn't think of
any obvious reason why it wouldn't be...

> @@ -818,10 +818,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  	unsigned long newsp = 0;
>  	long err = 0;
>  	struct pt_regs *regs = tsk->thread.regs;
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	/* Save the thread's msr before get_tm_stackpointer() changes it */
>  	unsigned long msr = regs->msr;
> -#endif

I wondered if that comment still makes sense in the absence of the
ifdef. It is preserved in commit f1cf4f93de2f ("powerpc/signal32: Remove
ifdefery in middle of if/else"), and I can't figure out how you would
improve it, so I guess it's probably good as it is.

>  	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
>  	if (!access_ok(frame, sizeof(*frame)))
> @@ -836,8 +834,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  	/* Create the ucontext.  */
>  	err |= __put_user(0, &frame->uc.uc_flags);
>  	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +
>  	if (MSR_TM_ACTIVE(msr)) {
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  		/* The ucontext_t passed to userland points to the second
>  		 * ucontext_t (for transactional state) with its uc_link ptr.
>  		 */
> @@ -847,9 +846,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  					    tsk, ksig->sig, NULL,
>  					    (unsigned long)ksig->ka.sa.sa_handler,
>  					    msr);
> -	} else
>  #endif
> -	{
> +	} else {
>  		err |= __put_user(0, &frame->uc.uc_link);
>  		prepare_setup_sigcontext(tsk, 1);
>  		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,

That seems reasonable to me.

Kind regards,
Daniel

