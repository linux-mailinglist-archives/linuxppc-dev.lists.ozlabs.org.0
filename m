Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C5B62C456
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:26:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7j72CNpz3dvX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:26:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJ6wYAJR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJ6wYAJR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7f853ZLz3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:24:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B75E161EC4;
	Wed, 16 Nov 2022 16:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7905C433C1;
	Wed, 16 Nov 2022 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615838;
	bh=DiTEt8XP0MxtxKbF5ev7VXOTUwbITQ2VyXFIkyGrEn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PJ6wYAJRMkj/NnbJKwutaEqZGsul0Y5oZ+yT84rWOuJiP+x2WAy2XC1Hdsnf2CweP
	 Y0+tPWImMSwYmXIsB64fs2r3+RwLwvptw8bZNL/hnIdDAGQoshhpq2d+G4awA8LAEi
	 cbUeZHPd0sTqISD9d50J//8Xvlv1QxAiamBAD7GWuiHsBIQQQZ/Kdle1bKcYK2sTIe
	 NQgxmVstgW3cEmnfco4AZJUTpnhbNfpEElLkIPJXmpTyq30zRs0Dn2VzVeYjl0Z/We
	 TaVLWE0vlpVmCGS9+QNfYXtDa7eocyk+ce9knsywPyNpt11zw1FZyBCTGgYY2Yi4Q9
	 /uoSU11QFLcxw==
Date: Wed, 16 Nov 2022 10:23:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 24/39] PCI/MSI: Move pci_irq_vector() to api.c
Message-ID: <20221116162356.GA1115513@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.984490384@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:53PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_irq_vector() and let its kernel-doc match the rest of the file.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/api.c | 23 +++++++++++++++++++++++
>  drivers/pci/msi/msi.c | 24 ------------------------
>  2 files changed, 23 insertions(+), 24 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 8546749afa6e..0f1ec87e3f9f 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -182,3 +182,26 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
>  	return nvecs;
>  }
>  EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
> +
> +/**
> + * pci_irq_vector() - Get Linux IRQ number of a device interrupt vector
> + * @dev: the PCI device to operate on
> + * @nr:  device-relative interrupt vector index (0-based); has different
> + *       meanings, depending on interrupt mode
> + *         MSI-X        the index in the MSI-X vector table
> + *         MSI          the index of the enabled MSI vectors
> + *         INTx         must be 0
> + *
> + * Return: the Linux IRQ number, or -EINVAL if @nr is out of range
> + */
> +int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
> +{
> +	unsigned int irq;
> +
> +	if (!dev->msi_enabled && !dev->msix_enabled)
> +		return !nr ? dev->irq : -EINVAL;
> +
> +	irq = msi_get_virq(&dev->dev, nr);
> +	return irq ? irq : -EINVAL;
> +}
> +EXPORT_SYMBOL(pci_irq_vector);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index a028774f438d..38ad2fe4b85c 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -900,30 +900,6 @@ void pci_free_irq_vectors(struct pci_dev *dev)
>  EXPORT_SYMBOL(pci_free_irq_vectors);
>  
>  /**
> - * pci_irq_vector - return Linux IRQ number of a device vector
> - * @dev:	PCI device to operate on
> - * @nr:		Interrupt vector index (0-based)
> - *
> - * @nr has the following meanings depending on the interrupt mode:
> - *   MSI-X:	The index in the MSI-X vector table
> - *   MSI:	The index of the enabled MSI vectors
> - *   INTx:	Must be 0
> - *
> - * Return: The Linux interrupt number or -EINVAl if @nr is out of range.
> - */
> -int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
> -{
> -	unsigned int irq;
> -
> -	if (!dev->msi_enabled && !dev->msix_enabled)
> -		return !nr ? dev->irq : -EINVAL;
> -
> -	irq = msi_get_virq(&dev->dev, nr);
> -	return irq ? irq : -EINVAL;
> -}
> -EXPORT_SYMBOL(pci_irq_vector);
> -
> -/**
>   * pci_irq_get_affinity - return the affinity of a particular MSI vector
>   * @dev:	PCI device to operate on
>   * @nr:		device-relative interrupt vector index (0-based).
> 
