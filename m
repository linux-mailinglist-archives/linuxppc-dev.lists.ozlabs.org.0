Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B029BA5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 17:13:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLGvn3gS9zDqRX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 03:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=du48mibx; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLGql6mlSzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 03:09:39 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F299207C4;
 Tue, 27 Oct 2020 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603814977;
 bh=NgpoWJZg0ipijvq8gAtM0Btu5zbvVUy7tiszdUv4swQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=du48mibxy4onfRpTVylWClPccKz68p73ssqZOlbnec26Gr7oeGF6OeGXjXoVaps4f
 c86BuytTuI+SBre61pOdBYE7VXtJ0T5DV2sCYvNnlIOBeH1EFs2RdQAfWBBAKAiiEa
 HuPzVlV9KgglLvre7YHZGQYvgL8m5lWAL619j0hg=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kXRXS-004neu-Pw; Tue, 27 Oct 2020 16:09:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Oct 2020 16:09:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC PATCH kernel 1/2] irq: Add reference counting to IRQ mappings
In-Reply-To: <20201027090655.14118-2-aik@ozlabs.ru>
References: <20201027090655.14118-1-aik@ozlabs.ru>
 <20201027090655.14118-2-aik@ozlabs.ru>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <415025f93a2b93e8ae62cba57ca1a8a7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, clg@kaod.org,
 oohall@gmail.com, mpe@ellerman.id.au, cai@lca.pw, robh@kernel.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com,
 msuchanek@suse.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Qian Cai <cai@lca.pw>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexey,

On 2020-10-27 09:06, Alexey Kardashevskiy wrote:
> PCI devices share 4 legacy INTx interrupts from the same PCI host 
> bridge.
> Device drivers map/unmap hardware interrupts via irq_create_mapping()/
> irq_dispose_mapping(). The problem with that these interrupts are
> shared and when performing hot unplug, we need to unmap the interrupt
> only when the last device is released.
> 
> This reuses already existing irq_desc::kobj for this purpose.
> The refcounter is naturally 1 when the descriptor is allocated already;
> this adds kobject_get() in places where already existing mapped virq
> is returned.

That's quite interesting, as I was about to revive a patch series that
rework the irqdomain subsystem to directly cache irq_desc instead of
raw interrupt numbers. And for that, I needed some form of 
refcounting...

