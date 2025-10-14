Return-Path: <linuxppc-dev+bounces-12810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA417BD78DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm3xK3Q2Nz3020;
	Tue, 14 Oct 2025 17:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760422837;
	cv=none; b=QIXgEOjLn1VScBTS1eo1M9cYRBwXD14HAqU2JhkbFRL6pS+YuDA+k6/7bz6V2i8hlMTDmrp2KJ/CjjrgBRxXGLs8UKQjTjho/umYb/KXIErbrOjsqxOmDgWLuhZD1h702jn6Jvmw5WDcBVkWIkhZIGX0ytyFstM4qe5Ry7o6ehlbysxIzEKLenaZZlpci5yTUxfv2N4YdN9iwVUm76mom6mVisTZVQafQnpyOnWM80HS5PXigI191YE59hZ+/G65p2N0m9112HymTtx0VF/HNtFZwfGBqFF2984BTNieKfc5tsfAn+ptUm4vkDe3pIyeEvwM2itCrg2oHkTWxuJing==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760422837; c=relaxed/relaxed;
	bh=EePgnXsXpE3cOt+iCZV0SUb00Awy++MhoQWxEEi+7E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=EErHtWR8BihhiIhzTVuGjtjLuG0kPs+n8XP3zDwQoYUKKUm2PoKPW2w326rU9iJLUOQnGpeWGkRdiG4DJkcXEBERj7Afr1jivSQsnD0BPTjXUnaaNITcpE2UNfRiiBOkH+nAOkWUYRZKCX+conY7NfDw0o1Y2K5FkOzWMeWVj4Fhks56IkYQNxaLQX48Di1CDX/Pk5qx4j0zK6vdIYsln7uRQQ/2YD6vrtoi7vxiGKqJ4WpySazYGmsZLqP/9vcwjaQ3XbmRGYa1YLXHZuL7x+QXHRte7MBoPv8jA2bcpKXZ/d45yFLlCdWSR43+39JqwoBJLqo2TjSXAM6ay6aVXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm3xJ3gQhz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cm3Jn20tyz9sS7;
	Tue, 14 Oct 2025 07:52:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4egiN9TgGf1Y; Tue, 14 Oct 2025 07:52:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cm3Jn0qPSz9sRy;
	Tue, 14 Oct 2025 07:52:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F1ED38B767;
	Tue, 14 Oct 2025 07:52:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FZPNwzUO7_7x; Tue, 14 Oct 2025 07:52:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F12C8B763;
	Tue, 14 Oct 2025 07:52:24 +0200 (CEST)
Message-ID: <efedcf6c-2fe5-4580-a7b1-d14609da916b@csgroup.eu>
Date: Tue, 14 Oct 2025 07:52:24 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsl_msi: Translate bitmap to hwirq on fsl,mpic
To: Ben Collins <bcollins@kernel.org>
References: <2025042122-cute-skua-c6de4a@boujee-and-buff>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
Cc: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <2025042122-cute-skua-c6de4a@boujee-and-buff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Le 22/04/2025 à 04:35, Ben Collins a écrit :
> On PPC_32 QorIQ, the hwirq bitmap is done with the cascade being the most
> significant bits and the srs on the cascade being the least. This has the
> effect of filling up one cascade before the next.
> 
> Since each cascade has 32 srs and is tied to a single CPU and interrupt,
> this means no load balancing of MSIs.
> 
> Rework this case to translate between the bitmap and hwirq so that MSIs
> are allocated across the cascades round-robin to achieve load balancing.
> 
> Also, to avoid holes in the bitmap, allocate it for exactly what the
> hardware supports.
> 
> Tested on P4080 (which had the problem) and T4240 (which did not, but
> also no regressions).
> 
> Signed-off-by: Ben Collins <bcollins@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linux-kernel@vger.kernel.org

This patch doesn't apply:

$ LANG= b4 shazam 2025042122-cute-skua-c6de4a@boujee-and-buff
Grabbing thread from 
lore.kernel.org/all/2025042122-cute-skua-c6de4a@boujee-and-buff/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   [PATCH] fsl_msi: Translate bitmap to hwirq on fsl,mpic
---
Total patches: 1
---
Applying: fsl_msi: Translate bitmap to hwirq on fsl,mpic
Patch failed at 0001 fsl_msi: Translate bitmap to hwirq on fsl,mpic
error: patch failed: arch/powerpc/sysdev/fsl_msi.c:412
error: arch/powerpc/sysdev/fsl_msi.c: patch does not apply

Christophe

> ---
>   arch/powerpc/sysdev/fsl_msi.c | 232 ++++++++++++++++++++++++----------
>   arch/powerpc/sysdev/fsl_msi.h |   7 +-
>   2 files changed, 167 insertions(+), 72 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
> index 7b9a5ea9cad9d..37f2143187ee1 100644
> --- a/arch/powerpc/sysdev/fsl_msi.c
> +++ b/arch/powerpc/sysdev/fsl_msi.c
> @@ -29,17 +29,63 @@
>   #include "fsl_pci.h"
>   
>   #define MSIIR_OFFSET_MASK	0xfffff
> +
>   #define MSIIR_IBS_SHIFT		0
>   #define MSIIR_SRS_SHIFT		5
> +#define MSIIR_SRS_MASK		0x7
> +
>   #define MSIIR1_IBS_SHIFT	4
>   #define MSIIR1_SRS_SHIFT	0
> -#define MSI_SRS_MASK		0xf
> +#define MSIIR1_SRS_MASK		0xf
> +
>   #define MSI_IBS_MASK		0x1f
>   
> -#define msi_hwirq(msi, msir_index, intr_index) \
> -		((msir_index) << (msi)->srs_shift | \
> +#define MSI_MPIC_SIZE		0x10
> +#define MSI_IPIC_SIZE		0x04
> +
> +#define msi_to_hwirq(msi, msir_index, intr_index) \
> +		(((msir_index) << (msi)->srs_shift) | \
>   		 ((intr_index) << (msi)->ibs_shift))
>   
> +static inline int msi_to_bit(struct fsl_msi *msi, int msir_index, int intr_index)
> +{
> +	if (!msi->srs_shift)
> +		return msi_to_hwirq(msi, msir_index, intr_index);
> +
> +	return msir_index | (intr_index << hweight32(msi->srs_mask));
> +}
> +
> +static inline int bit_to_hwirq(struct fsl_msi *msi, int bit)
> +{
> +	int hwirq;
> +
> +	if (!msi->srs_shift)
> +		return bit;
> +
> +	hwirq  = (bit & msi->srs_mask) << msi->srs_shift;
> +	hwirq |=  bit >> hweight32(msi->srs_mask);
> +
> +	return hwirq;
> +}
> +
> +static inline int hwirq_to_bit(struct fsl_msi *msi, int hwirq)
> +{
> +	int bit;
> +
> +	if (!msi->srs_shift)
> +		return hwirq;
> +
> +	bit  = (hwirq >> msi->srs_shift) & msi->srs_mask;
> +	bit |= (hwirq & MSI_IBS_MASK) << msi->srs_shift;
> +
> +	return bit;
> +}
> +
> +#define hwirq_to_srs(msi, hwirq) \
> +		(((hwirq) >> (msi)->srs_shift) & (msi)->srs_mask)
> +#define hwirq_to_ibs(msi, hwirq) \
> +		(((hwirq) >> (msi)->ibs_shift) & MSI_IBS_MASK)
> +
>   static LIST_HEAD(msi_head);
>   
>   struct fsl_msi_feature {
> @@ -72,7 +118,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, struct seq_file *p)
>   	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
>   	int cascade_virq, srs;
>   
> -	srs = (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
> +	srs = hwirq_to_srs(msi_data, hwirq);
>   	cascade_virq = msi_data->cascade_array[srs]->virq;
>   
>   	seq_printf(p, "fsl-msi-%d", cascade_virq);
> @@ -107,8 +153,9 @@ static const struct irq_domain_ops fsl_msi_host_ops = {
>   static int fsl_msi_init_allocator(struct fsl_msi *msi_data)
>   {
>   	int rc, hwirq;
> +	int num_irqs = msi_data->nr_msi_regs * IRQS_PER_MSI_REG;
>   
> -	rc = msi_bitmap_alloc(&msi_data->bitmap, NR_MSI_IRQS_MAX,
> +	rc = msi_bitmap_alloc(&msi_data->bitmap, num_irqs,
>   			      irq_domain_get_of_node(msi_data->irqhost));
>   	if (rc)
>   		return rc;
> @@ -117,7 +164,7 @@ static int fsl_msi_init_allocator(struct fsl_msi *msi_data)
>   	 * Reserve all the hwirqs
>   	 * The available hwirqs will be released in fsl_msi_setup_hwirq()
>   	 */
> -	for (hwirq = 0; hwirq < NR_MSI_IRQS_MAX; hwirq++)
> +	for (hwirq = 0; hwirq < num_irqs; hwirq++)
>   		msi_bitmap_reserve_hwirq(&msi_data->bitmap, hwirq);
>   
>   	return 0;
> @@ -135,7 +182,8 @@ static void fsl_teardown_msi_irqs(struct pci_dev *pdev)
>   		irq_set_msi_desc(entry->irq, NULL);
>   		irq_dispose_mapping(entry->irq);
>   		entry->irq = 0;
> -		msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
> +		msi_bitmap_free_hwirqs(&msi_data->bitmap,
> +				       hwirq_to_bit(msi_data, hwirq), 1);
>   	}
>   }
>   
> @@ -171,44 +219,41 @@ static void fsl_compose_msi_msg(struct pci_dev *pdev, int hwirq,
>   	else
>   		msg->data = hwirq;
>   
> -	pr_debug("%s: allocated srs: %d, ibs: %d\n", __func__,
> -		 (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK,
> -		 (hwirq >> msi_data->ibs_shift) & MSI_IBS_MASK);
> +	pr_debug("%s: allocated srs: %i, ibs: %i\n", __func__,
> +		 hwirq_to_srs(msi_data, hwirq),
> +		 hwirq_to_ibs(msi_data, hwirq));
>   }
>   
> +#ifdef CONFIG_EPAPR_PARAVIRT
> +static const char * const of_msi_match[] = {
> +	"fsl,vmpic-msi",
> +	"fsl,vmpic-msi-v4.3",
> +	NULL,
> +};
> +#endif
> +
>   static int fsl_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
>   {
>   	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
>   	struct device_node *np;
> -	phandle phandle = 0;
> -	int rc, hwirq = -ENOMEM;
> +	int n_bit, bit = -ENOMEM;
>   	unsigned int virq;
>   	struct msi_desc *entry;
>   	struct msi_msg msg;
>   	struct fsl_msi *msi_data;
>   
> -	if (type == PCI_CAP_ID_MSI) {
> -		/*
> -		 * MPIC version 2.0 has erratum PIC1. For now MSI
> -		 * could not work. So check to prevent MSI from
> -		 * being used on the board with this erratum.
> -		 */
> -		list_for_each_entry(msi_data, &msi_head, list)
> -			if (msi_data->feature & MSI_HW_ERRATA_ENDIAN)
> -				return -EINVAL;
> -	}
> -
> +#ifdef CONFIG_EPAPR_PARAVIRT
> +	phandle ph = 0;
>   	/*
>   	 * If the PCI node has an fsl,msi property, then we need to use it
> -	 * to find the specific MSI.
> +	 * to find the specific MSI. This is deprecated on physical hardware
> +	 * and only used by ePAPR to restrict use of PAMU registered devices.
>   	 */
>   	np = of_parse_phandle(hose->dn, "fsl,msi", 0);
>   	if (np) {
> -		if (of_device_is_compatible(np, "fsl,mpic-msi") ||
> -		    of_device_is_compatible(np, "fsl,vmpic-msi") ||
> -		    of_device_is_compatible(np, "fsl,vmpic-msi-v4.3"))
> -			phandle = np->phandle;
> -		else {
> +		if (of_device_compatible_match(np, of_msi_match)) {
> +			ph = np->phandle;
> +		} else {
>   			dev_err(&pdev->dev,
>   				"node %pOF has an invalid fsl,msi phandle %u\n",
>   				hose->dn, np->phandle);
> @@ -217,54 +262,73 @@ static int fsl_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
>   		}
>   		of_node_put(np);
>   	}
> +#endif
>   
> +	/*
> +	 * fsl_teardown_msi_irqs() will cleanup already allocated descriptors if
> +	 * we return an error. Hence the lack of cleaning up previous
> +	 * iterations.
> +	 */
> +	n_bit = 0;
>   	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_NOTASSOCIATED) {
> +		int hwirq;
> +
> +		if (n_bit >= nvec)
> +			break;
> +
>   		/*
> -		 * Loop over all the MSI devices until we find one that has an
> +		 * Loop over all the MSI devices until we find one that has the
>   		 * available interrupt.
>   		 */
>   		list_for_each_entry(msi_data, &msi_head, list) {
>   			/*
> -			 * If the PCI node has an fsl,msi property, then we
> -			 * restrict our search to the corresponding MSI node.
> -			 * The simplest way is to skip over MSI nodes with the
> -			 * wrong phandle. Under the Freescale hypervisor, this
> -			 * has the additional benefit of skipping over MSI
> -			 * nodes that are not mapped in the PAMU.
> +			 * MPIC version 2.0 has erratum PIC1. For now MSI could not
> +			 * work. So check to prevent MSI from being used on the board
> +			 * with this erratum.
>   			 */
> -			if (phandle && (phandle != msi_data->phandle))
> +			if (type == PCI_CAP_ID_MSI &&
> +			    msi_data->feature & MSI_HW_ERRATA_ENDIAN)
>   				continue;
>   
> -			hwirq = msi_bitmap_alloc_hwirqs(&msi_data->bitmap, 1);
> -			if (hwirq >= 0)
> +#ifdef CONFIG_EPAPR_PARAVIRT
> +			/* Check for phandle on ePAPR */
> +			if (ph && (ph != msi_data->phandle))
> +				continue;
> +#endif
> +
> +			bit = msi_bitmap_alloc_hwirqs(&msi_data->bitmap, 1);
> +			if (bit >= 0)
>   				break;
>   		}
>   
> -		if (hwirq < 0) {
> -			rc = hwirq;
> -			dev_err(&pdev->dev, "could not allocate MSI interrupt\n");
> -			goto out_free;
> +		if (bit < 0) {
> +			dev_err(&pdev->dev,
> +				"could not allocate MSI interrupt\n");
> +			return bit;
>   		}
>   
> +		hwirq = bit_to_hwirq(msi_data, bit);
> +
>   		virq = irq_create_mapping(msi_data->irqhost, hwirq);
>   
>   		if (!virq) {
> -			dev_err(&pdev->dev, "fail mapping hwirq %i\n", hwirq);
> -			msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
> -			rc = -ENOSPC;
> -			goto out_free;
> +			dev_err(&pdev->dev, "failed to map hwirq %i\n", hwirq);
> +			msi_bitmap_free_hwirqs(&msi_data->bitmap, bit, 1);
> +			return -ENOSPC;
>   		}
> +
>   		/* chip_data is msi_data via host->hostdata in host->map() */
>   		irq_set_msi_desc(virq, entry);
>   
>   		fsl_compose_msi_msg(pdev, hwirq, &msg, msi_data);
>   		pci_write_msi_msg(virq, &msg);
> +
> +		n_bit++;
>   	}
> -	return 0;
>   
> -out_free:
> -	/* free by the caller of this function */
> -	return rc;
> +	WARN_ON(n_bit != nvec);
> +
> +	return 0;
>   }
>   
>   static irqreturn_t fsl_msi_cascade(int irq, void *data)
> @@ -284,10 +348,11 @@ static irqreturn_t fsl_msi_cascade(int irq, void *data)
>   	switch (msi_data->feature & FSL_PIC_IP_MASK) {
>   	case FSL_PIC_IP_MPIC:
>   		msir_value = fsl_msi_read(msi_data->msi_regs,
> -			msir_index * 0x10);
> +					  msir_index * MSI_MPIC_SIZE);
>   		break;
>   	case FSL_PIC_IP_IPIC:
> -		msir_value = fsl_msi_read(msi_data->msi_regs, msir_index * 0x4);
> +		msir_value = fsl_msi_read(msi_data->msi_regs,
> +					  msir_index * MSI_IPIC_SIZE);
>   		break;
>   #ifdef CONFIG_EPAPR_PARAVIRT
>   	case FSL_PIC_IP_VMPIC: {
> @@ -308,18 +373,31 @@ static irqreturn_t fsl_msi_cascade(int irq, void *data)
>   		intr_index = ffs(msir_value) - 1;
>   
>   		err = generic_handle_domain_irq(msi_data->irqhost,
> -				msi_hwirq(msi_data, msir_index,
> +				msi_to_hwirq(msi_data, msir_index,
>   					  intr_index + have_shift));
>   		if (!err)
>   			ret = IRQ_HANDLED;
>   
> -		have_shift += intr_index + 1;
> -		msir_value = msir_value >> (intr_index + 1);
> +		have_shift  += intr_index + 1;
> +		msir_value >>= intr_index + 1;
>   	}
>   
>   	return ret;
>   }
>   
> +static ssize_t irq_bitmap_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct fsl_msi *msi = dev_get_drvdata(dev);
> +
> +	if (msi->bitmap.bitmap == NULL)
> +		return 0;
> +
> +	return bitmap_print_to_pagebuf(false, buf, msi->bitmap.bitmap,
> +				       msi->bitmap.irq_count);
> +}
> +static DEVICE_ATTR_RO(irq_bitmap);
> +
>   static void fsl_of_msi_remove(struct platform_device *ofdev)
>   {
>   	struct fsl_msi *msi = platform_get_drvdata(ofdev);
> @@ -327,7 +405,10 @@ static void fsl_of_msi_remove(struct platform_device *ofdev)
>   
>   	if (msi->list.prev != NULL)
>   		list_del(&msi->list);
> -	for (i = 0; i < NR_MSI_REG_MAX; i++) {
> +
> +	device_remove_file(&ofdev->dev, &dev_attr_irq_bitmap);
> +
> +	for (i = 0; i < msi->nr_msi_regs; i++) {
>   		if (msi->cascade_array[i]) {
>   			virq = msi->cascade_array[i]->virq;
>   
> @@ -382,14 +463,16 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_device *dev,
>   	}
>   
>   	/* Release the hwirqs corresponding to this MSI register */
> -	for (i = 0; i < IRQS_PER_MSI_REG; i++)
> +	for (i = 0; i < IRQS_PER_MSI_REG; i++) {
>   		msi_bitmap_free_hwirqs(&msi->bitmap,
> -				       msi_hwirq(msi, offset, i), 1);
> +				       msi_to_bit(msi, offset, i), 1);
> +	}
>   
>   	return 0;
>   }
>   
>   static const struct of_device_id fsl_of_msi_ids[];
> +
>   static int fsl_of_msi_probe(struct platform_device *dev)
>   {
>   	struct fsl_msi *msi;
> @@ -412,8 +495,27 @@ static int fsl_of_msi_probe(struct platform_device *dev)
>   	}
>   	platform_set_drvdata(dev, msi);
>   
> +	if (device_create_file(&dev->dev, &dev_attr_irq_bitmap)) {
> +		dev_err(&dev->dev,
> +			"couldn't create device file for irq_bitmap\n");
> +	}
> +
> +	if (of_device_is_compatible(dev->dev.of_node, "fsl,mpic-msi-v4.3") ||
> +	    of_device_is_compatible(dev->dev.of_node, "fsl,vmpic-msi-v4.3")) {
> +		msi->nr_msi_regs = NR_MSI_REG_MSIIR1;
> +		msi->ibs_shift   = MSIIR1_IBS_SHIFT;
> +		msi->srs_mask    = MSIIR1_SRS_MASK;
> +		msi->srs_shift   = MSIIR1_SRS_SHIFT;
> +	} else {
> +		msi->nr_msi_regs = NR_MSI_REG_MSIIR;
> +		msi->ibs_shift   = MSIIR_IBS_SHIFT;
> +		msi->srs_mask    = MSIIR_SRS_MASK;
> +		msi->srs_shift   = MSIIR_SRS_SHIFT;
> +	}
> +
>   	msi->irqhost = irq_domain_add_linear(dev->dev.of_node,
> -				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
> +					msi->nr_msi_regs * IRQS_PER_MSI_REG,
> +					&fsl_msi_host_ops, msi);
>   
>   	if (msi->irqhost == NULL) {
>   		dev_err(&dev->dev, "No memory for MSI irqhost\n");
> @@ -440,8 +542,6 @@ static int fsl_of_msi_probe(struct platform_device *dev)
>   				dev->dev.of_node);
>   			goto error_out;
>   		}
> -		msi->msiir_offset =
> -			features->msiir_offset + (res.start & 0xfffff);
>   
>   		/*
>   		 * First read the MSIIR/MSIIR1 offset from dts
> @@ -475,10 +575,7 @@ static int fsl_of_msi_probe(struct platform_device *dev)
>   
>   	p = of_get_property(dev->dev.of_node, "msi-available-ranges", &len);
>   
> -	if (of_device_is_compatible(dev->dev.of_node, "fsl,mpic-msi-v4.3") ||
> -	    of_device_is_compatible(dev->dev.of_node, "fsl,vmpic-msi-v4.3")) {
> -		msi->srs_shift = MSIIR1_SRS_SHIFT;
> -		msi->ibs_shift = MSIIR1_IBS_SHIFT;
> +	if (msi->nr_msi_regs == NR_MSI_REG_MSIIR1) {
>   		if (p)
>   			dev_warn(&dev->dev, "%s: dose not support msi-available-ranges property\n",
>   				__func__);
> @@ -494,9 +591,6 @@ static int fsl_of_msi_probe(struct platform_device *dev)
>   		static const u32 all_avail[] =
>   			{ 0, NR_MSI_REG_MSIIR * IRQS_PER_MSI_REG };
>   
> -		msi->srs_shift = MSIIR_SRS_SHIFT;
> -		msi->ibs_shift = MSIIR_IBS_SHIFT;
> -
>   		if (p && len % (2 * sizeof(u32)) != 0) {
>   			dev_err(&dev->dev, "%s: Malformed msi-available-ranges property\n",
>   				__func__);
> diff --git a/arch/powerpc/sysdev/fsl_msi.h b/arch/powerpc/sysdev/fsl_msi.h
> index e2a1bfc7c2377..0515030af9acb 100644
> --- a/arch/powerpc/sysdev/fsl_msi.h
> +++ b/arch/powerpc/sysdev/fsl_msi.h
> @@ -15,7 +15,6 @@
>   #define NR_MSI_REG_MSIIR1	16 /* MSIIR1 can index 16 MSI registers */
>   #define NR_MSI_REG_MAX		NR_MSI_REG_MSIIR1
>   #define IRQS_PER_MSI_REG	32
> -#define NR_MSI_IRQS_MAX	(NR_MSI_REG_MAX * IRQS_PER_MSI_REG)
>   
>   #define FSL_PIC_IP_MASK   0x0000000F
>   #define FSL_PIC_IP_MPIC   0x00000001
> @@ -32,11 +31,13 @@ struct fsl_msi {
>   	unsigned long cascade_irq;
>   
>   	u32 msiir_offset; /* Offset of MSIIR, relative to start of CCSR */
> -	u32 ibs_shift; /* Shift of interrupt bit select */
> -	u32 srs_shift; /* Shift of the shared interrupt register select */
> +	u32 ibs_shift;    /* Shift of interrupt bit select */
> +	u32 srs_mask;     /* Mask of the shared interrupt register select */
> +	u32 srs_shift;    /* Shift for shared interrupt register select */
>   	void __iomem *msi_regs;
>   	u32 feature;
>   	struct fsl_msi_cascade_data *cascade_array[NR_MSI_REG_MAX];
> +	u32 nr_msi_regs;
>   
>   	struct msi_bitmap bitmap;
>   
--
pw-bot: cr

