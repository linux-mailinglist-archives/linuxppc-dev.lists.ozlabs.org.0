Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE492CC010
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:50:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmMM76Fp8zDr7p
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 01:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmMK44gXqzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 01:48:06 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1676F70CC87B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 15:48:00 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Dec 2020
 15:48:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0042e157309-940f-4e70-93a7-ff880590e1c3,
 76C1EB7D287EC99E24174FE453FFFFDEEFC13325) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH kernel v3] powerpc/pci: Remove LSI mappings on device
 teardown
To: <linuxppc-dev@lists.ozlabs.org>
References: <20201202005222.5477-1-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <37a940dc-62e3-5ef4-7594-7c46b5aa9340@kaod.org>
Date: Wed, 2 Dec 2020 15:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202005222.5477-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8aeb5e09-d7ff-43c1-8bd0-54e77989220f
X-Ovh-Tracer-Id: 12186740593918249751
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeigedgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/2/20 1:52 AM, Alexey Kardashevskiy wrote:
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


Reviewed-by: Cédric Le Goater <clg@kaod.org>

I did some PHB hotplug tests on a KVM guest and a LPAR using only LSIs.

Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks Alexey,

C.

> ---
> Changes:
> v3:
> * free @vi on error path
> 
> v2:
> * added refcounter
> ---
>  arch/powerpc/kernel/pci-common.c | 82 ++++++++++++++++++++++++++++++--
>  1 file changed, 78 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index be108616a721..2b555997b295 100644
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
> +	vi = kzalloc(sizeof(struct pci_intx_virq), GFP_KERNEL);
> +	if (!vi)
> +		return -1;
>  
>  	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
>  
> @@ -377,12 +432,12 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>  		 * function.
>  		 */
>  		if (pci_read_config_byte(pci_dev, PCI_INTERRUPT_PIN, &pin))
> -			return -1;
> +			goto error_exit;
>  		if (pin == 0)
> -			return -1;
> +			goto error_exit;
>  		if (pci_read_config_byte(pci_dev, PCI_INTERRUPT_LINE, &line) ||
>  		    line == 0xff || line == 0) {
> -			return -1;
> +			goto error_exit;
>  		}
>  		pr_debug(" No map ! Using line %d (pin %d) from PCI config\n",
>  			 line, pin);
> @@ -394,14 +449,33 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>  
>  	if (!virq) {
>  		pr_debug(" Failed to map !\n");
> -		return -1;
> +		goto error_exit;
>  	}
>  
>  	pr_debug(" Mapped to linux irq %d\n", virq);
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
> +error_exit:
> +	kfree(vi);
> +	return -1;
>  }
>  
>  /*
> 

