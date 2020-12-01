Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25ED2C9C93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 10:34:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClcQ61z87zDqwP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 20:34:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClcLj5jSrzDqMt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 20:31:53 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 34E0076E3310;
 Tue,  1 Dec 2020 10:31:46 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 1 Dec 2020
 10:31:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00355c78e65-afd1-4c50-b17e-38dcfc7cea0d,
 66EB1A3D5BF4D64889CDC343FC639189F0F7CCAF) smtp.auth=clg@kaod.org
Subject: Re: [PATCH kernel v2] powerpc/pci: Remove LSI mappings on device
 teardown
To: Alexey Kardashevskiy <aik@ozlabs.ru>, <linuxppc-dev@lists.ozlabs.org>
References: <20201201073919.5600-1-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <350f6a85-77d8-c0bc-3ba5-f3fd3c50ffe1@kaod.org>
Date: Tue, 1 Dec 2020 10:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201073919.5600-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 53956333-8ef0-490d-8127-0847f8d5e309
X-Ovh-Tracer-Id: 973340472586832864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrihhksehoiihlrggsshdrrhhu
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/1/20 8:39 AM, Alexey Kardashevskiy wrote:
> From: Oliver O'Halloran <oohall@gmail.com>
> 
> When a passthrough IO adapter is removed from a pseries machine using hash
> MMU and the XIVE interrupt mode, the POWER hypervisor expects the guest OS
> to clear all page table entries related to the adapter. If some are still
> present, the RTAS call which isolates the PCI slot returns error 9001
> "valid outstanding translations" and the removal of the IO adapter fails.
> This is because when the PHBs are scanned, Linux maps automatically the
> INTx interrupts in the Linux interrupt number space but these are never
> removed.
> 
> This problem can be fixed by adding the corresponding unmap operation when
> the device is removed. There's no pcibios_* hook for the remove case, but
> the same effect can be achieved using a bus notifier.
> 
> Because INTx are shared among PHBs (and potentially across the system),
> this adds tracking of virq to unmap them only when the last user is gone.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> [aik: added refcounter]
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Looks good to me and the system survives all the PCI hotplug tests I used 
to do on my first attempts to fix this issue. 

One comment below,

> ---
> 
> 
> Doing this in the generic irq code is just too much for my small brain :-/

may be more cleanups are required in the PCI/MSI/IRQ PPC layers before 
considering your first approach. You think too much in advance  !

> 
> ---
>  arch/powerpc/kernel/pci-common.c | 71 ++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index be108616a721..0acf17f17253 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -353,6 +353,55 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>  	return NULL;
>  }
>  
> +struct pci_intx_virq {
> +	int virq;
> +	struct kref kref;
> +	struct list_head list_node;
> +};
> +
> +static LIST_HEAD(intx_list);
> +static DEFINE_MUTEX(intx_mutex);
> +
> +static void ppc_pci_intx_release(struct kref *kref)
> +{
> +	struct pci_intx_virq *vi = container_of(kref, struct pci_intx_virq, kref);
> +
> +	list_del(&vi->list_node);
> +	irq_dispose_mapping(vi->virq);
> +	kfree(vi);
> +}
> +
> +static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct pci_dev *pdev = to_pci_dev(data);
> +
> +	if (action == BUS_NOTIFY_DEL_DEVICE) {
> +		struct pci_intx_virq *vi;
> +
> +		mutex_lock(&intx_mutex);
> +		list_for_each_entry(vi, &intx_list, list_node) {
> +			if (vi->virq == pdev->irq) {
> +				kref_put(&vi->kref, ppc_pci_intx_release);
> +				break;
> +			}
> +		}
> +		mutex_unlock(&intx_mutex);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block ppc_pci_unmap_irq_notifier = {
> +	.notifier_call = ppc_pci_unmap_irq_line,
> +};
> +
> +static int ppc_pci_register_irq_notifier(void)
> +{
> +	return bus_register_notifier(&pci_bus_type, &ppc_pci_unmap_irq_notifier);
> +}
> +arch_initcall(ppc_pci_register_irq_notifier);
> +
>  /*
>   * Reads the interrupt pin to determine if interrupt is use by card.
>   * If the interrupt is used, then gets the interrupt line from the
> @@ -361,6 +410,12 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>  static int pci_read_irq_line(struct pci_dev *pci_dev)
>  {
>  	int virq;
> +	struct pci_intx_virq *vi, *vitmp;
> +
> +	/* Preallocate vi as rewind is complex if this fails after mapping */

AFAICT, we only need to call irq_dispose_mapping() if allocation fails.
If so, it would be simpler to isolate the code in a pci_intx_register(virq) 
helper and call it from pci_read_irq_line().

> +	vi = kzalloc(sizeof(struct pci_intx_virq), GFP_KERNEL);
> +	if (!vi)
> +		return -1;
>  
>  	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
>  
> @@ -401,6 +456,22 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>  
>  	pci_dev->irq = virq;
>  
> +	mutex_lock(&intx_mutex);
> +	list_for_each_entry(vitmp, &intx_list, list_node) {
> +		if (vitmp->virq == virq) {
> +			kref_get(&vitmp->kref);
> +			kfree(vi);
> +			vi = NULL;
> +			break;
> +		}
> +	}
> +	if (vi) {
> +		vi->virq = virq;
> +		kref_init(&vi->kref);
> +		list_add_tail(&vi->list_node, &intx_list);
> +	}
> +	mutex_unlock(&intx_mutex);
> +
>  	return 0;
>  }
>  
> 

