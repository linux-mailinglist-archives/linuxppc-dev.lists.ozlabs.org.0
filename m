Return-Path: <linuxppc-dev+bounces-1726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EB98D0DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 12:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJVsl5g6Wz2yQG;
	Wed,  2 Oct 2024 20:09:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727863786;
	cv=none; b=gFcWmv/DGsmvaLUFYJ9cl71hHm84z+vU0SBlcUzZXX66hLjLSeMjlZj4XiuK1bRZ9vFiMGrr6Y1+Hl5IM9hlvLJ6dj2osZ+VjctN/kfoIgQET1D3s/N7HwGfTo1Ggq2MdkYS+7E5IwUNOEBKhoPsHszgVFqMmPS9BENMfNWXYml/TWczwPEnX6DIQWdalHNa6V7n1S50eUJ0qO2dBIQyl/4xnlZC9fKdx/NQbrQDbPdxV5Kr0twCIqi76t51sorPVT5j3vZaSPWlwhEpCYbBby3yY2knnGilGAOKcvP4XUKLqvP6fTCXFmBp76MEkQAC0Ch5rTwESivsJLFJmX9b4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727863786; c=relaxed/relaxed;
	bh=mb59KJjSNfWC20EAWGOc9Up2meyWMry61XLe9mm8SOA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f2/I0CodPCjMQnkV2vdf1JnjVqMQHCH2WOcf0oJfqjDMBIMf6GXLSJEHvMP4yEW30RaTpAtPzYWCiI9/EtfxDzoxYmZnGpghlKynsD6UYY5L5/f1htl1lWhMcP7jaiuFwRJBdeIJR9RZ5zEM7IN02dYQqfPaWKRmkxTNqw7FYOoo6LXXVQNOF3yot8LX/ugEdLymhG7Jycbt2AHKPw4OadJd6hJFf3L2+zlcMGW4pndJmE/FBrUtx23MUHN7kcfv8s8p5d2h3L/xNZqu5BntljcFU18yHMENEimiDqir5xMeEi+Wwdi0kLsltj3Ghezpboppk3Qc0aW50dBYlUBLOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b26alOTI; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fA9Mcmqw; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b26alOTI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fA9Mcmqw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJVsk1hZ8z2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 20:09:46 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727863778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mb59KJjSNfWC20EAWGOc9Up2meyWMry61XLe9mm8SOA=;
	b=b26alOTIwPE5WQO32GirhS4TLbLM6kdt4huW1uEKHWHg9REQ6vZVCPRpVuK+f0pQDmamCH
	Lg4WAgXV/D9nzTHeP7fVXL2qUxgnrR2EstRe+oPdc3RsC7px9oJ80Ny0UG4F9kRLyYVjxx
	mxRyuOcw7k+jIYgfANjqLbtcaoXnB//Fgakt/3JJ02yp0O60r3FO9QeF9wdN0p4EmqJZrR
	itmId45Crqo8YFSybbpl/qvNb5YR4Wnl4e1x9GedI0QHoCV9dMsWo4jl09TsDW4uH2W/rz
	6blpbcma4rsw+YpKUvjy/NH8r7vJJShlxRbTzNLfhyHEYW9QjswS1z5smu+yRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727863778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mb59KJjSNfWC20EAWGOc9Up2meyWMry61XLe9mm8SOA=;
	b=fA9McmqwiGJ2Uze93z7x2HZAlLxru5KvfJP6wS+2KS+YLtwYcvd0qpbxmQ2Rfx9rHbrjPO
	MHvcSHCeSlTUSIBg==
To: Costa Shulyupin <costa.shul@redhat.com>, longman@redhat.com,
 ming.lei@redhat.com, pauld@redhat.com, juri.lelli@redhat.com,
 vschneid@redhat.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Zefan Li
 <lizefan.x@bytedance.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner
 <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
 Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Costa Shulyupin <costa.shul@redhat.com>, Bjorn
 Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] genirq/cpuhotplug: Adjust managed irqs
 according to change of housekeeping CPU
In-Reply-To: <20240916122044.3056787-3-costa.shul@redhat.com>
References: <20240916122044.3056787-1-costa.shul@redhat.com>
 <20240916122044.3056787-3-costa.shul@redhat.com>
Date: Wed, 02 Oct 2024 12:09:38 +0200
Message-ID: <87h69uyfx9.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 16 2024 at 15:20, Costa Shulyupin wrote:

> Interrupts disturb real-time tasks on affined cpus.
> To ensure CPU isolation for real-time tasks, interrupt handling must
> be adjusted accordingly.
> Non-managed interrupts can be configured from userspace,
> while managed interrupts require adjustments in kernelspace.
>
> Adjust status of managed interrupts according change
> of housekeeping CPUs to support dynamic CPU isolation.

