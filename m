Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B86FF6B5C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 07:06:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pQGY1Kk4zDqPj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 15:06:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pQDW3hpXzDq8g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 15:04:43 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6H54L2w008780;
 Wed, 17 Jul 2019 00:04:22 -0500
Message-ID: <304f0d849b9514915b2adb9627ed549a6c83c5f9.camel@kernel.crashing.org>
Subject: Re: [PATCH kernel v3] powerpc/xive: Drop deregistered irqs
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 17 Jul 2019 15:04:20 +1000
In-Reply-To: <20190717050028.85926-1-aik@ozlabs.ru>
References: <20190717050028.85926-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-17 at 15:00 +1000, Alexey Kardashevskiy wrote:
> There is a race between releasing an irq on one cpu and fetching it
> from XIVE on another cpu as there does not seem to be any locking between
> these, probably because xive_irq_chip::irq_shutdown() is supposed to
> remove the irq from all queues in the system which it does not do.
> 
> As a result, when such released irq appears in a queue, we take it
> from the queue but we do not change the current priority on that cpu and
> since there is no handler for the irq, EOI is never called and the cpu
> current priority remains elevated (7 vs. 0xff==unmasked). If another irq
> is assigned to the same cpu, then that device stops working until irq
> is moved to another cpu or the device is reset.
> 
> This adds a new ppc_md.orphan_irq callback which is called if no irq
> descriptor is found. The XIVE implementation drops the current priority
> to 0xff which effectively unmasks interrupts in a current CPU.

Better.

Now, you should proably add orphan_irq as a separate patch, and it
wouldn't hurt to make other PICs like XICS also provide it :-) They are
less likely to hit due to the absence of queuing but I suppose the
theorical race exists.

Cheers,
Ben.

> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
> Changes:
> v3:
> * added a comment above xive_orphan_irq()
> 
> v2:
> * added ppc_md.orphan_irq
> ---
>  arch/powerpc/include/asm/machdep.h |  3 +++
>  arch/powerpc/kernel/irq.c          |  9 ++++++---
>  arch/powerpc/sysdev/xive/common.c  | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
> index c43d6eca9edd..6cc14e28e89a 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -59,6 +59,9 @@ struct machdep_calls {
>  	/* Return an irq, or 0 to indicate there are none pending. */
>  	unsigned int	(*get_irq)(void);
>  
> +	/* Drops irq if it does not have a valid descriptor */
> +	void		(*orphan_irq)(unsigned int irq);
> +
>  	/* PCI stuff */
>  	/* Called after allocating resources */
>  	void		(*pcibios_fixup)(void);
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index bc68c53af67c..b4e06d05bdba 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -632,10 +632,13 @@ void __do_irq(struct pt_regs *regs)
>  	may_hard_irq_enable();
>  
>  	/* And finally process it */
> -	if (unlikely(!irq))
> +	if (unlikely(!irq)) {
>  		__this_cpu_inc(irq_stat.spurious_irqs);
> -	else
> -		generic_handle_irq(irq);
> +	} else if (generic_handle_irq(irq)) {
> +		if (ppc_md.orphan_irq)
> +			ppc_md.orphan_irq(irq);
> +		__this_cpu_inc(irq_stat.spurious_irqs);
> +	}
>  
>  	trace_irq_exit(regs);
>  
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 082c7e1c20f0..17e696b2d71b 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -283,6 +283,23 @@ static unsigned int xive_get_irq(void)
>  	return irq;
>  }
>  
> +/*
> + * Handles the case when a target CPU catches an interrupt which is being shut
> + * down on another CPU. generic_handle_irq() returns an error in such case
> + * and then the orphan_irq() handler restores the CPPR to reenable interrupts.
> + *
> + * Without orphan_irq() and valid irq_desc, there is no other way to restore
> + * the CPPR. This executes on a CPU which caught the interrupt.
> + */
> +static void xive_orphan_irq(unsigned int irq)
> +{
> +	struct xive_cpu *xc = __this_cpu_read(xive_cpu);
> +
> +	xc->cppr = 0xff;
> +	out_8(xive_tima + xive_tima_offset + TM_CPPR, 0xff);
> +	DBG_VERBOSE("orphan_irq: irq %d, adjusting CPPR to 0xff\n", irq);
> +}
> +
>  /*
>   * After EOI'ing an interrupt, we need to re-check the queue
>   * to see if another interrupt is pending since multiple
> @@ -1419,6 +1436,7 @@ bool __init xive_core_init(const struct xive_ops *ops, void __iomem *area, u32 o
>  	xive_irq_priority = max_prio;
>  
>  	ppc_md.get_irq = xive_get_irq;
> +	ppc_md.orphan_irq = xive_orphan_irq;
>  	__xive_enabled = true;
>  
>  	pr_devel("Initializing host..\n");

