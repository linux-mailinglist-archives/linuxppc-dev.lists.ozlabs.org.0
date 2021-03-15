Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4010733B4C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzczS27FHz2yxX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:42:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzcz61KrJz2yR5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:41:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dzcyt5Cddz9tyS0;
 Mon, 15 Mar 2021 14:41:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Is9oE9-b_fHN; Mon, 15 Mar 2021 14:41:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dzcyt3TQgz9tyRx;
 Mon, 15 Mar 2021 14:41:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC59C8B776;
 Mon, 15 Mar 2021 14:41:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IigNPlIQnF_L; Mon, 15 Mar 2021 14:41:47 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CB6A8B779;
 Mon, 15 Mar 2021 14:41:47 +0100 (CET)
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2d68d9ad-c3a2-2372-a5b2-1a1e3fdb41e4@csgroup.eu>
Date: Mon, 15 Mar 2021 14:41:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20200225173541.1549955-29-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/02/2020 à 18:35, Nicholas Piggin a écrit :
> Implement the bulk of interrupt return logic in C. The asm return code
> must handle a few cases: restoring full GPRs, and emulating stack store.
> 
> The stack store emulation is significantly simplfied, rather than creating
> a new return frame and switching to that before performing the store, it
> uses the PACA to keep a scratch register around to perform thestore.
> 
> The asm return code is moved into 64e for now. The new logic has made
> allowance for 64e, but I don't have a full environment that works well
> to test it, and even booting in emulated qemu is not great for stress
> testing. 64e shouldn't be too far off working with this, given a bit
> more testing and auditing of the logic.
> 
> This is slightly faster on a POWER9 (page fault speed increases about
> 1.1%), probably due to reduced mtmsrd.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---

...

> +notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
> +{

...

> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	local_paca->tm_scratch = regs->msr;
> +#endif

Could we define a helper for that in asm/tm.h, that voids when CONFIG_PPC_TRANSACTIONAL_MEM is not 
selected ?

> +
> +	kuap_check_amr();
> +
> +	account_cpu_user_exit();
> +
> +	return ret;
> +}
> +
> +void unrecoverable_exception(struct pt_regs *regs);
> +void preempt_schedule_irq(void);
> +
> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
> +{
> +

...

> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	local_paca->tm_scratch = regs->msr;
> +#endif
> +
> +	/*
> +	 * We don't need to restore AMR on the way back to userspace for KUAP.
> +	 * The value of AMR only matters while we're in the kernel.
> +	 */
> +	kuap_restore_amr(regs);
> +
> +	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
> +		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
> +		return 1;
> +	}
> +	return 0;
> +}
> +#endif

Christophe
