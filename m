Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0552906C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 16:05:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCSb72ZPMzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 01:05:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCSTl4ZRTzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 01:00:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCSTd10fJz9vCy3;
 Fri, 16 Oct 2020 16:00:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6RaeYaQdiGD7; Fri, 16 Oct 2020 16:00:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCSTd07kCz9vCy2;
 Fri, 16 Oct 2020 16:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 84A398B84F;
 Fri, 16 Oct 2020 16:00:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NOi16LFEapLX; Fri, 16 Oct 2020 16:00:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E2EC8B83E;
 Fri, 16 Oct 2020 16:00:22 +0200 (CEST)
Subject: Re: [PATCH 7/8] powerpc/signal64: Rewrite handle_rt_signal64() to
 minimise uaccess switches
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-8-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1cedcf43-4594-5db1-d248-7c06a572aecc@csgroup.eu>
Date: Fri, 16 Oct 2020 16:00:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015150159.28933-8-cmr@codefail.de>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/10/2020 à 17:01, Christopher M. Riedl a écrit :
> From: Daniel Axtens <dja@axtens.net>
> 
> Add uaccess blocks and use the 'unsafe' versions of functions doing user
> access where possible to reduce the number of times uaccess has to be
> opened/closed.
> 
> There is no 'unsafe' version of copy_siginfo_to_user, so move it
> slightly to allow for a "longer" uaccess block.
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal_64.c | 54 ++++++++++++++++-----------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 6d4f7a5c4fbf..3b97e3681a8f 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -843,46 +843,42 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	/* Save the thread's msr before get_tm_stackpointer() changes it */
>   	unsigned long msr = regs->msr;
>   #endif
> -
>   	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
> -	if (!access_ok(frame, sizeof(*frame)))
> +	if (!user_write_access_begin(frame, sizeof(*frame)))
>   		goto badframe;
>   
> -	err |= __put_user(&frame->info, &frame->pinfo);
> -	err |= __put_user(&frame->uc, &frame->puc);
> -	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
> -	if (err)
> -		goto badframe;
> +	unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
> +	unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
>   
>   	/* Create the ucontext.  */
> -	err |= __put_user(0, &frame->uc.uc_flags);
> -	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
> +	unsafe_put_user(0, &frame->uc.uc_flags, badframe_block);
> +	unsafe_save_altstack(&frame->uc.uc_stack, regs->gpr[1], badframe_block);
> +
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	if (MSR_TM_ACTIVE(msr)) {
>   		/* The ucontext_t passed to userland points to the second
>   		 * ucontext_t (for transactional state) with its uc_link ptr.
>   		 */
> -		err |= __put_user(&frame->uc_transact, &frame->uc.uc_link);
> +		unsafe_put_user(&frame->uc_transact, &frame->uc.uc_link, badframe_block);
> +		user_write_access_end();

Whaou. Doing this inside an #ifdef sequence is dirty.
Can you reorganise code to avoid that and to avoid nesting #ifdef/#endif and the if/else as I did in 
signal32 ?

>   		err |= setup_tm_sigcontexts(&frame->uc.uc_mcontext,
>   					    &frame->uc_transact.uc_mcontext,
>   					    tsk, ksig->sig, NULL,
>   					    (unsigned long)ksig->ka.sa.sa_handler,
>   					    msr);
> +		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> +			goto badframe;
> +
>   	} else
>   #endif
>   	{
> -		err |= __put_user(0, &frame->uc.uc_link);
> -
> -		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> -			return -EFAULT;
> -		err |= __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
> -						ksig->sig, NULL,
> -						(unsigned long)ksig->ka.sa.sa_handler, 1);
> -		user_write_access_end();
> +		unsafe_put_user(0, &frame->uc.uc_link, badframe_block);
> +		unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
> +					NULL, (unsigned long)ksig->ka.sa.sa_handler,
> +					1, badframe_block);
>   	}
> -	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
> -	if (err)
> -		goto badframe;
> +
> +	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
>   
>   	/* Make sure signal handler doesn't get spurious FP exceptions */
>   	tsk->thread.fp_state.fpscr = 0;
> @@ -891,15 +887,17 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
>   		regs->nip = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
>   	} else {
> -		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> -			return -EFAULT;
> -		err |= __unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
> -		user_write_access_end();
> -		if (err)
> -			goto badframe;
> +		unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0],
> +					badframe_block);
>   		regs->nip = (unsigned long) &frame->tramp[0];
>   	}
>   
> +	user_write_access_end();
> +
> +	/* Save the siginfo outside of the unsafe block. */
> +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> +		goto badframe;
> +
>   	/* Allocate a dummy caller frame for the signal handler. */
>   	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
>   	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
> @@ -939,6 +937,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   
>   	return 0;
>   
> +badframe_block:
> +	user_write_access_end();
>   badframe:
>   	signal_fault(current, regs, "handle_rt_signal64", frame);
>   
> 


Christophe
