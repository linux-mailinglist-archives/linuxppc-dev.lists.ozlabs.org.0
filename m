Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B051E0E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 23:13:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw3FG0STcz3cFR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 07:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oyF7PEmP;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9ITl2ylm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=oyF7PEmP; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=9ITl2ylm; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw3Dd3YYyz3bs0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 07:12:33 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651871541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OR1pmM4x5cpd2mA4k9e/aWIlSPAQ7vdjsY8tgTejLzI=;
 b=oyF7PEmPteS/Ij/pjSpG2vUJ+F9MWnjT60Q7Em5LJxgEcgdV2Keo97S3wPx7/J5E+txgUk
 JCojiqTYydfRy2QOfNub+Z6GCtf5iqJ95IrYyVrXU94wRA891K8qGTKu4kMrONDEj3t2xI
 wCxkleNZMeXe1/LgpV4XvplOoKFaZn2h2Dl1FzoVtMKW2jBHJlfhIWbjQPIGNfO2Pi7uAj
 DKSr6s0Xz47aEJt6wfPtWXi8IsfQLaSxpHv37/gGewZf4jpFxR8Ho2GkHDTqeBU4A8ImgG
 SYlksuHxEF3mZZSNUbvq7CwBHaeStS+M10UHzWT6KuBuUylRXxV8qYgVGLXNuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651871541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OR1pmM4x5cpd2mA4k9e/aWIlSPAQ7vdjsY8tgTejLzI=;
 b=9ITl2ylmsUv+bZnup01fSsbtCNbIJHb2Vl+xV5ebZckGAGMVOE04FOZX36z7AudwqlokLy
 CoePs/joVdcnuxDw==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 05/29] x86/apic/vector: Do not allocate vectors for NMIs
In-Reply-To: <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-6-ricardo.neri-calderon@linux.intel.com>
Date: Fri, 06 May 2022 23:12:20 +0200
Message-ID: <87zgjufjrf.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05 2022 at 16:59, Ricardo Neri wrote:
> Vectors are meaningless when allocating IRQs with NMI as the delivery
> mode.

Vectors are not meaningless. NMI has a fixed vector.

The point is that for a fixed vector there is no vector management
required.

Can you spot the difference?

> In such case, skip the reservation of IRQ vectors. Do it in the lowest-
> level functions where the actual IRQ reservation takes place.
>
> Since NMIs target specific CPUs, keep the functionality to find the best
> CPU.

Again. What for?
  
> +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
> +		cpu = irq_matrix_find_best_cpu(vector_matrix, dest);
> +		apicd->cpu = cpu;
> +		vector = 0;
> +		goto no_vector;
> +	}

Why would a NMI ever end up in this code? There is no vector management
required and this find cpu exercise is pointless.

>  	vector = irq_matrix_alloc(vector_matrix, dest, resvd, &cpu);
>  	trace_vector_alloc(irqd->irq, vector, resvd, vector);
>  	if (vector < 0)
>  		return vector;
>  	apic_update_vector(irqd, vector, cpu);
> +
> +no_vector:
>  	apic_update_irq_cfg(irqd, vector, cpu);
>  
>  	return 0;
> @@ -321,12 +330,22 @@ assign_managed_vector(struct irq_data *irqd, const struct cpumask *dest)
>  	/* set_affinity might call here for nothing */
>  	if (apicd->vector && cpumask_test_cpu(apicd->cpu, vector_searchmask))
>  		return 0;
> +
> +	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI) {
> +		cpu = irq_matrix_find_best_cpu_managed(vector_matrix, dest);
> +		apicd->cpu = cpu;
> +		vector = 0;
> +		goto no_vector;
> +	}

This code can never be reached for a NMI delivery. If so, then it's a
bug.

This all is special purpose for that particular HPET NMI watchdog use
case and we are not exposing this to anything else at all.

So why are you sprinkling this NMI nonsense all over the place? Just
because? There are well defined entry points to all of this where this
can be fenced off.

If at some day the hardware people get their act together and provide a
proper vector space for NMIs then we have to revisit that, but then
there will be a separate NMI vector management too.

What you want is the below which also covers the next patch. Please keep
an eye on the comments I added/modified.

Thanks,

        tglx
---
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -42,6 +42,7 @@ EXPORT_SYMBOL_GPL(x86_vector_domain);
 static DEFINE_RAW_SPINLOCK(vector_lock);
 static cpumask_var_t vector_searchmask;
 static struct irq_chip lapic_controller;
+static struct irq_chip lapic_nmi_controller;
 static struct irq_matrix *vector_matrix;
 #ifdef CONFIG_SMP
 static DEFINE_PER_CPU(struct hlist_head, cleanup_list);
@@ -451,6 +452,10 @@ static int x86_vector_activate(struct ir
 	trace_vector_activate(irqd->irq, apicd->is_managed,
 			      apicd->can_reserve, reserve);
 
+	/* NMI has a fixed vector. No vector management required */
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return 0;
+
 	raw_spin_lock_irqsave(&vector_lock, flags);
 	if (!apicd->can_reserve && !apicd->is_managed)
 		assign_irq_vector_any_locked(irqd);
@@ -472,6 +477,10 @@ static void vector_free_reserved_and_man
 	trace_vector_teardown(irqd->irq, apicd->is_managed,
 			      apicd->has_reserved);
 
+	/* NMI has a fixed vector. No vector management required */
+	if (apicd->hw_irq_cfg.delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return;
+
 	if (apicd->has_reserved)
 		irq_matrix_remove_reserved(vector_matrix);
 	if (apicd->is_managed)
@@ -568,6 +577,24 @@ static int x86_vector_alloc_irqs(struct
 		irqd->hwirq = virq + i;
 		irqd_set_single_target(irqd);
 
+		if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
+			/*
+			 * NMIs have a fixed vector and need their own
+			 * interrupt chip so nothing can end up in the
+			 * regular local APIC management code except the
+			 * MSI message composing callback.
+			 */
+			irqd->chip = &lapic_nmi_controller;
+			/*
+			 * Don't allow affinity setting attempts for NMIs.
+			 * This cannot work with the regular affinity
+			 * mechanisms and for the intended HPET NMI
+			 * watchdog use case it's not required.
+			 */
+			irqd_set_no_balance(irqd);
+			continue;
+		}
+
 		/*
 		 * Prevent that any of these interrupts is invoked in
 		 * non interrupt context via e.g. generic_handle_irq()
@@ -921,6 +948,11 @@ static struct irq_chip lapic_controller
 	.irq_retrigger		= apic_retrigger_irq,
 };
 
+static struct irq_chip lapic_nmi_controller = {
+	.name			= "APIC-NMI",
+	.irq_compose_msi_msg	= x86_vector_msi_compose_msg,
+};
+
 #ifdef CONFIG_SMP
 
 static void free_moved_vector(struct apic_chip_data *apicd)
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -261,6 +261,11 @@ static inline bool irqd_is_per_cpu(struc
 	return __irqd_to_state(d) & IRQD_PER_CPU;
 }
 
+static inline void irqd_set_no_balance(struct irq_data *d)
+{
+	__irqd_to_state(d) |= IRQD_NO_BALANCING;
+}
+
 static inline bool irqd_can_balance(struct irq_data *d)
 {
 	return !(__irqd_to_state(d) & (IRQD_PER_CPU | IRQD_NO_BALANCING));
