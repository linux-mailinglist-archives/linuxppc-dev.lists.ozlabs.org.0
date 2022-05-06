Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934051E105
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 23:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw3Ts1hRJz3cFM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 07:24:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1gitIq8F;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kbgZs5Io;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=1gitIq8F; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=kbgZs5Io; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw3TC4KHpz3bXy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 07:23:27 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651872204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Qt7CUp/pjOXetxeeCEQTHQJVA1rcx9ZBnwtcdpqF+0=;
 b=1gitIq8FJN+a0xsKA2F9S/IkXhuehmIu/V1V6fDWUg4SgYJ6GNR70nqfi6IKrkT0vv4Yae
 ZCuqm/hYF1OxK74tQBPRc0TS/NELz45bgd73c1EXtOB7GCDM8SKQ7JiVY/gGbu0/kBholF
 JCPN0OvDqROnL3mfI+OVoJn1DJwxkm1w/Y3xe4jMDPcQgffkYct2evhH90bBtQYroQhHVQ
 9i8FfLmF9G8vaSrdByk6xcyydCReNyG8txnHNUi2JYzjXsYbUvxSIRC6g/Zy35cqfeWuEr
 XMxMC6wWl98ijxGTdbdsJG7bZbtwAoS6+gKor1KCGSBIS1sDipmE+IsdzaWeTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651872204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Qt7CUp/pjOXetxeeCEQTHQJVA1rcx9ZBnwtcdpqF+0=;
 b=kbgZs5IojxdNYid2PCX/up8UYQ0YquDeCHiNJom3jcEaJQf4cp68zTUaibdsa1SEQ7jM4L
 U3OxdSYz2NZABvDA==
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v6 10/29] iommu/vt-d: Implement minor tweaks for NMI irqs
In-Reply-To: <20220506000008.30892-11-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-11-ricardo.neri-calderon@linux.intel.com>
Date: Fri, 06 May 2022 23:23:23 +0200
Message-ID: <87wneyfj90.ffs@tglx>
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
> The Intel IOMMU interrupt remapping driver already programs correctly the
> delivery mode of individual irqs as per their irq_data. Improve handling
> of NMIs. Allow only one irq per NMI. Also, it is not necessary to cleanup
> irq vectors after updating affinity.

Structuring a changelog in paragraphs might make it readable. New lines
exist for a reason.

> NMIs do not have associated vectors.

Again. NMI has an vector associated, but it is not subject to dynamic
vector management.

> diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> index fb2d71bea98d..791a9331e257 100644
> --- a/drivers/iommu/intel/irq_remapping.c
> +++ b/drivers/iommu/intel/irq_remapping.c
> @@ -1198,8 +1198,12 @@ intel_ir_set_affinity(struct irq_data *data, const struct cpumask *mask,
>  	 * After this point, all the interrupts will start arriving
>  	 * at the new destination. So, time to cleanup the previous
>  	 * vector allocation.
> +	 *
> +	 * Do it only for non-NMI irqs. NMIs don't have associated
> +	 * vectors.

See above.

>  	 */
> -	send_cleanup_vector(cfg);
> +	if (cfg->delivery_mode != APIC_DELIVERY_MODE_NMI)
> +		send_cleanup_vector(cfg);

So this needs to be replicated for all invocations of
send_cleanup_vector(), right? Why can't you put it into that function?
  
>  	return IRQ_SET_MASK_OK_DONE;
>  }
> @@ -1352,6 +1356,9 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
>  	if (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI)
>  		info->flags &= ~X86_IRQ_ALLOC_CONTIGUOUS_VECTORS;
>  
> +	if ((info->flags & X86_IRQ_ALLOC_AS_NMI) && nr_irqs != 1)
> +		return -EINVAL;

This cannot be reached when the vector allocation domain already
rejected it, but copy & pasta is wonderful and increases the line count.

Thanks,

        tglx


