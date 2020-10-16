Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2F2906B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 15:59:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCSS25k8NzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 00:58:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCSNq4qhSzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 00:56:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CCSNg0BPBz9vCy3;
 Fri, 16 Oct 2020 15:56:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id scuPDRjZ333A; Fri, 16 Oct 2020 15:56:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CCSNf6KJ1z9vCxn;
 Fri, 16 Oct 2020 15:56:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ADC08B84E;
 Fri, 16 Oct 2020 15:56:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gglr_eqA25I8; Fri, 16 Oct 2020 15:56:04 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DB678B83E;
 Fri, 16 Oct 2020 15:56:04 +0200 (CEST)
Subject: Re: [PATCH 6/8] powerpc/signal64: Replace setup_trampoline() w/
 unsafe_setup_trampoline()
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-7-cmr@codefail.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c447ee06-a581-1f5f-42c7-814a1f570fe0@csgroup.eu>
Date: Fri, 16 Oct 2020 15:56:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015150159.28933-7-cmr@codefail.de>
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
> Previously setup_trampoline() performed a costly KUAP switch on every
> uaccess operation. These repeated uaccess switches cause a significant
> drop in signal handling performance.
> 
> Rewrite setup_trampoline() to assume that a userspace write access
> window is open. Replace all uaccess functions with their 'unsafe'
> versions to avoid the repeated uaccess switches.
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>   arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++-------------
>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index bd92064e5576..6d4f7a5c4fbf 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -600,30 +600,33 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
>   /*
>    * Setup the trampoline code on the stack
>    */
> -static long setup_trampoline(unsigned int syscall, unsigned int __user *tramp)
> +#define unsafe_setup_trampoline(syscall, tramp, e) \
> +	unsafe_op_wrap(__unsafe_setup_trampoline(syscall, tramp), e)
> +static long notrace __unsafe_setup_trampoline(unsigned int syscall,
> +					unsigned int __user *tramp)
>   {
>   	int i;
> -	long err = 0;
>   
>   	/* bctrl # call the handler */
> -	err |= __put_user(PPC_INST_BCTRL, &tramp[0]);
> +	unsafe_put_user(PPC_INST_BCTRL, &tramp[0], err);
>   	/* addi r1, r1, __SIGNAL_FRAMESIZE  # Pop the dummy stackframe */
> -	err |= __put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
> -			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1]);
> +	unsafe_put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
> +			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1], err);
>   	/* li r0, __NR_[rt_]sigreturn| */
> -	err |= __put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2]);
> +	unsafe_put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2], err);
>   	/* sc */
> -	err |= __put_user(PPC_INST_SC, &tramp[3]);
> +	unsafe_put_user(PPC_INST_SC, &tramp[3], err);
>   
>   	/* Minimal traceback info */
>   	for (i=TRAMP_TRACEBACK; i < TRAMP_SIZE ;i++)
> -		err |= __put_user(0, &tramp[i]);
> +		unsafe_put_user(0, &tramp[i], err);
>   
> -	if (!err)
> -		flush_icache_range((unsigned long) &tramp[0],
> -			   (unsigned long) &tramp[TRAMP_SIZE]);
> +	flush_icache_range((unsigned long)&tramp[0],
> +			   (unsigned long)&tramp[TRAMP_SIZE]);

This flush should be done outside the user_write_access block.

>   
> -	return err;
> +	return 0;
> +err:
> +	return 1;
>   }
>   
>   /*
> @@ -888,7 +891,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
>   		regs->nip = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
>   	} else {
> -		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
> +		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> +			return -EFAULT;
> +		err |= __unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
> +		user_write_access_end();
>   		if (err)
>   			goto badframe;
>   		regs->nip = (unsigned long) &frame->tramp[0];
> 

Christophe
