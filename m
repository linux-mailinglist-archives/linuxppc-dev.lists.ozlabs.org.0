Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B9396DE2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 09:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvNtD1sLxz2yXX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 17:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvNss46cdz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 17:22:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FvNsg5K2JzBDlZ;
 Tue,  1 Jun 2021 09:22:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCSf2hoQB7ao; Tue,  1 Jun 2021 09:22:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FvNsg4QcCzBDlT;
 Tue,  1 Jun 2021 09:22:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82DAF8B765;
 Tue,  1 Jun 2021 09:22:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oR-q5SgmhKex; Tue,  1 Jun 2021 09:22:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34D5D8B7AE;
 Tue,  1 Jun 2021 09:22:47 +0200 (CEST)
Subject: Re: [PATCH] powerpc: make show_stack's stack walking KASAN-safe
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com
References: <20210528074806.1311297-1-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <19442f8a-43b2-b51d-b1ad-3d27bb5fac49@csgroup.eu>
Date: Tue, 1 Jun 2021 09:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528074806.1311297-1-dja@axtens.net>
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



Le 28/05/2021 à 09:48, Daniel Axtens a écrit :
> Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
> generic code, arm64, s390 and x86 all do this for similar sorts of
> reasons: when unwinding a stack, we might touch memory that KASAN has
> marked as being out-of-bounds. In ppc64 KASAN development, I hit this
> sometimes when checking for an exception frame - because we're checking
> an arbitrary offset into the stack frame.
> 
> See commit 20955746320e ("s390/kasan: avoid false positives during stack
> unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
> frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
> Prevent KASAN false positive warnings") and commit 6e22c8366416
> ("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer").
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>   arch/powerpc/kernel/process.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 89e34aa273e2..430cf06f9406 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2151,8 +2151,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>   			break;
>   
>   		stack = (unsigned long *) sp;
> -		newsp = stack[0];
> -		ip = stack[STACK_FRAME_LR_SAVE];
> +		newsp = READ_ONCE_NOCHECK(stack[0]);
> +		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
>   		if (!firstframe || ip != lr) {
>   			printk("%s["REG"] ["REG"] %pS",
>   				loglvl, sp, ip, (void *)ip);
> @@ -2170,17 +2170,19 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>   		 * See if this is an exception frame.
>   		 * We look for the "regshere" marker in the current frame.
>   		 */
> -		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
> -		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
> +		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS) &&
> +		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) ==
> +		     STACK_FRAME_REGS_MARKER)) {
>   			struct pt_regs *regs = (struct pt_regs *)
>   				(sp + STACK_FRAME_OVERHEAD);
>   
> -			lr = regs->link;
> +			lr = READ_ONCE_NOCHECK(regs->link);
>   			printk("%s--- interrupt: %lx at %pS\n",
> -			       loglvl, regs->trap, (void *)regs->nip);
> +			       loglvl, READ_ONCE_NOCHECK(regs->trap),
> +			       (void *)READ_ONCE_NOCHECK(regs->nip));
>   			__show_regs(regs);
>   			printk("%s--- interrupt: %lx\n",
> -			       loglvl, regs->trap);
> +			       loglvl, READ_ONCE_NOCHECK(regs->trap));

Actually you read regs->trap twice now. Can you use a local var and really read it only once ?

>   
>   			firstframe = 1;
>   		}
> 
