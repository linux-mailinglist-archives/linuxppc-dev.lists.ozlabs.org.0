Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B84212C1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNPvh3zVLz2ynk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:36:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.187.244;
 helo=10.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNPvF1CQxz2xfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:36:08 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D862821B98;
 Mon,  4 Oct 2021 15:28:54 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:28:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001f044fa8d-f551-434c-a151-573e484215db,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0d5f2dd4-ba5e-d274-93c4-932a1ace78aa@kaod.org>
Date: Mon, 4 Oct 2021 17:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/5] powerpc/64s: Fix unrecoverable MCE calling async
 handler from NMI
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20211004145642.1331214-1-npiggin@gmail.com>
 <20211004145642.1331214-6-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211004145642.1331214-6-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9ce724ac-d25a-4d53-b71d-13d884743fbe
X-Ovh-Tracer-Id: 2140898675701550045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveduhfdvkeduveevvdehgeefgfehkefghedtgfekueeiteeihfdtfeelgfdvjeejnecuffhomhgrihhnpegvgigtvghpthhiohhnshdqieegshdrshgsnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghgrnhgvshhhghhrsehlihhnuhigrdhisghmrdgtohhm
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/4/21 16:56, Nicholas Piggin wrote:
> The machine check handler is not considered NMI on 64s. The early
> handler is the true NMI handler, and then it schedules the
> machine_check_exception handler to run when interrupts are enabled.
> 
> This works fine except the case of an unrecoverable MCE, where the true
> NMI is taken when MSR[RI] is clear, it can not recover, so it calls
> machine_check_exception directly so something might be done about it.
> 
> Calling an async handler from NMI context can result in irq state and
> other things getting corrupted. This can also trigger the BUG at
>    arch/powerpc/include/asm/interrupt.h:168
>    BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));

I was hitting this problem when I rebooted a P8 tuleta system and
this series fixes it.

Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
  
> Fix this by making an _async version of the handler which is called
> in the normal case, and a NMI version that is called for unrecoverable
> interrupts.
> 
> Fixes: 2b43dd7653cc ("powerpc/64: enable MSR[EE] in irq replay pt_regs")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>> ---
>   arch/powerpc/include/asm/interrupt.h |  5 ++---
>   arch/powerpc/kernel/exceptions-64s.S |  8 +++++--
>   arch/powerpc/kernel/traps.c          | 31 ++++++++++++++++------------
>   3 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index b894b7169706..a1d238255f07 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -528,10 +528,9 @@ static __always_inline long ____##func(struct pt_regs *regs)
>   /* kernel/traps.c */
>   DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
>   #ifdef CONFIG_PPC_BOOK3S_64
> -DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception);
> -#else
> -DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
> +DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async);
>   #endif
> +DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
>   DECLARE_INTERRUPT_HANDLER(SMIException);
>   DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
>   DECLARE_INTERRUPT_HANDLER(unknown_exception);
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 024d9231f88c..eaf1f72131a1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1243,7 +1243,7 @@ EXC_COMMON_BEGIN(machine_check_common)
>   	li	r10,MSR_RI
>   	mtmsrd 	r10,1
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	bl	machine_check_exception
> +	bl	machine_check_exception_async
>   	b	interrupt_return_srr
>   
>   
> @@ -1303,7 +1303,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>   	subi	r12,r12,1
>   	sth	r12,PACA_IN_MCE(r13)
>   
> -	/* Invoke machine_check_exception to print MCE event and panic. */
> +	/*
> +	 * Invoke machine_check_exception to print MCE event and panic.
> +	 * This is the NMI version of the handler because we are called from
> +	 * the early handler which is a true NMI.
> +	 */
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	machine_check_exception
>   
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index e453b666613b..11741703d26e 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -796,24 +796,22 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
>   	 * do_exit() checks for in_interrupt() and panics in that case, so
>   	 * exit the irq/nmi before calling die.
>   	 */
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
> -		irq_exit();
> -	else
> +	if (in_nmi())
>   		nmi_exit();
> +	else
> +		irq_exit();
>   	die(str, regs, err);
>   }
>   
>   /*
> - * BOOK3S_64 does not call this handler as a non-maskable interrupt
> + * BOOK3S_64 does not usually call this handler as a non-maskable interrupt
>    * (it uses its own early real-mode handler to handle the MCE proper
>    * and then raises irq_work to call this handler when interrupts are
> - * enabled).
> + * enabled). The only time when this is not true is if the early handler
> + * is unrecoverable, then it does call this directly to try to get a
> + * message out.
>    */
> -#ifdef CONFIG_PPC_BOOK3S_64
> -DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
> -#else
> -DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
> -#endif
> +static void __machine_check_exception(struct pt_regs *regs)
>   {
>   	int recover = 0;
>   
> @@ -847,12 +845,19 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
>   	/* Must die if the interrupt is not recoverable */
>   	if (regs_is_unrecoverable(regs))
>   		die_mce("Unrecoverable Machine check", regs, SIGBUS);
> +}
>   
>   #ifdef CONFIG_PPC_BOOK3S_64
> -	return;
> -#else
> -	return 0;
> +DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async)
> +{
> +	__machine_check_exception(regs);
> +}
>   #endif
> +DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
> +{
> +	__machine_check_exception(regs);
> +
> +	return 0;
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
> 