What means 'adjust status' ?

> +
> +/*
> + * managed_irq_isolate() - Deactivate managed interrupts if necessary
> + */
> +// derived from migrate_one_irq, irq_needs_fixup, irq_fixup_move_pending

If at all then this needs to be integrated with migrate_one_irq()

> +static int managed_irq_isolate(struct irq_desc *desc)
> +{
> +	struct irq_data *d = irq_desc_get_irq_data(desc);
> +	struct irq_chip *chip = irq_data_get_irq_chip(d);
> +	const struct cpumask *a;
> +	bool maskchip;
> +	int err;
> +
> +	/*
> +	 * Deactivate if:
> +	 * - Interrupt is managed
> +	 * - Interrupt is not per cpu
> +	 * - Interrupt is started
> +	 * - Effective affinity mask includes isolated CPUs
> +	 */
> +	if (!irqd_affinity_is_managed(d) || irqd_is_per_cpu(d) || !irqd_is_started(d)
> +	    || cpumask_subset(irq_data_get_effective_affinity_mask(d),
> +			      housekeeping_cpumask(HK_TYPE_MANAGED_IRQ)))
> +		return 0;
> +	// TBD: it is required?
> +	/*
> +	 * Complete an eventually pending irq move cleanup. If this
> +	 * interrupt was moved in hard irq context, then the vectors need
> +	 * to be cleaned up. It can't wait until this interrupt actually
> +	 * happens and this CPU was involved.
> +	 */
> +	irq_force_complete_move(desc);
> +
> +	if (irqd_is_setaffinity_pending(d)) {
> +		irqd_clr_move_pending(d);
> +		if (cpumask_intersects(desc->pending_mask,
> +		    housekeeping_cpumask(HK_TYPE_MANAGED_IRQ)))
> +			a = irq_desc_get_pending_mask(desc);
> +	} else {
> +		a = irq_data_get_affinity_mask(d);
> +	}
> +
> +	maskchip = chip->irq_mask && !irq_can_move_pcntxt(d) && !irqd_irq_masked(d);
> +	if (maskchip)
> +		chip->irq_mask(d);
> +
> +	if (!cpumask_intersects(a, housekeeping_cpumask(HK_TYPE_MANAGED_IRQ))) {
> +		/*
> +		 * Shut managed interrupt down and leave the affinity untouched.
> +		 * The effective affinity is reset to the first online CPU.
> +		 */
> +		irqd_set_managed_shutdown(d);
> +		irq_shutdown_and_deactivate(desc);
> +		return 0;

Seriously? The interrupt is active and the queue might have outstanding
requests which will never complete because the interrupt is taken away.

On CPU hotplug the related subsystem has shut down the device queue and
drained all outstanding requests. But none of this happens here.

> +	}
> +
> +	/*
> +	 * Do not set the force argument of irq_do_set_affinity() as this
> +	 * disables the masking of offline CPUs from the supplied affinity
> +	 * mask and therefore might keep/reassign the irq to the outgoing
> +	 * CPU.

Which outgoing CPU?

> +	 */
> +	err = irq_do_set_affinity(d, a, false);
> +	if (err)
> +		pr_warn_ratelimited("IRQ%u: set affinity failed(%d).\n",
> +				    d->irq, err);
> +
> +	if (maskchip)
> +		chip->irq_unmask(d);
> +
> +	return err;
> +}
> +
> +/** managed_irq_affinity_adjust() - Deactivate of restore managed interrupts
> + * according to change of housekeeping cpumask.
> + *
> + * @enable_mask:	CPUs for which interrupts should be restored
> + */
> +int managed_irq_affinity_adjust(struct cpumask *enable_mask)
> +{
> +	unsigned int irq;
> +
> +	for_each_active_irq(irq) {

What ensures that this iteration is safe?

> +		struct irq_desc *desc = irq_to_desc(irq);

And that the descriptor is valid?

> +		unsigned int cpu;
> +
> +		for_each_cpu(cpu, enable_mask)
> +			irq_restore_affinity_of_irq(desc, cpu);

And what protects irq_restore_affinity_of_irq() against other operations
on @desc?

> +		raw_spin_lock(&desc->lock);

What disables interrupts here in the runtime case?

> +		managed_irq_isolate(desc);
> +		raw_spin_unlock(&desc->lock);
> +	}
> +
> +	return 0;

That return value has which purpose?

None of this can work at runtime.

Thanks,

        tglx

