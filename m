Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F6A30DC84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 15:21:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW3l43BPczF4Vh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 01:21:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW1c66HMSzF3QJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 23:45:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DW1bx1lvkz9txxD;
 Wed,  3 Feb 2021 13:45:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HjMAXj_hX0ua; Wed,  3 Feb 2021 13:45:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DW1bx0MsNz9txxB;
 Wed,  3 Feb 2021 13:45:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C76B8B7E6;
 Wed,  3 Feb 2021 13:45:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NgsdGv0kVo9P; Wed,  3 Feb 2021 13:45:02 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E2FC8B7E5;
 Wed,  3 Feb 2021 13:45:02 +0100 (CET)
Subject: Re: [PATCH v10 6/6] powerpc: Book3S 64-bit outline-only KASAN support
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20210203115946.663273-1-dja@axtens.net>
 <20210203115946.663273-7-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4b790789-052f-76de-a289-726517026efd@csgroup.eu>
Date: Wed, 3 Feb 2021 13:45:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203115946.663273-7-dja@axtens.net>
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



Le 03/02/2021 à 12:59, Daniel Axtens a écrit :
> Implement a limited form of KASAN for Book3S 64-bit machines running under
> the Radix MMU, supporting only outline mode.
> 

> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index a66f435dabbf..9a6fd603f0e7 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2157,8 +2157,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
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
> @@ -2176,17 +2176,19 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>   		 * See if this is an exception frame.
>   		 * We look for the "regshere" marker in the current frame.
>   		 */
> -		if (validate_sp(sp, tsk, STACK_INT_FRAME_SIZE)
> -		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
> +		if (validate_sp(sp, tsk, STACK_INT_FRAME_SIZE) &&
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
>   
>   			firstframe = 1;
>   		}


The above changes look like a bug fix not directly related to KASAN. Should be split out in another 
patch I think.

Christophe
