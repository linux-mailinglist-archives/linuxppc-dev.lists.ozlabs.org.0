Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE262C466
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:29:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7mG21Dzz3fMG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:29:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=epxWFDk7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=epxWFDk7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7hv5dQFz3dvT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:26:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E280DB81DEA;
	Wed, 16 Nov 2022 16:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557FBC433D6;
	Wed, 16 Nov 2022 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615979;
	bh=73LMr939EWHPt+TPzYln4/nGtq+P1TBpXelJNWyyGSw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=epxWFDk7HPFmaZbjDCJ/ydB3mEoQMH2j2yq0y0yM+vh4Ncs5Axxm3vHFp/z0m8QO6
	 +h5qF/vT2V3jfzyKyhJErOVm5EzgpAv/iAcbfQEBLr9kpS8GvqamucPk5Ck9uYNS32
	 QhA/pgN8B8KBzNYipQnqqdIrni5bENZVQugvGtmj+tanFnlbZqD5t9dxthWSNiI85n
	 +OHTEvmWILrt4VKS0LCh4ka9s9FD9PdCar5liUHDakWYHaVQGkspn6xbd2LyoaYD5J
	 r2MMCspMk/5CkyNDskzxCPUfhro4JgY3PryiLpoYF8kczw9WLBRxHWI+CbN2aI/3rj
	 MGQB7KX2ICXeQ==
Date: Wed, 16 Nov 2022 10:26:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 27/39] PCI/MSI: Move pci_disable_msix() to api.c
Message-ID: <20221116162617.GA1115753@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.156785224@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:58PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_disable_msix() and make its kernel-doc comprehensive.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Trivial question below.

> ---
>  drivers/pci/msi/api.c | 24 ++++++++++++++++++++++++
>  drivers/pci/msi/msi.c | 14 +-------------
>  drivers/pci/msi/msi.h |  1 +
>  3 files changed, 26 insertions(+), 13 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 83ea38ffa116..653a61868ae6 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -112,6 +112,30 @@ int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
>  EXPORT_SYMBOL(pci_enable_msix_range);
>  
>  /**
> + * pci_disable_msix() - Disable MSI-X interrupt mode on device
> + * @dev: the PCI device to operate on
> + *
> + * Legacy device driver API to disable MSI-X interrupt mode on device,
> + * free earlier-allocated interrupt vectors, and restore INTx emulation.

Isn't INTx *emulation* a PCIe implementation detail?  Doesn't seem
relevant to callers that it's emulated.

> + * The PCI device Linux IRQ (@dev->irq) is restored to its default pin
> + * assertion IRQ. This is the cleanup pair of pci_enable_msix_range().
> + *
> + * NOTE: The newer pci_alloc_irq_vectors() / pci_free_irq_vectors() API
> + * pair should, in general, be used instead.
> + */
> +void pci_disable_msix(struct pci_dev *dev)
> +{
> +	if (!pci_msi_enabled() || !dev || !dev->msix_enabled)
> +		return;
> +
> +	msi_lock_descs(&dev->dev);
> +	pci_msix_shutdown(dev);
> +	pci_free_msi_irqs(dev);
> +	msi_unlock_descs(&dev->dev);
> +}
> +EXPORT_SYMBOL(pci_disable_msix);
> +
> +/**
>   * pci_alloc_irq_vectors() - Allocate multiple device interrupt vectors
>   * @dev:      the PCI device to operate on
>   * @min_vecs: minimum required number of vectors (must be >= 1)
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 1226d66da992..6fa90d07d2e4 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -736,7 +736,7 @@ static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
>  	return msix_capability_init(dev, entries, nvec, affd);
>  }
>  
> -static void pci_msix_shutdown(struct pci_dev *dev)
> +void pci_msix_shutdown(struct pci_dev *dev)
>  {
>  	struct msi_desc *desc;
>  
> @@ -758,18 +758,6 @@ static void pci_msix_shutdown(struct pci_dev *dev)
>  	pcibios_alloc_irq(dev);
>  }
>  
> -void pci_disable_msix(struct pci_dev *dev)
> -{
> -	if (!pci_msi_enable || !dev || !dev->msix_enabled)
> -		return;
> -
> -	msi_lock_descs(&dev->dev);
> -	pci_msix_shutdown(dev);
> -	pci_free_msi_irqs(dev);
> -	msi_unlock_descs(&dev->dev);
> -}
> -EXPORT_SYMBOL(pci_disable_msix);
> -
>  int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  			   struct irq_affinity *affd)
>  {
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index 8c4a5289432d..77e2587f7e4f 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -86,6 +86,7 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
>  
>  /* MSI internal functions invoked from the public APIs */
>  void pci_msi_shutdown(struct pci_dev *dev);
> +void pci_msix_shutdown(struct pci_dev *dev);
>  void pci_free_msi_irqs(struct pci_dev *dev);
>  int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
>  int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
> 
