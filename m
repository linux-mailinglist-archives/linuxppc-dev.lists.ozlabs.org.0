Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA42D62C3EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7Yl56Dfz3f8X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:20:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FlscaLWa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FlscaLWa;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7X35jrBz3cQk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:18:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53F9361E6A;
	Wed, 16 Nov 2022 16:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73DAC433D6;
	Wed, 16 Nov 2022 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615521;
	bh=xsQa1DiNL/6zsloEcEu6Ukvgx+aoLHbVelli9P0JdkE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FlscaLWaTxDQUiFYrKfxiw8Is512INpNfhSwD6LYRM/LnWLISkfHWVCN+HI/HB9Py
	 CsOhz4ZFu9t7L185gW+tLdKnqOtA3Vi5HLkuAa1nZI7K6BAv9o39vy1Lv1qTxuBuGQ
	 KyiF119c19UlukBK0owCVhyFtkaOtpHJI6YvfTw/wRpXfbq0DchoKF8zCS3SR5PP3q
	 ZwhtzlykAPL9KZKn5sXdOJ5n5ZirM7s3EoBn1D84oSCdfUjX2DfIIqirJqJOU53hDC
	 R07my9UXS+C1zX0eVsWpoRdG26lfCPZWHT7PBdtjzRHCgNFiNEyVCzm12MEAqnv7fj
	 ixetgCl6U1k3g==
Date: Wed, 16 Nov 2022 10:18:39 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 20/39] PCI/MSI: Move pci_enable_msi() API to api.c
Message-ID: <20221116161839.GA1115061@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.755178149@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:46PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c all exported device-driver MSI APIs are now
> to be grouped in one file, api.c.
> 
> Move pci_enable_msi() and make its kernel-doc comprehensive.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Nit: suggest "disentangle" or "untangle" for "distangle" here and in
subsequent patches.

> ---
>  drivers/pci/msi/api.c | 23 +++++++++++++++++++++++
>  drivers/pci/msi/msi.c | 14 ++------------
>  drivers/pci/msi/msi.h |  1 +
>  3 files changed, 26 insertions(+), 12 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 7485942cbe5d..63d7f8f6a284 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -13,6 +13,29 @@
>  #include "msi.h"
>  
>  /**
> + * pci_enable_msi() - Enable MSI interrupt mode on device
> + * @dev: the PCI device to operate on
> + *
> + * Legacy device driver API to enable MSI interrupts mode on device and
> + * allocate a single interrupt vector. On success, the allocated vector
> + * Linux IRQ will be saved at @dev->irq. The driver must invoke
> + * pci_disable_msi() on cleanup.
> + *
> + * NOTE: The newer pci_alloc_irq_vectors() / pci_free_irq_vectors() API
> + * pair should, in general, be used instead.
> + *
> + * Return: 0 on success, errno otherwise
> + */
> +int pci_enable_msi(struct pci_dev *dev)
> +{
> +	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
> +	if (rc < 0)
> +		return rc;
> +	return 0;
> +}
> +EXPORT_SYMBOL(pci_enable_msi);
> +
> +/**
>   * pci_disable_msi() - Disable MSI interrupt mode on device
>   * @dev: the PCI device to operate on
>   *
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 4a1300b74518..98f07ad9af62 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -790,8 +790,8 @@ void pci_disable_msix(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL(pci_disable_msix);
>  
> -static int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
> -				  struct irq_affinity *affd)
> +int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
> +			   struct irq_affinity *affd)
>  {
>  	int nvec;
>  	int rc;
> @@ -844,16 +844,6 @@ static int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	}
>  }
>  
> -/* deprecated, don't use */
> -int pci_enable_msi(struct pci_dev *dev)
> -{
> -	int rc = __pci_enable_msi_range(dev, 1, 1, NULL);
> -	if (rc < 0)
> -		return rc;
> -	return 0;
> -}
> -EXPORT_SYMBOL(pci_enable_msi);
> -
>  static int __pci_enable_msix_range(struct pci_dev *dev,
>  				   struct msix_entry *entries, int minvec,
>  				   int maxvec, struct irq_affinity *affd,
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index 634879277349..00bb98d5bb0e 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -87,6 +87,7 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
>  /* MSI internal functions invoked from the public APIs */
>  void pci_msi_shutdown(struct pci_dev *dev);
>  void pci_free_msi_irqs(struct pci_dev *dev);
> +int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
>  
>  /* Legacy (!IRQDOMAIN) fallbacks */
>  #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
> 
