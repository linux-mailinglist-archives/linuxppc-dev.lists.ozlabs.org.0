Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CA2F14FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 14:33:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDvmt3FsZzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 00:33:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDvgX1rmCzDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 00:29:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DDvgK3jK9z9v0Ng;
 Mon, 11 Jan 2021 14:29:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0-p2zC7slQzp; Mon, 11 Jan 2021 14:29:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DDvgK2nwHz9v0NS;
 Mon, 11 Jan 2021 14:29:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D2858B79B;
 Mon, 11 Jan 2021 14:29:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1ab35YSSLX0t; Mon, 11 Jan 2021 14:29:06 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A9808B79A;
 Mon, 11 Jan 2021 14:29:06 +0100 (CET)
Subject: Re: [PATCH v3 4/8] powerpc/signal64: Remove TM ifdefery in middle of
 if/else block
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20210109032557.13831-1-cmr@codefail.de>
 <20210109032557.13831-5-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <80d49969-880f-5161-c829-cf319f94351d@csgroup.eu>
Date: Mon, 11 Jan 2021 14:29:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109032557.13831-5-cmr@codefail.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 09/01/2021 à 04:25, Christopher M. Riedl a écrit :
> Rework the messy ifdef breaking up the if-else for TM similar to
> commit f1cf4f93de2f ("powerpc/signal32: Remove ifdefery in middle of if/else").
> 
> Unlike that commit for ppc32, the ifdef can't be removed entirely since
> uc_transact in sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM.
> 
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal_64.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index b211a8ea4f6e..dd3787f67a78 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -710,9 +710,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   	struct pt_regs *regs = current_pt_regs();
>   	struct ucontext __user *uc = (struct ucontext __user *)regs->gpr[1];
>   	sigset_t set;
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	unsigned long msr;
> -#endif
>   
>   	/* Always make any pending restarted system calls return -EINTR */
>   	current->restart_block.fn = do_no_restart_syscall;
> @@ -762,10 +760,12 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   	 * restore_tm_sigcontexts.
>   	 */
>   	regs->msr &= ~MSR_TS_MASK;
> +#endif
>   
>   	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
>   		goto badframe;

This means you are doing that __get_user() even when msr is not used. That should be avoided.

>   	if (MSR_TM_ACTIVE(msr)) {
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   		/* We recheckpoint on return. */
>   		struct ucontext __user *uc_transact;
>   
> @@ -778,9 +778,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
>   		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
>   					   &uc_transact->uc_mcontext))
>   			goto badframe;
> -	} else
>   #endif
> -	{
> +	} else {
>   		/*
>   		 * Fall through, for non-TM restore
>   		 *
> @@ -818,10 +817,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	unsigned long newsp = 0;
>   	long err = 0;
>   	struct pt_regs *regs = tsk->thread.regs;
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	/* Save the thread's msr before get_tm_stackpointer() changes it */
> -	unsigned long msr = regs->msr;
> -#endif
> +	unsigned long msr __maybe_unused = regs->msr;

I don't thing __maybe_unused() is the right solution.

I think MSR_TM_ACTIVE() should be fixed instead, either by changing it into a static inline 
function, or doing something similar to 
https://github.com/linuxppc/linux/commit/05a4ab823983d9136a460b7b5e0d49ee709a6f86

>   
>   	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
>   	if (!access_ok(frame, sizeof(*frame)))
> @@ -836,8 +833,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	/* Create the ucontext.  */
>   	err |= __put_user(0, &frame->uc.uc_flags);
>   	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +
>   	if (MSR_TM_ACTIVE(msr)) {
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   		/* The ucontext_t passed to userland points to the second
>   		 * ucontext_t (for transactional state) with its uc_link ptr.
>   		 */
> @@ -847,9 +845,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   					    tsk, ksig->sig, NULL,
>   					    (unsigned long)ksig->ka.sa.sa_handler,
>   					    msr);
> -	} else
>   #endif
> -	{
> +	} else {
>   		err |= __put_user(0, &frame->uc.uc_link);
>   		prepare_setup_sigcontext(tsk, 1);
>   		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> 

Christophe
