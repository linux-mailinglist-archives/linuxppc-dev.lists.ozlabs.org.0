Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6F62C3F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7Zl2r3Zz3dts
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mpKmZmtb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mpKmZmtb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7Yq4hLwz3cK7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:20:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D883B81DDB;
	Wed, 16 Nov 2022 16:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D5EC433D6;
	Wed, 16 Nov 2022 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615611;
	bh=X2C68F6q+wNuxGuKjgaLTWW+7T0jqD6TQBHmxJHvCls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mpKmZmtb694pYOb3OIpj770lfq9Syc2gJH9Fq9VGYEi9b0ro695T1OtPaujdLCDyc
	 U9DVRo3n7QcdLtaqqHCo0c+tMMj9V8bGs7Gun02LNGwzjZuI09Jr4Nn2muenuWQ0pc
	 uPX5MKjE6ujs+AKWS1FfMDVvYRjD4chlTJc3NhjRzlOBbfHtMpvcTdKjNyfWYjae/y
	 BgJDfjvlr4kDY1rs+rlKejlnZ5WJPr+XmyXhG1FEZ49J1Wyj7jk1vzgpXf+xcP9Zd/
	 mnHjvNAgyI7QPRrx5yGiD8owvqpx5B+CCHXKZLIp1xM42kwoX+pWoEmLrOT9PykCyA
	 8NX7uGQFq+qfg==
Date: Wed, 16 Nov 2022 10:20:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 21/39] PCI/MSI: Move pci_enable_msix_range() to api.c
Message-ID: <20221116162010.GA1115209@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.813792885@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:48PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_enable_msix_range() and make its kernel-doc comprehensive.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/api.c | 32 ++++++++++++++++++++++++++++++++
>  drivers/pci/msi/msi.c | 30 ++++--------------------------
>  drivers/pci/msi/msi.h |  3 +++
>  3 files changed, 39 insertions(+), 26 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 63d7f8f6a284..d48050555d55 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -58,3 +58,35 @@ void pci_disable_msi(struct pci_dev *dev)
>  	msi_unlock_descs(&dev->dev);
>  }
>  EXPORT_SYMBOL(pci_disable_msi);
> +
> +/**
> + * pci_enable_msix_range() - Enable MSI-X interrupt mode on device
> + * @dev:     the PCI device to operate on
> + * @entries: input/output parameter, array of MSI-X configuration entries
> + * @minvec:  minimum required number of MSI-X vectors
> + * @maxvec:  maximum desired number of MSI-X vectors
> + *
> + * Legacy device driver API to enable MSI-X interrupt mode on device and
> + * configure its MSI-X capability structure as appropriate.  The passed
> + * @entries array must have each of its members "entry" field set to a
> + * desired (valid) MSI-X vector number, where the range of valid MSI-X
> + * vector numbers can be queried through pci_msix_vec_count().  If
> + * successful, the driver must invoke pci_disable_msix() on cleanup.
> + *
> + * NOTE: The newer pci_alloc_irq_vectors() / pci_free_irq_vectors() API
> + * pair should, in general, be used instead.
> + *
> + * Return: number of MSI-X vectors allocated (which might be smaller
> + * than @maxvecs), where Linux IRQ numbers for such allocated vectors
> + * are saved back in the @entries array elements' "vector" field. Return
> + * -ENOSPC if less than @minvecs interrupt vectors are available.
> + * Return -EINVAL if one of the passed @entries members "entry" field
> + * was invalid or a duplicate, or if plain MSI interrupts mode was
> + * earlier enabled on device. Return other errnos otherwise.
> + */
> +int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
> +			  int minvec, int maxvec)
> +{
> +	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
> +}
> +EXPORT_SYMBOL(pci_enable_msix_range);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 98f07ad9af62..6700ef1c734e 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -844,10 +844,10 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	}
>  }
>  
> -static int __pci_enable_msix_range(struct pci_dev *dev,
> -				   struct msix_entry *entries, int minvec,
> -				   int maxvec, struct irq_affinity *affd,
> -				   int flags)
> +int __pci_enable_msix_range(struct pci_dev *dev,
> +			    struct msix_entry *entries, int minvec,
> +			    int maxvec, struct irq_affinity *affd,
> +			    int flags)
>  {
>  	int rc, nvec = maxvec;
>  
> @@ -887,28 +887,6 @@ static int __pci_enable_msix_range(struct pci_dev *dev,
>  }
>  
>  /**
> - * pci_enable_msix_range - configure device's MSI-X capability structure
> - * @dev: pointer to the pci_dev data structure of MSI-X device function
> - * @entries: pointer to an array of MSI-X entries
> - * @minvec: minimum number of MSI-X IRQs requested
> - * @maxvec: maximum number of MSI-X IRQs requested
> - *
> - * Setup the MSI-X capability structure of device function with a maximum
> - * possible number of interrupts in the range between @minvec and @maxvec
> - * upon its software driver call to request for MSI-X mode enabled on its
> - * hardware device function. It returns a negative errno if an error occurs.
> - * If it succeeds, it returns the actual number of interrupts allocated and
> - * indicates the successful configuration of MSI-X capability structure
> - * with new allocated MSI-X interrupts.
> - **/
> -int pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries,
> -		int minvec, int maxvec)
> -{
> -	return __pci_enable_msix_range(dev, entries, minvec, maxvec, NULL, 0);
> -}
> -EXPORT_SYMBOL(pci_enable_msix_range);
> -
> -/**
>   * pci_alloc_irq_vectors_affinity - allocate multiple IRQs for a device
>   * @dev:		PCI device to operate on
>   * @min_vecs:		minimum number of vectors required (must be >= 1)
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index 00bb98d5bb0e..8c4a5289432d 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -88,8 +88,11 @@ static inline __attribute_const__ u32 msi_multi_mask(struct msi_desc *desc)
>  void pci_msi_shutdown(struct pci_dev *dev);
>  void pci_free_msi_irqs(struct pci_dev *dev);
>  int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec, struct irq_affinity *affd);
> +int __pci_enable_msix_range(struct pci_dev *dev, struct msix_entry *entries, int minvec,
> +			    int maxvec,  struct irq_affinity *affd, int flags);
>  
>  /* Legacy (!IRQDOMAIN) fallbacks */
> +
>  #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
>  int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
>  void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev);
> 
