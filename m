Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F64511CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:12:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtJjX0l39z305Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 06:12:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtJj45Lsdz2xB9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 06:12:08 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AB05520EE3;
 Mon, 15 Nov 2021 19:05:18 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 15 Nov
 2021 20:05:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0067dd14582-1412-4631-8fa2-d8a1cb31cee9,
 B170A238E9997327E6DA2770AA6356012EAFCF51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1fe9d629-0f5f-4807-b97c-77b3b3c7de72@kaod.org>
Date: Mon, 15 Nov 2021 20:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 16/39] irqdomain: Make normal and nomap irqdomains
 exclusive
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210520163751.27325-1-maz@kernel.org>
 <20210520163751.27325-17-maz@kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210520163751.27325-17-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eb9f6b47-83ae-4727-9694-cdc3b8086037
X-Ovh-Tracer-Id: 12641041204814514982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Mark,

On 5/20/21 18:37, Marc Zyngier wrote:
> Direct mappings are completely exclusive of normal mappings, meaning
> that we can refactor the code slightly so that we can get rid of
> the revmap_direct_max_irq field and use the revmap_size field
> instead, reducing the size of the irqdomain structure.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>


This patch is breaking the POWER9/POWER10 XIVE driver (these are not
old PPC systems :) on machines sharing the same LSI HW IRQ. For instance,
a linux KVM guest with a virtio-rng and a virtio-balloon device. In that
case, Linux creates two distinct IRQ mappings which can lead to some
unexpected behavior.

A fix to go forward would be to change the XIVE IRQ domain to use a
'Tree' domain for reverse mapping and not the 'No Map' domain mapping.
I will keep you updated for XIVE.

Thanks,

C.


