Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B771E2C90D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 23:20:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClKRW3MPkzDr2g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 09:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=LKYde6px; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=yAgP2wjT; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClKPp2L99zDr0Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 09:18:38 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606774714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFudy8L+FlHMOa4nsHLt70wET9/WFjTaQkZS7DntErI=;
 b=LKYde6pxVDO8fB/PwX7qEMxyT+OyS7kjQ5jVxQTYW/rZtRAgLQyOHvkX6cefQFr8+wHPn4
 VoNpwxoEITvI2gzTqprsF/EVBGhC5WkqzTBYtr/hXg1Q6q4lZibJ5CFM8wqLVp3Bsi9/Y9
 JFy2SN14bhwT7xHJfYXYD95qz0I42FTBs65tkI1/U8NfamnLVO63F85kwLwSWnCaLS499l
 EkOvGygL7SnHVYhO2uJieDBngIQmIZdrpk/vDaQtQLMTVnwMdK0/uHUbPzVqNrQtDzKrk8
 uEkgzdGcVWJZG+qQDbKHNSUsuAncrKqfot3G8V0rRk1T5QndhKrmU+PQCzQAiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606774714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFudy8L+FlHMOa4nsHLt70wET9/WFjTaQkZS7DntErI=;
 b=yAgP2wjTpmMizPaYS2eE7kNJTr0f4jj44LvgPz+5/V8EMY/UF87pHX4+fK6GW4Bb5mx1dZ
 M4vb99HR77HvR2AA==
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernel v4 5/8] genirq: Add free_irq hook for IRQ
 descriptor and use for mapping disposal
In-Reply-To: <20201124061720.86766-6-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-6-aik@ozlabs.ru>
Date: Mon, 30 Nov 2020 23:18:34 +0100
Message-ID: <877dq2ij45.fsf@nanos.tec.linutronix.de>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, linux-gpio@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey,

On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
> We want to make the irq_desc.kobj's release hook free associated resources
> but we do not want to pollute the irqdesc code with domains.

Can you please describe your changelog in factual ways without 'we and I
and want'? See Documentation/process/

> This adds a free_irq hook which is called when the last reference to
> the descriptor is dropped.
>
> The first user is mapped irqs. This potentially can break the existing
> users; however they seem to do the right thing and call dispose once
> per mapping.

Q: How is this supposed to work with CONFIG_SPARSE_IRQ=n?
A: Not at all.

Also 'seem to do the right thing' is from the same quality as 'should
not break stuff'. Either you have done a proper analysis or you did
not. Aside of that how is anyone supposed to decode the subtle wreckage
which is this going to cause if 'seem to do the right thing' turns out
to be wrong?

> -void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
> +static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
>  {
>  	struct irq_data *irq_data = irq_get_irq_data(irq);
>  	irq_hw_number_t hwirq;
> @@ -582,6 +582,13 @@ void irq_domain_associate_many(struct irq_domain *domain, unsigned int irq_base,
>  }
>  EXPORT_SYMBOL_GPL(irq_domain_associate_many);
>  
> +static void irq_mapped_free_desc(struct irq_desc *desc)

That function name is really misleading and badly chosen. The function
is not about freeing the irq descriptor as the name suggests. It's
called from that code in order to clean up the mapping.

> +{
> +	unsigned int virq = desc->irq_data.irq;
> +
> +	irq_domain_disassociate(desc->irq_data.domain, virq);
> +}
> +
>  /**
>   * irq_create_direct_mapping() - Allocate an irq for direct mapping
>   * @domain: domain to allocate the irq for or NULL for default domain
> @@ -638,6 +645,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>  {
>  	struct device_node *of_node;
>  	int virq;
> +	struct irq_desc *desc;

This code uses reverse fir tree ordering of variables

  	struct device_node *of_node;
	struct irq_desc *desc;
  	int virq;

Why? Because it's simpler to read than the vertical camel case above.

Thanks,

        tglx
