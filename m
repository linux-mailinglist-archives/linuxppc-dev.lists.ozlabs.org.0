Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64562C45E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:27:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7k70FFbz3f3t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:27:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OsAR5tUM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OsAR5tUM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7fg5WCDz3fCW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:24:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B052461EDF;
	Wed, 16 Nov 2022 16:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2D3C43151;
	Wed, 16 Nov 2022 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615864;
	bh=KtY9Vs/brf6w8qE0/o2ebQAHWrfi6LuL4OCBYWS1b/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OsAR5tUMX+89dO25+e1oBaNX+VGOE54GjAZOeyQYzbZTqgTpNZPlC7Zf0Qy0SimWL
	 OR8t+btKVpMvqEQ2V7aoAZN1zMjTQCRrK8WO5AVFz/X8LqfPWIRfiLYx7B9ez2Li1x
	 NP++bYoQ8hvu729w4z5dH2whv3CJCLy6w/xF27iMn12m008IlvYWFnrvIvDGMtohSP
	 Qd6I11EqTQKaL3+Y4S0xJbyXIyRL3xDNLy1DOi1v45qWxTG45M3xoCgIlj3dBMQk7k
	 Zy92tOMVgmRKIk+cihrJp3nIEtIdrW9BrFRb27cgnQ5SzXTHkivURkBvDJ8YCfNGMu
	 AqP9aJE9VxrtA==
Date: Wed, 16 Nov 2022 10:24:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 25/39] PCI/MSI: Move pci_free_irq_vectors() to api.c
Message-ID: <20221116162423.GA1115645@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.042870570@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:54PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> To distangle the maze in msi.c, all exported device-driver MSI APIs are
> now to be grouped in one file, api.c.
> 
> Move pci_free_irq_vectors() and make its kernel-doc comprehensive.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/api.c | 15 +++++++++++++++
>  drivers/pci/msi/msi.c | 13 -------------
>  2 files changed, 15 insertions(+), 13 deletions(-)
> ---
> diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
> index 0f1ec87e3f9f..2ff2a9ccfc47 100644
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -205,3 +205,18 @@ int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
>  	return irq ? irq : -EINVAL;
>  }
>  EXPORT_SYMBOL(pci_irq_vector);
> +
> +/**
> + * pci_free_irq_vectors() - Free previously allocated IRQs for a device
> + * @dev: the PCI device to operate on
> + *
> + * Undo the interrupt vector allocations and possible device MSI/MSI-X
> + * enablement earlier done through pci_alloc_irq_vectors_affinity() or
> + * pci_alloc_irq_vectors().
> + */
> +void pci_free_irq_vectors(struct pci_dev *dev)
> +{
> +	pci_disable_msix(dev);
> +	pci_disable_msi(dev);
> +}
> +EXPORT_SYMBOL(pci_free_irq_vectors);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 38ad2fe4b85c..ed8caf5ac99f 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -887,19 +887,6 @@ int __pci_enable_msix_range(struct pci_dev *dev,
>  }
>  
>  /**
> - * pci_free_irq_vectors - free previously allocated IRQs for a device
> - * @dev:		PCI device to operate on
> - *
> - * Undoes the allocations and enabling in pci_alloc_irq_vectors().
> - */
> -void pci_free_irq_vectors(struct pci_dev *dev)
> -{
> -	pci_disable_msix(dev);
> -	pci_disable_msi(dev);
> -}
> -EXPORT_SYMBOL(pci_free_irq_vectors);
> -
> -/**
>   * pci_irq_get_affinity - return the affinity of a particular MSI vector
>   * @dev:	PCI device to operate on
>   * @nr:		device-relative interrupt vector index (0-based).
> 