> ---
>   include/linux/irqdomain.h |  6 +++---
>   kernel/irq/irqdomain.c    | 45 ++++++++++++++++++++++++++++++---------
>   2 files changed, 38 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 723495ec5a2f..0916cf9c6e20 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -149,8 +149,6 @@ struct irq_domain_chip_generic;
>    * @parent: Pointer to parent irq_domain to support hierarchy irq_domains
>    *
>    * Revmap data, used internally by irq_domain
> - * @revmap_direct_max_irq: The largest hwirq that can be set for controllers that
> - *                         support direct mapping
>    * @revmap_size: Size of the linear map table @revmap[]
>    * @revmap_tree: Radix map tree for hwirqs that don't fit in the linear map
>    * @revmap: Linear table of hwirq->virq reverse mappings
> @@ -173,7 +171,6 @@ struct irq_domain {
>   
>   	/* reverse map data. The linear map gets appended to the irq_domain */
>   	irq_hw_number_t hwirq_max;
> -	unsigned int revmap_direct_max_irq;
>   	unsigned int revmap_size;
>   	struct radix_tree_root revmap_tree;
>   	struct mutex revmap_tree_mutex;
> @@ -207,6 +204,9 @@ enum {
>   	 */
>   	IRQ_DOMAIN_MSI_NOMASK_QUIRK	= (1 << 6),
>   
> +	/* Irq domain doesn't translate anything */
> +	IRQ_DOMAIN_FLAG_NO_MAP		= (1 << 7),
> +
>   	/*
>   	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
>   	 * for implementation specific purposes and ignored by the
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index e0143e640683..fa94c86e47d4 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -146,6 +146,10 @@ struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, int size,
>   
>   	static atomic_t unknown_domains;
>   
> +	if (WARN_ON((size && direct_max) ||
> +		    (!IS_ENABLED(CONFIG_IRQ_DOMAIN_NOMAP) && direct_max)))
> +		return NULL;
> +
>   	domain = kzalloc_node(sizeof(*domain) + (sizeof(unsigned int) * size),
>   			      GFP_KERNEL, of_node_to_nid(to_of_node(fwnode)));
>   	if (!domain)
> @@ -213,8 +217,14 @@ struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, int size,
>   	domain->ops = ops;
>   	domain->host_data = host_data;
>   	domain->hwirq_max = hwirq_max;
> +
> +	if (direct_max) {
> +		size = direct_max;
> +		domain->flags |= IRQ_DOMAIN_FLAG_NO_MAP;
> +	}
> +
>   	domain->revmap_size = size;
> -	domain->revmap_direct_max_irq = direct_max;
> +
>   	irq_domain_check_hierarchy(domain);
>   
>   	mutex_lock(&irq_domain_mutex);
> @@ -482,9 +492,18 @@ struct irq_domain *irq_get_default_host(void)
>   	return irq_default_domain;
>   }
>   
> +static bool irq_domain_is_nomap(struct irq_domain *domain)
> +{
> +	return IS_ENABLED(CONFIG_IRQ_DOMAIN_NOMAP) &&
> +	       (domain->flags & IRQ_DOMAIN_FLAG_NO_MAP);
> +}
> +
>   static void irq_domain_clear_mapping(struct irq_domain *domain,
>   				     irq_hw_number_t hwirq)
>   {
> +	if (irq_domain_is_nomap(domain))
> +		return;
> +
>   	if (hwirq < domain->revmap_size) {
>   		domain->revmap[hwirq] = 0;
>   	} else {
> @@ -498,6 +517,9 @@ static void irq_domain_set_mapping(struct irq_domain *domain,
>   				   irq_hw_number_t hwirq,
>   				   struct irq_data *irq_data)
>   {
> +	if (irq_domain_is_nomap(domain))
> +		return;
> +
>   	if (hwirq < domain->revmap_size) {
>   		domain->revmap[hwirq] = irq_data->irq;
>   	} else {
> @@ -629,9 +651,9 @@ unsigned int irq_create_direct_mapping(struct irq_domain *domain)
>   		pr_debug("create_direct virq allocation failed\n");
>   		return 0;
>   	}
> -	if (virq >= domain->revmap_direct_max_irq) {
> +	if (virq >= domain->revmap_size) {
>   		pr_err("ERROR: no free irqs available below %i maximum\n",
> -			domain->revmap_direct_max_irq);
> +			domain->revmap_size);
>   		irq_free_desc(virq);
>   		return 0;
>   	}
> @@ -879,10 +901,14 @@ unsigned int irq_find_mapping(struct irq_domain *domain,
>   	if (domain == NULL)
>   		return 0;
>   
> -	if (hwirq < domain->revmap_direct_max_irq) {
> -		data = irq_domain_get_irq_data(domain, hwirq);
> -		if (data && data->hwirq == hwirq)
> -			return hwirq;
> +	if (irq_domain_is_nomap(domain)) {
> +		if (hwirq < domain->revmap_size) {
> +			data = irq_domain_get_irq_data(domain, hwirq);
> +			if (data && data->hwirq == hwirq)
> +				return hwirq;
> +		}
> +
> +		return 0;
>   	}
>   
>   	/* Check if the hwirq is in the linear revmap. */
> @@ -1470,7 +1496,7 @@ static void irq_domain_fix_revmap(struct irq_data *d)
>   {
>   	void __rcu **slot;
>   
> -	if (d->hwirq < d->domain->revmap_size)
> +	if (irq_domain_is_nomap(d->domain) || d->hwirq < d->domain->revmap_size)
>   		return; /* Not using radix tree. */
>   
>   	/* Fix up the revmap. */
> @@ -1830,8 +1856,7 @@ static void
>   irq_domain_debug_show_one(struct seq_file *m, struct irq_domain *d, int ind)
>   {
>   	seq_printf(m, "%*sname:   %s\n", ind, "", d->name);
> -	seq_printf(m, "%*ssize:   %u\n", ind + 1, "",
> -		   d->revmap_size + d->revmap_direct_max_irq);
> +	seq_printf(m, "%*ssize:   %u\n", ind + 1, "", d->revmap_size);
>   	seq_printf(m, "%*smapped: %u\n", ind + 1, "", d->mapcount);
>   	seq_printf(m, "%*sflags:  0x%08x\n", ind +1 , "", d->flags);
>   	if (d->ops && d->ops->debug_show)
> 

