Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8256262C462
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7lG32Kyz3fKb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:28:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CGfT9Euj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CGfT9Euj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7g76LY2z3f6M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:24:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B069861EC5;
	Wed, 16 Nov 2022 16:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3483C433C1;
	Wed, 16 Nov 2022 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615889;
	bh=5g+lcRTgojvcHO75iDpTjlaYEoDk4vaOgEIAFKquvjM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CGfT9EujGvvtjcam7zJkxMdubgo56iBrswn0DlhLFS3nOTHL1qm3LwBUMO05J3w6H
	 1GeFR/VxrTv0g2tCX5oiDoRupCot1sfREV2psK7cDcKLuGqEkLqI7oddjNKarF1+zM
	 JEac4McFFKKpbTQbNkJUiP5aacLCSrn+xE0MZi9s7/g5oTufE8wmvvxlCz8DFrH8Gv
	 jLRj5SGvcYknM0Blv/Fn5U5HcI3irfG45BEnTEwPgtwh0pAb7RTJcLtnrtT7FWU60E
	 YReC72piHkL32yXPlfDvvvl78qjUseY6DiIACDvpzvJHN6uFGSeVeH95OB/3xcv3i3
	 fkQvwqB8am0JQ==
Date: Wed, 16 Nov 2022 10:24:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 26/39] PCI/MSI: Move pci_msix_vec_count() to api.c
Message-ID: <20221116162447.GA1115701@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.099461602@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:56PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_msix_vec_count() and make its kernel-doc comprehensive.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/api.c | 20 ++++++++++++++++++++
>  drivers/pci/msi/msi.c | 20 --------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 2ff2a9ccfc47..83ea38ffa116 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -60,6 +60,26 @@ void pci_disable_msi(struct pci_dev *dev)
>  EXPORT_SYMBOL(pci_disable_msi);
>  
>  /**
> + * pci_msix_vec_count() - Get number of MSI-X interrupt vectors on device
> + * @dev: the PCI device to operate on
> + *
> + * Return: number of MSI-X interrupt vectors available on this device
> + * (i.e., the device's MSI-X capability structure "table size"), -EINVAL
> + * if the device is not MSI-X capable, other errnos otherwise.
> + */
> +int pci_msix_vec_count(struct pci_dev *dev)
> +{
> +	u16 control;
> +
> +	if (!dev->msix_cap)
> +		return -EINVAL;
> +
> +	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
> +	return msix_table_size(control);
> +}
> +EXPORT_SYMBOL(pci_msix_vec_count);
> +
> +/**
>   * pci_enable_msix_range() - Enable MSI-X interrupt mode on device
>   * @dev:     the PCI device to operate on
>   * @entries: input/output parameter, array of MSI-X configuration entries
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index ed8caf5ac99f..1226d66da992 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -701,26 +701,6 @@ void pci_msi_shutdown(struct pci_dev *dev)
>  	pcibios_alloc_irq(dev);
>  }
>  
> -/**
> - * pci_msix_vec_count - return the number of device's MSI-X table entries
> - * @dev: pointer to the pci_dev data structure of MSI-X device function
> - * This function returns the number of device's MSI-X table entries and
> - * therefore the number of MSI-X vectors device is capable of sending.
> - * It returns a negative errno if the device is not capable of sending MSI-X
> - * interrupts.
> - **/
> -int pci_msix_vec_count(struct pci_dev *dev)
> -{
> -	u16 control;
> -
> -	if (!dev->msix_cap)
> -		return -EINVAL;
> -
> -	pci_read_config_word(dev, dev->msix_cap + PCI_MSIX_FLAGS, &control);
> -	return msix_table_size(control);
> -}
> -EXPORT_SYMBOL(pci_msix_vec_count);
> -
>  static int __pci_enable_msix(struct pci_dev *dev, struct msix_entry *entries,
>  			     int nvec, struct irq_affinity *affd, int flags)
>  {
> 
