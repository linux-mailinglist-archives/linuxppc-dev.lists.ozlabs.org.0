Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33E862C44B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7h74bhVz3f9c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OCEybrea;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OCEybrea;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7dT6RhPz3f9X
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:23:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30B8661ED9;
	Wed, 16 Nov 2022 16:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B018DC433D6;
	Wed, 16 Nov 2022 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615804;
	bh=2nU4MOObR9A/jOY+gjTU6v5hsEY4DPvkpe3RAEIYrlw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OCEybreaEgPYv/BqqRQ3ZprA2wF/mVzqFWMumzorrbm9PwwgyP2gavOSf3bXBTbLE
	 ePQqu0Hxh+lTVX6IwG1qssPlkUNH0UhWlk2gmyGNirw24RU/a0IUz/57H2ulW1ImpD
	 CrAkBgVxk8hU5EJt2bYGJWmJiLaVQNmU0Y6VTWTg8uxTgd4Ah3ryYfAnoqbk7I2QuD
	 XHa1mYUrVQkZWcgA4nU8ME8AdPQQNueWAnSJj137wmV1aNju4nKcmF1DS85e6CVYu7
	 TA8/Obo8DyRGKKtBELLz9s749ma9CqfVHJ1VvOyWOO5kPua5q5sj4VGjXmvVzskirS
	 xnbhC+QUV1wvw==
Date: Wed, 16 Nov 2022 10:23:22 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 23/39] PCI/MSI: Move pci_alloc_irq_vectors_affinity() to
 api.c
Message-ID: <20221116162322.GA1115421@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.927531290@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:51PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_alloc_irq_vectors_affinity() and let its kernel-doc reference
> pci_alloc_irq_vectors() documentation added in parent commit.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

One question below.

> ---
>  drivers/pci/msi/api.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/pci/msi/msi.c | 65 +----------------------------------------------------
>  2 files changed, 59 insertions(+), 65 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 1714905943fb..8546749afa6e 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -123,3 +123,62 @@ int pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  					      flags, NULL);
>  }
>  EXPORT_SYMBOL(pci_alloc_irq_vectors);
> +
> +/**
> + * pci_alloc_irq_vectors_affinity() - Allocate multiple device interrupt
> + *                                    vectors with affinity requirements
> + * @dev:      the PCI device to operate on
> + * @min_vecs: minimum required number of vectors (must be >= 1)
> + * @max_vecs: maximum desired number of vectors
> + * @flags:    allocation flags, as in pci_alloc_irq_vectors()
> + * @affd:     affinity requirements (can be %NULL).
> + *
> + * Same as pci_alloc_irq_vectors(), but with the extra @affd parameter.
> + * Check that function docs, and &struct irq_affinity, for more details.

Is "&struct irq_affinity" some kernel-doc syntax, or is the "&"
superfluous?

> + */
> +int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
> +				   unsigned int max_vecs, unsigned int flags,
> +				   struct irq_affinity *affd)
> +{
> +	struct irq_affinity msi_default_affd = {0};
> +	int nvecs = -ENOSPC;
> +
> +	if (flags & PCI_IRQ_AFFINITY) {
> +		if (!affd)
> +			affd = &msi_default_affd;
> +	} else {
> +		if (WARN_ON(affd))
> +			affd = NULL;
> +	}
> +
> +	if (flags & PCI_IRQ_MSIX) {
> +		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
> +						affd, flags);
> +		if (nvecs > 0)
> +			return nvecs;
> +	}
> +
> +	if (flags & PCI_IRQ_MSI) {
> +		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd);
> +		if (nvecs > 0)
> +			return nvecs;
> +	}
> +
> +	/* use legacy IRQ if allowed */
> +	if (flags & PCI_IRQ_LEGACY) {
> +		if (min_vecs == 1 && dev->irq) {
> +			/*
> +			 * Invoke the affinity spreading logic to ensure that
> +			 * the device driver can adjust queue configuration
> +			 * for the single interrupt case.
> +			 */
> +			if (affd)
> +				irq_create_affinity_masks(1, affd);
> +			pci_intx(dev, 1);
> +			return 1;
> +		}
> +	}
> +
> +	return nvecs;
> +}
> +EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 6700ef1c734e..a028774f438d 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -887,71 +887,6 @@ int __pci_enable_msix_range(struct pci_dev *dev,
>  }
>  
>  /**
> - * pci_alloc_irq_vectors_affinity - allocate multiple IRQs for a device
> - * @dev:		PCI device to operate on
> - * @min_vecs:		minimum number of vectors required (must be >= 1)
> - * @max_vecs:		maximum (desired) number of vectors
> - * @flags:		flags or quirks for the allocation
> - * @affd:		optional description of the affinity requirements
> - *
> - * Allocate up to @max_vecs interrupt vectors for @dev, using MSI-X or MSI
> - * vectors if available, and fall back to a single legacy vector
> - * if neither is available.  Return the number of vectors allocated,
> - * (which might be smaller than @max_vecs) if successful, or a negative
> - * error code on error. If less than @min_vecs interrupt vectors are
> - * available for @dev the function will fail with -ENOSPC.
> - *
> - * To get the Linux IRQ number used for a vector that can be passed to
> - * request_irq() use the pci_irq_vector() helper.
> - */
> -int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
> -				   unsigned int max_vecs, unsigned int flags,
> -				   struct irq_affinity *affd)
> -{
> -	struct irq_affinity msi_default_affd = {0};
> -	int nvecs = -ENOSPC;
> -
> -	if (flags & PCI_IRQ_AFFINITY) {
> -		if (!affd)
> -			affd = &msi_default_affd;
> -	} else {
> -		if (WARN_ON(affd))
> -			affd = NULL;
> -	}
> -
> -	if (flags & PCI_IRQ_MSIX) {
> -		nvecs = __pci_enable_msix_range(dev, NULL, min_vecs, max_vecs,
> -						affd, flags);
> -		if (nvecs > 0)
> -			return nvecs;
> -	}
> -
> -	if (flags & PCI_IRQ_MSI) {
> -		nvecs = __pci_enable_msi_range(dev, min_vecs, max_vecs, affd);
> -		if (nvecs > 0)
> -			return nvecs;
> -	}
> -
> -	/* use legacy IRQ if allowed */
> -	if (flags & PCI_IRQ_LEGACY) {
> -		if (min_vecs == 1 && dev->irq) {
> -			/*
> -			 * Invoke the affinity spreading logic to ensure that
> -			 * the device driver can adjust queue configuration
> -			 * for the single interrupt case.
> -			 */
> -			if (affd)
> -				irq_create_affinity_masks(1, affd);
> -			pci_intx(dev, 1);
> -			return 1;
> -		}
> -	}
> -
> -	return nvecs;
> -}
> -EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
> -
> -/**
>   * pci_free_irq_vectors - free previously allocated IRQs for a device
>   * @dev:		PCI device to operate on
>   *
> 
