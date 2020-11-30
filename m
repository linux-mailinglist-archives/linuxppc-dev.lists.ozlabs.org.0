Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B192F2C924B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 00:15:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClLg855GwzDqvP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 10:15:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=TErIi0LR; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=OBqVQNWA; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClLdT3bV7zDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 10:13:48 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606778024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcIojZeNBXirIxPuzck5gKL+B2GaAAVvbLMSbnv7A4o=;
 b=TErIi0LRzrxWtp2w0jaDbQs3wM0sxhxyGGuNXb8yCoSc19jwyWuTOLBKnvHCQCuVB92XB7
 U8bleVUuBzWgRMnH9UGQbNX9UJU1aATJ3/YACH9xpT2TQ28H7n6zBeosQVWyUDwLhsclsu
 iBmtG3PLr6EVBA9vzkJ2dN2nxSoEl77RRKFyUPL1iJRoLiXoQE/hvD7OuotKPcwa+Lvy9V
 GkYyESZNsVaNTsQHjBmTN/OSf4JuKlnUIPkFLAl5f1dQHxjSPXt8xoGGv0afpOS0RoEDrL
 vkEM6fM2/ruRi/txjDpqSV9joZSgnJFSMw6uQvHtLX2JLfic/ZSKE2dJ5uRKuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606778024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcIojZeNBXirIxPuzck5gKL+B2GaAAVvbLMSbnv7A4o=;
 b=OBqVQNWAecaT77Y/D1j/uIFIdsyYMUuCsILx3O7iOBPONrreeEGV9ZZIdUy8tDebOhwOw5
 JTAGOz1sV1hhrSCQ==
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernel v4 6/8] genirq/irqdomain: Move hierarchical IRQ
 cleanup to kobject_release
In-Reply-To: <20201124061720.86766-7-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-7-aik@ozlabs.ru>
Date: Tue, 01 Dec 2020 00:13:44 +0100
Message-ID: <871rgaigk7.fsf@nanos.tec.linutronix.de>
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
> This moves hierarchical domain's irqs cleanup into the kobject release
> hook to make irq_domain_free_irqs() as simple as kobject_put.

Truly simple: Simply broken in multiple ways.

CONFIG_SPARSE_IRQ=n is now completely buggered. It does not even compile
anymore. Running core code changes through a larger set of cross
compilers is neither rocket science nor optional.

For CONFIG_SPARSE_IRQ=y, see below.

> @@ -1675,14 +1679,11 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs)
>  		 "NULL pointer, cannot free irq\n"))
>  		return;
>  
> -	mutex_lock(&irq_domain_mutex);
> -	for (i = 0; i < nr_irqs; i++)
> -		irq_domain_remove_irq(virq + i);
> -	irq_domain_free_irqs_hierarchy(data->domain, virq, nr_irqs);
> -	mutex_unlock(&irq_domain_mutex);
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_desc *desc = irq_to_desc(virq + i);
>  
> -	irq_domain_free_irq_data(virq, nr_irqs);
> -	irq_free_descs(virq, nr_irqs);
> +		kobject_put(&desc->kobj);

So up to this point both irq_dispose_mapping() _and_
irq_domain_free_irqs() invoked irq_free_descs().

Let's look at the call chains:

   irq_domain_free_irqs()
     irq_free_descs()
       mutex_lock(&sparse_irq_lock);
         for (i...)
           free_desc(from + i)
             irq_remove_debugfs_entry();
             unregister_irq_proc();
             irq_sysfs_del();
             delete_irq_desc();
             call_rcu();
       bitmap_clear(allocated_irqs, ...);
       mutex_unlock(&sparse_irq_lock);

with your modifications it does:

   irq_domain_free_irqs()
     for (i...)
          kobject_put(&desc->kobj)
            irq_kobj_release()
              if (desc->free_irq)
                desc->free_irq(desc);
              irq_remove_debugfs_entry();
              unregister_irq_proc();
              delete_irq_desc();
              call_rcu();

Can you spot the wreckage? It's not even subtle, it's more than obvious.

    1) None of the operations in irq_kobj_release() is protected by
       sparse_irq_lock anymore. There was a comment in free_desc() which
       explained what is protected. You removed parts of that comment
       and just left the sysfs portion of it above delete_irq_desc()
       which is completely bogus because you removed the irq_sysfs_del()
       call.

    2) Nothing removes the freed interrupts from the allocation
       bitmap. Run this often enough and you exhausted the interrupt
       space.

And no, you cannot just go and invoke irq_free_descs() instead of
kobject_put(), simply because you'd create lock order inversion vs. the
free_irq() callback.

So no, it's not that simple and I'm not at all interested in another
respin of this with some more duct tape applied.

It can be done, but that needs way more thought, a proper design which
preserves the existing semantics completely and wants to be a fine
grained series where each patch does exactly ONE small thing which is
reviewable and testable on _ALL_ users of this code, i.e. _ALL_
architectures and irq chip implementations.  

Thanks,

        tglx
