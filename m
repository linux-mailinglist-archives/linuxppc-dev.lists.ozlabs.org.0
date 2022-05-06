Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DE51DFD7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 21:54:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw1VX71FMz3cB5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 05:54:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Xc8Vtd93;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/4l7akva;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=Xc8Vtd93; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=/4l7akva; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw1Ty00nLz3bs0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 05:53:57 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651866834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPigNHr8wXW4Jsp9L+zcdiLLC2xp5wKYQoiAjHdLkb0=;
 b=Xc8Vtd935tKSHJ4TItbPhom70GX4iR+XaOHyoZEbq2TCP4h9WjKpN0MVzmsUbMnujiBgnV
 WXGzehvrucSX1BoXOdNpoMb3s0YNBoPdGbKtAB3wDRyptT25vNwG7QcC7LwRl3B15XR6VM
 FhGG5jK12XCNGha0igmSaWXXc2p4A3H1NRfSABcL1Z3IwAXCO4O3qpx16YQ/THdTjg92ya
 In409B3HY2BR55Mv7J/T3Np4Rdy7VMWpG58IDPN5+hY6NlLD7uyzePgQU6EvXGIFGFCODZ
 3pB/pK2v3RdJoDZ1aaYSIcYs0qALgfVW7BGlvJCXH5N/7ExJVtGCxVmBC9jnxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651866834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPigNHr8wXW4Jsp9L+zcdiLLC2xp5wKYQoiAjHdLkb0=;
 b=/4l7akvaVCpYSimscxE6emXgo2DDhYqJsbAjKJILCBQFs5NLOHNmvvAauEvq153gAwkORH
 f5cYHMQqOtGE5zCA==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 02/29] x86/apic: Add irq_cfg::delivery_mode
In-Reply-To: <20220506000008.30892-3-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-3-ricardo.neri-calderon@linux.intel.com>
Date: Fri, 06 May 2022 21:53:54 +0200
Message-ID: <875ymih1yl.ffs@tglx>
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
> Currently, the delivery mode of all interrupts is set to the mode of the
> APIC driver in use. There are no restrictions in hardware to configure the
> delivery mode of each interrupt individually. Also, certain IRQs need
> to be

s/IRQ/interrupt/ Changelogs can do without acronyms.

> configured with a specific delivery mode (e.g., NMI).
>
> Add a new member, delivery_mode, to struct irq_cfg. Subsequent changesets
> will update every irq_domain to set the delivery mode of each IRQ to that
> specified in its irq_cfg data.
>
> To keep the current behavior, when allocating an IRQ in the root
> domain

The root domain does not allocate an interrupt. The root domain
allocates a vector for an interrupt. There is a very clear and technical
destinction. Can you please be more careful about the wording?

> --- a/arch/x86/kernel/apic/vector.c
> +++ b/arch/x86/kernel/apic/vector.c
> @@ -567,6 +567,7 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
>  		irqd->chip_data = apicd;
>  		irqd->hwirq = virq + i;
>  		irqd_set_single_target(irqd);
> +

Stray newline.

>  		/*
>  		 * Prevent that any of these interrupts is invoked in
>  		 * non interrupt context via e.g. generic_handle_irq()
> @@ -577,6 +578,14 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
>  		/* Don't invoke affinity setter on deactivated interrupts */
>  		irqd_set_affinity_on_activate(irqd);
>  
> +		/*
> +		 * Initialize the delivery mode of this irq to match the

s/irq/interrupt/

> +		 * default delivery mode of the APIC. Children irq domains
> +		 * may take the delivery mode from the individual irq
> +		 * configuration rather than from the APIC driver.
> +		 */
> +		apicd->hw_irq_cfg.delivery_mode = apic->delivery_mode;
> +
>  		/*
>  		 * Legacy vectors are already assigned when the IOAPIC
>  		 * takes them over. They stay on the same vector. This is