> 
> This reorganizes irq_dispose_mapping() to release the kobj and let
> the release callback do the cleanup.
> 
> If some driver or platform does its own reference counting, this 
> expects
> those parties to call irq_find_mapping() and call irq_dispose_mapping()
> for every irq_create_fwspec_mapping()/irq_create_mapping().
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  kernel/irq/irqdesc.c   | 35 +++++++++++++++++++++++------------
>  kernel/irq/irqdomain.c | 27 +++++++++++++--------------
>  2 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 1a7723604399..dae096238500 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -419,20 +419,39 @@ static struct irq_desc *alloc_desc(int irq, int
> node, unsigned int flags,
>  	return NULL;
>  }
> 
> +static void delayed_free_desc(struct rcu_head *rhp);
>  static void irq_kobj_release(struct kobject *kobj)
>  {
>  	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
> +	struct irq_domain *domain;
> +	unsigned int virq = desc->irq_data.irq;
> 
> -	free_masks(desc);
> -	free_percpu(desc->kstat_irqs);
> -	kfree(desc);
> +	domain = desc->irq_data.domain;
> +	if (domain) {
> +		if (irq_domain_is_hierarchy(domain)) {
> +			irq_domain_free_irqs(virq, 1);

How does this work with hierarchical domains? Each domain should
contribute as a reference on the irq_desc. But if you got here,
it means the refcount has already dropped to 0.

So either there is nothing to free here, or you don't track the
references implied by the hierarchy. I suspect the latter.

> +		} else {
> +			irq_domain_disassociate(domain, virq);
> +			irq_free_desc(virq);
> +		}
> +	}
> +
> +	/*
> +	 * We free the descriptor, masks and stat fields via RCU. That
> +	 * allows demultiplex interrupts to do rcu based management of
> +	 * the child interrupts.
> +	 * This also allows us to use rcu in kstat_irqs_usr().
> +	 */
> +	call_rcu(&desc->rcu, delayed_free_desc);
>  }
> 
>  static void delayed_free_desc(struct rcu_head *rhp)
>  {
>  	struct irq_desc *desc = container_of(rhp, struct irq_desc, rcu);
> 
> -	kobject_put(&desc->kobj);
> +	free_masks(desc);
> +	free_percpu(desc->kstat_irqs);
> +	kfree(desc);
>  }
> 
>  static void free_desc(unsigned int irq)
> @@ -453,14 +472,6 @@ static void free_desc(unsigned int irq)
>  	 */
>  	irq_sysfs_del(desc);
>  	delete_irq_desc(irq);
> -
> -	/*
> -	 * We free the descriptor, masks and stat fields via RCU. That
> -	 * allows demultiplex interrupts to do rcu based management of
> -	 * the child interrupts.
> -	 * This also allows us to use rcu in kstat_irqs_usr().
> -	 */
> -	call_rcu(&desc->rcu, delayed_free_desc);
>  }
> 
>  static int alloc_descs(unsigned int start, unsigned int cnt, int node,
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index cf8b374b892d..02733ddc321f 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -638,6 +638,7 @@ unsigned int irq_create_mapping(struct irq_domain 
> *domain,
>  {
>  	struct device_node *of_node;
>  	int virq;
> +	struct irq_desc *desc;
> 
>  	pr_debug("irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
> 
> @@ -655,7 +656,9 @@ unsigned int irq_create_mapping(struct irq_domain 
> *domain,
>  	/* Check if mapping already exists */
>  	virq = irq_find_mapping(domain, hwirq);
>  	if (virq) {
> +		desc = irq_to_desc(virq);
>  		pr_debug("-> existing mapping on virq %d\n", virq);
> +		kobject_get(&desc->kobj);

My worry with this is that there is probably a significant amount of
code out there that relies on multiple calls to irq_create_mapping()
with the same parameters not to have any side effects. They would
expect a subsequent irq_dispose_mapping() to drop the translation
altogether, and that's obviously not the case here.

Have you audited the various call sites to see what could break?

>  		return virq;
>  	}
> 
> @@ -751,6 +754,7 @@ unsigned int irq_create_fwspec_mapping(struct
> irq_fwspec *fwspec)
>  	irq_hw_number_t hwirq;
>  	unsigned int type = IRQ_TYPE_NONE;
>  	int virq;
> +	struct irq_desc *desc;
> 
>  	if (fwspec->fwnode) {
>  		domain = irq_find_matching_fwspec(fwspec, DOMAIN_BUS_WIRED);
> @@ -787,8 +791,11 @@ unsigned int irq_create_fwspec_mapping(struct
> irq_fwspec *fwspec)
>  		 * current trigger type then we are done so return the
>  		 * interrupt number.
>  		 */
> -		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
> +		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq)) {
> +			desc = irq_to_desc(virq);
> +			kobject_get(&desc->kobj);
>  			return virq;
> +		}
> 
>  		/*
>  		 * If the trigger type has not been set yet, then set
> @@ -800,6 +807,8 @@ unsigned int irq_create_fwspec_mapping(struct
> irq_fwspec *fwspec)
>  				return 0;
> 
>  			irqd_set_trigger_type(irq_data, type);
> +			desc = irq_to_desc(virq);
> +			kobject_get(&desc->kobj);
>  			return virq;
>  		}
> 
> @@ -852,22 +861,12 @@ EXPORT_SYMBOL_GPL(irq_create_of_mapping);
>   */
>  void irq_dispose_mapping(unsigned int virq)
>  {
> -	struct irq_data *irq_data = irq_get_irq_data(virq);
> -	struct irq_domain *domain;
> +	struct irq_desc *desc = irq_to_desc(virq);
> 
> -	if (!virq || !irq_data)
> +	if (!virq || !desc)
>  		return;
> 
> -	domain = irq_data->domain;
> -	if (WARN_ON(domain == NULL))
> -		return;
> -
> -	if (irq_domain_is_hierarchy(domain)) {
> -		irq_domain_free_irqs(virq, 1);
> -	} else {
> -		irq_domain_disassociate(domain, virq);
> -		irq_free_desc(virq);
> -	}
> +	kobject_put(&desc->kobj);
>  }
>  EXPORT_SYMBOL_GPL(irq_dispose_mapping);

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
