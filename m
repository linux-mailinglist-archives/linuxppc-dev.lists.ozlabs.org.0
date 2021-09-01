Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2E3FE113
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 19:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H09pB75B7z2ypK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 03:21:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H09nl69QYz2xY7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 03:21:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H09ng6FWtz9sT9;
 Wed,  1 Sep 2021 19:21:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_N9MjJ2HeRI; Wed,  1 Sep 2021 19:21:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H09nd6w0Tz9sTJ;
 Wed,  1 Sep 2021 19:21:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6979C8B84A;
 Wed,  1 Sep 2021 19:21:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MNxsslQg7zMo; Wed,  1 Sep 2021 19:21:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A5F708B841;
 Wed,  1 Sep 2021 19:21:08 +0200 (CEST)
Subject: Re: [PATCH v2 1/2] powerpc/64s: system call scv tabort fix for
 corrupt irq soft-mask state
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210901165418.1412891-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <65ed1ac8-f4af-742a-1d2a-e5db7e71a920@csgroup.eu>
Date: Wed, 1 Sep 2021 19:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901165418.1412891-1-npiggin@gmail.com>
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
Cc: Eirik Fuller <efuller@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/09/2021 à 18:54, Nicholas Piggin a écrit :
> If a system call is made with a transaction active, the kernel
> immediately aborts it and returns. scv system calls disable irqs even
> earlier in their interrupt handler, and tabort_syscall does not fix this
> up.
> 
> This can result in irq soft-mask state being messed up on the next
> kernel entry, and crashing at BUG_ON(arch_irq_disabled_regs(regs)) in
> the kernel exit handlers, or possibly worse.
> 
> Fix this by having tabort_syscall setting irq soft-mask back to enabled
> (which requires MSR[EE] be disabled first).
> 
> Reported-by: Eirik Fuller <efuller@redhat.com>
> Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> Tested the wrong kernel before sending v1 and missed a bug, sorry.
> 
>   arch/powerpc/kernel/interrupt_64.S | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index d4212d2ff0b5..9c31d65b4851 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -428,16 +428,22 @@ RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   tabort_syscall:
>   _ASM_NOKPROBE_SYMBOL(tabort_syscall)
> -	/* Firstly we need to enable TM in the kernel */
> +	/* We need to enable TM in the kernel, and disable EE (for scv) */
>   	mfmsr	r10
>   	li	r9, 1
>   	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
> +	LOAD_REG_IMMEDIATE(r9, MSR_EE)
> +	andc	r10, r10, r9

Why not use 'rlwinm' to mask out MSR_EE ?

Something like

	rlwinm	r10, r10, 0, ~MSR_EE

>   	mtmsrd	r10, 0
>   
>   	/* tabort, this dooms the transaction, nothing else */
>   	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
>   	TABORT(R9)
>   
> +	/* scv has disabled irqs so must re-enable. sc just remains enabled */
> +	li	r9,IRQS_ENABLED
> +	stb	r9,PACAIRQSOFTMASK(r13)
> +
>   	/*
>   	 * Return directly to userspace. We have corrupted user register state,
>   	 * but userspace will never see that register state. Execution will
> 
