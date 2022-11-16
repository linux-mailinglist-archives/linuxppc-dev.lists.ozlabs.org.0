Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B80B62C4CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:39:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7zb27N0z3f9X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vKfW/nDm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vKfW/nDm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7vF4jtpz3fP1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:35:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE0EB61EDC;
	Wed, 16 Nov 2022 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428B7C433C1;
	Wed, 16 Nov 2022 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616519;
	bh=7lFiLHolyMGn6ahDnXfEkllCx/9ERpAkWUrxM/p/G9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=vKfW/nDmof5x1qGUsktU3mydNWRx1u9bhEjDkmydS/VWh2/xpfykSTgYa0kamGUhs
	 bcf4kbzL85OpNgLTrOvOh2UUslQaypX7mNoM45JtDtpIR9zGOMomS1Wbgw/7SKDPN4
	 tmmP8HT71SQQ/UEzl1sAGcxs9eJGv6KNlSc2olb8MF1WxILw0MgJgAWcPuFl5kwj+D
	 z1yQ/14WNHo/iN+pJsOviHJqamoR8SJpWPJkbpE+qQ1QygN0RcDV4cGduF02vI7YZw
	 lK5hdTJWQSFr8k6/I1uRD95isxwVgodYtg33kYJPfe+evfsZclOWu/OCv1fd5mGqma
	 E+ENti03HPFZQ==
Date: Wed, 16 Nov 2022 10:35:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 28/39] PCI/MSI: Move pci_irq_get_affinity() to api.c
Message-ID: <20221116163517.GA1116781@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.214792769@linutronix.de>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:59PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_irq_get_affinity() and let its kernel-doc match rest of the
> file.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

One nit below.

> ---
>  drivers/pci/msi/api.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/msi/msi.c | 38 --------------------------------------
>  2 files changed, 43 insertions(+), 38 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 653a61868ae6..473df7ba0584 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/export.h>
> +#include <linux/irq.h>
>  
>  #include "msi.h"
>  
> @@ -251,6 +252,48 @@ int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
>  EXPORT_SYMBOL(pci_irq_vector);
>  
>  /**
> + * pci_irq_get_affinity() - Get a device interrupt vector affinity
> + * @dev: the PCI device to operate on
> + * @nr:  device-relative interrupt vector index (0-based); has different
> + *       meanings, depending on interrupt mode
> + *         MSI-X        the index in the MSI-X vector table
> + *         MSI          the index of the enabled MSI vectors
> + *         INTx         must be 0
> + *
> + * Return: MSI/MSI-X vector affinity, NULL if @nr is out of range or if
> + * the MSI(-X) vector was allocated without explicit affinity
> + * requirements (e.g., by pci_enable_msi(), pci_enable_msix_range(), or
> + * pci_alloc_irq_vectors() without the %PCI_IRQ_AFFINITY flag). Return a
> + * generic set of CPU ids representing all possible CPUs available
> + * during system boot if the device is in legacy INTx mode.

s/ids/IDs/

> + */
> +const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
> +{
> +	int idx, irq = pci_irq_vector(dev, nr);
> +	struct msi_desc *desc;
> +
> +	if (WARN_ON_ONCE(irq <= 0))
> +		return NULL;
> +
> +	desc = irq_get_msi_desc(irq);
> +	/* Non-MSI does not have the information handy */
> +	if (!desc)
> +		return cpu_possible_mask;
> +
> +	/* MSI[X] interrupts can be allocated without affinity descriptor */
> +	if (!desc->affinity)
> +		return NULL;
> +
> +	/*
> +	 * MSI has a mask array in the descriptor.
> +	 * MSI-X has a single mask.
> +	 */
> +	idx = dev->msi_enabled ? nr : 0;
> +	return &desc->affinity[idx].mask;
> +}
> +EXPORT_SYMBOL(pci_irq_get_affinity);
> +
> +/**
>   * pci_free_irq_vectors() - Free previously allocated IRQs for a device
>   * @dev: the PCI device to operate on
>   *
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 6fa90d07d2e4..d78646d1c116 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -854,44 +854,6 @@ int __pci_enable_msix_range(struct pci_dev *dev,
>  	}
>  }
>  
> -/**
> - * pci_irq_get_affinity - return the affinity of a particular MSI vector
> - * @dev:	PCI device to operate on
> - * @nr:		device-relative interrupt vector index (0-based).
> - *
> - * @nr has the following meanings depending on the interrupt mode:
> - *   MSI-X:	The index in the MSI-X vector table
> - *   MSI:	The index of the enabled MSI vectors
> - *   INTx:	Must be 0
> - *
> - * Return: A cpumask pointer or NULL if @nr is out of range
> - */
> -const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
> -{
> -	int idx, irq = pci_irq_vector(dev, nr);
> -	struct msi_desc *desc;
> -
> -	if (WARN_ON_ONCE(irq <= 0))
> -		return NULL;
> -
> -	desc = irq_get_msi_desc(irq);
> -	/* Non-MSI does not have the information handy */
> -	if (!desc)
> -		return cpu_possible_mask;
> -
> -	/* MSI[X] interrupts can be allocated without affinity descriptor */
> -	if (!desc->affinity)
> -		return NULL;
> -
> -	/*
> -	 * MSI has a mask array in the descriptor.
> -	 * MSI-X has a single mask.
> -	 */
> -	idx = dev->msi_enabled ? nr : 0;
> -	return &desc->affinity[idx].mask;
> -}
> -EXPORT_SYMBOL(pci_irq_get_affinity);
> -
>  struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc)
>  {
>  	return to_pci_dev(desc->dev);
> 
