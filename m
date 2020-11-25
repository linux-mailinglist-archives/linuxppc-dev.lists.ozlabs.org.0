Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF32C44D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 17:23:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch5mZ2TPHzDr4t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 03:23:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.45.220; helo=5.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4204 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Nov 2020 03:22:09 AEDT
Received: from 5.mo52.mail-out.ovh.net (5.mo52.mail-out.ovh.net
 [188.165.45.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch5kn5KPrzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 03:22:02 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 35B1B21BD52;
 Wed, 25 Nov 2020 13:45:40 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 13:45:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003764d7788-e883-4b91-8c12-09b64416a181,
 13817E1CA0648EB9EE095497159C33290D197662) smtp.auth=groug@kaod.org
Date: Wed, 25 Nov 2020 13:45:38 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 1/2] genirq: add an irq_create_mapping_affinity()
 function
Message-ID: <20201125134538.71895275@bahia.lan>
In-Reply-To: <20201125111657.1141295-2-lvivier@redhat.com>
References: <20201125111657.1141295-1-lvivier@redhat.com>
 <20201125111657.1141295-2-lvivier@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d00713c1-4f18-4b54-a786-baae8bb63fee
X-Ovh-Tracer-Id: 5905345013404899832
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehtddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetgffffffggfekgeffteekhffhueelffdvhedvgfdthfeiudetvddulefgveevteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghu
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Paul
 Mackerras <paulus@samba.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Nov 2020 12:16:56 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> This function adds an affinity parameter to irq_create_mapping().
> This parameter is needed to pass it to irq_domain_alloc_descs().
> 
> irq_create_mapping() is a wrapper around irq_create_mapping_affinity()
> to pass NULL for the affinity parameter.
> 
> No functional change.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  include/linux/irqdomain.h | 12 ++++++++++--
>  kernel/irq/irqdomain.c    | 13 ++++++++-----
>  2 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 71535e87109f..ea5a337e0f8b 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -384,11 +384,19 @@ extern void irq_domain_associate_many(struct irq_domain *domain,
>  extern void irq_domain_disassociate(struct irq_domain *domain,
>  				    unsigned int irq);
>  
> -extern unsigned int irq_create_mapping(struct irq_domain *host,
> -				       irq_hw_number_t hwirq);
> +extern unsigned int irq_create_mapping_affinity(struct irq_domain *host,
> +				      irq_hw_number_t hwirq,
> +				      const struct irq_affinity_desc *affinity);
>  extern unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
>  extern void irq_dispose_mapping(unsigned int virq);
>  
> +static inline unsigned int irq_create_mapping(struct irq_domain *host,
> +					      irq_hw_number_t hwirq)
> +{
> +	return irq_create_mapping_affinity(host, hwirq, NULL);
> +}
> +
> +
>  /**
>   * irq_linear_revmap() - Find a linux irq from a hw irq number.
>   * @domain: domain owning this hardware interrupt
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index cf8b374b892d..e4ca69608f3b 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -624,17 +624,19 @@ unsigned int irq_create_direct_mapping(struct irq_domain *domain)
>  EXPORT_SYMBOL_GPL(irq_create_direct_mapping);
>  
>  /**
> - * irq_create_mapping() - Map a hardware interrupt into linux irq space
> + * irq_create_mapping_affinity() - Map a hardware interrupt into linux irq space
>   * @domain: domain owning this hardware interrupt or NULL for default domain
>   * @hwirq: hardware irq number in that domain space
> + * @affinity: irq affinity
>   *
>   * Only one mapping per hardware interrupt is permitted. Returns a linux
>   * irq number.
>   * If the sense/trigger is to be specified, set_irq_type() should be called
>   * on the number returned from that call.
>   */
> -unsigned int irq_create_mapping(struct irq_domain *domain,
> -				irq_hw_number_t hwirq)
> +unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
> +				       irq_hw_number_t hwirq,
> +				       const struct irq_affinity_desc *affinity)
>  {
>  	struct device_node *of_node;
>  	int virq;
> @@ -660,7 +662,8 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>  	}
>  
>  	/* Allocate a virtual interrupt number */
> -	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node), NULL);
> +	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node),
> +				      affinity);
>  	if (virq <= 0) {
>  		pr_debug("-> virq allocation failed\n");
>  		return 0;
> @@ -676,7 +679,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>  
>  	return virq;
>  }
> -EXPORT_SYMBOL_GPL(irq_create_mapping);
> +EXPORT_SYMBOL_GPL(irq_create_mapping_affinity);
>  
>  /**
>   * irq_create_strict_mappings() - Map a range of hw irqs to fixed linux irqs

